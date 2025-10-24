### Model design:

```txt
<bound method Module.state_dict of EdgeAiModel(
  (rnn_encoder): RNNBlock(
    (cell): CustomRNN(
      (wx): Linear(in_features=1, out_features=16, bias=True)
      (wh): Linear(in_features=16, out_features=16, bias=True)
    )
  )
  (fc_encoder): Linear(in_features=16, out_features=10, bias=True)
  (rnn_decoder): RNNBlock(
    (cell): CustomRNN(
      (wx): Linear(in_features=10, out_features=16, bias=True)
      (wh): Linear(in_features=16, out_features=16, bias=True)
    )
  )
  (fc_head): Linear(in_features=16, out_features=1, bias=True)
)>
=================================================================
Layer (type:depth-idx)                   Param #
=================================================================
EdgeAiModel                              --
├─RNNBlock: 1-1                          --
│    └─CustomRNN: 2-1                    --
│    │    └─Linear: 3-1                  32
│    │    └─Linear: 3-2                  272
├─Linear: 1-2                            170
├─RNNBlock: 1-3                          --
│    └─CustomRNN: 2-2                    --
│    │    └─Linear: 3-3                  176
│    │    └─Linear: 3-4                  272
├─Linear: 1-4                            17
=================================================================
Total params: 939
Trainable params: 939
Non-trainable params: 0
=================================================================
```

Size of the trainable params of the model: (total params * sizeOf(param datatype)) / 1024 →
... → (939 * 4) / 1024 = 3.66796875 KB.
