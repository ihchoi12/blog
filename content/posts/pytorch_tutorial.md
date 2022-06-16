---
title: "Pytorch Tutorial"
date: 2022-06-14T15:52:29+08:00
draft: False
---

To understand pytorch training codes better, I start to follow a full totorial and summarize my progress here. 


# Basic Concepts
<p align="center">
    <img src="/posts/2022-06-14-16-23-53.png" width="300" /> <br>
    <a href="https://jovian.ai/aakashns/machine-learning-intro">[source]</a> 
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

# Linear Regression (y = xW^T + b)
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


##  Linear Regression using PyTorch Built-in
- the above training process is common, so several built-ins are provided

### packages
- ```from torch.utils.data import TensorDataset```: allow us to handle certain rows (why? to handle data into batches, see below) of data as a tuple of (input, output)
```py
from torch.utils.data import TensorDataset
# Define dataset
train_ds = TensorDataset(inputs, targets)
train_ds[0:3]
```
- ```from torch.utils.data import DataLoader```: split data into batches while shffuling
```py
from torch.utils.data import DataLoader
# Define data loader
batch_size = 11
train_dl = DataLoader(train_ds, batch_size, shuffle=True)
```
- ```import torch.nn as nn```: contains utility classes for building neural networks
```py
import torch.nn as nn
# Define model
model = nn.Linear(3, 2) # 3 weights, 2 biases (3 inputs, 2 outputs)
print(model.weight)
print(model.bias)
# model.parameters() returns a list of tensors weight and bias

"""
Parameter containing:
tensor([[ 0.1312, -0.4246, -0.2341],
        [ 0.4099,  0.4766,  0.1676]], requires_grad=True)
Parameter containing:
tensor([ 0.1603, -0.0098], requires_grad=True)
"""

# Here, model is an object (not a function), but we can do FP in the same way
preds = model(inputs)
``` 
- ```import torch.nn.functional as F```: built-in loss function (e.g., mse_loss)
```py
...
# Import nn.functional
import torch.nn.functional as F
# Define loss function
loss_fn = F.mse_loss
loss = loss_fn(model(inputs), targets)
```
- ```torch.optim.SGD```: optimize parameters using gradients instead of manually updating them (meaning of stochastic: batches are selected with random shuffling instead of the entire data)
```py
# Define optimizer
opt = torch.optim.SGD(model.parameters(), lr=1e-5)
"""
tell the optimizer: "matrices model.parameters() need to be updated 
"""
```

***
Using all these built-ins, training model can be implemented again as follows:
```py
...
# Utility function to train the model
def fit(num_epochs, model, loss_fn, opt, train_dl):
    
    # Repeat for given number of epochs
    for epoch in range(num_epochs):
        
        # Train with batches of data
        for xb,yb in train_dl: 
            # train_dl is a list of tuples of tensors (input, output), while each tensor has a batch of tensors
            
            # 1. Generate predictions
            pred = model(xb)
            
            # 2. Calculate loss
            loss = loss_fn(pred, yb)
            
            # 3. Compute gradients
            loss.backward()
            
            # 4. Update parameters using gradients
            opt.step()
            
            # 5. Reset the gradients to zero
            opt.zero_grad()
        
        # Print the progress
        if (epoch+1) % 10 == 0:
            print('Epoch [{}/{}], Loss: {:.4f}'.format(epoch+1, num_epochs, loss.item())) # loss is tensor of a single value, so loss.item retrieves the value

fit(100, model, loss_fn, opt, train_dl) # train for 100 epochs
```


### Note: why stochastic (batches with random shuffling) instead of the enrtire dataset?
- memory: no need to fit the entire data at once 
- accuracy: gives more chances for convergence
- could take longer per epoch though (due to less parallelization).
<p align="center">
    <img src="/posts/sgd.png" width="300" /> <br>
    <a href="https://arxiv.org/pdf/1802.09941.pdf">[source]</a> 
</p>

# Reference
- https://www.youtube.com/watch?v=GIsg-ZUy0MY
