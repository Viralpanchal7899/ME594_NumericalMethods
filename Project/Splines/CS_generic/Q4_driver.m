% Cubilc Splines 

close all 
clear all 
clc

data = readtable('test.csv');

t = data.SampleTimeFine;
y = data.dv_1_;

% t = [1.3 1.7 1.9 2.3 2.7 3.1 3.6 4.0];
% y = [2.8 3.2 3.1 3.5 4.8 4.2 5.3 4.8];

spline_plot(t,y)
