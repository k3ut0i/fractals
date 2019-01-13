CFLAGS += -Wall -Wextra -O2
LIBS += -lm

%.o : %.c
	$(CC) $(CFLAGS) -c -o $@ $<

draw_sample : core.o draw_sample.o
	$(CC) $(CFLAGS) -o $@ $^ $(LIBS)
