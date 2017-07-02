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
begin
  floor = $floor(x);
end
endfunction

function real ceil;
  input x;
  real x;
begin
  ceil = $ceil(x);
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
begin
  sin = $sin(x);
end
endfunction

function real cos;
  input x;
  real x;
begin
  cos = $cos(x);
end
endfunction

function real tan;
  input x;
  real x;
begin
  tan = $tan(x);
end
endfunction

function real cot;
  input x;
  real x;
begin
  // Not defined where sin(x) == 0.0;
  cot = 1.0/$tan(x);
end
endfunction

function real sec;
  input x;
  real x;
begin
  // Not defined where cos(x) == 0.0;
  sec = 1.0/$cos(x);
end
endfunction

function real csc;
  input x;
  real x;
begin
  // Not defined where sin(x) == 0.0;
  csc = 1.0/$sin(x);
end
endfunction

function real exp;
  input x;
  real x;
begin
  exp = $exp(x);
end
endfunction

function real log;
  input x;
  real x;
begin
  log = $ln(x);
end
endfunction

function real log10;
  input x;
  real x;
begin
  log10 = $log10(x);
end
endfunction

function real pow;
  input x,y;
  real x,y;
begin
  pow = $pow(x, y);
end
endfunction

function real sqrt;
  input x;
  real x;
begin
  sqrt = $sqrt(x);
end
endfunction

function real cbrt;
  input x;
  real x;
  real epsilon;
begin
  epsilon = 0.00001;
  if (x < 0.0)
  begin
    $display("cbrt illegal argument:",x);
    $stop;
  end
  if (x < epsilon) 
  begin
    cbrt = 0.0;
  end
  else
  begin
    cbrt = $pow(x, 0.33333333);
  end
end
endfunction

function real hypot;
  input x, y;
  real x, y;
begin
  hypot = $hypot(x, y);
end
endfunction

function real atan;
  input x;
  real x;
begin
  atan = $atan(x);
end
endfunction

function real atan2;
  input y, x;
  real y, x;
begin 
  atan2 = $atan2(x, y);
end
endfunction

function real asin;
  input x;
  real x;
begin
  asin = $asin(x);
end
endfunction

function real acos;
  input x;
  real x;
begin
  acos = $acos(x);
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
  sinh = $sinh(x);
end
endfunction

function real cosh;
  input x;
  real x;
begin
  cosh = $cosh(x);
end
endfunction

function real tanh;
  input x;
  real x;
begin
  tanh = $tanh(x);
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
  asinh = $asinh(x);
end
endfunction

function real acosh;
  input x;
  real x;
begin
  acosh = $acosh(x);
end
endfunction

function real atanh;
  input x;
  real x;
begin
  atanh = $atanh(x);
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
