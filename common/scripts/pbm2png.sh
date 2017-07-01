#!/bin/bash

cd ../../ansicstd

for app in "sin" "cos" "tan" "cot" "sec" "csc" \
  "asin" "acos" "atan" "acot" "asec" "acsc" \
  "sinh" "cosh" "tanh" "coth" "sech" "csch" \
  "asinh" "acosh" "atanh" "acoth" "asech" "acsch" \
  "exp" "log" "log10" "sqrt" \
  "floor" "ceil" "round" "trunc" "fabs"
do
  convert test${app}.pbm ../figures/test${app}.png
done

cd ../common/scripts

