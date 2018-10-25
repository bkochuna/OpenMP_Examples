# Simulated Annealing
For this exercise we will use a short program that solves a simulated annealing problem for a plate
with a fixed boundary condition. This constitutes solving Laplace’s equation given by:

<a href="https://www.codecogs.com/eqnedit.php?latex=\nabla^2&space;T&space;=&space;0" target="_blank"><img src="https://latex.codecogs.com/gif.latex?\nabla^2&space;T&space;=&space;0" title="\nabla^2 T = 0" /></a>

Note that this is similar to Poisson’s equation. Similar to Poisson’s equation, we discretize this with
finite difference creating a 5-point stencil. In this problem the solution is obtained via Gauss-Seidel iteration,
so the resulting fixed point iteration scheme is given by:

<a href="https://www.codecogs.com/eqnedit.php?latex=T^{(k&plus;1)}_{i,j}&space;=&space;\frac{1}{4}\Big(&space;T^{(k&plus;1)}_{i-1,j}&space;&plus;&space;T^{(k)}_{i&plus;1,j}&space;&plus;&space;T^{(k&plus;1)}_{i,j-1}&space;&plus;&space;T^{(k)}_{i,j&plus;1}&space;\Big)" target="_blank"><img src="https://latex.codecogs.com/gif.latex?T^{(k&plus;1)}_{i,j}&space;=&space;\frac{1}{4}\Big(&space;T^{(k&plus;1)}_{i-1,j}&space;&plus;&space;T^{(k)}_{i&plus;1,j}&space;&plus;&space;T^{(k&plus;1)}_{i,j-1}&space;&plus;&space;T^{(k)}_{i,j&plus;1}&space;\Big)" title="T^{(k+1)}_{i,j} = \frac{1}{4}\Big( T^{(k+1)}_{i-1,j} + T^{(k)}_{i+1,j} + T^{(k+1)}_{i,j-1} + T^{(k)}_{i,j+1} \Big)" /></a>

Serial code is provided in C and Fortran. 

To compile the examples the recommended:
```bash
gcc -fopenmp -lm -o laplace_serial.exe laplace_serial.c 
gfortran -fopenmp -o laplace_serial.exe laplace_serial.f90
```
