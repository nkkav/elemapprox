#include <stdio.h>
#include <stdlib.h>

extern int x_dim, y_dim;
double xmin, ymin, xmax, ymax;
int *a;     //[y_dim][x_dim];
int *temp;  //[x_dim];
int i, j;
int row, col;
double xcol, yrow;
  
  
/* graph_init:
 * Initialize the displayed graph area dimensions and the graph data storage.
 */
void graph_init(double xmin_init, double ymin_init, double xmax_init, double ymax_init)
{
  xmin = xmin_init;
  ymin = ymin_init;
  xmax = xmax_init;
  ymax = ymax_init;
  a    = malloc(y_dim * x_dim * sizeof(int));
  temp = malloc(x_dim * sizeof(int));
  for (i = 0; i < y_dim; i = i+1) {
    for (j = 0; j < x_dim; j = j+1) {
      a[i*x_dim+j] = 0;
    }
  }
}

/* graph_plot:
 * Plot the graph on a x_dim x y_dim grid.
 */
void graph_plot(double x, double y)
{
  xcol = (x-xmin)/(xmax-xmin) * x_dim;
  yrow = (y-ymin)/(ymax-ymin) * y_dim;
  col = xcol;
  row = yrow;
  if ((col >= 0) && (col < x_dim) &&(row >= 0) && (row < y_dim)) {
    for (i = 0; i < x_dim; i++) {
      temp[i] = a[row*x_dim+i];   // [row][i]
    }
    temp[col] = 1;
    for (i = 0; i < x_dim; i++) {
      a[row*x_dim+i] = temp[i];   // [row][i]
    }
  }
}

/* graph_display:
 * Display the graph as an ASCII chart.
 */
void graph_display(void)
{
  for (row = y_dim-1; row >= 0; row = row-1) {
    for (i = 0; i < x_dim; i++) {
      temp[i] = a[row*x_dim+i];
    }
    for (col = 0; col < x_dim; col = col + 1) {
      if (temp[col] != 0) {
        printf("*");
      } else {
        printf(".");
      }
    }
    printf("\n");
  }
}

/* graph_display_pbm:
 * Write the contents of a PBM (portable bit map) file.
 * A PBM image file follows the format:
 * P1
 * <X> <Y>
 * <I1> <I2> ... <IMAX>
 * NOTE1: Comment lines start with '#'.
 # NOTE2: < > denote integer values (in decimal).
 */
void graph_display_pbm(void)
{
  /* Write the magic number string. */
  printf("P1\n");
  /* Write the image dimensions. */
  printf("%d %d\n", x_dim, y_dim);
  
  for (row = y_dim-1; row >= 0; row = row-1) {
    for (i = 0; i < x_dim; i++) {
      temp[i] = a[row*x_dim+i];
    }
    for (col = 0; col < x_dim; col = col + 1) {
      if (temp[col] != 0) {
        printf("1 ");
      } else {
        printf("0 ");
      }
    }
    printf("\n");
  }
}

/* graph_free:
 * Deallocate image data.
 */
void graph_free(void)
{
  free(a);
  free(temp);
}
