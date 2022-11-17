% Solving a Laplace Equation with Dirichlet Boundary Condition using Jacobi Method.
% Clear Workspaces
clear
clc

% Initialising Variables
Nmax = 5;               % Nmax = Number of nodes in X-direction.
Mmax = 4;               % Mmax = Number of nodes in Y-direction.
tolerance = 1d-6;       % Tolerance for Convergence Criteria.
error = 1;              % Error.
k = 0;                  % Iteration Counter.

% Initialising u Array with Boundary Conditions and Guess values for Computational Nodes (u0)
u = [8.9, 8.9, 8.9, 8.9, 8.9; 
     8.4, 0, 0, 0, 9.2;
     7.2, 0, 0, 0, 9.4;
     6.1, 6.8, 7.7, 8.7, 6.1]
ukp1 = u;

% Output Column Headings.
fprintf(' k   |')
for j = 1:Mmax-2
    for i = 1:Nmax-2
        fprintf('  u(%li,%li)   |',j,i)
    end
end
fprintf('  error\n')
% Iterate Jacobi until Convergence.
while error>tolerance
    % Update Iteration Counter.
    k = k+1;
    fprintf(' %4i |',k)
    
    % Loop through Computational nodes.
    for j = 2:Mmax-1
        for i = 2:Nmax-1
            ukp1(j,i) = 0.25*(u(j+1,i)+u(j,i+1)+u(j-1,i)+u(j,i-1));
            fprintf(' %8.6f |',ukp1(j,i))
        end
    end
      
    % Calculate Error using L2 Norm.
    error = sqrt(sum(sum((ukp1-u).^2)));
    fprintf(' %8.6f \n',error)
    
    % Update u.
    u = ukp1;
end
u