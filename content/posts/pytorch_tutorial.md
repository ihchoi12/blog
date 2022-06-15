---
title: "Pytorch Tutorial"
date: 2022-06-14T15:52:29+08:00
draft: False
---

To understand pytorch training codes better, I start to follow a full totorial and summarize my progress here. 


# ML Intro
<p align="center">
    <img src="/posts/2022-06-14-16-23-53.png" width="300" /> <br>
    <a href="https://jovian.ai/aakashns/machine-learning-intro">Image source</a> 
</p>

Unlike classical programming where we input data and algorithm (rules) to get the output, we give data and output to the ML training algorithm so that it can figure out the correct output for unknown data. 

## Tensor
- all data elements of a tensor are converted to have the same type (e.g., float)
- the shape of a tensor must be regular 3-dimension (difference from a simple list-of-list)

## PyTorch
- a library for tensor processing 
- the underlying implementation is in CUDA language (c language, which is fast), but it provides a layer of python wrappers (which is slow, but easy to use) of CUDA API calls
- why it's great? we can automatically compute the gradient of the output w.r.t. a tensor
- specify ```require_grad = True``` of a tensor to reduce unnecessary gradient calculation cost  

Example:
```py
def test():
    print hi
# Create tensors.
x = torch.tensor(3.)
w = torch.tensor(4., requires_grad=True)
b = torch.tensor(5., requires_grad=True)
# Arithmetic Operation
y = w * x + b
# Compute derivatives
y.backward()
# Display gradients
print('dy/dx:', x.grad)
print('dy/dw:', w.grad)
print('dy/db:', b.grad)
print hi
```
```c++
// hello c++
int main () {
    return 0;
}
```

[output]
dy/dx: None
dy/dw: tensor(3.)
dy/db: tensor(1.)


# Reference
- https://www.youtube.com/watch?v=GIsg-ZUy0MY
