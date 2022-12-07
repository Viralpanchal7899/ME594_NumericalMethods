% Cubic splines for IMU data
close all 
clear all 
clc

% Computing time to run the algorithm 

tic
% Importing the csv data
data = readtable('test.csv');

% Defining the abscissa and ordinate
X = data.SampleTimeFine;
Y = data.dv_1_;

% Defining the number of samples
N = length(X)-1;

% Defining the initial variables
A = ones(N,1);
B = ones(N+1,1);
B = B*4;
B(1) = 2;
B(N+1) = 2;
C = ones(N,1);

RHS(1) = 3*(Y(2) - Y(1));
RHS(N+1) = 3* (Y(N+1)- Y(N));

for i = 2:N
    RHS(i) = 3*(Y(i+1) - Y(i-1));
end

% Calling Thomas algorithm
D = thomas_alg(A,B,C,RHS);

% Defining 4 interested variables
a = zeros(N,1);
b = zeros(N,1);
c = zeros(N,1);
d = zeros(N,1);

for i = 1:N
    a(i) = Y(i);
    b(i) = D(i);
    c(i) = 3*(Y(i+1)-Y(i)) - 2*D(i) - D(i+1);
    d(i) = 2*(Y(i)-Y(i+1))+D(i)+D(i+1);
end

% Defining u parameter which is always b/w 0 & 1
u = linspace(0,1,101);

% plotting linear spline / raw plot
plot(X,Y,'o-');
hold on

for i=1:N
    X_CS = u*(X(i+1) - (X(i))) + X(i);
    Y_CS = a(i) + b(i) * u(:) + c(i) * u(:).^2 + d(i) * u(:).^3;
    
    % plotting the cublic spline 
    plot(X_CS,Y_CS,'-m',LineWidth=1)
end

legend('Linear spline','Cubic spline')
xlabel('Sample time');
ylabel('Velocity');
title('Cubic Splines');
grid on
axis padded

toc
