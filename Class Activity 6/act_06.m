close all 
clear all
clc

A = [-2 1 0
    1 -2 1
    0 1 -2];
v = A;
v(:,1) = A(:,1);
% r_11 = norm(v1)
% e1 = (1/(r_11))*(v1)

for i = 1:3
    for j = 1:3
        if i == j
            r(i,j) = norm(v(:,i))
        end
    end
end
for i = 1:3
    for j = 1:3
        if i ~= j
            e(:,i) = v(:,1)/r(i,i)
            r(i,j) = e(1,i).*v(1,j) + e(2,i).*v(2,j)+ e(3,i).*v(3,j)
%             r(i,j) = v()
             
%             r(i,j) = ()
        end
    end
end
