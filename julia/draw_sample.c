#include "core.h"
#include <stdio.h>
#include <stdlib.h>
int main(int argc, char *argv[argc+1])
{
  if(argc != 4){
    fprintf(stderr, "Usage: %s <filename> <precision> <julia_const>", argv[0]);
    exit(EXIT_FAILURE);
  }
  const char* filename = argv[1];
  double precision = strtod(argv[2], NULL);
  double jx, jy;
  sscanf(argv[3], "%lgx%lg", &jx, &jy);
  draw_julia_set(filename, precision, jx + jy * I);
  return EXIT_SUCCESS;
}
