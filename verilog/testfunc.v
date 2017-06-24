`define EOF     32'hFFFF_FFFF
`define STDERR  32'h0000_0002
`define NULL      0
`define MAXLINE 128

module testfunc;
  integer x_dim = 256;
  integer y_dim = 256;
  real step = 0.01;
  
  // Usage options:
  // *   -h:             Print this help.
  // *   -func <func>:   Test the elementary function <func>.
  // *   -pbm:           Generate PBM chart data.
  // *   -ascii:         Generate ASCII chart data (default).
  // *   -x <num>:       Value for the x-dimension of the image (default: 256).
  // *   -y <num>:       Value for the y-dimension of the image (default: 256).
  // *   -s <fnum>:      Floating-point value for the step size used in plotting  
  // *                   (default: 0.01).
  
  integer i, j, Stdin_f, Stdout_f, Stderr_f;
  integer copied_elem_func_name=0;
  integer enable_pbm=0, enable_ascii=1;
  reg [8*8-1:0] elem_func_name;
  
  // The input line is expected to be formatted as follows:
  // "+h" 
  // or
  // "+func=<func> [+pbm|+ascii] (+x=<num>)* (+y=<num>)* (+s=<fnum>)*"  
  
  initial
  begin
    Stdout_f = $fopen("testfunc.log", "w");
    ////////////////////////////////////////////////////////////////////////////  
    // +FINISH=10000 +TESTNAME=this_test +FREQ+5.6666 +FREQUENCY +TEST12
	//
	// Parse "+h"
	if ($test$plusargs("h"))
	begin
	  $fwrite(Stdout_f, "Info: Print this help.\n");
	  $fwrite(Stdout_f, "\n");
	  $fwrite(Stdout_f, "* Usage:\n");
	  $fwrite(Stdout_f, "* ./testfunc -func <func> [-pbm|-ascii] (-x <num>)* (-y <num>)* (-s <fnum>)*\n");
	  $fwrite(Stdout_f, "* \n");
	  $fwrite(Stdout_f, "* Options:\n");
	  $fwrite(Stdout_f, "*   -h:             Print this help.\n");
	  $fwrite(Stdout_f, "*   -func <func>:   Test the elementary function <func>.\n");
	  $fwrite(Stdout_f, "*   -pbm:           Generate PBM chart data.\n");
	  $fwrite(Stdout_f, "*   -ascii:         Generate ASCII chart data (default).\n");
	  $fwrite(Stdout_f, "*   -x <num>:       Value for the x-dimension of the image (default: 256).\n");
	  $fwrite(Stdout_f, "*   -y <num>:       Value for the y-dimension of the image (default: 256).\n");  
	  $fwrite(Stdout_f, "*   -s <fnum>:      Floating-point value for the step size used in plotting\n");  
	  $fwrite(Stdout_f, "*                   (default: 0.01).\n");  
	  $fwrite(Stdout_f, "* \n");
	  $fwrite(Stdout_f, "* For further information, please refer to the website:\n");
	  $fwrite(Stdout_f, "* http://www.nkavvadias.com\n\n");	
	  $finish;
	end	
    // Parse +func=<func>
    if ($value$plusargs("func=%s", elem_func_name))
	begin
	  copied_elem_func_name = 1;
	end
	// Parse +pbm
	if ($test$plusargs("pbm"))
	begin
	  enable_pbm   = 1;
	  enable_ascii = 0;
	end
	// Parse +ascii
	if ($test$plusargs("ascii"))
	begin
	  enable_pbm   = 0;
	  enable_ascii = 1;
	end
	// Parse +x=<num>
	if (!$value$plusargs("x=%d", x_dim))
	begin
	  x_dim = 256;
	end
	// Parse +y=<num>
	if (!$value$plusargs("y=%d", y_dim))
	begin
	  y_dim = 256;
	end
	// Parse +s=<fnum>
	if (!$value$plusargs("s=%f", step))
	begin
	  step = 0.01;
	end
	////////////////////////////////////////////////////////////////////
    if (copied_elem_func_name == 0) 
    begin
	  $fwrite(Stdout_f, "Error: Elementary function not specified.\n");
	  $finish;	
    end	
	////////////////////////////////////////////////////////////////////
	if (elem_func_name == "acos") 
	  funcplot.plot_acos(step);
	else if (elem_func_name == "acosh")
	  funcplot.plot_acosh(step);
	else if (elem_func_name == "acot")
	  funcplot.plot_acot(step);
	else if (elem_func_name == "acoth")
	  funcplot.plot_acoth(step);
	else if (elem_func_name == "acsc")
	  funcplot.plot_acsc(step);
	else if (elem_func_name == "acsch")
	  funcplot.plot_acsch(step);
	else if (elem_func_name == "asec")
	  funcplot.plot_asec(step);
	else if (elem_func_name == "asech")
	  funcplot.plot_asech(step);
	else if (elem_func_name == "asin")
	  funcplot.plot_asin(step);
	else if (elem_func_name == "asinh")
	  funcplot.plot_asinh(step);
	else if (elem_func_name == "atan")
	  funcplot.plot_atan(step);
	else if (elem_func_name == "atanh")
	  funcplot.plot_atanh(step);
	else if (elem_func_name == "cos")
	  funcplot.plot_cos(step);
	else if (elem_func_name == "cosh")
	  funcplot.plot_cosh(step);
	else if (elem_func_name == "cot")
	  funcplot.plot_cot(step);
	else if (elem_func_name == "coth")
	  funcplot.plot_coth(step);
	else if (elem_func_name == "csc")
	  funcplot.plot_csc(step);
	else if (elem_func_name == "csch")
	  funcplot.plot_csch(step);
	else if (elem_func_name == "exp")
	  funcplot.plot_exp(step);
	else if (elem_func_name == "log")
	  funcplot.plot_log(step);
	else if (elem_func_name == "sqrt")
	  funcplot.plot_sqrt(step);
	else if (elem_func_name == "sec")
	  funcplot.plot_sec(step);
	else if (elem_func_name == "sech")
	  funcplot.plot_sech(step);
	else if (elem_func_name == "sin")
	  funcplot.plot_sin(step);
	else if (elem_func_name == "sinh")
	  funcplot.plot_sinh(step);
	else if (elem_func_name == "tan")
	  funcplot.plot_tan(step);
	else if (elem_func_name == "tanh")
	  funcplot.plot_tanh(step);
	else if (elem_func_name == "floor")
	  funcplot.plot_floor(step);
	else if (elem_func_name == "ceil")
	  funcplot.plot_ceil(step);
	else if (elem_func_name == "fabs")
	  funcplot.plot_fabs(step);
	else if (elem_func_name == "round")
	  funcplot.plot_round(step);
	else if (elem_func_name == "trunc")
	  funcplot.plot_trunc(step);
	////////////////////////////////////////////////////////////////////
	#100;
    if (enable_ascii == 1) 
	  graph.display(x_dim, y_dim);
	else if (enable_pbm == 1) 
	  graph.display_pbm(x_dim, y_dim);
	////////////////////////////////////////////////////////////////////
	$fclose(Stdout_f);
    $finish;
  end

endmodule
