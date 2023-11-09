% Define the ODE
r = 0.001;
M = 665;
ode = @(t, Pt) r * (M - Pt) * Pt;
% Define the time span
span = [0, 20];
% Define initial condition
Pt0 = 9.6; 
% Solve the ODE
[t, Pt] = ode45(ode, span, Pt0);

% Plot the solution
plot(t, Pt, 'b-');
title("Solution for P_t' = r(M - P_t)P_t");
xlabel('Time (t)');
ylabel('P_t');
grid on;
