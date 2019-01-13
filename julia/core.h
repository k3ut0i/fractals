#ifndef JULIA_CORE_H
#define JULIA_CORE_H

#include <complex.h>

#define MAX_ITERATIONS 1000
#define GOLDEN_RATIO 1.61803398875

int draw_julia_set(const char* filename, double precision,
		   double complex julia_constant);
#endif /* JULIA_CORE_H */
