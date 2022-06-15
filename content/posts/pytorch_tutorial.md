---
title: "Pytorch Tutorial"
date: 2022-06-14T15:52:29+08:00
draft: False
---

To understand pytorch training codes better, I start to follow a full totorial and summarize my progress here. 


# Basic Concepts
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
- why it's great? we can automatically compute the gradient (i.e., autograd using ```.backward()```) of the output w.r.t. tensors
- specify ```require_grad = True``` of a tensor to reduce unnecessary gradient calculation cost  

Example:
```py
# Create tensors.
x = torch.tensor(3.)
w = torch.tensor(4., requires_grad=True)
b = torch.tensor(5., requires_grad=True)
# Arithmetic Operation
y = w * x + b
# Compute gradients using autograd
y.backward()
# Display gradients
print('dy/dx:', x.grad)
print('dy/dw:', w.grad)
print('dy/db:', b.grad)
```
Output:
```
dy/dx: None
dy/dw: tensor(3.)
dy/db: tensor(1.)
```
- PyTorch interoperates well with ```numpy```, so we can use ```numpy``` to easily handle our data and also take benefit of PyTorch (Autograd, tensor operations on GPU).  

# Linear Regression
Linear regression is to a relationship between **input variables** (e.g., study time) and **target variables** (score). Each target variable is estimated to be a weighted sum of the input variables, offset by some constant (i.e., bias).

Here, **learning** means to figure out the weights using the training data. How? Gradient Descent: Just adjust slightly many times towards better accuracy.

To represent this problem mathematically, we form a matrix of the weights and vector of biases (# of target variables == # of rows).

## Loss Function
- to evaluate the model accuracy during training
- typically use **MSE** (Mean Squared Error), why square? to remove negative values 


##  Overall Process
1. Setup Model
2. Generate Predictions
3. Calculate Loss
4. Compute Gradients w.r.t. Weights and Biases
5. Adjust Weights and Biases
6. Reset Gradients to Zero (why? gradients are accumulated throughout training)

```py
# Weights and biases
w = torch.randn(2, 3, requires_grad=True)
b = torch.randn(2, requires_grad=True)

# Setup model
def model(x):
    return x @ w.t() + b

# MSE loss
def mse(t1, t2):
    diff = t1 - t2
    return torch.sum(diff * diff) / diff.numel()

# Train for 100 epochs
for i in range(100):
    preds = model(inputs)
    loss = mse(preds, targets)
    loss.backward()
    with torch.no_grad(): # stop tracking operations while adjusting
        w -= w.grad * 1e-5
        b -= b.grad * 1e-5
        w.grad.zero_()
        b.grad.zero_()
```
** Note on ```torch.no_grad()```: By default, PyTorch tracks all operations (during FP) on tensors with ```required_grad=True```, which is called gradient context tracking by autograd engine. This tracking task has some processing and memory cost, so we deactivate it using ```torch.no_grad()``` when it's not needed.  
# Reference
- https://www.youtube.com/watch?v=GIsg-ZUy0MY
