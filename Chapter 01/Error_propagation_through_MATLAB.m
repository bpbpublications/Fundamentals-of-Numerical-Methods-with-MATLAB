%Error propagation through MATLAB

syms Area x y sAreasxsy
Area = x *y
sArea = sqrt(sx^2*diff(Area,x)^2+sy^2*diff(Area,y)^2)
subs(Area, {x,y},{15.5, 30.4})
subs(sArea, {sx,sy, x, y}, {0.4, 0.6, 15.5, 30.4})
Area =x*y
sArea =(sx^2*y^2 + sy^2*x^2)^(1/2)
