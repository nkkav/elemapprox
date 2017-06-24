#!/bin/bash

DIR1=$1
DIR2=$2

for app in "sin" "cos" "tan" "cot" "sec" "csc" \
  "asin" "acos" "atan" "acot" "asec" "acsc" \
  "sinh" "cosh" "tanh" "coth" "sech" "csch" \
  "asinh" "acosh" "atanh" "acoth" "asech" "acsch" \
  "exp" "log" "sqrt" \
  "floor" "ceil" "fabs" "round" "trunc"
do
  app1=""
  app2=""
  echo "Compare function ${app} in ${DIR1} and ${DIR2}"
  if [[ "$DIR1" == *"vhdlieee"* ]]; then
    app1=k$app
    if [[ "$app" == "sec" ]]; then
      app1=ksecant
    fi
  else
    app1=$app
  fi
  if [[ "$DIR2" == *"vhdlieee"* ]]; then
    app2=k$app
    if [[ "$app" == "sec" ]]; then
      app2=ksecant
    fi
  else
    app2=$app
  fi
  diff ${DIR1}/test${app1}.txt ${DIR2}/test${app2}.txt
  echo ""
done

