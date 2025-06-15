
There are many approaches which offer performance superior to mini-batch [stochastic gradient]

## Hessian Technique

 Consider the abstract problem of minimizing a cost function C, which a function of many variables,  $w=w_{1},w_{2},…,$  so $C=C(w)$.
 By Taylor's Theorem :


$$
 C(w+\Delta w) = C(w) + \sum_{j}^{} \frac{ \partial C }{ \partial w_{j} } \Delta w_{j} + \frac{1}{2} \sum_{jk}^{} \Delta w_{j} \frac{ \partial^2 C }{ \partial w_{j} \partial w_{k} }\Delta w_{k} + \dots 
$$

We can write this more compactly :

$$
C(w+\Delta w) = C(w) + \nabla C \cdot\Delta w + \frac{1}{2} \Delta w^T H \Delta w + \dots.
$$
H -> *Hessian matrix*

$$
C(w+\Delta w) \approx C(w) +\nabla C \cdot \Delta w + \frac{1}{2} \Delta w^T H\Delta w
$$
By calculas we can find that
$$
\Delta w = -H^{-1} \nabla C
$$

In practice it is better to take small steps and we do this by repeatedly changing w by an amount $\Delta w = -H^{-1} \nabla C$
Despite having many desirable properties, it is ==very difficult== to apply in practice.

## Momentum Based gradient descent

Intuitively, the advantage Hessian optimization has is that it incorporates not just information about the gradient, but also information about how the gradient is changing.

- It makes it more like physical scenario of ball rolling down of a valley by adding a notion of ==velocity==. 
- It also adds friction like term, which reduces velocity.

$$
v \to v' = \mu v-\eta \nabla C
$$
$$
w \to w' = w +v'
$$
$\mu=\text{Hyperparameter that controls damping}$ 

![[Pasted image 20250615001956.png]]

