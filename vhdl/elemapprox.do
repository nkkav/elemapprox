# Filename : elemapprox.do
# Author   : Nikolaos Kavvadias 2014
# Copyright: (C) 2014 Nikolaos Kavvadias

vlib work
vcom elemapprox.vhd
vcom graph.vhd
vcom funcplot.vhd
vcom testfunc.vhd
vsim testfunc
onbreak {quit -f}
run -all
exit -f
