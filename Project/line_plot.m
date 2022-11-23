% Program for least squares solving for a line
% Y = Ax + B

close all
clear all
clc

data = readtable('test.csv');

% Raw plot 
% solving for velocity measured in x direction wrt time

plot(data.SampleTimeFine, data.dv_1_,'*')
grid on
axis padded
legend('raw data')

% script for least square line equation 
% y=AX+B;

% 2 equations
% sum(yx) = sum(x^2)*A + sum(x)*B
% sum(y) = sum(x)*A + (N)*B

x = data.SampleTimeFine;
y = data.dv_1_;

sigma_x = 0;
sigma_y = 0;
sigma_xy = 0;
sigma_x2 = 0;
for i = 1:length(x)
    sigma_x = x(i) + sigma_x;
    sigma_y = y(i) + sigma_y;
    sigma_xy = x(i)*y(i) + sigma_xy;
    sigma_x2 = x(i)^2 + sigma_x2;
end

% matrix
RHS = zeros();  
% X = zeros();
RHS = [sigma_xy ; sigma_y];
X = [sigma_x2 sigma_x; sigma_x length(x)];
X_inv = inv(X);
C = X_inv * RHS;

% y = C(1)*x + C(2)
y_f = C(1)*x + C(2);

hold on
plot(x,y_f)

