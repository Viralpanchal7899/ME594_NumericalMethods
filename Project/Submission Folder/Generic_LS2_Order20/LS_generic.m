% Plotting the curve with increasing order of the polynomial equation
% irrespective of the MSE.

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

% Starting MSE
MSE_arr = zeros();

% defining the starting order of the polynomial
O = 1;
max_order = 20;
tic
while O <= max_order
    
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
    
    subplot(round(max_order/5),round(max_order/4),O)
    plot(X,Y)
    hold on
    plot(X,Y_LS,'g',LineWidth=2)
    title('Order = ',O)
    sgtitle('Blue - Raw plot | Green - LS plot')
    xlabel('Sample Time')
    ylabel('Velocity')
    axis padded
    grid on
    
    % Computing the MSE and incrementing the order
    mse = error(Y_LS,Y,length(Y));
    MSE_arr(O+1,1) = mse;
    O = O+1;
end

figure()
% Plotting the error as the order is increasing
plot(1:1:20,MSE_arr(1:20,1))
legend('MSE')
xlabel('Order')
ylabel('MSE')
title('MSE as the order of polynomial increases')
grid on 
axis padded
toc


    
