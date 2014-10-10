--------------------------------------------------------------------------------
-- Filename: graph.vhd
-- Purpose : 2D functions plotting package.
-- Author  : Nikolaos Kavvadias (C) 2014
-- Date    : 06-Oct-2014
-- Revision: 0.0.0 (14/10/06)
--           Initial version hand-translated and adapted from the Verilog HDL 
--           version (graph.v).
--
--------------------------------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;
use STD.textio.all;

package graph_pkg is

  -- Number of rows (y_dim).
  constant NUMROW     : integer := 256;
  -- Number of columns (x_dim). 
  constant NUMCOL     : integer := 256;

  -- 2D array data type.
  type pixel_arr is array (NUMROW-1 downto 0) of std_logic_vector(NUMCOL-1 downto 0);

  -- Auxiliary signals.
  signal xmin         : real;
  signal ymin         : real;
  signal xmax         : real;
  signal ymax         : real;
  signal a            : pixel_arr;
  signal temp         : std_logic_vector(NUMCOL-1 downto 0);
  signal ix           : integer;
  signal row          : integer;
  signal col          : integer;
  signal xcol         : real;
  signal yrow         : real;
  signal xdim         : integer;
  signal ydim         : integer;

  -- Interface for the implemented procedures and functions.
  -- graph_init
  procedure graph_init (
    xmin_init : in real;
    ymin_init : in real;
    xmax_init : in real;
    ymax_init : in real;
    y_dim     : in integer;
    a         : inout pixel_arr;
    xmin      : out real;
    ymin      : out real;
    xmax      : out real;
    ymax      : out real);
  -- graph_plot
  procedure graph_plot (
    x     : in real; 
    y     : in real; 
    xmin  : in real;
    ymin  : in real;
    xmax  : in real;
    ymax  : in real;  
    x_dim : in integer; 
    y_dim : in integer;
    a     : inout pixel_arr);
  -- graph_display
  procedure graph_display (
    filename : in string;  
    x_dim    : in integer; 
    y_dim    : in integer;
    a        : inout pixel_arr);
  -- graph_display_pbm
  procedure graph_display_pbm (
    filename : in string;  
    x_dim    : in integer; 
    y_dim    : in integer;
    a        : inout pixel_arr);

end package graph_pkg;


package body graph_pkg is

  -- graph_init:
  -- Initialize the displayed graph area dimensions and the graph data storage.
  --
  procedure graph_init (
    xmin_init : in real;
    ymin_init : in real;
    xmax_init : in real;
    ymax_init : in real;
    y_dim     : in integer;
    a         : inout pixel_arr;
    xmin      : out real;
    ymin      : out real;
    xmax      : out real;
    ymax      : out real
  ) is
    variable i : integer;
  begin
    xmin := xmin_init;
    ymin := ymin_init;
    xmax := xmax_init;
    ymax := ymax_init;
    i    := 0;
    while (i < y_dim) loop
      a(i) := (others => '0');
      i    := i + 1;
    end loop;    
  end procedure graph_init;

  -- graph_plot:
  -- Plot the graph on a NUMCOL x NUMROW (y_dim x x_dim) grid.
  -- 
  procedure graph_plot (
    x     : in real; 
    y     : in real; 
    xmin  : in real;
    ymin  : in real;
    xmax  : in real;
    ymax  : in real;  
    x_dim : in integer; 
    y_dim : in integer;
    a     : inout pixel_arr
  ) is
    variable xcol, yrow : real;
    variable col, row   : integer;
    variable temp       : std_logic_vector(NUMCOL-1 downto 0);
  begin
    xcol := (x-xmin)/(xmax-xmin)*real(x_dim);
    yrow := (y-ymin)/(ymax-ymin)*real(y_dim);
    col  := integer(xcol);
    row  := integer(yrow);
    if ((col >= 0) and (col < x_dim) and (row >= 0) and (row < y_dim)) then
      temp      := a(row);
      temp(col) := '1';
      a(row)    := temp;
    end if;
  end procedure graph_plot;

  -- graph_display:
  -- Display the graph as an ASCII chart.
  --
  procedure graph_display (
    filename : in string;  
    x_dim    : in integer; 
    y_dim    : in integer;
    a        : inout pixel_arr
  ) is
    FILE     asciifile : text;
    variable l         : line;
    variable col, row  : integer;
    variable temp      : std_logic_vector(NUMCOL-1 downto 0);
  begin
    file_open(asciifile, filename, WRITE_MODE);
    row := y_dim - 1;
    while (row >= 0) loop
      temp := a(row);
      col  := 0;
      while (col < x_dim) loop
        if (temp(col) = '1') then
          write(l, string'("*"));
        else
          write(l, string'("."));
        end if;
        col := col + 1;
      end loop;  -- col
      row := row - 1;
      write(l, string'(" "));
      writeline(asciifile, l);
    end loop;  -- row
    file_close(asciifile);
    deallocate(l);
  end procedure graph_display;
 
  -- graph_display_pbm:
  -- Write the contents of a PBM (portable bit map) file.
  -- An ASCII PBM image file follows the format:
  -- P1
  -- <X> <Y>
  -- <I1> <I2> ... <IMAX>
  -- NOTE1: Comment lines start with '#'.
  -- NOTE2: < > denote integer values (in decimal).
  --
  procedure graph_display_pbm (
    filename : in string;  
    x_dim    : in integer; 
    y_dim    : in integer;
    a        : inout pixel_arr
  ) is
    FILE     pbmfile  : text;
    variable l        : line;
    variable col, row : integer;
    variable temp     : std_logic_vector(NUMCOL-1 downto 0);
  begin
    file_open(pbmfile, filename, WRITE_MODE);
    -- Write the magic number string.
    write(l, string'("P1"));
    writeline(pbmfile, l);
    -- Write the image dimensions.
    write(l, integer'IMAGE(x_dim) & " " & integer'IMAGE(y_dim));
    writeline(pbmfile, l);
    row := y_dim - 1;
    while (row >= 0) loop
      temp := a(row);
      col  := 0;
      while (col < x_dim) loop
        if (temp(col) = '1') then
          write(l, string'("1 "));
        else
          write(l, string'("0 "));
        end if;
        col := col + 1;
      end loop;  -- col
      row := row - 1;
      writeline(pbmfile, l);
    end loop;  -- row
    file_close(pbmfile);
    deallocate(l);
  end procedure graph_display_pbm;

end package body graph_pkg;
