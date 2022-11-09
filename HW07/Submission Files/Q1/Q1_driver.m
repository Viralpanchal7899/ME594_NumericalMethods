% Q1 Driver

clear all
close all
clc

t = [0 10 20 30 40 50 60 70 80];
v = [30 29.5 28 23 10 5 2 0.5 0];

F = Force(t,v);
F = F';
disp(F)