CC=gcc
CFLAGS=-Wall -O2
EXE=.exe

all : testfunc$(EXE)

graph.o : graph.c graph.h
	$(CC) $(CFLAGS) -c graph.c

elemapprox.o : elemapprox.c elemapprox.h
	$(CC) $(CFLAGS) -c elemapprox.c

testfunc.o : testfunc.c graph.h funcplot.h
	$(CC) $(CFLAGS) -c testfunc.c     
    
testfunc$(EXE) : elemapprox.o graph.o funcplot.o testfunc.o
	$(CC) $(CFLAGS) -o testfunc$(EXE) elemapprox.o graph.o funcplot.o testfunc.o -lm

tidy :
	rm -rf *.o
    
clean :
	rm -rf *.o test*$(EXE)
