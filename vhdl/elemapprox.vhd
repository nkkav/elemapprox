--------------------------------------------------------------------------------
-- Filename: elemapprox.vhd
-- Purpose : Single-precision elementary functions approximation package.
-- Author  : Nikolaos Kavvadias (C) 2014
-- Date    : 06-Oct-2014
-- Revision: 0.0.0 (14/10/06)
--           Initial version hand-translated and adapted from the Verilog HDL 
--           version (elemapprox.v).
--
--------------------------------------------------------------------------------

library IEEE;
use STD.textio.all;

package elemapprox_pkg is

  -- Definitions of mathematical and physical constants.
  --
  -- Derived from constants.v
  -- If prefixed by MATH_ then it is a is a mathematical constant.
  
  -- e
  constant MATH_E        : real := 2.7182818284590452354;
  -- log_2(e)
  constant MATH_LOG2E    : real := 1.4426950408889634074;
  -- log_10(e)
  constant MATH_LOG10E   : real := 0.43429448190325182765;
  -- ln(2)
  constant MATH_LN2      : real := 0.69314718055994530942;
  -- ln(10)
  constant MATH_LN10     : real := 2.30258509299404568402;
  -- pi
  constant MATH_PI       : real := 3.14159265358979323846;
  -- 2*pi
  constant MATH_TWO_PI   : real := 6.28318530717958647693;
  -- pi/2
  constant MATH_PI_2     : real := 1.57079632679489661923;
  -- pi/4
  constant MATH_PI_4     : real := 0.78539816339744830962;
  -- 1/pi
  constant MATH_1_PI     : real := 0.31830988618379067154;
  -- 2/pi 
  constant MATH_2_PI     : real := 0.63661977236758134308;
  -- 2/sqrt(pi)
  constant MATH_2_SQRTPI : real := 1.12837916709551257390;
  -- sqrt(2)
  constant MATH_SQRT2    : real := 1.41421356237309504880;
  -- sqrt(1/2)
  constant MATH_SQRT1_2  : real := 0.70710678118654752440;
   
  -- Interface for the implemented elementary functions.
  function fabs   (n : in real) return real;
  function floor  (x : in real) return real;
  function fmod   (a : in real; b : in real) return real;
  function sin    (x : in real) return real;
  function cos    (x : in real) return real;
  function tan    (x : in real) return real;
  function cot    (x : in real) return real;
  function secant (x : in real) return real;
  function csc    (x : in real) return real;
  function rootof2(n : in integer) return real;
  function exp    (x : in real) return real;
  function log    (x : in real) return real;
  function pow    (x : in real; y : in real) return real;
  function sqrt   (x : in real) return real;
  function hypot  (x : in real; y : in real) return real;
  function atan   (x : in real) return real;
  function atan2  (y : in real; x : in real) return real;
  function asin   (x : in real) return real;
  function acos   (x : in real) return real;
  function acot   (x : in real) return real;
  function asec   (x : in real) return real;
  function acsc   (x : in real) return real;
  function sinh   (x : in real) return real;
  function cosh   (x : in real) return real;
  function tanh   (x : in real) return real;
  function coth   (x : in real) return real;
  function sech   (x : in real) return real;
  function csch   (x : in real) return real;
  function asinh  (x : in real) return real;
  function acosh  (x : in real) return real;
  function atanh  (x : in real) return real;
  function acoth  (x : in real) return real;
  function asech  (x : in real) return real;
  function acsch  (x : in real) return real;
  function min    (x : in real; y : in real) return real; 
  function max    (x : in real; y : in real) return real;

end package elemapprox_pkg;


package body elemapprox_pkg is

  function fabs (n : in real) return real is
    variable t_fabs : real;
  begin
    if (n >= 0.0) then
      t_fabs := n;
    else
      t_fabs := -n;
    end if;
    return t_fabs;
  end fabs;

  function floor (x : in real) return real is
    variable temp    : integer;
    variable t_floor : real;
  begin
    temp := integer(x);
    t_floor := real(temp);
    return t_floor;
  end floor;

  function frac (x : in real) return real is
    variable t_frac : real;
  begin
    t_frac := x - floor(x);
    return t_frac;
  end frac;

  function fmod (a : in real; b : in real) return real is
    variable c      : real;
    variable t_fmod : real;
  begin
    c := frac(fabs(a/b)) * fabs(b);
    if (a < 0.0) then
      t_fmod := -c;
    else 
      t_fmod := c;
    end if;
    return t_fmod;
  end fmod;

  function sin (x : in real) return real is 
    variable x1,y,y2,y3,y5,y7,sum,sign : real;
    variable temp  : real;
    variable t_sin : real;
  begin
    sign := 1.0;
    x1 := x;
    if (x1 < 0.0) then
      x1   := -x1;
      sign := -1.0;
    end if;
--    while (x1 > MATH_PI/2.0) loop
--      x1   := x1 - MATH_PI;
--      sign := -1.0*sign;
--    end loop;    
    x1  := fmod(x1, MATH_TWO_PI);
    y   := x1*2.0/MATH_PI;
    y2  := y*y;
    y3  := y*y2;
    y5  := y3*y2;
    y7  := y5*y2;
    sum := 1.570794*y - 0.645962*y3 + 0.079692*y5 - 0.004681712*y7;
    t_sin := sign*sum;
    return t_sin;
  end sin;

  function cos (x : in real) return real is
    variable t_cos : real;
  begin
    t_cos := sin(x + MATH_PI/2.0);
    return t_cos;
  end cos;

  function tan (x : in real) return real is
    variable t_tan : real;
  begin
    -- Not defined where cos(x) == 0.0;
    t_tan := sin(x)/cos(x);
    return (t_tan);
  end tan;

  function cot (x : in real) return real is
    variable t_cot : real;
  begin
    -- Not defined where sin(x) == 0.0;
    t_cot := cos(x)/sin(x);
    return t_cot;
  end cot;

  -- NOTE: Name changed to "secant" from "sec" to avoid naming clashes.
  function secant (x : in real) return real is
    variable t_sec : real;
  begin
    -- Not defined where cos(x) == 0.0;
    t_sec := 1.0/cos(x);
    return t_sec;
  end secant;

  function csc (x : in real) return real is
    variable t_csc : real;
  begin
    -- Not defined where sin(x) == 0.0;
    t_csc := 1.0/sin(x);
    return t_csc;
  end csc;

  function rootof2 (n : in integer) return real is
    variable i         : integer;
    variable power     : real;
    variable t_rootof2 : real;
  begin
    power := 0.82629586;
    power := power / 10000000.0;
    power := power + 1.0;
    i := -23;
    if (n >= 1) then
      power := 2.0;
      i := 0;
    end if;
    while (i < n) loop
      power := power * power;
      i := i + 1;
    end loop;
    t_rootof2 := power;
    return t_rootof2;
  end rootof2;

  function exp (x : in real) return real is
    variable i : integer;
    variable x1,power,prod : real;
    variable t_exp : real;
  begin
    x1 := fabs(x)*MATH_LOG2E;
    if (x1 > 255.0) then
      t_exp := 0.0;
      if (x > 0.0) then
        assert false 
          report "exp illegal argument:" & real'IMAGE(x) 
          severity failure;
      end if;
    else
      prod  := 1.0;
      power := 128.0;
      i := 7;
      while (i >= -23) loop
        if (x1 > power) then
          prod := prod * rootof2(i);
          x1   := x1 - power;
        end if;
        power := power / 2.0;
        i := i - 1;
      end loop;
      if (x < 0.0) then
        t_exp := 1.0/prod;
      else
        t_exp := prod;
      end if;
    end if;
    return t_exp;
  end exp;

  function log (x : in real) return real is
    variable i : integer;
    variable re,t_log2 : real;
    variable t_log : real;
  begin
    if (x <= 0.0) then
      assert false 
        report "log illegal argument:" & real'IMAGE(x) 
        severity failure;
      t_log := 0.0;
    else
      if (x < 1.0) then
        re := 1.0/x;
      else
        re := x;
      end if;
      t_log2 := 0.0;
      i := 7;
      while (i >= -23) loop
        if (re > rootof2(i)) then
          re     := re/rootof2(i);
          t_log2 := 2.0*t_log2 + 1.0;
        else
          t_log2 := t_log2*2.0;
        end if;
        i := i - 1;
      end loop;
      if (x < 1.0) then
        t_log := -t_log2/12102203.16;
      else
        t_log := t_log2/12102203.16;
      end if;
    end if;
    return t_log;
  end log;

  function pow (x : in real; y : in real) return real is
    variable t_pow : real;
  begin
    if (x < 0.0) then
      assert false 
        report "pow illegal argument:" & real'IMAGE(x) 
        severity failure;    
    end if;
    t_pow := exp(y*log(x));
    return t_pow;
  end pow;

  function sqrt (x : in real) return real is
    variable t_sqrt : real;
    variable epsilon : real;
  begin
    epsilon := 0.00001;
    if (x < 0.0) then
      assert false 
        report "sqrt illegal argument:" & real'IMAGE(x) 
        severity failure;    
    end if;
    if (x < epsilon) then
      t_sqrt := 0.0;
    else
      t_sqrt := exp(0.5*log(x));
    end if;
    return t_sqrt;
  end sqrt;

  function hypot (x : in real; y : in real) return real is
    variable t_hypot : real;
  begin
    t_hypot := sqrt(x*x + y*y);
    return t_hypot;
  end hypot;
  
  function atan (x : in real) return real is
    variable x1, x2, sign, bias : real;
    variable d3, s3 : real;
    variable t_atan : real;
  begin
    sign := 1.0;
    bias := 0.0;
    x1   := x;
    if (x1 < 0.0) then
      x1   := -x1;
      sign := -1.0;
    end if;  
    if (x1 > 1.0) then
      x1   := 1.0/x1;
      bias := sign*MATH_PI/2.0;
      sign := -1.0*sign;
    end if;
    x2 := x1*x1;
    d3 := x2 + 1.44863154;
    d3 := 0.26476862 / d3;
    s3 := x2 + 3.3163354;
    d3 := s3 - d3;
    d3 := 7.10676 / d3;
    s3 := 6.762139 + x2;
    d3 := s3 - d3;
    d3 := 3.7092563 / d3;
    d3 := d3 + 0.17465544;
    t_atan := sign * x1 * d3 + bias;
    return t_atan;
  end atan;

  -- Summary of atan2 functionality:
  --
  -- if x = y = 0, then the result is indefinite, 
  -- if x > 0 and y = 0, then atan2 = 0, 
  -- if x < 0 and y = 0, then atan2 = p, else 
  -- if y < 0, then -p < atan2 < 0, 
  -- if y > 0, then 0 < atan2 < p.
  -- if x > 0 then
  --   theta = arctan(y/x)
  -- if x < 0 then
  --   theta = arctan(y/x) - 180 degrees
  -- if x = 0 then
  -- if y > 0 then
  --   theta = 90 degrees
  -- if y < 0 then
  --   theta = -90 degrees
  -- if y = 0 then
  --   theta is indeterminate
  --
  function atan2 (y : in real; x : in real) return real is
    variable t_atan2 : real;
  begin
    if (x > 0.0) then
      t_atan2 := atan(y/x);
    end if;
    if (x < 0.0) then 
      if (y < 0.0) then
        t_atan2 := atan(y/x) - MATH_PI;
      else
        t_atan2 := atan(y/x) + MATH_PI;
      end if;
    end if;
    if (x = 0.0) then
      if (y > 0.0) then
        t_atan2 := MATH_PI/2.0;
      end if;
      if (y < 0.0) then
        t_atan2 := -MATH_PI/2.0;
      end if;
      if (y = 0.0) then
        assert false 
          report "atan2 error" 
          severity failure;      
      end if;
    end if;
    return t_atan2;
  end atan2;

  function asin (x : in real) return real is
    variable t_asin : real;
  begin
    if ((x <= -1.0) or (x >= 1.0)) then
      assert false 
        report "asin illegal argument:" & real'IMAGE(x) 
        severity failure;    
    end if;
    t_asin := atan(x/sqrt(1.0 - x*x));
    return t_asin;
  end asin;

  function acos (x : in real) return real is
    variable t_acos : real;
  begin
    if ((x <= -1.0) or (x >= 1.0)) then
      assert false 
        report "acos illegal argument:" & real'IMAGE(x) 
        severity failure;    
    end if;
--    t_acos := MATH_PI/2.0 - asin(x);
    t_acos := atan(sqrt(1.0 - x*x)/x);
    return t_acos;
  end acos;

  function acot (x : in real) return real is
    variable t_acot : real;
  begin
    t_acot := atan(1.0/x);
    return t_acot;
  end acot;

  function asec (x : in real) return real is
    variable t_asec : real;
  begin
    if ((x > -1.0) and (x < 1.0)) then
      assert false 
        report "asec illegal argument:" & real'IMAGE(x) 
        severity failure;    
    end if;
    t_asec := acos(1.0/x);
    return t_asec;
  end asec;

  function acsc (x : in real) return real is
    variable t_acsc : real;
  begin
    if ((x > -1.0) and (x < 1.0)) then
      assert false 
        report "acsc illegal argument:" & real'IMAGE(x) 
        severity failure;    
    end if;
    t_acsc := asin(1.0/x);
    return t_acsc;
  end acsc;

  function sinh (x : in real) return real is
    variable t_sinh : real;
  begin
    t_sinh := (exp(x) - exp(-x))/2.0;
    return t_sinh;
  end sinh;

  function cosh (x : in real) return real is
    variable t_cosh : real;
  begin
    t_cosh := (exp(x) + exp(-x))/2.0;
    return t_cosh;
  end cosh;

  function tanh (x : in real) return real is
    variable t_tanh : real;
  begin
    t_tanh := sinh(x) / cosh(x);
    return t_tanh;
  end tanh;

  function coth (x : in real) return real is
    variable t_coth : real;
  begin
    if (x = 0.0) then
      assert false 
        report "coth illegal argument:" & real'IMAGE(x) 
        severity failure;    
    end if;
    t_coth := cosh(x) / sinh(x);
    return t_coth;
  end coth;

  function sech (x : in real) return real is
    variable t_sech : real;
  begin
    t_sech := 1.0 / cosh(x);
    return t_sech;
  end sech;

  function csch (x : in real) return real is
    variable t_csch : real;
  begin
    if (x = 0.0) then
      assert false 
        report "csch illegal argument:" & real'IMAGE(x) 
        severity failure;    
    end if;
    t_csch := 1.0 / sinh(x);
    return t_csch;
  end csch;

  function asinh (x : in real) return real is
    variable t_asinh : real;
  begin
    t_asinh := log(x + sqrt(x*x + 1.0));
    return t_asinh;
  end asinh;

  function acosh (x : in real) return real is
    variable t_acosh : real;
  begin
    if (x < 1.0) then
      assert false 
        report "acosh illegal argument:" & real'IMAGE(x) 
        severity failure;    
    end if;
    t_acosh := log(x + sqrt(x*x - 1.0));
    return t_acosh;
  end acosh;

  function atanh (x : in real) return real is
    variable t_atanh : real;
  begin
    if ((x <= -1.0) and (x >= 1.0)) then
      assert false 
        report "atanh illegal argument:" & real'IMAGE(x) 
        severity failure;    
    end if;
    t_atanh := 0.5 * log((1.0+x)/(1.0-x));
    return t_atanh;
  end atanh;

  function acoth (x : in real) return real is
    variable t_acoth : real;
  begin
    if ((x >= -1.0) and (x <= 1.0)) then
      assert false 
        report "acoth illegal argument:" & real'IMAGE(x) 
        severity failure;    
    end if;
    t_acoth := 0.5 * log((x+1.0)/(x-1.0));
    return t_acoth;
  end acoth;

  function asech (x : in real) return real is
    variable t_asech : real;
  begin
    if ((x <= 0.0) or (x > 1.0)) then
      assert false 
        report "asech illegal argument:" & real'IMAGE(x) 
        severity failure;    
    end if;
    t_asech := log((1.0 + sqrt(1.0 - x*x))/x);
    return t_asech;
  end asech;

  function acsch (x : in real) return real is
    variable t_acsch : real;
  begin
    if (x = 0.0) then
      assert false 
        report "acsch illegal argument:" & real'IMAGE(x) 
        severity failure;    
    end if;
    if (x > 0.0) then
      t_acsch := log((1.0 + sqrt(x*x + 1.0))/x);
    else --  if (x < 0.0) then
      t_acsch := log((1.0 - sqrt(x*x + 1.0))/x);
    end if;
    return t_acsch;
  end acsch;

  function min (x : in real; y : in real) return real is
    variable t_min : real;
  begin
    if (x < y) then
      t_min := x;
    else
      t_min := y;
    end if;
    return t_min;
  end min;

  function max (x : in real; y : in real) return real is
    variable t_max : real;
  begin
    if (x > y) then
      t_max := x;
    else
      t_max := y;
    end if;
    return t_max;
  end max;

end package body elemapprox_pkg;
