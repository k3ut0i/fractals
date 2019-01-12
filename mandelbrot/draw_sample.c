#include "core.h"
#include <stdio.h>
#include <stdlib.h>

int main(int argc, char *argv[argc+1])
{
  if(argc != 3){
    fprintf(stderr, "%s <file_name> <pixel_density>", argv[0]);
    exit(EXIT_FAILURE);
  }
  const char* fname = argv[1];
  const double pix_density = strtod(argv[2], NULL);
  draw_image(fname, pix_density);
  return 0;
}


/* Local Variables: */
/* compile-command: "gcc -Wall -Wextra draw_sample.c -o draw_sample" */
/* End: */
