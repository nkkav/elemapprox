`include "constants.v"

module elemapprox;

function real fabs;
  input n;
  real n;
begin
  if (n >= 0.0) 
    fabs = n;
  else
    fabs = -n;
end
endfunction

function real floor;
  input x;
  real x;
  integer temp;
begin
  temp = x - 0.5;
  floor = temp - (temp % 1);
end
endfunction

function real ceil;
  input x;
  real x;
begin
  ceil = -floor(-x);
end
endfunction

function real frac;
  input x;
  real x;
begin
  frac = x - floor(x);
end 
endfunction

function real round;
  input x;
  real x;
begin
  if (x > 0.0)
    round = floor(x + 0.5);
  else if (x < 0.0)
    round = ceil(x - 0.5);
  else
    round = 0.0;
end
endfunction

function real trunc;
  input x;
  real x;
begin
  if (x > 0.0)
    trunc = floor(x);
  else
    trunc = ceil(x);
end
endfunction

function real fmod;
  input a;
  input b;
  real a, b;
  real c;
begin
  c = frac(fabs(a/b)) * fabs(b);
  fmod = (a < 0) ? -c : c;
end
endfunction

function real sin;
  input x;
  real x;
  real x1,y,y2,y3,y5,y7,sum,sign;
  real temp;
begin
  sign = 1.0;
  x1 = x;
  if (x1 < 0.0)
  begin
    x1 = -x1;
    sign = -1.0;
  end
//  while (x1 > `MATH_PI/2.0)
//  begin
//    x1 = x1 - `MATH_PI;
//    sign = -1.0*sign;
//  end    
  x1 = fmod(x1, `MATH_TWO_PI);
  y = x1*2.0/`MATH_PI;
  y2 = y*y;
  y3 = y*y2;
  y5 = y3*y2;
  y7 = y5*y2;
  sum = 1.570794*y - 0.645962*y3 + 0.079692*y5 - 0.004681712*y7;
  sin = sign*sum;
end
endfunction

function real cos;
  input x;
  real x;
begin
  cos = sin(x + `MATH_PI/2.0);
end
endfunction

function real tan;
  input x;
  real x;
begin
  // Not defined where cos(x) == 0.0;
  tan = sin(x)/cos(x);
end
endfunction

function real cot;
  input x;
  real x;
begin
  // Not defined where sin(x) == 0.0;
  cot = cos(x)/sin(x);
end
endfunction

function real sec;
  input x;
  real x;
begin
  // Not defined where cos(x) == 0.0;
  sec = 1.0/cos(x);
end
endfunction

function real csc;
  input x;
  real x;
begin
  // Not defined where sin(x) == 0.0;
  csc = 1.0/sin(x);
end
endfunction

function real rootof2;
  input n;
  integer n;
  real power;
  integer i;
begin
  power = 0.82629586;
  power = power / 10000000.0;
  power = power + 1.0;
  i = -23;
  if (n >= 1)
  begin
    power = 2.0;
    i = 0;
  end
  for (i = i; i < n; i = i + 1)
  begin
    power = power * power;
  end
  rootof2 = power;
end
endfunction

function real exp;
  input x;
  real x;
  real x1,power,prod;
  integer i;
begin
  x1 = fabs(x)*`MATH_LOG2E;
  if (x1 > 255.0)
  begin
    exp = 0.0;
    if (x > 0.0)
    begin
      $display("exp illegal argument:",x);
      $stop;
    end
  end
  else
  begin
    prod = 1.0;
    power = 128.0;
    for (i = 7; i >= -23; i = i - 1)
    begin
      if (x1 > power)
      begin
        prod = prod * rootof2(i);
        x1 = x1 - power;
      end
      power = power / 2.0;
    end
    if (x < 0)
      exp = 1.0/prod;
    else
      exp = prod;
  end
end
endfunction

function real log;
  input x;
  real x;
  real re,log2;
  integer i;
begin
  if (x <= 0.0)
  begin
    $display("log illegal argument:",x);
    $stop;
    log = 0;
  end
  else
  begin
    if (x < 1.0)
      re = 1.0/x;
    else
      re = x;
    log2 = 0.0;
    for (i = 7; i >= -23; i = i - 1)
    begin
      if (re > rootof2(i))
      begin
        re = re/rootof2(i);
        log2 = 2.0*log2 + 1.0;
      end
      else
        log2 = log2*2;
    end
    if (x < 1.0)
      log = -log2/12102203.16;
    else
      log = log2/12102203.16;
  end
end
endfunction

function real pow;
  input x,y;
  real x,y;
begin
  if (x < 0.0)
  begin
    $display("pow illegal argument:",x);
    $stop;
  end
  pow = exp(y*log(x));
end
endfunction

function real sqrt;
  input x;
  real x;
  real epsilon;
begin
  epsilon = 0.00001;
  if (x < 0.0)
  begin
    $display("sqrt illegal argument:",x);
    $stop;
  end
  if (x < epsilon) 
  begin
    sqrt = 0.0;
  end
  else
  begin
    sqrt = exp(0.5*log(x));
  end
end
endfunction

function real hypot;
  input x, y;
  real x, y;
begin
  hypot = sqrt(x*x + y*y);
end
endfunction

function real atan;
  input x;
  real x;
  real x1,x2,sign,bias;
  real d3,s3;
begin
  sign = 1.0;
  bias = 0.0;
  x1 = x;
  if (x1 < 0.0)
  begin
    x1 = -x1;
    sign = -1.0;
  end
  if (x1 > 1.0)
  begin
    x1 = 1.0/x1;
    bias = sign*`MATH_PI/2.0;
    sign = -1.0*sign;
  end
  x2 = x1*x1;
  d3 = x2 + 1.44863154;
  d3 = 0.26476862 / d3;
  s3 = x2 + 3.3163354;
  d3 = s3 - d3;
  d3 = 7.10676 / d3;
  s3 = 6.762139 + x2;
  d3 = s3 - d3;
  d3 = 3.7092563 / d3;
  d3 = d3 + 0.17465544;
  atan = sign*x1*d3+bias;
end
endfunction

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
function real atan2;
  input y, x;
  real y, x;
begin 
  if (x > 0.0)
    atan2 = atan(y/x);
  if (x < 0.0) 
  begin 
   if (y < 0.0)
     atan2 = atan(y/x) - `MATH_PI;
   else
     atan2 = atan(y/x) + `MATH_PI;
  end
  if (x == 0.0)
  begin
    if (y > 0.0)
      atan2 = `MATH_PI/2.0;
    if (y < 0.0)
      atan2 = -`MATH_PI/2.0;
    if (y == 0.0)
      $display("atan2 error");
  end
end
endfunction

function real asin;
  input x;
  real x;
begin
  if ((x <= -1.0) || (x >= 1.0)) 
  begin
    $display("asin illegal argument:", x);
    $stop;
  end
  asin = atan(x/sqrt(1.0 - x*x));
end
endfunction

function real acos;
  input x;
  real x;
begin
  if ((x <= -1.0) || (x >= 1.0)) 
  begin
    $display("acos illegal argument:", x);
    $stop;
  end
//  acos = `MATH_PI/2.0 - asin(x);
  acos = atan(sqrt(1.0-x*x)/x);
end
endfunction

function real acot;
  input x;
  real x;
begin
  acot = atan(1.0/x);
end
endfunction

function real asec;
  input x;
  real x;
begin
  if ((x > -1.0) && (x < 1.0)) 
  begin
    $display("asec illegal argument:", x);
    $stop;
  end
  asec = acos(1.0/x);
end
endfunction

function real acsc;
  input x;
  real x;
begin
  if ((x > -1.0) && (x < 1.0)) 
  begin
    $display("acsc illegal argument:", x);
    $stop;
  end
  acsc = asin(1.0/x);
end
endfunction

function real sinh;
  input x;
  real x;
begin
  sinh = (exp(x) - exp(-x))/2.0;
end
endfunction

function real cosh;
  input x;
  real x;
begin
  cosh = (exp(x) + exp(-x))/2.0;
end
endfunction

function real tanh;
  input x;
  real x;
begin
  tanh = sinh(x) / cosh(x);
end
endfunction

function real coth;
  input x;
  real x;
begin
  if (x == 0.0) 
  begin
    $display("coth illegal argument:", x);
    $stop;
  end
  coth = cosh(x) / sinh(x);
end
endfunction

function real sech;
  input x;
  real x;
begin
  sech = 1.0 / cosh(x);
end
endfunction

function real csch;
  input x;
  real x;
begin
  if (x == 0.0) 
  begin
    $display("csch illegal argument:", x);
    $stop;
  end
  csch = 1.0 / sinh(x);
end
endfunction

function real asinh;
  input x;
  real x;
begin
  asinh = log(x + sqrt(x*x + 1.0));
end
endfunction

function real acosh;
  input x;
  real x;
begin
  if (x < 1.0) 
  begin
    $display("acosh illegal argument:", x);
    $stop;
  end
  acosh = log(x + sqrt(x*x - 1.0));
end
endfunction

function real atanh;
  input x;
  real x;
begin
  if ((x <= -1.0) || (x >= 1.0)) 
  begin
    $display("atanh illegal argument:", x);
    $stop;
  end
  atanh = 0.5 * log((1.0+x)/(1.0-x));
end
endfunction

function real acoth;
  input x;
  real x;
begin
  if ((x >= -1.0) && (x <= 1.0)) 
  begin
    $display("acoth illegal argument:", x);
    $stop;
  end
  acoth = 0.5 * log((x+1.0)/(x-1.0));
end
endfunction

function real asech;
  input x;
  real x;
begin
  if ((x <= 0.0) || (x > 1.0)) 
  begin
    $display("asech illegal argument:", x);
    $stop;
  end
  asech = log((1.0 + sqrt(1.0 - x*x))/x);
end
endfunction

function real acsch;
  input x;
  real x;
begin
  if (x == 0.0) 
  begin
    $display("acsch illegal argument:", x);
    $stop;
  end
  if (x > 0.0)
    acsch = log((1.0 + sqrt(x*x + 1.0))/x);
  else if (x < 0.0)
    acsch = log((1.0 - sqrt(x*x + 1.0))/x);    
end
endfunction

function real min;
  input x, y;
  real x, y;
begin
  if (x < y)
    min = x;
  else
    min = y;
end
endfunction

function real max;
  input x, y;
  real x, y;
begin
  if (x > y)
    max = x;
  else
    max = y;
end
endfunction

endmodule
