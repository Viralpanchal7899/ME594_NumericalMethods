% Generic least squares
close all
clear all
clc

tic

% Importing the data
data = readtable('test.csv');
X = data.SampleTimeFine;
Y = data.dv_1_;

% Raw Plot
plot(X,Y)

% Starting MSE
mse = 1;
MSE_arr(1,1) = 1;

% defining the starting order of the polynomial
O = 1;

while mse>1e-6
    
    % Getting a matrix for all x values
    x = zeros();
    for j = 1:O+1
        o_n = O+j-1;
        for i = 1:O+1
            x(i,j) = sum(X.^(o_n-i+1));
        end
    end

    x_req = x';

    % Getting RHS - Y matrix
    y = zeros();
    for i = 1:O+1
        y(i,1) = sum(Y.*X.^(i-1));
    end

    % Getting the coefficients
    c = zeros();
    c = inv(x_req)*y;

    % Solving to get Y_LS considering all the X values
    Y_LS = zeros();
    for i = 1:length(X)
        y_temp = 0;
        o_n = O;
        for j = 1:length(c)
            y_temp = y_temp + (c(j,1)* X(i,1).^(o_n));
            o_n = o_n - 1;
        end
        Y_LS(i,1) = y_temp;
    end

    % Computing the MSE and incrementing the order
    mse = error(Y_LS,Y,length(Y));
    MSE_arr(O+1,1) = mse;
    O = O+1;
end

% fprintf("Final MSE = %f ", MSE_arr(length(MSE_array),1));
% Plotting the curve
hold on 
plot(X,Y_LS,LineWidth=3)
legend('Raw Plot','Polynomial Curve')
axis padded
grid on 

toc
    
