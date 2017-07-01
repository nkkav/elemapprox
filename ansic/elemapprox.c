#include <stdio.h>
#include <stdlib.h>
#include <math.h>
#include "elemapprox.h"

double kfabs(double n)
{
  double f;
  if (n >= 0.0) {
    f = n;
  } else {
    f = -n;
  }
  return (f);
}

// *********************************************************
// ***
// ***   Routines to compute sine and cosine to 14.7 digits
// ***  of accuracy. 
// ***
// *********************************************************
//
//		kcos_internal computes cosine (x)
//
//  Accurate to about 14.7 decimal digits over the range [0, pi/2].
//  The input argument is in radians.
//
//  Algorithm:
//		cos(x)= c1 + c2*x**2 + c3*x**4 + c4*x**6 + c5*x**8 + c6*x**10 + c7*x**12
//   which is the same as:
//		cos(x)= c1 + x**2(c2 + c3*x**2 + c4*x**4 + c5*x**6 + c6*x**8 + c7*x**10)
//		cos(x)= c1 + x**2(c2 + x**2(c3 + c4*x**2 + c5*x**4 + c6*x**6 + c7*x**8 ))
//		cos(x)= c1 + x**2(c2 + x**2(c3 + x**2(c4 + c5*x**2 + c6*x**4 + c7*x**6 )))
//		cos(x)= c1 + x**2(c2 + x**2(c3 + x**2(c4 + x**2(c5 + c6*x**2 + c7*x**4 ))))
//		cos(x)= c1 + x**2(c2 + x**2(c3 + x**2(c4 + x**2(c5 + x**2(c6 + c7*x**2 )))))
//
double kcos_internal(double x)
{
  const double c1= 0.99999999999999806767; 
  const double c2=-0.4999999999998996568; 
  const double c3= 0.04166666666581174292; 
  const double c4=-0.001388888886113613522; 
  const double c5= 0.000024801582876042427; 
  const double c6=-0.0000002755693576863181; 
  const double c7= 0.0000000020858327958707; 
  const double c8=-0.000000000011080716368; 
  double x2 = x * x;
  return (    c1 + x2*(c2 + x2*(c3 + x2*(c4 + 
              x2*(c5 + x2*(c6 + x2*(c7 + 
              x2*c8))))))); 
}

double kfloor(double x)
{
  int temp = x - 0.5;
  return (temp - (temp % 1));
}

double kfrac(double x)
{
  return (x - kfloor(x));
}

double kfmod(double a, double b)
{
  double t0 = kfabs(a/b);
  double t1 = kfrac(t0);
  double c = t1*kfabs(b);
  return ((a < 0) ? -c : c);
}

double kceil(double x)
{
  return -kfloor(-x);
}

double kround(double x)
{
  double tround = 0.0;
  if (x > 0.0)
    tround = kfloor(x + 0.5);
  else if (x < 0.0)
    tround = kceil(x - 0.5);
  return tround;
}

double ktrunc(double x)
{
  double ttrunc;
  if (x > 0.0)
    ttrunc = kfloor(x);
  else
    ttrunc = kceil(x);
  return ttrunc;
}

// This is the main cosine approximation "driver"
// It reduces the input argument's range to [0, pi/2],
// and then calls the approximator.
// See the notes for an explanation of the range reduction.
//
double kcos(double x)
{
  int quad;                          // What quadrant are we in?
  double x1 = kfmod(x, MATH_TWO_PI); // Get rid of values > 2*pi
  if (x1 < 0.0) {
    x1 = -x1;                       // cos(-x) = cos(x)
  }
  quad = (int)(x1 * MATH_2_PI);    // Get quadrant # (0 to 3) we're in
  switch (quad) {
    case 0: return  kcos_internal(x1);
    case 1: return -kcos_internal(MATH_PI - x1);
    case 2: return -kcos_internal(x1 - MATH_PI);
    case 3: return  kcos_internal(MATH_TWO_PI - x1);
    default:
      fprintf(stderr, "Error: Wrong value (%d) for quadrant.\n", quad);
      exit(1);
      break;
  }
}

double ksin(double x)
{
  return (kcos(MATH_HALF_PI - x));
}

double ktan(double x)
{
  return (ksin(x)/kcos(x));
}

double kcot(double x)
{
  double cotval;
  // Not defined where sin(x) == 0.0;
  cotval = kcos(x)/ksin(x);
  return (cotval);
}

double ksec(double x)
{
  double secval;
  // Not defined where cos(x) == 0.0;
  secval = 1.0/kcos(x);
  return (secval);
}

double kcsc(double x)
{
  double cscval;
  // Not defined where sin(x) == 0.0;
  cscval = 1.0/ksin(x);
  return (cscval);
}

double rootof2(int n)
{
  double power;
  int i;
  power = 0.82629586;
  power = power / 10000000.0;
  power = power + 1.0;
  i = -23;
  if (n >= 1) {
    power = 2.0;
    i = 0;
  }
  for (; i < n; i = i + 1) {
    power = power * power;
  }
  return (power);
}

double kexp(double x)
{
  double x1, power, prod, expval;
  int i;
  x1 = kfabs(x) * MATH_LOG2E;
  if (x1 > 255.0) {
    expval = 0.0;
    if (x > 0.0) {
      printf("exp illegal argument: %lf", x);
      exit(1);
    }
  } else {
    prod = 1.0;
    power = 128.0;
    for (i = 7; i >= -23; i = i-1) {
      if (x1 > power) {
        prod = prod * rootof2(i);
        x1 = x1 - power;
      }
      power = power / 2.0;
    }
    if (x < 0.0) {
      expval = 1.0 / prod;
    } else {
      expval = prod;
    }
  }
  return (expval);
}

double klog(double x)
{
  double re, log2val, logval;
  int i;
  if (x <= 0.0) {
    printf("log illegal argument: %lf",x);
    exit(1);
    logval = 0;
  } else {
    if (x < 1.0) {
      re = 1.0/x;
    } else {
      re = x;
    }
    log2val = 0.0;
    for (i = 7; i >= -23; i = i-1) {
      if (re > rootof2(i)) {
        re = re/rootof2(i);
        log2val = 2.0*log2val + 1.0;
      } else {
        log2val = log2val * 2;
      }
    }
    if (x < 1.0) {
      logval = -log2val/12102203.16; // 2^23 * log2(e)
    } else {
      logval = log2val/12102203.16;
    }
  }
  return (logval);
}

double klog10(double x)
{
  return klog(x) / MATH_LN10;
}

double kpow(double x, double y)
{
  double powval;
  if (x < 0.0) {
    printf("pow illegal argument: %lf", x);
    exit(1);
  }
  powval = kexp(y * klog(x));
  return (powval);
}

double ksqrt(double x)
{
  double sqrtval;
  double epsilon;
  epsilon = 0.00001;
  if (x < 0.0) {
    printf("sqrt illegal argument: %lf", x);
    exit(1);
  }
  if (x < epsilon) {
    sqrtval = 0.0;
  } else {
    sqrtval = kexp(0.5 * klog(x));
  }
  return (sqrtval);
}

double khypot(double x, double y)
{
  return (ksqrt(x*x + y*y));
}

double katan(double x)
{
  double x1, x2, sign, bias;
  double d3, s3;
  double atanval;
  sign = 1.0;
  bias = 0.0;
  x1 = x;
  if (x1 < 0.0) {
    x1 = -x1;
    sign = -1.0;
  }
  if (x1 > 1.0) {
    x1 = 1.0 / x1;
    bias = sign * MATH_PI/2.0;
    sign = -1.0 * sign;
  }
  x2 = x1 * x1;
  d3 = x2 + 1.44863154;
  d3 = 0.26476862 / d3;
  s3 = x2 + 3.3163354;
  d3 = s3 - d3;
  d3 = 7.10676 / d3;
  s3 = 6.762139 + x2;
  d3 = s3 - d3;
  d3 = 3.7092563 / d3;
  d3 = d3 + 0.17465544;
  atanval = sign * x1 * d3 + bias;
  return (atanval);
}

//if x = y = 0, then the result is indefinite,
//if x > 0 and y = 0, then atan2 = 0,
//if x < 0 and y = 0, then atan2 = p, else
//if y < 0, then -p < atan2 < 0,
//if y > 0, then 0 < atan2 < p.
//if x > 0 then
//  theta = arctan(y/x)
//if x < 0 then
//  theta = arctan(y/x) - 180 degrees
//if x = 0 then
//  if y > 0 then
//    theta = 90 degrees
//  if y < 0 then
//    theta = -90 degrees
//  if y = 0 then
//    theta is indeterminate
double katan2(double y, double x)
{
  double katan2val=0.0;
  if (x > 0.0) {
    katan2val = katan(y/x);
  }
  if (x < 0.0) {
    if (y < 0.0) {
      katan2val = katan(y/x) - MATH_PI;
    } else {
      katan2val = katan(y/x) + MATH_PI;
    }
  }
  if (x == 0.0) {
    if (y > 0.0) {
      katan2val = MATH_PI/2.0;
    }
    if (y < 0.0) {
      katan2val = -MATH_PI/2.0;
    }
    if (y == 0.0) {
      printf("atan2 error");
      exit(1);
    }
  }
  return (katan2val);
}

double kasin(double x)
{
  double asinval;
  if ((x <= -1.0) || (x >= 1.0)) {
    printf("asin illegal argument: %lf", x);
    exit(1);
  }
  asinval = katan(x/ksqrt(1 - x*x));
  return (asinval);
}

double kacos(double x)
{
  double acosval;
  if ((x <= -1.0) || (x >= 1.0)) {
    printf("acos illegal argument: %lf", x);
    exit(1);
  }
  acosval = katan(ksqrt(1.0-x*x)/x);
  return (acosval);
}

double kacot(double x)
{
  double acotval;
  acotval = katan(1.0/x);
  return (acotval);
}

double kasec(double x)
{
  double asecval;
  if ((x > -1.0) && (x < 1.0)) {
    printf("asec illegal argument: %lf", x);
    exit(1);
  }
  asecval = kacos(1.0/x);
  return (asecval);
}

double kacsc(double x)
{
  double acscval;
  if ((x > -1.0) && (x < 1.0)) {
    printf("acsc illegal argument: %lf", x);
    exit(1);
  }
  acscval = kasin(1.0/x);
  return (acscval);
}

double ksinh(double x)
{
  double sinhval;
  sinhval = (kexp(x) - kexp(-x))/2.0;
  return (sinhval);
}

double kcosh(double x)
{
  double coshval;
  coshval = (kexp(x) + kexp(-x))/2.0;
  return (coshval);
}

double ktanh(double x)
{
  double tanhval;
  tanhval = ksinh(x) / kcosh(x);
  return (tanhval);
}

double kcoth(double x)
{
  double cothval;
  if (x == 0.0) {
    printf("coth illegal argument: %lf", x);
    exit(1);
  }
  cothval = kcosh(x) / ksinh(x);
  return (cothval);
}

double ksech(double x)
{
  double sechval;
  sechval = 1.0 / kcosh(x);
  return (sechval);
}

double kcsch(double x)
{
  double cschval;
  if (x == 0.0) {
    printf("csch illegal argument: %lf", x);
    exit(1);
  }
  cschval = 1.0 / ksinh(x);
  return (cschval);
}

double kasinh(double x)
{
  double kasinhval;
  kasinhval = klog(x + ksqrt(x*x + 1.0));
  return (kasinhval);
}

double kacosh(double x)
{
  double kacoshval;
  if (x < 1.0) {
    printf("acosh illegal argument: %lf", x);
    exit(1);
  }
  kacoshval = klog(x + ksqrt(x*x - 1.0));
  return (kacoshval);
}

double katanh(double x)
{
  double katanhval;
  if ((x <= -1.0) || (x >= 1.0)) {
    printf("atanh illegal argument: %lf", x);
    exit(1);
  }
  katanhval = 0.5 * klog((1.0+x)/(1.0-x));
  return (katanhval);
}

double kacoth(double x)
{
  double acothval;
  if ((x >= -1.0) && (x <= 1.0)) {
    printf("acoth illegal argument: %lf", x);
    exit(1);
  }
  acothval = 0.5 * klog((x+1.0)/(x-1.0));
  return (acothval);
}

double kasech(double x)
{
  double asechval;
  if ((x <= 0.0) || (x > 1.0)) {
    printf("asech illegal argument: %lf", x);
    exit(1);
  }
  asechval = klog((1.0 + ksqrt(1.0 - x*x))/x);
  return (asechval);
}

double kacsch(double x)
{
  double acschval=0.0;
  if (x == 0.0) {
    printf("acsch illegal argument: %lf", x);
    exit(1);
  }
  if (x > 0.0) {
    acschval = klog((1.0 + ksqrt(x*x + 1.0))/x);
  } else if (x < 0.0) {
    acschval = klog((1.0 - ksqrt(x*x + 1.0))/x);
  }
  return (acschval);
}

double kfmin(double x, double y)
{
  double f;
  if (x < y)
    f = x;
  else
    f = y;
  return f;
}

double kfmax(double x, double y)
{
  double f;
  if (x > y)
    f = x;
  else
    f = y;
  return f;
}

