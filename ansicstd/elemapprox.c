#include <stdio.h>
#include <stdlib.h>
#include <math.h>
#include "elemapprox.h"

#define FLOOR(x)          ((int) (x))

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

double kfloor(double x)
{
  return floor(x);
}

double kfrac(double x)
{
  return (x - kfloor(x));
}

double kfmod(double a, double b)
{
  return fmod(a, b);
}

double kceil(double x)
{
  return ceil(x);
}

double kcos(double x)
{
  return cos(x);
}

double ksin(double x)
{
  return sin(x);
}

double ktan(double x)
{
  return tan(x);
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

double kexp(double x)
{
  return exp(x);
}

double klog(double x)
{
  return log(x);
}

double kpow(double x, double y)
{
  return pow(x, y);
}

double ksqrt(double x)
{
  return sqrt(x);
}

double khypot(double x, double y)
{
  return (ksqrt(x*x + y*y));
}

double katan(double x)
{
  return atan(x);
}

double katan2(double y, double x)
{
  return atan2(y, x);
}

double kasin(double x)
{
  return asin(x);
}

double kacos(double x)
{
  return acos(x);
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
  return sinh(x);
}

double kcosh(double x)
{
  return cosh(x);
}

double ktanh(double x)
{
  return tanh(x);
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
