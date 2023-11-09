% Define the ODE
kappa = 0.5; 
M = 665;
ode = @(t, Pt) kappa * log(M / Pt) * Pt;
% Define the time span
span = [0, 20];
% Define initial condition
Pt0 = 700;
% Solve the ODE
[t, Pt] = ode45(ode, span, Pt0);

% Plot the solution
plot(t, Pt, 'b-');
title("Solution for P_t' = \kappa ln(M/P_t)P_t");
xlabel('Time (t)');
ylabel('P_t');
grid on;
