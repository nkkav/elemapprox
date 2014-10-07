GHDL=ghdl
GHDLFLAGS=--ieee=standard -fexplicit --workdir=work
# Simulation will run up to this limit or end by the forced assert.
GHDLRUNFLAGS=--stop-time=10000ns

# Default target : elaborate
all : run

# Elaborate target.  Almost useless
elab : force
	$(GHDL) -c $(GHDLFLAGS) -e testfunc

# Run target
run: force
	$(GHDL) --elab-run $(GHDLFLAGS) testfunc $(GHDLRUNFLAGS)

# Targets to analyze libraries
init: force
	mkdir work
	$(GHDL) -a $(GHDLFLAGS) elemapprox.vhd
	$(GHDL) -a $(GHDLFLAGS) graph.vhd
	$(GHDL) -a $(GHDLFLAGS) funcplot.vhd
	$(GHDL) -a $(GHDLFLAGS) testfunc.vhd

force:

clean :
	rm -rf *.o work
