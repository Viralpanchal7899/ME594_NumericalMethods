% Generic least squares
close all
clear all
clc

% Importing the data
data = readtable('test.csv');
X = data.SampleTimeFine;
Y = data.dv_1_;

% Raw Plot
plot(X,Y)

% defining the order of the polynomial
o = 15;

% Getting a matrix for all x values
x = zeros();
for j = 1:o+1
    o_n = o+j-1;
    for i = 1:o+1
        x(i,j) = sum(X.^(o_n-i+1));
    end
end

x_req = x';

% Getting RHS - Y matrix
y = zeros();
for i = 1:o+1
    y(i,1) = sum(Y.*X.^(i-1));
end

% Getting the coefficients
c = zeros();
c = inv(x_req)*y;

% Solving to get Y_LS considering all the X values
Y_LS = zeros();
for i = 1:length(X)
    y_temp = 0;
    o_n = o;
    for j = 1:length(c)
        y_temp = y_temp + (c(j,1)* X(i,1).^(o_n));
        o_n = o_n - 1;
    end
    Y_LS(i,1) = y_temp;
end

% Plotting the curve
hold on 
plot(X,Y_LS,LineWidth=3)
legend('Raw Plot','Polynomial Curve')
grid on 

    
