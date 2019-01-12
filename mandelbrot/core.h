#ifndef MANDELBROT_CORE_H
#define MANDELBROT_CORE_H

#include <complex.h>

#define MAX_ITERATION 1000

/* Square of distance from the origin from which divergence is sure */
#define MAX_DISTANCE 4


double diverge_rate(double complex c);

int draw_image(const char* filename, double precision);
#endif
