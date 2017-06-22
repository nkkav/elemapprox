--------------------------------------------------------------------------------
-- Filename: funcplot.vhd
-- Purpose : Routines for plotting the elementary function approximations.
-- Author  : Nikolaos Kavvadias (C) 2014
-- Date    : 10-Oct-2014
-- Revision: 0.1.0 (14/10/10)
--           Changed procedure names accordingly for prefixed elementary 
--           function names (by "k"). This version is IEEE.math_real 
--           compatible.
--           0.0.0 (14/10/06)
--           Initial version hand-translated and adapted from the Verilog HDL 
--           version (funcplot.v).
--
--------------------------------------------------------------------------------

library IEEE;
use STD.textio.all;
use IEEE.math_real.all;
use WORK.graph_pkg.all;
use WORK.elemapprox_pkg.all;

package funcplot_pkg is
    
  -- Interface for the implemented elementary functions.
  procedure plot_kacos (
    step  : in real; 
    x_dim : in integer; 
    y_dim : in integer;
    a     : inout pixel_arr);
  procedure plot_kacosh (
    step  : in real; 
    x_dim : in integer; 
    y_dim : in integer;
    a     : inout pixel_arr);
  procedure plot_kacot (
    step  : in real; 
    x_dim : in integer; 
    y_dim : in integer;
    a     : inout pixel_arr);
  procedure plot_kacoth (
    step  : in real; 
    x_dim : in integer; 
    y_dim : in integer;
    a     : inout pixel_arr); 
  procedure plot_kacsc (
    step  : in real; 
    x_dim : in integer; 
    y_dim : in integer;
    a     : inout pixel_arr);
  procedure plot_kacsch (
    step  : in real; 
    x_dim : in integer; 
    y_dim : in integer;
    a     : inout pixel_arr);
  procedure plot_kasec (
    step  : in real; 
    x_dim : in integer; 
    y_dim : in integer;
    a     : inout pixel_arr);
  procedure plot_kasech (
    step  : in real; 
    x_dim : in integer; 
    y_dim : in integer;
    a     : inout pixel_arr);
  procedure plot_kasin (
    step  : in real; 
    x_dim : in integer; 
    y_dim : in integer;
    a     : inout pixel_arr);
  procedure plot_kasinh (
    step  : in real; 
    x_dim : in integer; 
    y_dim : in integer;
    a     : inout pixel_arr);
  procedure plot_katan (
    step  : in real; 
    x_dim : in integer; 
    y_dim : in integer;
    a     : inout pixel_arr);
  procedure plot_katanh (
    step  : in real; 
    x_dim : in integer; 
    y_dim : in integer;
    a     : inout pixel_arr);
  procedure plot_kcos (
    step  : in real; 
    x_dim : in integer; 
    y_dim : in integer;
    a     : inout pixel_arr);
  procedure plot_kcosh (
    step  : in real; 
    x_dim : in integer; 
    y_dim : in integer;
    a     : inout pixel_arr);
  procedure plot_kcot (
    step  : in real; 
    x_dim : in integer; 
    y_dim : in integer;
    a     : inout pixel_arr); 
  procedure plot_kcoth (
    step  : in real; 
    x_dim : in integer; 
    y_dim : in integer;
    a     : inout pixel_arr);
  procedure plot_kcsc (
    step  : in real; 
    x_dim : in integer; 
    y_dim : in integer;
    a     : inout pixel_arr);
  procedure plot_kcsch (
    step  : in real; 
    x_dim : in integer; 
    y_dim : in integer;
    a     : inout pixel_arr);
  procedure plot_kexp (
    step  : in real; 
    x_dim : in integer; 
    y_dim : in integer;
    a     : inout pixel_arr);
  procedure plot_klog (
    step  : in real; 
    x_dim : in integer; 
    y_dim : in integer;
    a     : inout pixel_arr);
  procedure plot_ksqrt (
    step  : in real; 
    x_dim : in integer; 
    y_dim : in integer;
    a     : inout pixel_arr);
  procedure plot_kcbrt (
    step  : in real; 
    x_dim : in integer; 
    y_dim : in integer;
    a     : inout pixel_arr);
  procedure plot_ksec (
    step  : in real; 
    x_dim : in integer; 
    y_dim : in integer;
    a     : inout pixel_arr);
  procedure plot_ksech (
    step  : in real; 
    x_dim : in integer; 
    y_dim : in integer;
    a     : inout pixel_arr);
  procedure plot_ksin (
    step  : in real; 
    x_dim : in integer; 
    y_dim : in integer;
    a     : inout pixel_arr); 
  procedure plot_ksinh (
    step  : in real; 
    x_dim : in integer; 
    y_dim : in integer;
    a     : inout pixel_arr);
  procedure plot_ktan (
    step  : in real; 
    x_dim : in integer; 
    y_dim : in integer;
    a     : inout pixel_arr);
  procedure plot_ktanh (
    step  : in real; 
    x_dim : in integer; 
    y_dim : in integer;
    a     : inout pixel_arr);
  procedure plot_kfloor (
    step  : in real; 
    x_dim : in integer; 
    y_dim : in integer;
    a     : inout pixel_arr);
  procedure plot_kceil (
    step  : in real; 
    x_dim : in integer; 
    y_dim : in integer;
    a     : inout pixel_arr);
  procedure plot_kfabs (
    step  : in real; 
    x_dim : in integer; 
    y_dim : in integer;
    a     : inout pixel_arr);
  procedure plot_kround (
    step  : in real; 
    x_dim : in integer; 
    y_dim : in integer;
    a     : inout pixel_arr);

end package funcplot_pkg;


package body funcplot_pkg is

  procedure plot_kacos (
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
      y := kacos(x);
      graph_plot(x, y, xmin, ymin, xmax, ymax, x_dim, y_dim, a);
      x := x + step;
    end loop;
  end plot_kacos;

  procedure plot_kacosh (
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
      y := kacosh(x);
      graph_plot(x, y, xmin, ymin, xmax, ymax, x_dim, y_dim, a);
      x := x + step;
    end loop;
  end plot_kacosh;  

  procedure plot_kacot (
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
      y := kacot(x);
      graph_plot(x, y, xmin, ymin, xmax, ymax, x_dim, y_dim, a);
      x := x + step;
    end loop;
  end plot_kacot;  
 
  procedure plot_kacoth (
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
        y := kacoth(x);
      end if;
      graph_plot(x, y, xmin, ymin, xmax, ymax, x_dim, y_dim, a);
      x := x + step;
    end loop;
  end plot_kacoth;  
  
  procedure plot_kacsc (
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
        y := kacsc(x);
      end if;
      graph_plot(x, y, xmin, ymin, xmax, ymax, x_dim, y_dim, a);
      x := x + step;
    end loop;
  end plot_kacsc;  

  procedure plot_kacsch (
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
        y := kacsch(x);
      end if;
      graph_plot(x, y, xmin, ymin, xmax, ymax, x_dim, y_dim, a);
      x := x + step;
    end loop;
  end plot_kacsch;  

  procedure plot_kasec (
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
        y := kasec(x);
      end if;
      graph_plot(x, y, xmin, ymin, xmax, ymax, x_dim, y_dim, a);
      x := x + step;
    end loop;
  end plot_kasec;  

  procedure plot_kasech (
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
        y := kasech(x);
      end if;
      graph_plot(x, y, xmin, ymin, xmax, ymax, x_dim, y_dim, a);
      x := x + step;
    end loop;
  end plot_kasech;    

  procedure plot_kasin (
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
      y := kasin(x);
      graph_plot(x, y, xmin, ymin, xmax, ymax, x_dim, y_dim, a);
      x := x + step;
    end loop;
  end plot_kasin;    

  procedure plot_kasinh (
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
      y := kasinh(x);
      graph_plot(x, y, xmin, ymin, xmax, ymax, x_dim, y_dim, a);
      x := x + step;
    end loop;
  end plot_kasinh;
  
  procedure plot_katan (
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
      y := katan(x);
      graph_plot(x, y, xmin, ymin, xmax, ymax, x_dim, y_dim, a);
      x := x + step;
    end loop;
  end plot_katan;

  procedure plot_katanh (
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
      y := katanh(x);
      graph_plot(x, y, xmin, ymin, xmax, ymax, x_dim, y_dim, a);
      x := x + step;
    end loop;
  end plot_katanh;

  procedure plot_kcos (
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
      y := kcos(x);
      graph_plot(x, y, xmin, ymin, xmax, ymax, x_dim, y_dim, a);
      x := x + step;
    end loop;
  end plot_kcos;

  procedure plot_kcosh (
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
      y := kcosh(x);
      graph_plot(x, y, xmin, ymin, xmax, ymax, x_dim, y_dim, a);
      x := x + step;
    end loop;
  end plot_kcosh;

  procedure plot_kcot (
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
      y := kcot(x);
      graph_plot(x, y, xmin, ymin, xmax, ymax, x_dim, y_dim, a);
      x := x + step;
    end loop;
  end plot_kcot;
 
  procedure plot_kcoth (
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
        y := kcoth(x);
      end if;
      graph_plot(x, y, xmin, ymin, xmax, ymax, x_dim, y_dim, a);
      x := x + step;
    end loop;
  end plot_kcoth;

  procedure plot_kcsc (
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
      y := kcsc(x);
      graph_plot(x, y, xmin, ymin, xmax, ymax, x_dim, y_dim, a);
      x := x + step;
    end loop;
  end plot_kcsc;
 
  procedure plot_kcsch (
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
        y := kcsch(x);
      end if;
      graph_plot(x, y, xmin, ymin, xmax, ymax, x_dim, y_dim, a);
      x := x + step;
    end loop;
  end plot_kcsch;
 
  procedure plot_kexp (
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
      y := kexp(x);
      graph_plot(x, y, xmin, ymin, xmax, ymax, x_dim, y_dim, a);
      x := x + step;
    end loop;
  end plot_kexp;

  procedure plot_klog (
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
        y := klog(x);
      end if;        
      graph_plot(x, y, xmin, ymin, xmax, ymax, x_dim, y_dim, a);
      x := x + step;
    end loop;
  end plot_klog;
  
  procedure plot_ksqrt (
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
      y := ksqrt(x);
      graph_plot(x, y, xmin, ymin, xmax, ymax, x_dim, y_dim, a);
      x := x + step;
    end loop;
  end plot_ksqrt;

  procedure plot_kcbrt (
    step  : in real; 
    x_dim : in integer; 
    y_dim : in integer;
    a     : inout pixel_arr
  ) is
    variable x, y : real;
    variable xmin, ymin, xmax, ymax : real;
  begin
    graph_init(0.0, 0.0, 3000.0, 20.0, y_dim, a, xmin, ymin, xmax, ymax);
    x := 0.0;
    y := 0.0;
    while (x <= 3000.0) loop
      y := kcbrt(x);
      graph_plot(x, y, xmin, ymin, xmax, ymax, x_dim, y_dim, a);
      x := x + step;
    end loop;
  end plot_kcbrt;

  procedure plot_ksec (
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
      y := ksec(x);
      graph_plot(x, y, xmin, ymin, xmax, ymax, x_dim, y_dim, a);
      x := x + step;
    end loop;
  end plot_ksec;

  procedure plot_ksech (
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
      y := ksech(x);
      graph_plot(x, y, xmin, ymin, xmax, ymax, x_dim, y_dim, a);
      x := x + step;
    end loop;
  end plot_ksech;

  procedure plot_ksin (
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
      y := ksin(x);
      graph_plot(x, y, xmin, ymin, xmax, ymax, x_dim, y_dim, a);
      x := x + step;
    end loop;
  end plot_ksin;
  
  procedure plot_ksinh (
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
      y := ksinh(x);
      graph_plot(x, y, xmin, ymin, xmax, ymax, x_dim, y_dim, a);
      x := x + step;
    end loop;
  end plot_ksinh;

  procedure plot_ktan (
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
      y := ktan(x);
      graph_plot(x, y, xmin, ymin, xmax, ymax, x_dim, y_dim, a);
      x := x + step;
    end loop;
  end plot_ktan;

  procedure plot_ktanh (
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
      y := ktanh(x);
      graph_plot(x, y, xmin, ymin, xmax, ymax, x_dim, y_dim, a);
      x := x + step;
    end loop;
  end plot_ktanh;

  procedure plot_kfloor (
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
      y := kfloor(x);
      graph_plot(x, y, xmin, ymin, xmax, ymax, x_dim, y_dim, a);
      x := x + step;
    end loop;
  end plot_kfloor;

  procedure plot_kceil (
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
      y := kceil(x);
      graph_plot(x, y, xmin, ymin, xmax, ymax, x_dim, y_dim, a);
      x := x + step;
    end loop;
  end plot_kceil;

  procedure plot_kfabs (
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
      y := kfabs(x);
      graph_plot(x, y, xmin, ymin, xmax, ymax, x_dim, y_dim, a);
      x := x + step;
    end loop;
  end plot_kfabs;

  procedure plot_kround (
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
      y := kround(x);
      graph_plot(x, y, xmin, ymin, xmax, ymax, x_dim, y_dim, a);
      x := x + step;
    end loop;
  end plot_kround;

end package body funcplot_pkg;
