const std = @import("std");

pub const Scheduler = struct {
    pub const MAX_TASKS = 4;

    pub const TaskFn = *const fn(*anyopaque) void;

    pub const Task = struct {
        cb: TaskFn,
        ctx: *anyopaque,
        period_us: u64,          
        /// absolute time (µs) of next release
        next_release_us: u64,    
        enabled: bool = true,
        running: bool = false,
        last_start_us: u64 = 0,
        last_finish_us: u64 = 0,
        missed_deadlines: u32 = 0,
    };

    tasks: [MAX_TASKS]?Task,
    count: usize = 0,

    pub fn init() Scheduler{
        return Scheduler{
            .tasks = [_]?Task{null} ** MAX_TASKS,
            .count = 0,
        };
    }

    /// Register a periodic (or one-shot) task. Returns slot index or null if full.
    pub fn add_task(self: *Scheduler, cb: TaskFn, ctx: *anyopaque, start_at_us: u64, period_us: u64) ?usize {
        if (self.count >= MAX_TASKS) return null;
        self.tasks[self.count] = Task{
            .cb = cb,
            .ctx = ctx,
            .period_us = period_us,
            .next_release_us = start_at_us,
            .enabled = true,
        };
        self.count += 1;
        return self.count - 1;
    }

    /// Wakeup flag toggled by the timer ISR (set-and-clear handshake).
    /// This is a namespaced global, with static storage duration, and 
    /// lives in the global data memory (SRAM).
    pub var tick_pending: std.atomic.Value(u8) = std.atomic.Value(u8).init(0);

    /// Called from main loop; dispatch any task whose release time has arrived.
    pub fn dispatch(self: *Scheduler, now_us: u64) void {
        // Single-core run-to-completion: no preemption, no heap.
        for (self.tasks[0..self.count]) |*slot| {
            if (slot.*) |*t| {
                if (!t.enabled) continue;

                if (t.period_us != 0 and now_us > t.next_release_us + t.period_us) {
                    const late_us: u64 = now_us - t.next_release_us;
                    const extra: u64 = late_us / t.period_us; // whole periods elapsed
                    t.missed_deadlines += @intCast(extra);
                    t.next_release_us += extra * t.period_us;
                }

                if (now_us < t.next_release_us) continue;

                // Deadline check: if previous instance still running, count miss.
                if (t.running) {
                    t.missed_deadlines += 1;
                    // Skip starting a new instance; push the release forward.
                    t.next_release_us += t.period_us;
                    continue;
                }

                t.running = true;
                t.last_start_us = now_us;

                // Execute task
                t.cb(t.ctx);

                const now_us2 = now_us; // replace with a fresh time read if you have it
                t.last_finish_us = now_us; // you can update with fresh now_us if you want
                t.running = false;

                // Schedule next release if periodic
                if (t.period_us != 0) {
                    // Avoid release drift: advance by multiples of period to the first future slot.
                    const p = t.period_us;
                    var nxt = t.next_release_us + p;

                    if (now_us2 > nxt) {
                        const k = (now_us2 - nxt) / p + 1;
                        nxt += k * p;
                    }

                    t.next_release_us = nxt;

                } else {
                    t.enabled = false; // one-shot done
                }
            }
        }
    }
};
