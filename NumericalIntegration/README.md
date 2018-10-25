# Numerical Integration

For this exercise we explore the parallelization techniques of numerical integration.
One technique of numerical integration is the so-called *midpoint* rule. The midpoint rule
approximates integrals as:

<a href="https://www.codecogs.com/eqnedit.php?latex=\int&space;f(x)dx&space;\approx&space;\sum_{i=0}^N&space;f(x_i)\Delta&space;x_i" target="_blank"><img src="https://latex.codecogs.com/gif.latex?\int&space;f(x)dx&space;\approx&space;\sum_{i=0}^N&space;f(x_i)\Delta&space;x_i" title="\int f(x)dx \approx \sum_{i=0}^N f(x_i)\Delta x_i" /></a>

where <a href="https://www.codecogs.com/eqnedit.php?latex=x_i" target="_blank"><img src="https://latex.codecogs.com/gif.latex?x_i" title="x_i" /></a> is is at the midpoint of <a href="https://www.codecogs.com/eqnedit.php?latex=\Delta&space;x_i" target="_blank"><img src="https://latex.codecogs.com/gif.latex?\Delta&space;x_i" title="\Delta x_i" /></a>.

In this example we use the following integral, which integrates exactly to <a href="https://www.codecogs.com/eqnedit.php?latex=\pi" target="_blank"><img src="https://latex.codecogs.com/gif.latex?\pi" title="\pi" /></a>.

<a href="https://www.codecogs.com/eqnedit.php?latex=\int_0^1&space;\frac{4}{1&plus;x^2}dx=&space;\pi" target="_blank"><img src="https://latex.codecogs.com/gif.latex?\int_0^1&space;\frac{4}{1&plus;x^2}dx=&space;\pi" title="\int_0^1 \frac{4}{1+x^2}dx= \pi" /></a>

Serial code is provided in C. Possible solutions utilizing OpenMP are provided in the solutions folder.
The various solutions show the use of different constructs and demonstrate:
- problems with false sharing
- synchronizations with ```atomic``` and ```critical```
- the ```reduce``` clause
- tasks
- vectorization (not finished)

To compile the example and solutions the recommended command is:
```bash
gcc -fopenmp -o pi.exe pi.c 
```
