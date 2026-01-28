% Example4: Solution_of_graphical_method_of_finding_roots
a = -10:.1:100;
 g = inline('a + 1');
 h = inline('a.^3');
 y1 = g(a);
 x1 = h(a);
 plot(x1,y1)

