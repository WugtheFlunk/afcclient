CC=clang
CFLAGS=
LDFLAGS=-lssl -lm -lcrypto -l:libimobiledevice-1.0.a -l:libplist++-2.0.a -l:libplist-2.0.a -l:libusbmuxd-2.0.a -l:libimobiledevice-glue-1.0.a

OS := $(shell uname)
ifeq ($(OS),Darwin)
  # Nothing special needed for MacOS
else ifeq ($(OS),Linux)
  CFLAGS+=-fblocks
  LDFLAGS+=-lBlocksRuntime
else
  $(error Unsupported operating system: $(OS))
endif


TARGETS=afcclient

all: $(TARGETS)

afcclient: afcclient.o libidev.o
	$(CC) -o $@ $^ $(CFLAGS) $(LDFLAGS)

clean:
	rm -rf *.dSYM *.o *.gch $(TARGETS)

