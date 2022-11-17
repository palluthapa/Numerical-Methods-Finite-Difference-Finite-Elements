% SOLUTIONS TO EX 3
% NOTE THE %% COMMAND STARTS A NEW SECTION. EACH SECTION CAN BE RUN
% INDEPENDTLY USING THE RUN SECTION BUTTON ON THE EDIT TAB. THIS IS USEFUL
% FOR EXERCISE SHEETS!
clear all % ALL GOOD CODE SHOULD START WITH THIS
%% QUESTION 1
% PART A
x_exact = linspace(0,3); % CREATE A VECTOR OF 100 POINTS BETWEEN 0 AND 3
y_exact = 0.5*(exp(3*x_exact)-exp(x_exact)); % EXACT SOLUTION FOUND BY HAND
figure % CREATE A NEW SET OF AXES
plot(x_exact,y_exact); % NOTE THAT PLOT ONLY WORKS WITH VECTORS. LINSPACE CREATED A VECTOR FOR X, AND Y_EXACT IS A VECTOR OF Y(X)

% PART B AND C
[x_num, y_num] = q1_euler(0.1); % NOTE WE NEED TO USE THIS SYNTAX TO CAPTURE BOTH OUTPUTS
hold on % HOLD COMMAND ALLOWS MULTIPLE PLOTS ON SAME AXES
plot(x_num, y_num)
title('Solutions to q1')
legend('Exact solution', 'Numerical solution')

% PART D
dx = 0.1;
for j = 1:8
    dx = dx/2;
    [x,y] = q1_euler(dx);
    err(j) = abs(y(end) - y_exact(end));
    dx_vec(j) = dx;
end
% THE FOR-LOOP IN THIS QUESTION REPEATEDLY HALVES DX. ON EACH ITERATION, WE
% CALCULATE THE NUMERICAL SOLUTION USING THIS VALUE. THE GLOBAL ERROR IS
% WORKED OUT BY TAKING THE DIFFERENCE OF  THE NUMERICAL AND ACTUAL
% SOLUTIONS AT THE FINAL POINT. NOTE THE USE OF Y(END) TO FIND THE LAST
% VALUE OF THE VECTOR.
figure
plot(dx_vec, err);
title('Global truncation error')
xlabel('dx')
ylabel('Error')

%% QUESTION 2
% PART A
figure
[x2,y2] = q2_euler;
plot(x2,y2)
% PART B
[x3, y3] = q2b_euler;
hold on
plot(x3,y3)
% WE CAN COMPARE WITH THE EXACT SOLUTION WHICH WE FIND USING DSOLVE...
syms yy(xx)
yy_exact = matlabFunction(dsolve(diff(yy) - sin(yy) == 0, yy(0) == 1));
% DSOLVE SOLVES SIMPLE DIFFERENTIAL EQUATIONS AUTOMATICALLY AND EXACTLY. IT IS SLOW
% AND NOT RECOMMENDED FOR REAL PROBLEMS.
yy1 = arrayfun(yy_exact, x2); % THIS IS HOW YOU CREATE Y(X) FOR A VECTOR X
plot(x2, yy1)
legend('First order solution', 'Second order solution', 'Exact solution')

%% QUESTION 3
% PART A, B, C
tt = linspace(0,10);
yyy_exact = 0.5*(cos(tt)+sin(tt)); % EXACT SOLUTION
[t,y4,yp] = q3_euler(0.1,0.5,0.5);
figure
plot(tt,yyy_exact)
hold on
plot(t,y4)
xlabel('t')
ylabel('y') % NOTE HERE WE PLOT Y AGAINST T...
legend('Exact solution', 'Numerical solution')

% PART D
% RUN THE EULER METHOD WITH 50 RANDOM INITIAL CONDITIONS, THEN PLOT THEM
% ALL ON THE SAME AXES.
figure
hold on
for j = 1:50
   [t,y5,yp1] =  q3_euler(0.1,rand,rand);
   plot(y5,yp1)
end
xlabel('y')
ylabel('dy/dt') % NOW WE ARE PLOTTING Y AGAINST Y'. THIS IS A PHASE PLOT.