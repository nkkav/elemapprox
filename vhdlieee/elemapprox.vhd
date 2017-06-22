--------------------------------------------------------------------------------
-- Filename: elemapprox.vhd
-- Purpose : Single-precision elementary functions approximation package.
-- Author  : Nikolaos Kavvadias (C) 2014, 2015, 2016, 2017
-- Date    : 10-Oct-2014
-- Revision: 0.2.0 (17/06/22)
--           Plot floor, ceil, fabs and add round.
--           0.1.0 (14/10/10)
--           "VHDLIEEE" port of the plain VHDL version using IEEE.math_real.
--           0.0.0 (14/10/06)
--           Initial version hand-translated and adapted from the Verilog HDL 
--           version (elemapprox.v).
--
--------------------------------------------------------------------------------

library IEEE;
use STD.textio.all;
use IEEE.math_real.all;

package elemapprox_pkg is

  -- Definitions of mathematical and physical constants.
  -- 
  -- Defined in IEEE.math_real
  -- e
  -- MATH_E
  -- 
  -- log_2(e)
  alias    MATH_LOG2E    : real is MATH_LOG2_OF_E;
  -- log_10(e)
  alias    MATH_LOG10E   : real is MATH_LOG10_OF_E;
  -- ln(2)
  alias    MATH_LN2      : real is MATH_LOG_OF_2;
  -- ln(10)
  alias    MATH_LN10     : real is MATH_LOG_OF_10;
  -- pi
  -- MATH_PI
  -- 2*pi
  alias    MATH_TWO_PI   : real is MATH_2_PI;
  -- pi/2
  alias    MATH_PI_2     : real is MATH_PI_OVER_2;
  -- pi/4
  alias    MATH_PI_4     : real is MATH_PI_OVER_4;
  -- 1/pi
  alias    MATH_1_PI     : real is MATH_1_OVER_PI;
  -- 2/pi 
  constant MATH_2_PI     : real := 0.63661977236758134308;
  -- 2/sqrt(pi)
  constant MATH_2_SQRTPI : real := 1.12837916709551257390;
  -- sqrt(2)
  alias    MATH_SQRT2    : real is MATH_SQRT_2;
  -- sqrt(1/2) == 1/sqrt(2)
  alias    MATH_SQRT1_2  : real is MATH_1_OVER_SQRT_2;
  
  -- Interface for the implemented elementary functions.
  function kfabs   (n : in real) return real;
  function kfloor  (x : in real) return real;
  function kceil   (x : in real) return real;
  function kfrac   (x : in real) return real;
  function kround  (x : in real) return real;
  function kfmod   (a : in real; b : in real) return real;
  function ksin    (x : in real) return real;
  function kcos    (x : in real) return real;
  function ktan    (x : in real) return real;
  function kcot    (x : in real) return real;
  function ksec    (x : in real) return real;
  function kcsc    (x : in real) return real;
  function kexp    (x : in real) return real;
  function klog    (x : in real) return real;
  function kpow    (x : in real; y : in real) return real;
  function ksqrt   (x : in real) return real;
  function kcbrt   (x : in real) return real;
  function khypot  (x : in real ; y : in real) return real;
  function katan   (x : in real) return real;
  function katan2  (y : in real; x : in real) return real;
  function kasin   (x : in real) return real;
  function kacos   (x : in real) return real;
  function kacot   (x : in real) return real;
  function kasec   (x : in real) return real;
  function kacsc   (x : in real) return real;
  function ksinh   (x : in real) return real;
  function kcosh   (x : in real) return real;
  function ktanh   (x : in real) return real;
  function kcoth   (x : in real) return real;
  function ksech   (x : in real) return real;
  function kcsch   (x : in real) return real;
  function kasinh  (x : in real) return real;
  function kacosh  (x : in real) return real;
  function katanh  (x : in real) return real;
  function kacoth  (x : in real) return real;
  function kasech  (x : in real) return real;
  function kacsch  (x : in real) return real;
  function kmin    (x : in real; y : in real) return real;
  function kmax    (x : in real; y : in real) return real;

end package elemapprox_pkg;


package body elemapprox_pkg is

  function kfabs (n : in real) return real is
    variable t_fabs : real;
  begin
    if (n >= 0.0) then
      t_fabs := n;
    else
      t_fabs := -n;
    end if;
    return t_fabs;
  end kfabs;

  function kfloor (x : in real) return real is
  begin
    return floor(x);
  end kfloor;

  function kceil (x : in real) return real is
  begin
    return ceil(x);
  end kceil;

  function kfrac (x : in real) return real is
    variable t_frac : real;
  begin
    t_frac := x - kfloor(x);
    return t_frac;
  end kfrac;

  function kround (x : in real) return real is
    variable t_round : real;
  begin
    t_round := round(x);
    return t_round;
  end kround;

  function kfmod (a : in real; b : in real) return real is
  begin
    return (a mod b);
  end kfmod;

  function ksin (x : in real) return real is 
  begin
    return sin(x);
  end ksin;

  function kcos (x : in real) return real is
  begin
    return cos(x);
  end kcos;

  function ktan (x : in real) return real is
  begin
    return tan(x);
  end ktan;

  function kcot (x : in real) return real is
    variable t_cot : real;
  begin
    -- Not defined where ksin(x) == 0.0;
    t_cot := kcos(x)/ksin(x);
    return t_cot;
  end kcot;

  function ksec (x : in real) return real is
    variable t_sec : real;
  begin
    -- Not defined where kcos(x) == 0.0;
    t_sec := 1.0/kcos(x);
    return t_sec;
  end ksec;

  function kcsc (x : in real) return real is
    variable t_csc : real;
  begin
    -- Not defined where ksin(x) == 0.0;
    t_csc := 1.0/ksin(x);
    return t_csc;
  end kcsc;

  function kexp (x : in real) return real is
  begin
    return exp(x);
  end kexp;

  function klog (x : in real) return real is
  begin
    return log(x);
  end klog;

  function kpow (x : in real; y : in real) return real is
    variable t_pow : real;
  begin
    t_pow := x ** y;
    return t_pow;
  end kpow;

  function ksqrt (x : in real) return real is
  begin
    return sqrt(x);
  end ksqrt;

  function kcbrt (x : in real) return real is
  begin
    return cbrt(x);
  end kcbrt;

  function khypot (x : in real; y : in real) return real is
    variable t_hypot : real;
  begin
    t_hypot := ksqrt(x*x + y*y);
    return t_hypot;
  end khypot;
  
  function katan (x : in real) return real is
  begin
    return arctan(x);
  end katan;

  function katan2 (y : in real; x : in real) return real is
  begin
    return arctan(y, x);
  end katan2;

  function kasin (x : in real) return real is
  begin
    return arcsin(x);
  end kasin;

  function kacos (x : in real) return real is
  begin
    return arccos(x);
  end kacos;

  function kacot (x : in real) return real is
    variable t_acot : real;
  begin
    t_acot := katan(1.0/x);
    return t_acot;
  end kacot;

  function kasec (x : in real) return real is
    variable t_asec : real;
  begin
    if ((x > -1.0) and (x < 1.0)) then
      assert false 
        report "kasec illegal argument:" & real'IMAGE(x) 
        severity failure;    
    end if;
    t_asec := kacos(1.0/x);
    return t_asec;
  end kasec;

  function kacsc (x : in real) return real is
    variable t_acsc : real;
  begin
    if ((x > -1.0) and (x < 1.0)) then
      assert false 
        report "kacsc illegal argument:" & real'IMAGE(x) 
        severity failure;    
    end if;
    t_acsc := kasin(1.0/x);
    return t_acsc;
  end kacsc;

  function ksinh (x : in real) return real is
  begin
    return sinh(x);
  end ksinh;

  function kcosh (x : in real) return real is
  begin
    return cosh(x);
  end kcosh;

  function ktanh (x : in real) return real is
  begin
    return tanh(x);
  end ktanh;

  function kcoth (x : in real) return real is
    variable t_coth : real;
  begin
    if (x = 0.0) then
      assert false 
        report "kcoth illegal argument:" & real'IMAGE(x) 
        severity failure;    
    end if;
    t_coth := kcosh(x) / ksinh(x);
    return t_coth;
  end kcoth;

  function ksech (x : in real) return real is
    variable t_sech : real;
  begin
    t_sech := 1.0 / kcosh(x);
    return t_sech;
  end ksech;

  function kcsch (x : in real) return real is
    variable t_csch : real;
  begin
    if (x = 0.0) then
      assert false 
        report "kcsch illegal argument:" & real'IMAGE(x) 
        severity failure;    
    end if;
    t_csch := 1.0 / ksinh(x);
    return t_csch;
  end kcsch;

  function kasinh (x : in real) return real is
  begin
    return arcsinh(x);
  end kasinh;

  function kacosh (x : in real) return real is
  begin
    return arccosh(x);
  end kacosh;

  function katanh (x : in real) return real is
  begin
    return arctanh(x);
  end katanh;

  function kacoth (x : in real) return real is
    variable t_acoth : real;
  begin
    if ((x >= -1.0) and (x <= 1.0)) then
      assert false 
        report "kacoth illegal argument:" & real'IMAGE(x) 
        severity failure;    
    end if;
    t_acoth := 0.5 * klog((x+1.0)/(x-1.0));
    return t_acoth;
  end kacoth;

  function kasech (x : in real) return real is
    variable t_asech : real;
  begin
    if ((x <= 0.0) or (x > 1.0)) then
      assert false 
        report "kasech illegal argument:" & real'IMAGE(x) 
        severity failure;    
    end if;
    t_asech := klog((1.0 + sqrt(1.0 - x*x))/x);
    return t_asech;
  end kasech;

  function kacsch (x : in real) return real is
    variable t_acsch : real;
  begin
    if (x = 0.0) then
      assert false 
        report "kacsch illegal argument:" & real'IMAGE(x) 
        severity failure;    
    end if;
    if (x > 0.0) then
      t_acsch := klog((1.0 + sqrt(x*x + 1.0))/x);
    else --  if (x < 0.0) then
      t_acsch := klog((1.0 - sqrt(x*x + 1.0))/x);
    end if;
    return t_acsch;
  end kacsch;

  function kmin (x : in real; y : in real) return real is
    variable t_min : real;
  begin
    if (x < y) then
      t_min := x;
    else
      t_min := y;
    end if;
    return t_min;
  end kmin;

  function kmax (x : in real; y : in real) return real is
    variable t_max : real;
  begin
    if (x > y) then
      t_max := x;
    else
      t_max := y;
    end if;
    return t_max;
  end kmax;

end package body elemapprox_pkg;
