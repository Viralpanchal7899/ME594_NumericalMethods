%% Q4 - part 2
% plotting the three approximations solved in part 1

x = linspace(0,pi,1000);
f_x = cos(x);

f_3 = 1 - (x.^2/2);
f_5 = 1 - (x.^2/2) + (x.^4/24);
f_7 = 1 - (x.^2/2) + (x.^4/24) - (x.^6/720);
plot(x,f_x,x,f_3,'--',x,f_5,'-',x,f_7,'-.');
title('Cos(x) & Taylor series')
xlabel('x');
ylabel('y');
legend('cos(x)','f_3','f_5','f_7');

