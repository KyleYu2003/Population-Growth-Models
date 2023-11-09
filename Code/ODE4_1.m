% Define the ODE
theta = 0.000001;
M = 665;
ode = @(t, Pt) theta * (M^2 - Pt^2) * Pt;
% Define the time span
span = [0, 20];
% Define initial condition
Pt0 = 9.6;
% Solve the ODE
[t, Pt] = ode45(ode, span, Pt0);

% Plot the solution
plot(t, Pt, 'b-');
title("Solution for P_t' = \theta (M^2 - P_t^2)P_t");
xlabel('Time (t)');
ylabel('P_t');
grid on;