CC = gcc
CFLAGS = -Wall -Wextra -O2
LIBS = -lm

GUILE_LIBS = `pkg-config --libs guile-2.2`
GUILE_FLAGS = `pkg-config --cflags guile-2.2`

.PHONY: top clean check-syntax
top: core.o

%.o: %.c
	$(CC) $(CFLAGS) -c -o $@ $<

guile_api.so: core.o guile_api.o
lua_api.so: core.o lua_api.o

draw_sample: core.o draw_sample.o
	$(CC) $(CFLAGS) -o $@ $^ $(LIBS)
draw_custom: core.o draw_custom.o
	$(CC) $(CFLAGS) -o $@ $^ $(LIBS)
check-syntax: $(CHK_SOURCES)
	$(CC) -o /dev/null -S $(CHK_SOURCES)
clean:
	rm -f *.o draw_sample
