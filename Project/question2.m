% solving the the brussalator problem using the fourth order Runge-Kutta
% method
%dx/dt=A-Bx+x^2y-x
%dy/dt=Bx-x^2y

clear all

%constants
A=2;
B=6;

%Defining the functions
fx=@(x,y,t) A-B*x+x^2*y-x;                       %dx/dt
fy=@(x,y,t) B*x-x^2*y;                           %dy/dt

%initial conditions
x0=0;
y0=0;
x(1)=x0;
y(1)=y0;
t(1)=0;

%step size
h=0.01;                                          %h is the time step
tfinal=100;                                      %tfinal is the number of time units I will take. So I will solve for t=0 to t=100  
N=ceil(tfinal/h);                                %N is the number of time steps

%Loop
for i=1:N
    t(i+1)=t(i)+h;
    %Runge-Kutta method
    k1x=fx(x(i),y(i),t(i))                       %k1 value for concentration x(t)
    k1y=fy(x(i),y(i),t(i))                       %k1 value for concentration y(t)
    k2x=fx(x(i)+k1x*h/2,y(i)+k1y*h/2,t(i)+h/2)   %k2 value for concentration x(t)
    k2y=fy(x(i)+k1x*h/2,y(i)+k1y*h/2,t(i)+h/2)   %k2 value for concentration y(t)
    k3x=fx(x(i)+k2x*h/2,y(i)+k2y*h/2,t(i)+h/2)   %k3 value for concentration x(t)
    k3y=fy(x(i)+k2x*h/2,y(i)+k2y*h/2,t(i)+h/2)   %k3 value for concentration y(t)
    k4x=fx(x(i)+k3x*h,y(i)+k3y*h,t(i)+h/2)       %k4 value for concentration x(t)
    k4y=fy(x(i)+k3x*h,y(i)+k3y*h,t(i)+h/2)       %k4 value for concentration y(t)
    x(i+1)=x(i)+h/6*(k1x+2*k2x+2*k3x+k4x)        %k1 value for concentration x(t)
    y(i+1)=y(i)+h/6*(k1y+2*k2y+2*k3y+k4y)        %k1 value for concentration x(t)
end                                              