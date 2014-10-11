#!/bin/bash

#export PATH=/c/CompSci/Ghdl/bin:$PATH

# Default values to control function plotting for the ASCII option.
fmt="ascii"
x_dim=80
y_dim=20
step=0.05

rm -rf testfunc-ascii.txt
touch testfunc-ascii.txt

for app in "sin" "cos" "tan" "cot" "secant" "csc" \
  "asin" "acos" "atan" "acot" "asec" "acsc" \
  "sinh" "cosh" "tanh" "coth" "sech" "csch" \
  "asinh" "acosh" "atanh" "acoth" "asech" "acsch" \
  "exp" "log" "sqrt"
do
  echo "Plotting elementary function: ${app} as ASCII text"
  echo "Plotting elementary function: ${app} as ASCII text" >> testfunc-ascii.txt
  ######################################################################
  rm -rf config.txt
  # Write the configuration file.
  touch config.txt
  cat > ./config.txt << EOF
${app}
${fmt}
${x_dim}
${y_dim}
${step}
EOF
  ######################################################################    
  # Create test<func>.txt for saving as an ASCII plot.
  rm -rf test${app}.txt
  touch test${app}.txt
  ######################################################################    
  # Invoke VHDL simulation using Modelsim.
  vsim -c -do "./elemapprox.do"
  ######################################################################    
  # Concatenate the result file for each plotted function to 
  # "testfunc_ascii.txt".
  cat test${app}.txt >> testfunc-ascii.txt
  ######################################################################    
  echo ""
  echo "" >> testfunc-ascii.txt
done

if [ "$SECONDS" -eq 1 ]
then
  units=second
else
  units=seconds
fi
echo "This script has been running $SECONDS $units."

echo "Ran plot-mti-ascii on all tests."
exit 0
