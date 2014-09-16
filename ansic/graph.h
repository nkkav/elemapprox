#ifndef GRAPH_H
#define GRAPH_H
  
void graph_init(double xmin_init, double ymin_init, double xmax_init, double ymax_init);
void graph_plot(double x, double y);
void graph_display(void);
void graph_display_pbm(void);
void graph_free(void);

#endif /* GRAPH_H */
