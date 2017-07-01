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
//#define MATH_TWO_PI         6.28318530717958647693
//#define MATH_PI_2           1.57079632679489661923
//#define MATH_PI_4           0.78539816339744830962
//#define MATH_1_PI           0.31830988618379067154
//#define MATH_2_PI           0.63661977236758134308
//#define MATH_2_SQRTPI       1.12837916709551257390

//double const twopi=2.0*pi;			    // pi times 2
//double const two_over_pi= 2.0/pi;		    // 2/pi
//double const halfpi=pi/2.0;			    // pi divided by 2
//double const threehalfpi=3.0*pi/2.0;  	// pi times 3/2, used in tan routines
//double const four_over_pi=4.0/pi;		    // 4/pi, used in tan routines
//double const qtrpi=pi/4.0;			    // pi/4.0, used in tan routines
//double const sixthpi=pi/6.0;			    // pi/6.0, used in atan routines
//double const tansixthpi=tan(sixthpi);		// tan(pi/6), used in atan routines
//double const twelfthpi=pi/12.0;			// pi/12.0, used in atan routines
//double const tantwelfthpi=tan(twelfthpi);	// tan(pi/12), used in atan routines

/* Function prototypes. */
double kfabs(double n);
double kfloor(double x);
double kceil(double x);
double kround(double x);
double ktrunc(double x);
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
double klog10(double x);
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
