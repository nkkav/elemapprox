#!/bin/bash

#export PATH=/c/CompSci/iverilog/bin:$PATH

rm -rf testfunc-ascii.txt
touch testfunc-ascii.txt
iverilog -g2005 -o testfunc.vvp elemapprox.v graph.v funcplot.v testfunc.v
for app in "sin" "cos" "tan" "cot" "sec" "csc" \
  "asin" "acos" "atan" "acot" "asec" "acsc" \
  "sinh" "cosh" "tanh" "coth" "sech" "csch" \
  "asinh" "acosh" "atanh" "acoth" "asech" "acsch" \
  "exp" "log" "sqrt" \
  "floor" "ceil" "fabs" "round" "trunc"
do
  echo "Plotting elementary function: ${app} as ASCII text"
  echo "Plotting elementary function: ${app} as ASCII text" >> testfunc-ascii.txt
  vvp testfunc.vvp +func=${app} +ascii +x=80 +y=20 +s=0.05 >& test${app}.txt
  cat test${app}.txt >> testfunc-ascii.txt
done

if [ "$SECONDS" -eq 1 ]
then
  units=second
else
  units=seconds
fi
echo "This script has been running $SECONDS $units."

echo "Ran plot-verilog-ascii on all tests."
exit 0
