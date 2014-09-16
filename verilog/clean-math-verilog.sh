#!/bin/bash

for app in "sin" "cos" "tan" "cot" "sec" "csc" \
  "asin" "acos" "atan" "acot" "asec" "acsc" \
  "sinh" "cosh" "tanh" "coth" "sech" "csch" \
  "asinh" "acosh" "atanh" "acoth" "asech" "acsch" \
  "exp"
do
  rm -rf test${app}
done

if [ "$SECONDS" -eq 1 ]
then
  units=second
else
  units=seconds
fi
echo "This script has been running $SECONDS $units."

echo "Ran clean-math-verilog on all tests."
exit 0
