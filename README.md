# simpleIBverbs
InfiniBand: An Introduction + Simple IB verbs program with RDMA Write

Get from here: https://blog.zhaw.ch/icclab/infiniband-an-introduction-simple-ib-verbs-program-with-rdma-write/

The program – simply called rdma – described in this section is mainly based on the source code of the ‘ib_rdma_bw’
application. This application is part of the perftest package, available for various Linux distributions. The link
to the source-code file can be found at the end of this blogpost. The code in the example program has been greatly
simplified and stripped down.  Almost all the functions were renamed, some functions were put together and lots of
code was just removed. Depending on the argument passed to the example you either are the server/sender or the
client/receiver. At the moment the client connects to a server and then the server writes a string directly into a
local buffer of the client which displays it. The source code of the example program can be downloaded at the end
of this blogpost.


First a simplified description of what happens in the program. Most points are identical for the server and the
client.

-	Initialize InfiniBand Context (Structures needed for communication and memory)
- 	-	Get and open InfiniBand device. This will give you a ‘context’ which is used to create all the following
		structures
- 	-	Allocate a Protection Domain
- 	-	Register a Memory Region
- 	-	Create a Send and a Receive Completion Queue
- 	-	Create a Queue Pair
-	Initialize the Queue Pair (change QP status to INIT)
-	Exchange information to later be able to communicate with peer via IB. This is done via TCP in this example.
	Another possibility would be to use the RDMA Connection Manager which would need IPoIB enabled hosts. The
	following information is exchanged
- 	-	LID – Local Identifier, 16 bit addr. assigned to end nodes by subnet manager
- 	-	QPN – Queue Pair Number, identifier assigned to QP by HCA
- 	-	PSN – Packet Sequence Number, used by HCA to verify correct order of packages / detect package loss
- 	-	R_Key
- 	-	VADDR, address of memory region for peer to write into
-	Change the QP status to Ready to Receive (RTR)
-	* ONLY SERVER * – Change the QP status to Ready to Send (RTS)
-	Perform RDMA write
- 	-	Define memory region to read from with scatter/gather element (SGE)
- 	-	Use work request to define where to write to
- 	-	RDMA write into buffer of client/receiver
