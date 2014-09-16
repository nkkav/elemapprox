module funcplot;

  task plot_acos;
    input real step;
	real x, y;
  begin
    graph.init(-1.1, -0.1, 1.1, 3.25, testfunc.y_dim);
    x = -1.0+step;
    y = 0.0;
    while (x <= 1.0-step)
    begin
      y = elemapprox.acos(x);
      graph.plot(x, y, testfunc.x_dim, testfunc.y_dim);
      x = x + step;
    end
  end
  endtask
  
  task plot_acosh;
    input real step;
	real x, y;
  begin
    graph.init(0.9, 0.0, 10.0, 5.0, testfunc.y_dim);
    x = 1.05;
    y = 0.0;
    while (x <= 10.0)
    begin
      y = elemapprox.acosh(x);
      graph.plot(x, y, testfunc.x_dim, testfunc.y_dim);
      x = x + step;
    end
  end
  endtask  

  task plot_acot;
    input real step;
	real x, y;
  begin
    graph.init(-10.0, 0.0, 10.0, 3.2, testfunc.y_dim);
    x = -10.0;
    y = 0.0;
    while (x <= 10.0)
    begin
      y = elemapprox.acot(x);
      graph.plot(x, y, testfunc.x_dim, testfunc.y_dim);
      x = x + step;
    end
  end
  endtask  

  task plot_acoth;
    input real step;
	real x, y;
  begin
    graph.init(-5.0, -2.0, 5.0, 2.0, testfunc.y_dim);
    x = -5.0;
    y = 0.0;
    while (x <= 5.0)
    begin
	  if ((x < -1.0) || (x > 1.0)) 
	  begin
        y = elemapprox.acoth(x);
	  end
      graph.plot(x, y, testfunc.x_dim, testfunc.y_dim);
      x = x + step;
    end
  end
  endtask

  task plot_acsc;
    input real step;
	real x, y;
  begin
    graph.init(-10.0, -1.57, 10.0, 1.57, testfunc.y_dim);
    x = -10.0;
    y = 0.0;
    while (x <= 10.0)
    begin
	  if ((x <= -1.0) || (x >= 1.0)) 
	  begin
        y = elemapprox.acsc(x);
	  end
      graph.plot(x, y, testfunc.x_dim, testfunc.y_dim);
      x = x + step;
    end
  end
  endtask  

  task plot_acsch;
    input real step;
	real x, y;
  begin
    graph.init(-10.0, -3.5, 10.0, 3.5, testfunc.y_dim);
    x = -10.0;
    y = 0.0;
    while (x <= 10.0)
    begin
	  if (x != 0.0) 
	  begin
        y = elemapprox.acsch(x);
	  end
      graph.plot(x, y, testfunc.x_dim, testfunc.y_dim);
      x = x + step;
    end
  end
  endtask  

  task plot_asec;
    input real step;
	real x, y;
  begin
    graph.init(-10.0, -1.6, 10.0, 1.6, testfunc.y_dim);
    x = -10.0;
    y = 0.0;
    while (x <= 10.0)
    begin
	  if ((x <= -1.0) || (x >= 1.0)) 
	  begin
        y = elemapprox.asec(x);
	  end
      graph.plot(x, y, testfunc.x_dim, testfunc.y_dim);
      x = x + step;
    end
  end
  endtask  
  
  task plot_asech;
    input real step;
	real x, y;
  begin
    graph.init(0.0, 0.0, 1.1, 3.0, testfunc.y_dim);
    x = 0.0;
    y = 0.0;
    while (x <= 1.0)
    begin
	  if ((x > 0.0) && (x <= 1.0)) 
	  begin
        y = elemapprox.asech(x);
	  end
      graph.plot(x, y, testfunc.x_dim, testfunc.y_dim);
      x = x + step;
    end
  end
  endtask  

  task plot_asin;
    input real step;
	real x, y;
  begin
    graph.init(-1.1, -1.57, 1.1, 1.57, testfunc.y_dim);
    x = -1.0+step;
    y = 0.0;
    while (x <= (1.0-step)) 
	begin
      y = elemapprox.asin(x);
      graph.plot(x, y, testfunc.x_dim, testfunc.y_dim);
      x = x + step;
    end
  end
  endtask  
  
  task plot_asinh;
    input real step;
	real x, y;
  begin
    graph.init(-10.0, -5.0, 10.0, 5.0, testfunc.y_dim);
    x = -10.0;
    y = 0.0;
    while (x <= 10.0)
    begin
      y = elemapprox.asinh(x);
      graph.plot(x, y, testfunc.x_dim, testfunc.y_dim);
      x = x + step;
    end
  end
  endtask  

  task plot_atan;
    input real step;
	real x, y;
  begin
    graph.init(-10.0, -1.6, 10.0, 1.6, testfunc.y_dim);
    x = -10.0;
    y = 0.0;
    while (x <= 10.0)
    begin
      y = elemapprox.atan(x);
      graph.plot(x, y, testfunc.x_dim, testfunc.y_dim);
      x = x + step;
    end
  end
  endtask  

  task plot_atanh;
    input real step;
	real x, y;
  begin
    graph.init(-1.1, -2.0, 1.1, 2.0, testfunc.y_dim);
    x = -1.0+step;
    y = 0.0;
    while (x <= (1.0-step))
    begin
      y = elemapprox.atanh(x);
      graph.plot(x, y, testfunc.x_dim, testfunc.y_dim);
      x = x + step;
    end
  end
  endtask  
  
  task plot_cos;
    input real step;
	real x, y;
  begin
    graph.init(-10.0, -1.1, 10.0, 1.1, testfunc.y_dim);
    x = -10.0;
    y = 0.0;
    while (x <= 10.0)
    begin
      y = elemapprox.cos(x);
      graph.plot(x, y, testfunc.x_dim, testfunc.y_dim);
      x = x + step;
    end
  end
  endtask    

  task plot_cosh;
    input real step;
	real x, y;
  begin
    graph.init(-10.0, 0.0, 10.0, 100.0, testfunc.y_dim);
    x = -10.0;
    y = 0.0;
    while (x <= 10.0)
    begin
      y = elemapprox.cosh(x);
      graph.plot(x, y, testfunc.x_dim, testfunc.y_dim);
      x = x + step;
    end
  end
  endtask  

  task plot_cot;
    input real step;
	real x, y;
  begin
    graph.init(-3.5, -10.0, 3.5, 10.0, testfunc.y_dim);
    x = -3.5;
    y = 0.0;
    while (x <= 3.5)
    begin
      y = elemapprox.cot(x);
      graph.plot(x, y, testfunc.x_dim, testfunc.y_dim);
      x = x + step;
    end
  end
  endtask  

  task plot_coth;
    input real step;
	real x, y;
  begin
    graph.init(-2.0, -10.0, 2.0, 10.0, testfunc.y_dim);
    x = -10.0;
    y = 0.0;
    while (x <= 10.0)
    begin
      y = elemapprox.coth(x);
      graph.plot(x, y, testfunc.x_dim, testfunc.y_dim);
      x = x + step;
    end
  end
  endtask  

  task plot_csc;
    input real step;
	real x, y;
  begin
    graph.init(-10.0, -10.0, 10.0, 10.0, testfunc.y_dim);
    x = -10.0;
    y = 0.0;
    while (x <= 10.0)
    begin
      y = elemapprox.csc(x);
      graph.plot(x, y, testfunc.x_dim, testfunc.y_dim);
      x = x + step;
    end
  end
  endtask  

  task plot_csch;
    input real step;
	real x, y;
  begin
    graph.init(-5.0, -10.0, 5.0, 10.0, testfunc.y_dim);
    x = -10.0;
    y = 0.0;
    while (x <= 10.0)
    begin
      y = elemapprox.csch(x);
      graph.plot(x, y, testfunc.x_dim, testfunc.y_dim);
      x = x + step;
    end
  end
  endtask  

  task plot_exp;
    input real step;
	real x, y;
  begin
    graph.init(-8.0, -100.0, 8.0, 100.0, testfunc.y_dim);
    x = -8.0;
    y = 0.0;
    while (x <= 8.0)
    begin
      y = elemapprox.exp(x);
      graph.plot(x, y, testfunc.x_dim, testfunc.y_dim);
      x = x + step;
    end
  end
  endtask  

  task plot_sec;
    input real step;
	real x, y;
  begin
    graph.init(-10.0, -10.0, 10.0, 10.0, testfunc.y_dim);
    x = -10.0;
    y = 0.0;
    while (x <= 10.0)
    begin
      y = elemapprox.sec(x);
      graph.plot(x, y, testfunc.x_dim, testfunc.y_dim);
      x = x + step;
    end
  end
  endtask  

  task plot_sech;
    input real step;
	real x, y;
  begin
    graph.init(-10.0, 0.0, 10.0, 1.1, testfunc.y_dim);
    x = -10.0;
    y = 0.0;
    while (x <= 10.0)
    begin
      y = elemapprox.sech(x);
      graph.plot(x, y, testfunc.x_dim, testfunc.y_dim);
      x = x + step;
    end
  end
  endtask  
  
  task plot_sin;
    input real step;
	real x, y;
  begin
    graph.init(-10.0, -1.1, 10.0, 1.1, testfunc.y_dim);
    x = -10.0;
    y = 0.0;
    while (x <= 10.0)
    begin
      y = elemapprox.sin(x);
      graph.plot(x, y, testfunc.x_dim, testfunc.y_dim);
      x = x + step;
    end
  end
  endtask  

  task plot_sinh;
    input real step;
	real x, y;
  begin
    graph.init(-10.0, -100.0, 10.0, 100.0, testfunc.y_dim);
    x = -10.0;
    y = 0.0;
    while (x <= 10.0)
    begin
      y = elemapprox.sinh(x);
      graph.plot(x, y, testfunc.x_dim, testfunc.y_dim);
      x = x + step;
    end
  end
  endtask  

  task plot_tan;
    input real step;
	real x, y;
  begin
    graph.init(-3.5, -10.0, 3.5, 10.0, testfunc.y_dim);
    x = -3.5;
    y = 0.0;
    while (x <= 3.5)
    begin
      y = elemapprox.tan(x);
      graph.plot(x, y, testfunc.x_dim, testfunc.y_dim);
      x = x + step;
    end
  end
  endtask  

  task plot_tanh;
    input real step;
	real x, y;
  begin
    graph.init(-10.0, -1.1, 10.0, 1.1, testfunc.y_dim);
    x = -10.0;
    y = 0.0;
    while (x <= 10.0)
    begin
      y = elemapprox.tanh(x);
      graph.plot(x, y, testfunc.x_dim, testfunc.y_dim);
      x = x + step;
    end
  end
  endtask  
  
endmodule
