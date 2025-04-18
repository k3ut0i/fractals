#ifndef IMAGE_H
#define IMAGE_H
#include<stdio.h>

typedef unsigned int color_t; /* 24-bits, 8-for each of the rgb values in order*/

struct image_t {
  unsigned int xmax; /* width */
  unsigned int ymax; /* height */
  color_t *color;   /* 2d array of colors in row-major-order */
};

struct context_t {
  double xl, xu, yl, yu;
  unsigned int nxdots;
};

typedef double (gen_fn)(double, double);
typedef color_t (color_fn)(double);
int write_image_file(struct image_t*, const char*); /* return bytes printed */
int write_image(struct image_t* i, FILE*); /* return bytes printed */
struct image_t* gen_image(gen_fn*, color_fn*, struct context_t*);

#endif /* IMAGE_H */
