#include <stdio.h>
#include <stdlib.h>
#include <math.h>
#include <complex.h>
#include <string.h>
#include "core.h"

static inline double complex fn(double complex z, double complex c)
{
  return z * z + c;
}

static double divergence_rate(double complex z, double complex c)
{
  double complex point = z;
  int iter_num = 0;
  for(; cabs(point) < 2 && iter_num < MAX_ITERATIONS; iter_num++)
    point = fn(point, c);
  return iter_num/MAX_ITERATIONS;
}

int draw_julia_set(const char* fname, double p, double complex jc)
{
  FILE *fp = fopen(fname, "w");
  int width = floor(4/p);
  int height = floor(2/p);
  fprintf(fp, "P2\n%d %d\n255\n", width, height);
  double xp, yp;
  for(int y = 0; y < height; y++){
    for(int x = 0; x < width; x++){
      xp = x*p - 2; yp = y*p - 1;
      fprintf(fp, "%d ", (int)floor(255 * divergence_rate(xp + yp * I, jc)));
    }
    fputc('\n', fp);
  }
    
  fclose(fp);
  return 0;
}
