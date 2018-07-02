CC=gcc
CFLAGS=-Wall -g -o0
LDFLAGS= -lrdmacm -libverbs

# all: server client
all: rdma

rdma: rdma.o
	$(CC) rdma.o -o rdma $(LDFLAGS)	

rdma.o: rdma.c
	${CC} $(CFLAGS) -c rdma.c

clean_rdma:
	rm -f rdma rdma.o

