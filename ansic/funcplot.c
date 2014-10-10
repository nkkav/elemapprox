#include <stdio.h>
#include "elemapprox.h"
#include "graph.h"

extern double step;


void plot_acos(void) 
{
  double x, y=0.0;
  graph_init(-1.1, -0.1, 1.1, 3.25);
  x = -1.0+0.01;
  while (x <= 1.0-0.01) {
    y = kacos(x);
    graph_plot(x, y);
    x = x + step;
  }
}

void plot_acosh(void)
{
  double x, y=0.0;
  graph_init(0.9, 0.0, 10.0, 5.0);
  x = 1.05;
  while (x <= 10.0) {
    y = kacosh(x);
    graph_plot(x, y);
    x = x + step;
  }
}

void plot_acot(void)
{
  double x, y=0.0;
  graph_init(-10.0, 0.0, 10.0, 3.2);
  x = -10.0;
  while (x <= 10.0) {
    y = kacot(x);
    graph_plot(x, y);
    x = x + step;
  }
}

void plot_acoth(void)
{
  double x, y=0.0;
  graph_init(-5.0, -2.0, 5.0, 2.0);
  x = -5.0;
  while (x <= 5.0) {
    if ((x < -1.0) || (x > 1.0)) {
      y = kacoth(x);
    }
    graph_plot(x, y);
    x = x + step;
  }
}

void plot_acsc(void)
{
  double x, y=0.0;
  graph_init(-10.0, -1.57, 10.0, 1.57);
  x = -10.0;
  while (x <= 10.0) {
    if ((x <= -1.0) || (x >= 1.0)) {
      y = kacsc(x);
    }
    graph_plot(x, y);
    x = x + step;
  }
}

void plot_acsch(void)
{
  double x, y=0.0;
  graph_init(-10.0, -3.5, 10.0, 3.5);
  x = -10.0;
  while (x <= 10.0) {
    if (x != 0.0) {
      y = kacsch(x);
    }
    graph_plot(x, y);
    x = x + 0.05;
  }
}

void plot_asec(void)
{
  double x, y=0.0;
  graph_init(-10.0, -1.6, 10.0, 1.6);
  x = -10.0;
  while (x <= 10.0) {
    if ((x <= -1.0) || (x >= 1.0)) {
      y = kasec(x);
    }
    graph_plot(x, y);
    x = x + step;
  }
}

void plot_asech(void)
{
  double x, y=0.0;
  graph_init(0.0, 0.0, 1.1, 3.0);
  x = 0.0;
  while (x <= 1.0) {
    if ((x > 0.0) && (x <= 1.0)) {
      y = kasech(x);
    }
    graph_plot(x, y);
    x = x + step;
  }
}

void plot_asin(void)
{
  double x, y=0.0;
  graph_init(-1.1, -1.57, 1.1, 1.57);
  x = -1.0+0.01;
  while (x <= 1.0-0.01) {
    y = kasin(x);
    graph_plot(x, y);
    x = x + step;
  }
}

void plot_asinh(void)
{
  double x, y=0.0;
  graph_init(-10.0, -5.0, 10.0, 5.0);
  x = -10.0;
  while (x <= 10.0) {
    y = kasinh(x);
    graph_plot(x, y);
    x = x + step;
  }
}

void plot_atan(void)
{
  double x, y=0.0;
  graph_init(-10.0, -1.6, 10.0, 1.6);
  x = -10.0;
  while (x <= 10.0) {
    y = katan(x);
    graph_plot(x, y);
    x = x + step;
  }
}

void plot_atanh(void)
{
  double x, y=0.0;
  graph_init(-1.1, -2.0, 1.1, 2.0);
  x = -0.95;
  while (x <= 0.95) {
    y = katanh(x);
    graph_plot(x, y);
    x = x + step;
  }
}

void plot_cos(void)
{
  double x, y=0.0;
  graph_init(-10.0, -1.1, 10.0, 1.1);
  x = -10.0;
  while (x <= 10.0) {
    y = kcos(x);
    graph_plot(x, y);
    x = x + step;
  }
}

void plot_cosh(void)
{
  double x, y=0.0;
  graph_init(-10.0, 0.0, 10.0, 100.0);
  x = -10.0;
  while (x <= 10.0) {
    y = kcosh(x);
    graph_plot(x, y);
    x = x + step;
  }
}

void plot_cot(void)
{
  double x, y=0.0;
  graph_init(-3.5, -10.0, 3.5, 10.0);
  x = -3.5;
  while (x <= 3.5) {
    y = kcot(x);
    graph_plot(x, y);
    x = x + step;
  }
}

void plot_coth(void)
{
  double x, y=0.0;
  graph_init(-2.0, -10.0, 2.0, 10.0);
  x = -10.0;
  while (x <= 10.0) {
    y = kcoth(x);
    graph_plot(x, y);
    x = x + step;
  }
}

void plot_csc(void)
{
  double x, y=0.0;
  graph_init(-10.0, -10.0, 10.0, 10.0);
  x = -10.0;
  while (x <= 10.0) {
    y = kcsc(x);
    graph_plot(x, y);
    x = x + step;
  }
}

void plot_csch(void)
{
  double x, y=0.0;
  graph_init(-5.0, -10.0, 5.0, 10.0);
  x = -10.0;
  while (x <= 10.0) {
    y = kcsch(x);
    graph_plot(x, y);
    x = x + step;
  }
}

void plot_exp(void)
{
  double x, y=0.0;
  graph_init(-8.0, -100.0, 8.0, 100.0);
  x = -8.0;
  while (x <= 8.0) {
    y = kexp(x);
    graph_plot(x, y);
    x = x + step;
  }
}

void plot_sqrt(void)
{
  double x, y=0.0;
  graph_init(0.0, 0.0, 200.0, 20.0);
  x = 0.0;
  while (x <= 200.0) {
    y = ksqrt(x);
    graph_plot(x, y);
    x = x + step;
  }
}

void plot_sec(void)
{
  double x, y=0.0;
  graph_init(-10.0, -10.0, 10.0, 10.0);
  x = -10.0;
  while (x <= 10.0) {
    y = ksec(x);
    graph_plot(x, y);
    x = x + step;
  }
}

void plot_sech(void)
{
  double x, y=0.0;
  graph_init(-10.0, 0.0, 10.0, 1.1);
  x = -10.0;
  while (x <= 10.0) {
    y = ksech(x);
    graph_plot(x, y);
    x = x + step;
  }
}

void plot_sin(void)
{
  double x, y=0.0;
  graph_init(-10.0, -1.1, 10.0, 1.1);
  x = -10.0;
  while (x <= 10.0) {
    y = ksin(x);
    graph_plot(x, y);
    x = x + step;
  }
}

void plot_sinh(void)
{
  double x, y=0.0;
  graph_init(-10.0, -100.0, 10.0, 100.0);
  x = -10.0;
  while (x <= 10.0) {
    y = ksinh(x);
    graph_plot(x, y);
    x = x + step;
  }
}

void plot_tan(void)
{
  double x, y=0.0;
  graph_init(-3.5, -10.0, 3.5, 10.0);
  x = -3.5;
  while (x <= 3.5) {
    y = ktan(x);
    graph_plot(x, y);
    x = x + step;
  }
}

void plot_tanh(void)
{
  double x, y=0.0;
  graph_init(-10.0, -1.1, 10.0, 1.1);
  x = -10.0;
  while (x <= 10.0) {
    y = ktanh(x);
    graph_plot(x, y);
    x = x + step;
  }
}
