x = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18]';
y = [9.6, 18.3, 29.0, 47.2, 71.1, 119.1, 174.6, 257.3, 350.7, 441.0, 513.3, 559.7, 594.8, 629.4, 640.8, 651.1, 655.9, 659.6, 661.8]';
x_train = x(1:2:end);
y_train = y(1:2:end);
x_test = x(2:2:end);
y_test = y(2:2:end);

f = fittype('665*exp(-exp(-kappa*t+log(log(665/9.6))))','independent','t','coefficients','kappa');
cfun = fit(x_train, y_train, f, 'StartPoint', 0.001);

kappa_value = cfun.kappa;
fprintf('kappa: %.4f\n', kappa_value);

xi_train = x_train;
yi_train = cfun(xi_train);
xi_test = x_test;
yi_test = cfun(xi_test);

rmse_train = sqrt(mean((y_train - yi_train).^2));
meae_train = mean(abs(y_train - yi_train));
maae_train = max(abs(y_train - yi_train));

rmse_test = sqrt(mean((y_test - yi_test).^2));
meae_test = mean(abs(y_test - yi_test));
maae_test = max(abs(y_test - yi_test));

fprintf('RMSE (Root Mean Squared Error) of training data: %.4f\n', rmse_train);
fprintf('MeAE (Mean Absolute Error) of training data: %.4f\n', meae_train);
fprintf('MaAE (Maximum Absolute Error) of training data: %.4f\n', maae_train);

fprintf('RMSE (Root Mean Squared Error) of test data: %.4f\n', rmse_test);
fprintf('MeAE (Mean Absolute Error) of test data: %.4f\n', meae_test);
fprintf('MaAE (Maximum Absolute Error) of test data: %.4f\n', maae_test);

xj = 0:0.1:18;
yj = cfun(xj);
plot(x, y, 'r*', 'DisplayName', 'Observation');
hold on;
plot(xj, yj, 'b-', 'DisplayName', 'Fitted');
hold off;
legend('Location', 'best');