% Driver Q4
clear all
close all
clc

v = [38 37.6 36.2 33.6 29.7 24.5 17.8 9.6 0];

Q_t = Trapezoid(v)
Q_s = Simpsons(v)

