--------------------------------------------------------------------------------
-- Filename: funcplot.vhd
-- Purpose : Routines for plotting the elementary function approximations.
-- Author  : Nikolaos Kavvadias (C) 2014
-- Date    : 06-Oct-2014
-- Revision: 0.0.0 (14/10/06)
--           Initial version hand-translated and adapted from the Verilog HDL 
--           version (funcplot.v).
--
--------------------------------------------------------------------------------

library IEEE;
use STD.textio.all;
use WORK.graph_pkg.all;
use WORK.elemapprox_pkg.all;

package funcplot_pkg is
    
  -- Interface for the implemented elementary functions.
  procedure plot_acos (
    step  : in real; 
    x_dim : in integer; 
    y_dim : in integer;
    a     : inout pixel_arr);
  procedure plot_acosh (
    step  : in real; 
    x_dim : in integer; 
    y_dim : in integer;
    a     : inout pixel_arr);
  procedure plot_acot (
    step  : in real; 
    x_dim : in integer; 
    y_dim : in integer;
    a     : inout pixel_arr);
  procedure plot_acoth (
    step  : in real; 
    x_dim : in integer; 
    y_dim : in integer;
    a     : inout pixel_arr); 
  procedure plot_acsc (
    step  : in real; 
    x_dim : in integer; 
    y_dim : in integer;
    a     : inout pixel_arr);
  procedure plot_acsch (
    step  : in real; 
    x_dim : in integer; 
    y_dim : in integer;
    a     : inout pixel_arr);
  procedure plot_asec (
    step  : in real; 
    x_dim : in integer; 
    y_dim : in integer;
    a     : inout pixel_arr);
  procedure plot_asech (
    step  : in real; 
    x_dim : in integer; 
    y_dim : in integer;
    a     : inout pixel_arr);
  procedure plot_asin (
    step  : in real; 
    x_dim : in integer; 
    y_dim : in integer;
    a     : inout pixel_arr);
  procedure plot_asinh (
    step  : in real; 
    x_dim : in integer; 
    y_dim : in integer;
    a     : inout pixel_arr);
  procedure plot_atan (
    step  : in real; 
    x_dim : in integer; 
    y_dim : in integer;
    a     : inout pixel_arr);
  procedure plot_atanh (
    step  : in real; 
    x_dim : in integer; 
    y_dim : in integer;
    a     : inout pixel_arr);
  procedure plot_cos (
    step  : in real; 
    x_dim : in integer; 
    y_dim : in integer;
    a     : inout pixel_arr);
  procedure plot_cosh (
    step  : in real; 
    x_dim : in integer; 
    y_dim : in integer;
    a     : inout pixel_arr);
  procedure plot_cot (
    step  : in real; 
    x_dim : in integer; 
    y_dim : in integer;
    a     : inout pixel_arr); 
  procedure plot_coth (
    step  : in real; 
    x_dim : in integer; 
    y_dim : in integer;
    a     : inout pixel_arr);
  procedure plot_csc (
    step  : in real; 
    x_dim : in integer; 
    y_dim : in integer;
    a     : inout pixel_arr);
  procedure plot_csch (
    step  : in real; 
    x_dim : in integer; 
    y_dim : in integer;
    a     : inout pixel_arr);
  procedure plot_exp (
    step  : in real; 
    x_dim : in integer; 
    y_dim : in integer;
    a     : inout pixel_arr);
  procedure plot_log (
    step  : in real; 
    x_dim : in integer; 
    y_dim : in integer;
    a     : inout pixel_arr);
  procedure plot_log10 (
    step  : in real; 
    x_dim : in integer; 
    y_dim : in integer;
    a     : inout pixel_arr);
  procedure plot_sqrt (
    step  : in real; 
    x_dim : in integer; 
    y_dim : in integer;
    a     : inout pixel_arr);
  procedure plot_sec (
    step  : in real; 
    x_dim : in integer; 
    y_dim : in integer;
    a     : inout pixel_arr);
  procedure plot_sech (
    step  : in real; 
    x_dim : in integer; 
    y_dim : in integer;
    a     : inout pixel_arr);
  procedure plot_sin (
    step  : in real; 
    x_dim : in integer; 
    y_dim : in integer;
    a     : inout pixel_arr); 
  procedure plot_sinh (
    step  : in real; 
    x_dim : in integer; 
    y_dim : in integer;
    a     : inout pixel_arr);
  procedure plot_tan (
    step  : in real; 
    x_dim : in integer; 
    y_dim : in integer;
    a     : inout pixel_arr);
  procedure plot_tanh (
    step  : in real; 
    x_dim : in integer; 
    y_dim : in integer;
    a     : inout pixel_arr);
  procedure plot_floor (
    step  : in real; 
    x_dim : in integer; 
    y_dim : in integer;
    a     : inout pixel_arr);
  procedure plot_ceil (
    step  : in real; 
    x_dim : in integer; 
    y_dim : in integer;
    a     : inout pixel_arr);
  procedure plot_fabs (
    step  : in real; 
    x_dim : in integer; 
    y_dim : in integer;
    a     : inout pixel_arr);
  procedure plot_round (
    step  : in real; 
    x_dim : in integer; 
    y_dim : in integer;
    a     : inout pixel_arr);
  procedure plot_trunc (
    step  : in real; 
    x_dim : in integer; 
    y_dim : in integer;
    a     : inout pixel_arr);
end package funcplot_pkg;


package body funcplot_pkg is

  procedure plot_acos (
    step  : in real; 
    x_dim : in integer; 
    y_dim : in integer;
    a     : inout pixel_arr
  ) is
    variable x, y : real;
    variable xmin, ymin, xmax, ymax : real;
    variable ol   : line;
  begin
    graph_init(-1.1, -0.1, 1.1, 3.25, y_dim, a, xmin, ymin, xmax, ymax);
    x := -1.0+step;
    y := 0.0;
    while (x <= 1.0-step) loop
      y := acos(x);
      graph_plot(x, y, xmin, ymin, xmax, ymax, x_dim, y_dim, a);
      x := x + step;
    end loop;
  end plot_acos;

  procedure plot_acosh (
    step  : in real; 
    x_dim : in integer; 
    y_dim : in integer;
    a     : inout pixel_arr
  ) is
    variable x, y : real;
    variable xmin, ymin, xmax, ymax : real;
  begin
    graph_init(0.9, 0.0, 10.0, 5.0, y_dim, a, xmin, ymin, xmax, ymax);
    x := 1.05;
    y := 0.0;
    while (x <= 10.0) loop
      y := acosh(x);
      graph_plot(x, y, xmin, ymin, xmax, ymax, x_dim, y_dim, a);
      x := x + step;
    end loop;
  end plot_acosh;  

  procedure plot_acot (
    step  : in real; 
    x_dim : in integer; 
    y_dim : in integer;
    a     : inout pixel_arr
  ) is
    variable x, y : real;
    variable xmin, ymin, xmax, ymax : real;
  begin
    graph_init(-10.0, 0.0, 10.0, 3.2, y_dim, a, xmin, ymin, xmax, ymax);
    x := -10.0;
    y := 0.0;
    while (x <= 10.0) loop
      y := acot(x);
      graph_plot(x, y, xmin, ymin, xmax, ymax, x_dim, y_dim, a);
      x := x + step;
    end loop;
  end plot_acot;  
 
  procedure plot_acoth (
    step  : in real; 
    x_dim : in integer; 
    y_dim : in integer;
    a     : inout pixel_arr
  ) is
    variable x, y : real;
    variable xmin, ymin, xmax, ymax : real;
  begin
    graph_init(-5.0, -2.0, 5.0, 2.0, y_dim, a, xmin, ymin, xmax, ymax);
    x := -5.0;
    y := 0.0;
    while (x <= 5.0) loop
      if ((x < -1.0) or (x > 1.0)) then    
        y := acoth(x);
      end if;
      graph_plot(x, y, xmin, ymin, xmax, ymax, x_dim, y_dim, a);
      x := x + step;
    end loop;
  end plot_acoth;  
  
  procedure plot_acsc (
    step  : in real; 
    x_dim : in integer; 
    y_dim : in integer;
    a     : inout pixel_arr
  ) is
    variable x, y : real;
    variable xmin, ymin, xmax, ymax : real;
  begin
    graph_init(-10.0, -1.57, 10.0, 1.57, y_dim, a, xmin, ymin, xmax, ymax);
    x := -10.0;
    y := 0.0;
    while (x <= 10.0) loop
      if ((x <= -1.0) or (x >= 1.0)) then  
        y := acsc(x);
      end if;
      graph_plot(x, y, xmin, ymin, xmax, ymax, x_dim, y_dim, a);
      x := x + step;
    end loop;
  end plot_acsc;  

  procedure plot_acsch (
    step  : in real; 
    x_dim : in integer; 
    y_dim : in integer;
    a     : inout pixel_arr
  ) is
    variable x, y : real;
    variable xmin, ymin, xmax, ymax : real;
  begin
    graph_init(-10.0, -3.5, 10.0, 3.5, y_dim, a, xmin, ymin, xmax, ymax);
    x := -10.0;
    y := 0.0;
    while (x <= 10.0) loop
      if (x /= 0.0) then
        y := acsch(x);
      end if;
      graph_plot(x, y, xmin, ymin, xmax, ymax, x_dim, y_dim, a);
      x := x + step;
    end loop;
  end plot_acsch;  

  procedure plot_asec (
    step  : in real; 
    x_dim : in integer; 
    y_dim : in integer;
    a     : inout pixel_arr
  ) is
    variable x, y : real;
    variable xmin, ymin, xmax, ymax : real;
  begin
    graph_init(-10.0, -1.6, 10.0, 1.6, y_dim, a, xmin, ymin, xmax, ymax);
    x := -10.0;
    y := 0.0;
    while (x <= 10.0) loop
      if ((x <= -1.0) or (x >= 1.0)) then     
        y := asec(x);
      end if;
      graph_plot(x, y, xmin, ymin, xmax, ymax, x_dim, y_dim, a);
      x := x + step;
    end loop;
  end plot_asec;  

  procedure plot_asech (
    step  : in real; 
    x_dim : in integer; 
    y_dim : in integer;
    a     : inout pixel_arr
  ) is
    variable x, y : real;
    variable xmin, ymin, xmax, ymax : real;
  begin
    graph_init(0.0, 0.0, 1.1, 3.0, y_dim, a, xmin, ymin, xmax, ymax);
    x := 0.0;
    y := 0.0;
    while (x <= 1.0) loop
      if ((x > 0.0) and (x <= 1.0)) then      
        y := asech(x);
      end if;
      graph_plot(x, y, xmin, ymin, xmax, ymax, x_dim, y_dim, a);
      x := x + step;
    end loop;
  end plot_asech;    

  procedure plot_asin (
    step  : in real; 
    x_dim : in integer; 
    y_dim : in integer;
    a     : inout pixel_arr
  ) is
    variable x, y : real;
    variable xmin, ymin, xmax, ymax : real;
  begin
    graph_init(-1.1, -1.57, 1.1, 1.57, y_dim, a, xmin, ymin, xmax, ymax);
    x := -1.0+step;
    y := 0.0;
    while (x <= (1.0-step)) loop
      y := asin(x);
      graph_plot(x, y, xmin, ymin, xmax, ymax, x_dim, y_dim, a);
      x := x + step;
    end loop;
  end plot_asin;    

  procedure plot_asinh (
    step  : in real; 
    x_dim : in integer; 
    y_dim : in integer;
    a     : inout pixel_arr
  ) is
    variable x, y : real;
    variable xmin, ymin, xmax, ymax : real;
  begin
    graph_init(-10.0, -5.0, 10.0, 5.0, y_dim, a, xmin, ymin, xmax, ymax);
    x := -10.0;
    y := 0.0;
    while (x <= 10.0) loop
      y := asinh(x);
      graph_plot(x, y, xmin, ymin, xmax, ymax, x_dim, y_dim, a);
      x := x + step;
    end loop;
  end plot_asinh;
  
  procedure plot_atan (
    step  : in real; 
    x_dim : in integer; 
    y_dim : in integer;
    a     : inout pixel_arr
  ) is
    variable x, y : real;
    variable xmin, ymin, xmax, ymax : real;
  begin
    graph_init(-10.0, -1.6, 10.0, 1.6, y_dim, a, xmin, ymin, xmax, ymax);
    x := -10.0;
    y := 0.0;
    while (x <= 10.0) loop
      y := atan(x);
      graph_plot(x, y, xmin, ymin, xmax, ymax, x_dim, y_dim, a);
      x := x + step;
    end loop;
  end plot_atan;

  procedure plot_atanh (
    step  : in real; 
    x_dim : in integer; 
    y_dim : in integer;
    a     : inout pixel_arr
  ) is
    variable x, y : real;
    variable xmin, ymin, xmax, ymax : real;
  begin
    graph_init(-1.1, -2.0, 1.1, 2.0, y_dim, a, xmin, ymin, xmax, ymax);
    x := -1.0+step;
    y := 0.0;
    while (x <= (1.0-step)) loop
      y := atanh(x);
      graph_plot(x, y, xmin, ymin, xmax, ymax, x_dim, y_dim, a);
      x := x + step;
    end loop;
  end plot_atanh;

  procedure plot_cos (
    step  : in real; 
    x_dim : in integer; 
    y_dim : in integer;
    a     : inout pixel_arr
  ) is
    variable x, y : real;
    variable xmin, ymin, xmax, ymax : real;
  begin
    graph_init(-10.0, -1.1, 10.0, 1.1, y_dim, a, xmin, ymin, xmax, ymax);
    x := -10.0;
    y := 0.0;
    while (x <= 10.0) loop
      y := cos(x);
      graph_plot(x, y, xmin, ymin, xmax, ymax, x_dim, y_dim, a);
      x := x + step;
    end loop;
  end plot_cos;

  procedure plot_cosh (
    step  : in real; 
    x_dim : in integer; 
    y_dim : in integer;
    a     : inout pixel_arr
  ) is
    variable x, y : real;
    variable xmin, ymin, xmax, ymax : real;
  begin
    graph_init(-10.0, 0.0, 10.0, 100.0, y_dim, a, xmin, ymin, xmax, ymax);
    x := -10.0;
    y := 0.0;
    while (x <= 10.0) loop
      y := cosh(x);
      graph_plot(x, y, xmin, ymin, xmax, ymax, x_dim, y_dim, a);
      x := x + step;
    end loop;
  end plot_cosh;

  procedure plot_cot (
    step  : in real; 
    x_dim : in integer; 
    y_dim : in integer;
    a     : inout pixel_arr
  ) is
    variable x, y : real;
    variable xmin, ymin, xmax, ymax : real;
  begin
    graph_init(-3.5, -10.0, 3.5, 10.0, y_dim, a, xmin, ymin, xmax, ymax);
    x := -3.5;
    y := 0.0;
    while (x <= 3.5) loop
      y := cot(x);
      graph_plot(x, y, xmin, ymin, xmax, ymax, x_dim, y_dim, a);
      x := x + step;
    end loop;
  end plot_cot;
 
  procedure plot_coth (
    step  : in real; 
    x_dim : in integer; 
    y_dim : in integer;
    a     : inout pixel_arr
  ) is
    variable x, y : real;
    variable xmin, ymin, xmax, ymax : real;
    variable epsilon : real := 0.00001;
  begin
    graph_init(-2.0, -10.0, 2.0, 10.0, y_dim, a, xmin, ymin, xmax, ymax);
    x := -10.0;
    y := 0.0;
    while (x <= 10.0) loop
      if ((x < -epsilon) or (x > epsilon)) then
        y := coth(x);
      end if;
      graph_plot(x, y, xmin, ymin, xmax, ymax, x_dim, y_dim, a);
      x := x + step;
    end loop;
  end plot_coth;

  procedure plot_csc (
    step  : in real; 
    x_dim : in integer; 
    y_dim : in integer;
    a     : inout pixel_arr
  ) is
    variable x, y : real;
    variable xmin, ymin, xmax, ymax : real;
  begin
    graph_init(-10.0, -10.0, 10.0, 10.0, y_dim, a, xmin, ymin, xmax, ymax);
    x := -10.0;
    y := 0.0;
    while (x <= 10.0) loop
      y := csc(x);
      graph_plot(x, y, xmin, ymin, xmax, ymax, x_dim, y_dim, a);
      x := x + step;
    end loop;
  end plot_csc;
 
  procedure plot_csch (
    step  : in real; 
    x_dim : in integer; 
    y_dim : in integer;
    a     : inout pixel_arr
  ) is
    variable x, y : real;
    variable xmin, ymin, xmax, ymax : real;
    variable epsilon : real := 0.00001;
  begin
    graph_init(-5.0, -10.0, 5.0, 10.0, y_dim, a, xmin, ymin, xmax, ymax);
    x := -10.0;
    y := 0.0;
    while (x <= 10.0) loop
      if ((x < -epsilon) or (x > epsilon)) then
        y := csch(x);
      end if;
      graph_plot(x, y, xmin, ymin, xmax, ymax, x_dim, y_dim, a);
      x := x + step;
    end loop;
  end plot_csch;
 
  procedure plot_exp (
    step  : in real; 
    x_dim : in integer; 
    y_dim : in integer;
    a     : inout pixel_arr
  ) is
    variable x, y : real;
    variable xmin, ymin, xmax, ymax : real;
  begin
    graph_init(-8.0, -100.0, 8.0, 100.0, y_dim, a, xmin, ymin, xmax, ymax);
    x := -8.0;
    y := 0.0;
    while (x <= 8.0) loop
      y := exp(x);
      graph_plot(x, y, xmin, ymin, xmax, ymax, x_dim, y_dim, a);
      x := x + step;
    end loop;
  end plot_exp;

  procedure plot_log (
    step  : in real; 
    x_dim : in integer; 
    y_dim : in integer;
    a     : inout pixel_arr
  ) is
    variable x, y : real;
    variable xmin, ymin, xmax, ymax : real;
    variable epsilon : real;
  begin
    graph_init(0.0, 0.0, 200.0, 20.0, y_dim, a, xmin, ymin, xmax, ymax);
    x := 0.0;
    y := 0.0;
    epsilon := 0.00001;
    while (x <= 200.0) loop
      if (x > epsilon) then
        y := log(x);
      end if;        
      graph_plot(x, y, xmin, ymin, xmax, ymax, x_dim, y_dim, a);
      x := x + step;
    end loop;
  end plot_log;

  procedure plot_log10 (
    step  : in real; 
    x_dim : in integer; 
    y_dim : in integer;
    a     : inout pixel_arr
  ) is
    variable x, y : real;
    variable xmin, ymin, xmax, ymax : real;
    variable epsilon : real;
  begin
    graph_init(0.0, 0.0, 2000.0, 4.0, y_dim, a, xmin, ymin, xmax, ymax);
    x := 0.0;
    y := 0.0;
    epsilon := 0.0001;
    while (x <= 2000.0) loop
      if (x > epsilon) then
        y := log10(x);
      end if;        
      graph_plot(x, y, xmin, ymin, xmax, ymax, x_dim, y_dim, a);
      x := x + step;
    end loop;
  end plot_log10;

  procedure plot_sqrt (
    step  : in real; 
    x_dim : in integer; 
    y_dim : in integer;
    a     : inout pixel_arr
  ) is
    variable x, y : real;
    variable xmin, ymin, xmax, ymax : real;
  begin
    graph_init(0.0, 0.0, 200.0, 20.0, y_dim, a, xmin, ymin, xmax, ymax);
    x := 0.0;
    y := 0.0;
    while (x <= 200.0) loop
      y := sqrt(x);
      graph_plot(x, y, xmin, ymin, xmax, ymax, x_dim, y_dim, a);
      x := x + step;
    end loop;
  end plot_sqrt;
  
  procedure plot_sec (
    step  : in real; 
    x_dim : in integer; 
    y_dim : in integer;
    a     : inout pixel_arr
  ) is
    variable x, y : real;
    variable xmin, ymin, xmax, ymax : real;
  begin
    graph_init(-10.0, -10.0, 10.0, 10.0, y_dim, a, xmin, ymin, xmax, ymax);
    x := -10.0;
    y := 0.0;
    while (x <= 10.0) loop
      y := secant(x);
      graph_plot(x, y, xmin, ymin, xmax, ymax, x_dim, y_dim, a);
      x := x + step;
    end loop;
  end plot_sec;

  procedure plot_sech (
    step  : in real; 
    x_dim : in integer; 
    y_dim : in integer;
    a     : inout pixel_arr
  ) is
    variable x, y : real;
    variable xmin, ymin, xmax, ymax : real;
  begin
    graph_init(-10.0, 0.0, 10.0, 1.1, y_dim, a, xmin, ymin, xmax, ymax);
    x := -10.0;
    y := 0.0;
    while (x <= 10.0) loop
      y := sech(x);
      graph_plot(x, y, xmin, ymin, xmax, ymax, x_dim, y_dim, a);
      x := x + step;
    end loop;
  end plot_sech;

  procedure plot_sin (
    step  : in real; 
    x_dim : in integer; 
    y_dim : in integer;
    a     : inout pixel_arr
  ) is
    variable x, y : real;
    variable xmin, ymin, xmax, ymax : real;
  begin
    graph_init(-10.0, -1.1, 10.0, 1.1, y_dim, a, xmin, ymin, xmax, ymax);
    x := -10.0;
    y := 0.0;
    while (x <= 10.0) loop
      y := sin(x);
      graph_plot(x, y, xmin, ymin, xmax, ymax, x_dim, y_dim, a);
      x := x + step;
    end loop;
  end plot_sin;
  
  procedure plot_sinh (
    step  : in real; 
    x_dim : in integer; 
    y_dim : in integer;
    a     : inout pixel_arr
  ) is
    variable x, y : real;
    variable xmin, ymin, xmax, ymax : real;
  begin
    graph_init(-10.0, -100.0, 10.0, 100.0, y_dim, a, xmin, ymin, xmax, ymax);
    x := -10.0;
    y := 0.0;
    while (x <= 10.0) loop
      y := sinh(x);
      graph_plot(x, y, xmin, ymin, xmax, ymax, x_dim, y_dim, a);
      x := x + step;
    end loop;
  end plot_sinh;

  procedure plot_tan (
    step  : in real; 
    x_dim : in integer; 
    y_dim : in integer;
    a     : inout pixel_arr
  ) is
    variable x, y : real;
    variable xmin, ymin, xmax, ymax : real;
  begin
    graph_init(-3.5, -10.0, 3.5, 10.0, y_dim, a, xmin, ymin, xmax, ymax);
    x := -3.5;
    y := 0.0;
    while (x <= 3.5) loop
      y := tan(x);
      graph_plot(x, y, xmin, ymin, xmax, ymax, x_dim, y_dim, a);
      x := x + step;
    end loop;
  end plot_tan;

  procedure plot_tanh (
    step  : in real; 
    x_dim : in integer; 
    y_dim : in integer;
    a     : inout pixel_arr
  ) is
    variable x, y : real;
    variable xmin, ymin, xmax, ymax : real;
  begin
    graph_init(-10.0, -1.1, 10.0, 1.1, y_dim, a, xmin, ymin, xmax, ymax);
    x := -10.0;
    y := 0.0;
    while (x <= 10.0) loop
      y := tanh(x);
      graph_plot(x, y, xmin, ymin, xmax, ymax, x_dim, y_dim, a);
      x := x + step;
    end loop;
  end plot_tanh;

  procedure plot_floor (
    step  : in real; 
    x_dim : in integer; 
    y_dim : in integer;
    a     : inout pixel_arr
  ) is
    variable x, y : real;
    variable xmin, ymin, xmax, ymax : real;
  begin
    graph_init(-10.0, -10.0, 10.0, 10.0, y_dim, a, xmin, ymin, xmax, ymax);
    x := -10.0;
    y := 0.0;
    while (x <= 10.0) loop
      y := floor(x);
      graph_plot(x, y, xmin, ymin, xmax, ymax, x_dim, y_dim, a);
      x := x + step;
    end loop;
  end plot_floor;

  procedure plot_ceil (
    step  : in real; 
    x_dim : in integer; 
    y_dim : in integer;
    a     : inout pixel_arr
  ) is
    variable x, y : real;
    variable xmin, ymin, xmax, ymax : real;
  begin
    graph_init(-10.0, -10.0, 10.0, 10.0, y_dim, a, xmin, ymin, xmax, ymax);
    x := -10.0;
    y := 0.0;
    while (x <= 10.0) loop
      y := ceil(x);
      graph_plot(x, y, xmin, ymin, xmax, ymax, x_dim, y_dim, a);
      x := x + step;
    end loop;
  end plot_ceil;

  procedure plot_fabs (
    step  : in real; 
    x_dim : in integer; 
    y_dim : in integer;
    a     : inout pixel_arr
  ) is
    variable x, y : real;
    variable xmin, ymin, xmax, ymax : real;
  begin
    graph_init(-10.0, -10.0, 10.0, 10.0, y_dim, a, xmin, ymin, xmax, ymax);
    x := -10.0;
    y := 0.0;
    while (x <= 10.0) loop
      y := fabs(x);
      graph_plot(x, y, xmin, ymin, xmax, ymax, x_dim, y_dim, a);
      x := x + step;
    end loop;
  end plot_fabs;

  procedure plot_round (
    step  : in real; 
    x_dim : in integer; 
    y_dim : in integer;
    a     : inout pixel_arr
  ) is
    variable x, y : real;
    variable xmin, ymin, xmax, ymax : real;
  begin
    graph_init(-10.0, -10.0, 10.0, 10.0, y_dim, a, xmin, ymin, xmax, ymax);
    x := -10.0;
    y := 0.0;
    while (x <= 10.0) loop
      y := round(x);
      graph_plot(x, y, xmin, ymin, xmax, ymax, x_dim, y_dim, a);
      x := x + step;
    end loop;
  end plot_round;

  procedure plot_trunc (
    step  : in real; 
    x_dim : in integer; 
    y_dim : in integer;
    a     : inout pixel_arr
  ) is
    variable x, y : real;
    variable xmin, ymin, xmax, ymax : real;
  begin
    graph_init(-10.0, -10.0, 10.0, 10.0, y_dim, a, xmin, ymin, xmax, ymax);
    x := -10.0;
    y := 0.0;
    while (x <= 10.0) loop
      y := trunc(x);
      graph_plot(x, y, xmin, ymin, xmax, ymax, x_dim, y_dim, a);
      x := x + step;
    end loop;
  end plot_trunc;

end package body funcplot_pkg;
