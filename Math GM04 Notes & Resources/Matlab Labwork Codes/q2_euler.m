function [x,y] = q2_euler
xmax = 5;
dx = 0.01;
n = ceil(xmax/dx);
x = zeros(1,n);
y = zeros(1,n);
x(1) = 0;
y(1) = 1;
for j = 1:n-1
    y(j+1) = y(j)+ dx*(sin(y(j))); % SAME AS Q1 -- FOLLOW THE ALGORITHM FROM THE METHOD
    x(j+1) = x(j)+dx;
end