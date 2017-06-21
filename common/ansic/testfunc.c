#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "graph.h"
#include "funcplot.h"

int x_dim=256, y_dim=256;
double step=0.01;


/* print_usage:
 * Print usage instructions for the "testfunc" program.
 */
static void print_usage()
{
  printf("\n");
  printf("* Usage:\n");
  printf("* ./testfunc [options]\n");
  printf("* \n");
  printf("* Options:\n");
  printf("*   -h:             Print this help.\n");
  printf("*   -func <func>:   Test the elementary function <func>.\n");
  printf("*   -pbm:           Generate PBM chart data.\n");
  printf("*   -ascii:         Generate ASCII chart data (default).\n");
  printf("*   -x <num>:       Value for the x-dimension of the image (default: 256).\n");
  printf("*   -y <num>:       Value for the y-dimension of the image (default: 256).\n");  
  printf("*   -s <fnum>:      Floating-point value for the step size used in plotting\n");  
  printf("*                   (default: 0.01).\n");  
  printf("* \n");
  printf("* For further information, please refer to the website:\n");
  printf("* http://www.nkavvadias.com\n\n");
}

/* main:
 * The driver routine for the the "testfunc" program.
 */
int main(int argc, char **argv)
{
  int i, copied_elem_func_name=0;
  int enable_pbm=0, enable_ascii=1;
  char *elem_func_name;

  /* Read input arguments. */
  if (argc < 2) {
    print_usage();
    exit(1);
  }

  for (i = 1; i < argc; i++) {
    if (strcmp("-h", argv[i]) == 0) {
      print_usage();
      exit(1);
    } else if (strcmp("-pbm", argv[i]) == 0) {
      enable_pbm   = 1;
      enable_ascii = 0;
    } else if (strcmp("-ascii", argv[i]) == 0) {
      enable_pbm   = 0;
      enable_ascii = 1;
    } else if (strcmp("-func",argv[i]) == 0) {
      if ((i+1) < argc) {
        i++;
        copied_elem_func_name = 1;
        elem_func_name = malloc((strlen(argv[i])+1) * sizeof(char));
        strcpy(elem_func_name, argv[i]);
      }
    } else if (strcmp("-x", argv[i]) == 0) {
      if ((i+1) < argc) {
        i++;
        x_dim = atoi(argv[i]);
      }
    } else if (strcmp("-y", argv[i]) == 0) {
      if ((i+1) < argc) {
        i++;
        y_dim = atoi(argv[i]);
      }    
    } else if (strcmp("-s", argv[i]) == 0) {
      if ((i+1) < argc) {
        i++;
        step = atof(argv[i]);
      }
    }    
  }
  
  if (copied_elem_func_name == 0) {
    fprintf(stderr, "Error: Elementary function not specified.\n");
    exit(1);
  }
  
  if (strcmp(elem_func_name, "acos") == 0) {
    plot_acos();
  } else if (strcmp(elem_func_name, "acosh") == 0) {
    plot_acosh();
  } else if (strcmp(elem_func_name, "acot") == 0) {
    plot_acot();
  } else if (strcmp(elem_func_name, "acoth") == 0) {
    plot_acoth();
  } else if (strcmp(elem_func_name, "acsc") == 0) {
    plot_acsc();
  } else if (strcmp(elem_func_name, "acsch") == 0) {
    plot_acsch();
  } else if (strcmp(elem_func_name, "asec") == 0) {
    plot_asec();
  } else if (strcmp(elem_func_name, "asech") == 0) {
    plot_asech();
  } else if (strcmp(elem_func_name, "asin") == 0) {
    plot_asin();
  } else if (strcmp(elem_func_name, "asinh") == 0) {
    plot_asinh();
  } else if (strcmp(elem_func_name, "atan") == 0) {
    plot_atan();
  } else if (strcmp(elem_func_name, "atanh") == 0) {
    plot_atanh();
  } else if (strcmp(elem_func_name, "cos") == 0) {
    plot_cos();
  } else if (strcmp(elem_func_name, "cosh") == 0) {
    plot_cosh();
  } else if (strcmp(elem_func_name, "cot") == 0) {
    plot_cot();
  } else if (strcmp(elem_func_name, "coth") == 0) {
    plot_coth();
  } else if (strcmp(elem_func_name, "csc") == 0) {
    plot_csc();
  } else if (strcmp(elem_func_name, "csch") == 0) {
    plot_csch();
  } else if (strcmp(elem_func_name, "exp") == 0) {
    plot_exp();
  } else if (strcmp(elem_func_name, "log") == 0) {
    plot_log();
  } else if (strcmp(elem_func_name, "sqrt") == 0) {
    plot_sqrt();
  } else if (strcmp(elem_func_name, "sec") == 0) {
    plot_sec();
  } else if (strcmp(elem_func_name, "sech") == 0) {
    plot_sech();
  } else if (strcmp(elem_func_name, "sin") == 0) {
    plot_sin();
  } else if (strcmp(elem_func_name, "sinh") == 0) {
    plot_sinh();
  } else if (strcmp(elem_func_name, "tan") == 0) {
    plot_tan();
  } else if (strcmp(elem_func_name, "tanh") == 0) {
    plot_tanh();
  } else if (strcmp(elem_func_name, "floor") == 0) {
    plot_floor();
  } else if (strcmp(elem_func_name, "ceil") == 0) {
    plot_ceil();
  }  
  
  if (enable_ascii == 1) {
    graph_display();
  } else if (enable_pbm == 1) {
    graph_display_pbm();
  }
  
  if (enable_ascii == 1 || enable_pbm == 1) {
    graph_free();
  }
  
  if (copied_elem_func_name == 1) {
    free(elem_func_name);
  }

  return 0;
}
