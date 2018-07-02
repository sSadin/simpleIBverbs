.PHONY: clean
CFLAGS  := -Wall -Werror -g -O0
LD      := gcc
LDFLAGS := ${LDFLAGS} -libverbs -lrdmacm
APPS    := rdma

all: ${APPS}

rdma: rdma.o
	${LD} -o $@ $^ ${LDFLAGS}

clean:
	rm -f *.o ${APPS}

