#ifndef MANDELBROT_CORE_H
#define MANDELBROT_CORE_H

#include <complex.h>

#define MAX_ITERATION 1000

/* Square of distance from the origin from which divergence is sure */
#define MAX_DISTANCE 4

int draw_image_custom(const char* filename, double precision,
		      double complex bottom_right, double width, double height);
int draw_image(const char* filename, double precision);
#endif
