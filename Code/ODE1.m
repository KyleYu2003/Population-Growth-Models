% Define the ODE
eta = 0.1; 
ode = @(t, Pt) eta * Pt;
% Define the time span
span = [0, 20]; 
% Define initial condition
Pt0 = 9.6; 
% Solve the ODE
[t, Pt] = ode45(ode, span, Pt0);

% Plot the solution
plot(t, Pt, 'b-');
title("Solution for P_t' = \eta P_t");
xlabel('Time (t)');
ylabel('P_t');
grid on;
