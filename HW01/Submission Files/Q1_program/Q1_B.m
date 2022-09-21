%% Q1.B

% f_cal --> F using calculator
% f_mat --> F using Matlab
% TSE --> True relative error

format long
x = 0.007;
f_mat = (1 - cos(x))/sin(x);
fprintf('f_mat =');
disp(f_mat)

f_cal = 0.003429;
TRE = abs((f_mat - f_cal)/f_cal);
fprintf('TRE =');
disp(TRE)

%% Q1.C

f_cal2 = 0.003499;
TRE_2 = abs((f_mat - f_cal2)/f_cal2); 
fprintf('TRE_2 = ');
disp(TRE_2)


