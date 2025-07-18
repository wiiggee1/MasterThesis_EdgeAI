#ifndef BINDINGS_H
#define BINDINGS_H

#define LOG_LOCAL_LEVEL ESP_LOG_VERBOSE

// Include necessary ESP-IDF headers
#include "stdlib.h"
#include "stdio.h"
#include "sdkconfig.h"

#include "freertos/FreeRTOS.h"
#include "freertos/task.h"
#include "freertos/queue.h"
#include "freertos/semphr.h"

#include "xtensa/config/core-isa.h"
#include "xtensa/xtruntime-core-state.h"

#include "esp_system.h"
#include "esp_log.h"
#include "esp_app_trace.h"
#include "esp_err.h"
#include "esp_wifi.h"
#include "esp_event.h"
#include "esp_netif.h"
#include "nvs_flash.h"

#include "lwip/sockets.h"
#include "lwip/netdb.h"
#include "lwip/err.h"
#include "lwip/sys.h"

// Add any additional headers required for your project

#endif // BINDINGS_H

