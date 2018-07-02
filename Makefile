CC=gcc
CFLAGS=-Wall -g
LDFLAGS= -lrdmacm -libverbs

all: server client

rdma: rdma.o
	$(CC) $(CFLAGS) rdma.o -o rdma $(LDFLAGS)	

rdma.o: rdma.c
	${CC} -c rdma.c

clean_rdma:
	rm -f rdma rdma.o

