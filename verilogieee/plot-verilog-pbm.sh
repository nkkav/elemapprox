#!/bin/bash

#export PATH=/c/CompSci/iverilog/bin:$PATH

iverilog -g2005 -o testfunc.vvp elemapprox.v ../common/verilog/graph.v \
  ../common/verilog/funcplot.v ../common/verilog/testfunc.v
for app in "sin" "cos" "tan" "cot" "sec" "csc" \
  "asin" "acos" "atan" "acot" "asec" "acsc" \
  "sinh" "cosh" "tanh" "coth" "sech" "csch" \
  "asinh" "acosh" "atanh" "acoth" "asech" "acsch" \
  "exp" "log" "log10" "sqrt" "cbrt" \
  "floor" "ceil" "fabs" "round" "trunc"
do
  echo "Plotting elementary function: ${app} as PBM image"
  if [ "${app}" == "cot" ] 
  then
    step=0.02
  elif [ "${app}" == "acsch" ] 
  then
    step=0.05
  else
    step=0.001
  fi
  vvp testfunc.vvp +func=${app} +pbm +x=256 +y=256 +s=${step} >& test${app}.pbm
done

if [ "$SECONDS" -eq 1 ]
then
  units=second
else
  units=seconds
fi
echo "This script has been running $SECONDS $units."

echo "Ran plot-verilog-pbm on all tests."
exit 0
