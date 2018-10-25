# Hello World
For this exercise we will use a simple hello world program to introduce 
OpenMP. In this exercise we will demonstrate how to bring OpenMP 
routines, constants, and variables within the scope of the program and howto create a parallel region.

If you are new to OpenMP you are encouraged to also explore the various
ways one may define the number threads for a parallel region.
Explore the following:
- ```omp_set_num_threads```
- ```num_threads``` clause
- ```OMP_NUM_THREADS``` environment variable

If you wish to go further, try exploring the thread affinity options
- ```OMP_PROC_BIND```
- ```OMP_PLACES```

To print the core number use the following
```c
#include <sched.h>

int main() {

   { /* start parallel region */

      int cpu_num = sched_getcpu();

   } /* end of parallel region */
}

```

Serial code is provided in C. Possible solutions utilizing OpenMP are provided in the solutions folder.

To compile the example and solutions the recommended:
```bash
gcc -fopenmp -o hello.exe hello.c 
```
