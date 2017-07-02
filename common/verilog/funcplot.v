module funcplot;

  task plot_acos;
    input step;
    real step;
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
    input step;
    real step;
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
    input step;
    real step;
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
    input step;
    real step;
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
    input step;
    real step;
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
    input step;
    real step;
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
    input step;
    real step;
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
    input step;
    real step;
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
    input step;
    real step;
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
    input step;
    real step;
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
    input step;
    real step;
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
    input step;
    real step;
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
    input step;
    real step;
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
    input step;
    real step;
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
    input step;
    real step;
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
    input step;
    real step;
    real x, y;
    real epsilon;
  begin
    graph.init(-2.0, -10.0, 2.0, 10.0, testfunc.y_dim);
    x = -10.0;
    y = 0.0;
    epsilon = 0.00001;
    while (x <= 10.0)
    begin
      if ((x < -epsilon) || (x > epsilon))
      begin
        y = elemapprox.coth(x);
      end
      graph.plot(x, y, testfunc.x_dim, testfunc.y_dim);
      x = x + step;
    end
  end
  endtask  

  task plot_csc;
    input step;
    real step;
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
    input step;
    real step;
    real x, y;
    real epsilon;
  begin
    graph.init(-5.0, -10.0, 5.0, 10.0, testfunc.y_dim);
    x = -10.0;
    y = 0.0;
    epsilon = 0.00001;
    while (x <= 10.0)
    begin
      if ((x < -epsilon) || (x > epsilon))
      begin     
        y = elemapprox.csch(x);
      end        
      graph.plot(x, y, testfunc.x_dim, testfunc.y_dim);
      x = x + step;
    end
  end
  endtask  

  task plot_exp;
    input step;
    real step;
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

  task plot_log;
    input step;
    real step;
    real x, y;
    real epsilon;
  begin
    graph.init(0.0, 0.0, 200.0, 20.0, testfunc.y_dim);
    x = 0.0;
    y = 0.0;
    epsilon = 0.00001;
    while (x <= 200.0)
    begin
      if (x > epsilon)
      begin
        y = elemapprox.log(x);
      end        
      graph.plot(x, y, testfunc.x_dim, testfunc.y_dim);
      x = x + step;
    end
  end
  endtask  

  task plot_log10;
    input step;
    real step;
    real x, y;
    real epsilon;
  begin
    graph.init(0.0, 0.0, 2000.0, 4.0, testfunc.y_dim);
    x = 0.0;
    y = 0.0;
    epsilon = 0.0001;
    while (x <= 2000.0)
    begin
      if (x > epsilon)
      begin
        y = elemapprox.log10(x);
      end        
      graph.plot(x, y, testfunc.x_dim, testfunc.y_dim);
      x = x + step;
    end
  end
  endtask  
  
  task plot_sqrt;
    input step;
    real step;
    real x, y;
  begin
    graph.init(0.0, 0.0, 200.0, 20.0, testfunc.y_dim);
    x = 0.0;
    y = 0.0;
    while (x <= 200.0)
    begin
      y = elemapprox.sqrt(x);
      graph.plot(x, y, testfunc.x_dim, testfunc.y_dim);
      x = x + step;
    end
  end
  endtask

  task plot_cbrt;
    input step;
    real step;
    real x, y;
  begin
    graph.init(0.0, 0.0, 1000.0, 20.0, testfunc.y_dim);
    x = 0.0;
    y = 0.0;
    while (x <= 1000.0)
    begin
      y = elemapprox.cbrt(x);
      graph.plot(x, y, testfunc.x_dim, testfunc.y_dim);
      x = x + step;
    end
  end
  endtask

  task plot_sec;
    input step;
    real step;
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
    input step;
    real step;
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
    input step;
    real step;
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
    input step;
    real step;
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
    input step;
    real step;
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
    input step;
    real step;
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

  task plot_floor;
    input step;
    real step;
    real x, y;
  begin
    graph.init(-10.0, -10.0, 10.0, 10.0, testfunc.y_dim);
    x = -10.0;
    y = 0.0;
    while (x <= 10.0)
    begin
      y = elemapprox.floor(x);
      graph.plot(x, y, testfunc.x_dim, testfunc.y_dim);
      x = x + step;
    end
  end
  endtask  

  task plot_ceil;
    input step;
    real step;
    real x, y;
  begin
    graph.init(-10.0, -10.0, 10.0, 10.0, testfunc.y_dim);
    x = -10.0;
    y = 0.0;
    while (x <= 10.0)
    begin
      y = elemapprox.ceil(x);
      graph.plot(x, y, testfunc.x_dim, testfunc.y_dim);
      x = x + step;
    end
  end
  endtask  

  task plot_fabs;
    input step;
    real step;
    real x, y;
  begin
    graph.init(-10.0, -10.0, 10.0, 10.0, testfunc.y_dim);
    x = -10.0;
    y = 0.0;
    while (x <= 10.0)
    begin
      y = elemapprox.fabs(x);
      graph.plot(x, y, testfunc.x_dim, testfunc.y_dim);
      x = x + step;
    end
  end
  endtask  

  task plot_round;
    input step;
    real step;
    real x, y;
  begin
    graph.init(-10.0, -10.0, 10.0, 10.0, testfunc.y_dim);
    x = -10.0;
    y = 0.0;
    while (x <= 10.0)
    begin
      y = elemapprox.round(x);
      graph.plot(x, y, testfunc.x_dim, testfunc.y_dim);
      x = x + step;
    end
  end
  endtask

  task plot_trunc;
    input step;
    real step;
    real x, y;
  begin
    graph.init(-10.0, -10.0, 10.0, 10.0, testfunc.y_dim);
    x = -10.0;
    y = 0.0;
    while (x <= 10.0)
    begin
      y = elemapprox.trunc(x);
      graph.plot(x, y, testfunc.x_dim, testfunc.y_dim);
      x = x + step;
    end
  end
  endtask

endmodule
