% Program for least squares solving for a parabolic equation
% Y = Ax^2 + Bx + C

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

% Script for least squares parabolic equation
% Y = Ax^2 + Bx + C;

x = data.SampleTimeFine;
y = data.dv_1_;

sigma_x = 0;
sigma_y = 0;
sigma_xy = 0;
sigma_x2y = 0;
sigma_x2 = 0;
sigma_x3 = 0;
sigma_x4 = 0;

for i = 1:length(x)
    sigma_x = x(i) + sigma_x;
    sigma_y = y(i) + sigma_y;
    sigma_xy = x(i)*y(i) + sigma_xy;
    sigma_x2y = x(i)^2 * y(i) + sigma_x2y;
    sigma_x2 = x(i)^2 + sigma_x2;
    sigma_x3 = x(i)^3 + sigma_x3;
    sigma_x4 = x(i)^4 + sigma_x4;
end

RHS = zeros();
RHS = [sigma_y; sigma_xy; sigma_x2y];
X = [sigma_x2 sigma_x length(x); sigma_x3 sigma_x2 sigma_x; sigma_x4 sigma_x3 sigma_x2];
X_inv = inv(X);
C = X_inv * RHS;

y_f = (C(1))*(x.^2) + C(2)*x + C(3);

hold on 
plot(x,y_f)