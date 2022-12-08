clear all
close all
clc

data = readtable('test.csv');

% Defining the abscissa and ordinate
x = data.SampleTimeFine;
y = data.dv_1_;

% x = [12 13 14 16];
% y = [5 6 9 11];
sum = 0;
iter = 0;
max_iter = length(x);
y_lagrange = zeros();
a = 1;
% while iter < max_iter
%     iter = iter + 1;
%     a = x(iter,1);
    
    for i = 1 : length(x)
        prdct = 1;
        for j = 1 : length(x)
            if j ~= i
                prdct= prdct*((a-x(j,1))/(x(i,1)-x(j,1)));
            end
        end
        sum = sum + y(i,1)*prdct;
    end
% end



%     for i = 1:length(x)
%         u = 1;
%         l = 1;
%         for j = 1:length(x)
%             if j ~= i
%                 u = u * (a - x(j,1));
%                 l = l * (x(i,1) - x(j,1));
%             end
%         end
%         sum = sum + u / l * y(i,1);
%     end
%     y_lagrange(iter,1)= sum;
% end

% disp(sum);