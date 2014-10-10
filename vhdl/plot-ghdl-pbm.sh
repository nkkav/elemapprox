#!/bin/bash

#export PATH=/c/CompSci/Ghdl/bin:$PATH

# Default values to control function plotting for the ASCII option.
fmt="pbm"
x_dim=256
y_dim=256
step=0.001

for app in "sin" "cos" "tan" "cot" "sec" "csc" \
  "asin" "acos" "atan" "acot" "asec" "acsc" \
  "sinh" "cosh" "tanh" "coth" "sech" "csch" \
  "asinh" "acosh" "atanh" "acoth" "asech" "acsch" \
  "exp" "sqrt"
do
  echo "Plotting elementary function: ${app} as PBM image"
  ######################################################################
  # Adjust step for certain elementary functions.
  if [ "${app}" == "cot" ] 
  then
    step=0.02
  elif [ "${app}" == "acsch" ] 
  then
    step=0.05
  else
    step=0.001
  fi  
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
  # Invoke VHDL simulation using GHDL.
  make -f elemapprox.mk clean
  make -f elemapprox.mk init
  make -f elemapprox.mk run
  ######################################################################    
  echo ""
done

if [ "$SECONDS" -eq 1 ]
then
  units=second
else
  units=seconds
fi
echo "This script has been running $SECONDS $units."

echo "Ran plot-ghdl-pbm on all tests."
exit 0
