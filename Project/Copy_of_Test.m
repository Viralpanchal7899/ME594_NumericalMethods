close all
clear all
clc

x = [-1 0 1 2 3 4 5 6];
y = [10 9 8 5 4 3 0 -1];

T = readtable('test.csv')

% plot(x,y,'*')
% x_v = [0 1 2 3 4 5 6 7]
% for i = 1:8
%     y_l(i) = -1.067*x(i) + 8.643;
%     y_v(i) = -1.067*x_v(i) + 8.643;
% end
% hold on
% plot(x,y_l)

% hold on 
% plot(x_v,y_v,'-o')
% legend('points','y_l','y_v')
% axis padded