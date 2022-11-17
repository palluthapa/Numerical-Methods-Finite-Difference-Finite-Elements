%Solve Brusselator using Runge-Kutta(RK4) Method
%dx/dt = A-Bx+x^2y-x
%dy/dt = Bx-x^2y
clear all
%Problem Setup
A=3;
B=10;
%Defining the functions
fx=@(x,y,t) A-B*x+x^2*y-x;                       
fy=@(x,y,t) B*x-x^2*y;                        
%Initial conditions and Step size
x(1)=1;
y(1)=1;
t(1)=0;
h=0.001;                                          
tfinal=100;                                      
N=ceil(tfinal/h);                               
%Solving using RK-4 Method
for i=1:N
    t(i+1)=t(i)+h;
    k1=h*fx(x(i),y(i),t(i));                     
    l1=h*fy(x(i),y(i),t(i));                     
    k2=h*fx(x(i)+k1*1/2,y(i)+l1*1/2,t(i)+h/2); 
    l2=h*fy(x(i)+k1*1/2,y(i)+l1*1/2,t(i)+h/2);  
    k3=h*fx(x(i)+k2*1/2,y(i)+l2*1/2,t(i)+h/2);  
    l3=h*fy(x(i)+k2*1/2,y(i)+l2*1/2,t(i)+h/2);  
    k4=h*fx(x(i)+k3,y(i)+l3,t(i)+h);      
    l4=h*fy(x(i)+k3,y(i)+l3,t(i)+h);     
    x(i+1)=x(i)+1/6*(k1+2*k2+2*k3+k4);      
    y(i+1)=y(i)+1/6*(l1+2*l2+2*l3+l4);   
end 
x(N+1)
y(N+1)
%plotting the solution                        
figure(1); clf(1)
plot(t,x,'-r')           %plotting time dependent graph for x(t)
xlabel('Time (t)','FontName','Times New Roman','FontSize',12,'FontWeight','bold')
ylabel('Chemical Concentration x(t)','FontName','Times New Roman','FontSize',12,'FontWeight','bold')
title('Solution of IVP Brusselator equations with initial condition x(0)=0, y(0)=1','FontName','Times New Roman','FontSize',14,'FontWeight','bold','Color','b')
hold on
figure(2); clf(2)
plot(t,y,'-g')           %plotting time dependent graph for y(t)                            
xlabel('Time (t)','FontName','Times New Roman','FontSize',12,'FontWeight','bold')
ylabel('Chemical Concentration y(t)','FontName','Times New Roman','FontSize',12,'FontWeight','bold')
title('Solution of IVP Brusselator equations with initial condition x(0)=0, y(0)=1','FontName','Times New Roman','FontSize',14,'FontWeight','bold','Color','b')
figure(3); clf(3)                                
plot(x,y)            %plotting the phase portrait in phase plane
xlabel('Chemical Concentration x(t)','FontName','Times New Roman','FontSize',12,'FontWeight','bold')
ylabel('Chemical Concentration y(t)','FontName','Times New Roman','FontSize',12,'FontWeight','bold')
title('Phase Portrait plot for Brusselator equations','FontName','Times New Roman','FontSize',14,'FontWeight','bold','Color','b')
hold off