#!/bin/bash

for app in "sin" "cos" "tan" "cot" "sec" "csc" \
  "asin" "acos" "atan" "acot" "asec" "acsc" \
  "sinh" "cosh" "tanh" "coth" "sech" "csch" \
  "asinh" "acosh" "atanh" "acoth" "asech" "acsch" \
  "exp"
do
  echo "Plotting elementary function: ${app}"
#  ./test${app}.exe
  ./testfunc.exe -s 0.001 -func ${app} -pbm -x 256 -y 256 > test${app}.pbm
done

if [ "$SECONDS" -eq 1 ]
then
  units=second
else
  units=seconds
fi
echo "This script has been running $SECONDS $units."

echo "Ran plot-ansic-pbm on all tests."
exit 0
