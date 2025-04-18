#include "image.h"
#include <stdlib.h>

struct image_t* gen_image(gen_fn* gf, color_fn* cf, struct context_t* c){
  double d = (c->xu-c->xl)/c->nxdots;
  const unsigned int xmax = c->nxdots, ymax = (c->yu-c->yl)/d;
  fprintf(stderr, "%f %ud %ud\n", d, xmax, ymax);
  color_t* ca = malloc(sizeof(color_t)*xmax*ymax);
  for(unsigned int x = 0; x < xmax; x++)
    for(unsigned int y = 0; y < ymax; y++)
      ca[x*ymax+y] = cf(gf(c->xl+d*x, c->yl+d*y));
  struct image_t* i = malloc(sizeof(struct image_t));
  i->xmax = xmax, i->ymax = ymax, i->color = ca;
  return i;
}

int write_image(struct image_t* i, FILE* fp){
  int count = fprintf(fp, "P3\n%d %d\n255\n", i->ymax, i->xmax);
  for(unsigned int x = 0; x < i->xmax; x++)
    for(unsigned int y = 0; y < i->ymax; y++){
      color_t c = i->color[x*i->ymax+y];
      int b = c&((1<<8)-1);
      int g = (c>>8)&((1<<8)-1);
      int r = (c>>16)&((1<<8)-1);
      count += fprintf(fp, "%d %d %d\n", r, g, b);
    }
  return count;
}

int write_image_file(struct image_t* i, const char* fname){
  FILE* fp = fopen(fname, "w");
  int count = write_image(i, fp);
  fclose(fp);
  return count;
}
