#include "image.h"
#include<complex.h>
#include<math.h>
#include<stdlib.h>

#define ITER 100
#define MVAL (1<<30)
#define MCOL ((1<<24)-1)
double mandelbrot_gen(double x, double y){
  double complex c = x+y*I;
  double complex z = 0+0*I;
  for(int i = 0; i < ITER; i++){
    z = z*z+c;
    if(cabs(z) > 2) return 1;
  }
  return cabs(z);
}

unsigned int mb_cf(double x){
  unsigned int c = floor(x*MCOL);
  return c < MCOL ? c : MCOL;
}

int main(int argc, char* argv[]){
  if (argc != 6) {
    fprintf(stderr, "%s <xl> <xu> <yl> <yu> <nxdots>\n", argv[0]);
    return -1;
  }
  struct context_t c = {atof(argv[1]), atof(argv[2]), atof(argv[3]),
                        atof(argv[4]), atoi(argv[5])}; /* XXX: BUG IN SCALING */
  struct image_t* i = gen_image(mandelbrot_gen, mb_cf, &c);
  write_image_file(i, "mandelbrot.ppm");
  free(i->color);
  free(i);
  return 0;
}
