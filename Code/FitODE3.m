x = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18]';
y = [9.6, 18.3, 29.0, 47.2, 71.1, 119.1, 174.6, 257.3, 350.7, 441.0, 513.3, 559.7, 594.8, 629.4, 640.8, 651.1, 655.9, 659.6, 661.8]';
f = fittype('665*exp(-exp(-kappa*t+log(log(665/9.6))))','independent','t','coefficients','kappa');
cfun = fit(x, y, f, 'StartPoint', 0.01);
xi = 0:1:18;
yi = cfun(xi);
observed_data = y;

kappa_value = cfun.kappa;
fprintf('kappa: %.4f\n', kappa_value);

rmse = sqrt(mean((observed_data - yi).^2));
meae = mean(abs(observed_data - yi));
maae = max(abs(observed_data - yi));

fprintf('RMSE (Root Mean Squared Error): %.4f\n', rmse);
fprintf('MeAE (Mean Absolute Error): %.4f\n', meae);
fprintf('MaAE (Maximum Absolute Error): %.4f\n', maae);

xj = 0:0.1:18;
yj = cfun(xj);
plot(x, y, 'r*', 'DisplayName', 'Observation');
hold on;
plot(xj, yj, 'b-', 'DisplayName', 'Fitted');
hold off;
legend('Location', 'best');