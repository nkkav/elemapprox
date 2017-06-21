CC=gcc
CFLAGS=-Wall -O2
EXE=.exe

all : testfunc$(EXE)

graph.o : ../common/ansic/graph.c ../common/ansic/graph.h
	$(CC) $(CFLAGS) -c ../common/ansic/graph.c

funcplot.o : ../common/ansic/funcplot.c ../common/ansic/funcplot.h
	$(CC) $(CFLAGS) -c ../common/ansic/funcplot.c

elemapprox.o : elemapprox.c ../common/ansic/elemapprox.h
	$(CC) $(CFLAGS) -c elemapprox.c

testfunc.o : ../common/ansic/testfunc.c ../common/ansic/graph.h ../common/ansic/funcplot.h
	$(CC) $(CFLAGS) -c ../common/ansic/testfunc.c     
    
testfunc$(EXE) : elemapprox.o graph.o funcplot.o testfunc.o
	$(CC) $(CFLAGS) -o testfunc$(EXE) elemapprox.o graph.o funcplot.o testfunc.o -lm    

tidy :
	rm -rf *.o
    
clean :
	rm -rf *.o test*$(EXE)
