--------------------------------------------------------------------------------
-- Filename: testfunc.vhd
-- Purpose : Testbench entity/architecture for plotting the elementary function 
--           approximations in either ASCII or PBM (bitmap) formats.
-- Author  : Nikolaos Kavvadias (C) 2014
-- Date    : 10-Oct-2014
-- Revision: 0.1.0 (14/10/10)
--           Changed procedure names accordingly for prefixed elementary 
--           function names (by "k"). This version is IEEE.math_real 
--           compatible.
--           0.0.0 (14/10/07)
--           Initial version developed for the VHDL language. Does not share 
--           much with the Verilog HDL version for the testbench driver 
--           (testfunc.v).
--
--------------------------------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;
use STD.textio.all;
use WORK.graph_pkg.all;
use WORK.elemapprox_pkg.all;
use WORK.funcplot_pkg.all;


entity testfunc is
end entity testfunc;


architecture tb_arch of testfunc is
  -- The architecture reads a configuration file, named "config.txt" which is 
  -- generated (typically) by a script that drives the simulation.
  -- The configuration file consists of five (5) lines and follows the 
  -- following format;
  --
  -- <func>             // a string specifying the elementary function.
  -- <pbm>|<ascii>      // "pbm" or "ascii" string for the output format.
  -- <inum>             // Integer value for the x-dimension of the image.
  -- <inum>             // Integer value for the y-dimension of the image.
  -- <fnum>             // Floating-point value for the plotting step size.
  -- 
  -- Default values are as follows:
  -- * func = sin
  -- * pbm or ascii = ascii
  -- * inum(x) = 256
  -- * inum(y) = 256
  -- * fnum(s) = 0.01
  --
  -- Constants.
  constant CLK_PERIOD : time := 10 ns;  
  constant MAXLINE    : integer := 80;
  --
  -- Subprograms: procedures and functions
  -- Adapted from STD.textio.read for string values.
  -- Works for variable strings with length up to MAXLINE.
  procedure read_string(L: inout line; value: out string) is
    variable val  : string(1 to MAXLINE);
    variable vpos : integer := 0;     -- Index of last valid character in val.
    variable lpos : integer;          -- Index of next unused char in L.
    variable ix   : integer;
    variable ol   : line;
  begin
    if L /= NULL then
      lpos := L'left;         
      while ((lpos <= L'RIGHT) and (vpos < value'LENGTH)) loop
        vpos := vpos + 1;
        val(vpos) := L(lpos);
        lpos := lpos + 1;
      end loop;
      if (vpos > MAXLINE) then
        assert false
          report "Maximum string length exceeded."
          severity failure;
      end if;
      ix := 1;
      while (ix <= value'LENGTH) loop
        value(ix) := val(ix);
        ix := ix + 1;
      end loop;
    end if;
  end procedure read_string;
  --
  -- Definitions and declarations.
  -- Declare configuration data file.
  FILE cfgfile : text;
  -- 
begin

  VIRTUAL_BENCH : process
    variable oname  : string(1 to 18);
    variable l      : line;
    variable ol     : line;
    variable func   : string(1 to 10);
    variable fmt    : string(1 to 5);
    variable x_dim  : integer := 256;
    variable y_dim  : integer := 256;
    variable step   : real    := 0.01;
    variable arr    : pixel_arr;
    variable lim    : integer := 1;
  begin
    -- Open the configuration file.
    file_open(cfgfile, "config.txt", READ_MODE);
    -- 
    -- Read line #1 (elementary function)
    readline(cfgfile, l);
    read_string(l, func);    
    -- Set the output filename to: "test<func>"
    -- Read line #2 (PBM or ASCII)
    readline(cfgfile, l);
    read_string(l, fmt);    
    -- Accept pbm|PBM and ascii|ASCII (full lower or full upper only).
    if ((fmt(1 to 3) /= "pbm") and 
    	(fmt(1 to 3) /= "PBM") and 
    	(fmt(1 to 5) /= "ascii") and
    	(fmt(1 to 5) /= "ASCII")) then
      assert false 
        report "Output file format is invalid" 
        severity failure;
    end if;
    -- VHDL has brain-dead handling of variable strings. This is a 
    -- quick workaround for forming a proper output file name (oname)
    -- by the means of concatenations.
    if ((func(1 to 6) = "kacosh") or 
        (func(1 to 6) = "kacoth") or 
        (func(1 to 6) = "kacsch") or 
        (func(1 to 6) = "kasech") or 
        (func(1 to 6) = "kasinh") or 
        (func(1 to 6) = "katanh") or
        (func(1 to 6) = "kfloor") or
        (func(1 to 6) = "kround")) then
      lim := 6;
    elsif ((func(1 to 5) = "kacos") or 
        (func(1 to 5) = "kacot") or 
        (func(1 to 5) = "kacsc") or 
        (func(1 to 5) = "kasec") or 
        (func(1 to 5) = "kasin") or 
        (func(1 to 5) = "katan") or
        (func(1 to 5) = "kcosh") or 
        (func(1 to 5) = "kcoth") or 
        (func(1 to 5) = "kcsch") or 
        (func(1 to 5) = "ksech") or 
        (func(1 to 5) = "ksinh") or 
        (func(1 to 5) = "ktanh") or
        (func(1 to 5) = "ksqrt") or
        (func(1 to 5) = "kceil") or
        (func(1 to 5) = "kfabs")) then
      lim := 5;
    elsif ((func(1 to 4) = "kcos") or 
        (func(1 to 4) = "kcot") or 
        (func(1 to 4) = "kcsc") or 
        (func(1 to 4) = "ksec") or 
        (func(1 to 4) = "ksin") or 
        (func(1 to 4) = "ktan") or
        (func(1 to 4) = "kexp") or
        (func(1 to 4) = "klog")) then
      lim := 4;
    else
    assert false
      report "Unsupported function!" 
      severity failure;	
    end if;
    --
    -- Set the output filename to: "test<func>.[pbm|txt]".
    if ((fmt(1 to 3) = "pbm") or 
    	(fmt(1 to 3) = "PBM")) then
      oname(1 to lim+8) := "test" & func(1 to lim) & ".pbm";
    else 
      oname(1 to lim+8) := "test" & func(1 to lim) & ".txt";
    end if;     
    -- Read line #3 (x-dimension as integer)
    readline(cfgfile, l);
    read(l, x_dim);
    if (x_dim < 0) then
      assert false report "Negative x-dimension" severity failure;
    end if;
    -- Read line #4 (y-dimension as integer)
    readline(cfgfile, l);
    read(l, y_dim);
    if (y_dim < 0) then
      assert false report "Negative y-dimension" severity failure;
    end if;
    -- Read line #5 (plotting step size)
    readline(cfgfile, l);
    read(l, step);  
    if (step < 0.0) then
      assert false report "Negative plotting step size" severity failure;
    end if;
    -- Close the configuration file.
    file_close(cfgfile);
    deallocate(l);
    -- 
    -- Plot the requested function <func> and save it to file "test<func>.[pbm|txt]".    
    if (func(1 to 6) = "kacosh") then
      plot_kacosh(step, x_dim, y_dim, arr);
    elsif (func(1 to 5) = "kacos") then
      plot_kacos(step, x_dim, y_dim, arr);
    elsif (func(1 to 6) = "kacoth") then
      plot_kacoth(step, x_dim, y_dim, arr);
    elsif (func(1 to 5) = "kacot") then
      plot_kacot(step, x_dim, y_dim, arr);
    elsif (func(1 to 6) = "kacsch") then
      plot_kacsch(step, x_dim, y_dim, arr);
    elsif (func(1 to 5) = "kacsc") then
      plot_kacsc(step, x_dim, y_dim, arr);
    elsif (func(1 to 6) = "kasech") then
      plot_kasech(step, x_dim, y_dim, arr);
    elsif (func(1 to 5) = "kasec") then
      plot_kasec(step, x_dim, y_dim, arr);
    elsif (func(1 to 6) = "kasinh") then
      plot_kasinh(step, x_dim, y_dim, arr);
    elsif (func(1 to 5) = "kasin") then
      plot_kasin(step, x_dim, y_dim, arr);
    elsif (func(1 to 6) = "katanh") then
      plot_katanh(step, x_dim, y_dim, arr);
    elsif (func(1 to 5) = "katan") then
      plot_katan(step, x_dim, y_dim, arr);
    elsif (func(1 to 5) = "kcosh") then
      plot_kcosh(step, x_dim, y_dim, arr);
    elsif (func(1 to 4) = "kcos") then
      plot_kcos(step, x_dim, y_dim, arr);
    elsif (func(1 to 5) = "kcoth") then
      plot_kcoth(step, x_dim, y_dim, arr);
    elsif (func(1 to 4) = "kcot") then
      plot_kcot(step, x_dim, y_dim, arr);
    elsif (func(1 to 5) = "kcsch") then
      plot_kcsch(step, x_dim, y_dim, arr);
    elsif (func(1 to 4) = "kcsc") then
      plot_kcsc(step, x_dim, y_dim, arr);
    elsif (func(1 to 4) = "kexp") then
      plot_kexp(step, x_dim, y_dim, arr);
    elsif (func(1 to 4) = "klog") then
      plot_klog(step, x_dim, y_dim, arr);
    elsif (func(1 to 5) = "ksqrt") then
      plot_ksqrt(step, x_dim, y_dim, arr);
    elsif (func(1 to 5) = "ksech") then
      plot_ksech(step, x_dim, y_dim, arr);
    elsif (func(1 to 4) = "ksec") then
      plot_ksec(step, x_dim, y_dim, arr);
    elsif (func(1 to 5) = "ksinh") then
      plot_ksinh(step, x_dim, y_dim, arr);
    elsif (func(1 to 4) = "ksin") then
      plot_ksin(step, x_dim, y_dim, arr);
    elsif (func(1 to 5) = "ktanh") then
      plot_ktanh(step, x_dim, y_dim, arr);
    elsif (func(1 to 4) = "ktan") then
      plot_ktan(step, x_dim, y_dim, arr);
    elsif (func(1 to 6) = "kfloor") then
      plot_kfloor(step, x_dim, y_dim, arr);
    elsif (func(1 to 5) = "kceil") then
      plot_kceil(step, x_dim, y_dim, arr);
    elsif (func(1 to 5) = "kfabs") then
      plot_kfabs(step, x_dim, y_dim, arr);
    elsif (func(1 to 6) = "kround") then
      plot_kround(step, x_dim, y_dim, arr);
    else
    assert false
      report "Unsupported function!" 
      severity failure;	
    end if;
    --
    wait for CLK_PERIOD;
    --
    -- Display the plot either in PBM or in ASCII format.
    if ((fmt(1 to 3) = "pbm") or 
    	(fmt(1 to 3) = "PBM")) then
      -- as PBM.
      graph_display_pbm(oname(1 to lim+8), x_dim, y_dim, arr);
    else 
      -- as ASCII.
      graph_display(oname(1 to lim+8), x_dim, y_dim, arr);
    end if;
    wait;
    assert false
      report "NONE. End simulation time reached"
      severity failure;
    wait for CLK_PERIOD;
  end process VIRTUAL_BENCH;

end architecture tb_arch;
