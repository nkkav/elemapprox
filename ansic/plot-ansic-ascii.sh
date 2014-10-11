#!/bin/bash

rm -rf testfunc-ascii.txt
touch testfunc-ascii.txt
for app in "sin" "cos" "tan" "cot" "sec" "csc" \
  "asin" "acos" "atan" "acot" "asec" "acsc" \
  "sinh" "cosh" "tanh" "coth" "sech" "csch" \
  "asinh" "acosh" "atanh" "acoth" "asech" "acsch" \
  "exp" "log" "sqrt"
do
  echo "Plotting elementary function: ${app}"
  echo "Plotting elementary function: ${app}" >> testfunc-ascii.txt
  ./testfunc.exe -s 0.01 -func ${app} -ascii -x 80 -y 20 > test${app}.txt
  cat test${app}.txt >> testfunc-ascii.txt
done

if [ "$SECONDS" -eq 1 ]
then
  units=second
else
  units=seconds
fi
echo "This script has been running $SECONDS $units."

echo "Ran plot-ansic-ascii on all tests."
exit 0
