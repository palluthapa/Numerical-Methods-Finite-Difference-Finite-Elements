function [t,y,yp] = q3_euler(dt,y0,yp0)
tmax = 10;
n = ceil(tmax/dt);
y = zeros(1,n);
yp = zeros(1,n);
y(1) = y0;
yp(1) = yp0;
t = dt*(0:n-1);
for i = 1:n-1
    yp(i+1) = yp(i) - dt*y(i);
    y(i+1) = y(i)+dt*yp(i);
end
% ONCE YOU HAVE WRITTEN THE EQUATION Y''+Y=0 AS A FIRST ORDER SYSTEM,
% EULER'S METHOD IS EXACTLY THE SAME. YOU JUST NEED TO KEEP TRACK OF WHAT Y
% AND Y' ARE.
end