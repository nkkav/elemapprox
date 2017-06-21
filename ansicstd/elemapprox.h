#ifndef ELEMAPPROX_H
#define ELEMAPPROX_H

/* Mathematical constants. */
#define MATH_E              2.7182818284590452354
#define MATH_LOG2E          1.4426950408889634074
#define MATH_LOG10E         0.43429448190325182765
#define MATH_LN2            0.69314718055994530942
#define MATH_LN10           2.30258509299404568402
#define MATH_SQRT2          1.41421356237309504880
#define MATH_SQRT1_2        0.70710678118654752440

#define MATH_PI             3.1415926535897932384626433
#define MATH_TWO_PI         2.0 * MATH_PI
#define MATH_HALF_PI        MATH_PI / 2.0
#define MATH_THREE_HALF_PI  3.0 * MATH_PI / 2.0
#define MATH_2_PI           2.0 / MATH_PI
#define MATH_4_PI           4.0 / MATH_PI

/* Function prototypes. */
double kfabs(double n);
double kfloor(double x);
double kceil(double x);
double kfmod(double a, double b);
double ksin(double x);
double kcos(double x);
double ktan(double x);
double kcot(double x);
double ksec(double x);
double kcsc(double x);
double rootof2(int n);
double kexp(double x);
double klog(double x);
double kpow(double x, double y);
double ksqrt(double x);
double khypot(double x, double y);
double katan(double x);
double katan2(double y, double x);
double kasin(double x);
double kacos(double x);
double kacot(double x);
double kasec(double x);
double kacsc(double x);
double ksinh(double x);
double kcosh(double x);
double ktanh(double x);
double kcoth(double x);
double ksech(double x);
double kcsch(double x);
double kasinh(double x);
double kacosh(double x);
double katanh(double x);
double kacoth(double x);
double kasech(double x);
double kacsch(double x);
double kfmin(double x, double y);
double kfmax(double x, double y);

#endif /* ELEMAPPROX_H */
