#include "core.h"
#include <stdio.h>
#include <stdlib.h>
int main(int argc, char *argv[argc+1])
{
  if(argc != 7){
    fprintf(stderr,
	    "Usage: %s <filename> <precision> <x> <y> <width> <height>\n",
	    argv[0]);
    exit(EXIT_FAILURE);
  }
  const char * fname = argv[1];
  double precision = strtod(argv[2], NULL);
  double br_x = strtod(argv[3], NULL);
  double br_y = strtod(argv[4], NULL);
  double width = strtod(argv[5], NULL);
  double height = strtod(argv[6], NULL);
  fprintf(stdout,
	  "Drawing to %s with precision %lg at %lgx%lg dimension %lgx%lg\n",
	  fname, precision, br_x, br_y, width, height);
  draw_image_custom(fname, precision, br_x , br_y , width, height);
  return EXIT_SUCCESS;
}
