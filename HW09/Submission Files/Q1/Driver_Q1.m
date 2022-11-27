% Driver for Q1

close all
clear all
clc

a = 0;
b = 200;
h = 0.01;

x0 = 5;
y0 = 5;
z0 = 10;

[x,y,z] = RK4('lorentz',a,b,h,x0,y0,z0);