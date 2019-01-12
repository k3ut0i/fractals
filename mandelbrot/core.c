#include <stdio.h>
#include <math.h>
#include <complex.h>

#include "core.h"

static inline double complex mandelbrot_fn(double complex z, double complex c)
{
  return z * z + c;
}

double diverge_rate(double complex c)
{
  int iter_num = 0;
  for(double complex md_seq = 0.0 + 0.0 * I;
      iter_num < MAX_ITERATION && cabs(md_seq) < MAX_DISTANCE;
      iter_num++)
    {
      md_seq = mandelbrot_fn(md_seq, c);
    }
  return iter_num/MAX_ITERATION;
}

int draw_image(const char* f, double p)
{
  FILE *fp = fopen(f, "w");
  if(fp == NULL)
    return -1;

  /* Draw from x = -2,1 y = -1,1 */
  int width = floor(3/p);
  int height = floor(2/p);

  fprintf(fp, "P2\n%d %d\n255\n", width, height);
  for(int y = 0; y < height; y++){
    for(int x = 0; x < width ; x++)
      {
	double pos_x = p*x - 2;
	double pos_y = p*y - 1;
	fprintf(fp, "%d ", (int)floor(256 - 256 * diverge_rate(pos_x + pos_y * I)));
      }
    fputc('\n', fp);
  }

  fclose(fp);
  return 0;
}
