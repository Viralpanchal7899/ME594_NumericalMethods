clear all
close all
clc

 x = [0 1 2 3 4 5 6 ];
 
 X = 3; 
% Adding lagrange
 for i = 1:length(x)
    num(i,1) = 1;
    den(i,1) = 1;
    for j = 1:length(x)
        if i~=j
            num(i,1) = num(i,1)*(X-x(j,1));
            den(i,1) = den(i,1)*(x(i,1)-x(j,1));
        end
    end
    L(i,1) = y(i,1)*(num(i,1)/den(i,1));
end