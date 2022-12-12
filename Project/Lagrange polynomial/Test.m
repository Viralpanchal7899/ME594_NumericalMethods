clear all
close all
clc
% IMPLEMENTING LAGRANGE SELF
% In this script, Sample time is considered in X and only 10 random samples
% from the whole data set is taken keeping the first and last same from the
% parent dataset.

% Importing the data
data = readtable('test_3.csv');
x_og = data.SampleTimeFine;
y_og = data.dv_1_;

% N --> Number of samples from the original "og" dataset.
N = 10;


plot(x_og,y_og,'o');

% Lagrange with linspace
Y_l = zeros();
for k = 1:length(x_og)-1
    x = linspace(x_og(k),x_og(k+1),N);
    num = ones();
    den = ones();
    X = x(k);
    L = zeros();
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
Y_l(k,1) = sum(L(:,1));
hold on 
plot(x,Y_l)
end
legend('raw data','Lagrange Method')

% % Defining first and last, (x,y) dataset for this particular simulation.
% x(1,1) = x_og(1,1);
% x(N,1) = x_og(length(x_og),1);
% y(1,1) = y_og(1,1);
% y(N,1) = y_og(length(y_og),1);
% 
% % Randomly picking remaining readings from the whole set.
% iter = sort(randi([2,length(x_og)-1],1,N-2));
% for i = 1:(length(iter))
%     x(i+1,1) = x_og(iter(i),1);
%     y(i+1,1) = y_og(iter(i),1);
% end

% Y_l = zeros();
% % Implementing Lagrange 
% for k = 1:length(x)
%     num = ones();
%     den = ones();
%     X = x(k);
%     for i = 1:length(x)
%         num(i,1) = 1;
%         den(i,1) = 1;
%         for j = 1:length(x)
%             if i~=j
%                 num(i,1) = num(i,1)*(X-x(j,1));
%                 den(i,1) = den(i,1)*(x(i,1)-x(j,1));
%             end
%         end
%         L(i,1) = y(i,1)*(num(i,1)/den(i,1));
%     end
% Y_l(k,1) = sum(L(:,1));
% end

% Plotting all the data
% plot(x_og,y_og,'o');
% hold on 
% plot(x,Y_l)
% legend('raw data','Lagrange Method')