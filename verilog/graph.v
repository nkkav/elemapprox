module graph;
  parameter NUMROW=256, NUMCOL=256; // y_dim, x_dim
  real xmin, ymin, xmax, ymax;
  reg [NUMCOL-1:0] a[NUMROW-1:0];
  reg [NUMCOL-1:0] temp;
  integer i;
  integer row, col;
  real xcol, yrow;
  integer xdim, ydim;
  
  // graph_init:
  // Initialize the displayed graph area dimensions and the graph data storage.
  //
  task init;
    input xmin_init, ymin_init, xmax_init, ymax_init;
	input y_dim;
    real xmin_init, xmax_init, ymin_init, ymax_init;
	integer y_dim;
  begin
    xmin = xmin_init;
    ymin = ymin_init;
    xmax = xmax_init;
    ymax = ymax_init;
    for (i = 0; i < y_dim; i = i + 1)
      a[i] = 0;
  end
  endtask

  // graph_plot:
  // Plot the graph on a NUMCOL x NUMROW (y_dim x x_dim) grid.
  // 
  task plot;
    input x, y;
	input x_dim, y_dim;
    real x, y;
	integer x_dim, y_dim;
  begin
    xcol = (x-xmin)/(xmax-xmin)*x_dim;
    yrow = (y-ymin)/(ymax-ymin)*y_dim;
    col = xcol;
    row = yrow;
    if ((col >= 0) && (col < x_dim) &&(row >= 0) && (row < y_dim))
    begin
      temp = a[row];
      temp[col] = 1;
      a[row] = temp;
    end
  end
endtask

  // graph_display:
  // Display the graph as an ASCII chart.
  //
  task display;
    input x_dim, y_dim;
	integer x_dim, y_dim;
  begin
    for (row = y_dim-1; row >= 0; row = row - 1)
    begin
      temp = a[row];
      for (col = 0; col < x_dim; col = col + 1)
      begin
        if (temp[col])
          $write("*");
        else
          $write(".");
      end
      $display(" ");
    end
  end
  endtask
  
  // display_pbm:
  // Write the contents of a PBM (portable bit map) file.
  // A PBM image file follows the format:
  // P1
  // <X> <Y>
  // <I1> <I2> ... <IMAX>
  // NOTE1: Comment lines start with '#'.
  // NOTE2: < > denote integer values (in decimal).
  //
  task display_pbm;
    input x_dim, y_dim;
	integer x_dim, y_dim;
  begin
    // Write the magic number string.
	$display("P1");
	// Write the image dimensions.
	$display("%d %d", x_dim, y_dim);
    for (row = y_dim-1; row >= 0; row = row - 1)
    begin
      temp = a[row];
      for (col = 0; col < x_dim; col = col + 1)
      begin
        if (temp[col])
          $write("1 ");
        else
          $write("0 ");
      end
      $display(" ");
    end
  end
  endtask 

endmodule
