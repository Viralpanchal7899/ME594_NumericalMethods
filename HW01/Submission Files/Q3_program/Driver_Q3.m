%% Driver for Q3
% function file name - binfrac.m

%Test case 1 | R = 0.40625
fprintf('when R = 0.40625 \n');
[chopped_number_1,rounded_number_1] = binfrac(0.40625)

fprintf('---------------------------------------------------------\n');

%Test case 2 | R = 0.7
fprintf('when R = 0.7 \n');
[chopped_number_2,rounded_number_2] = binfrac(0.7)

fprintf('---------------------------------------------------------\n');

%Test case 3 | R = 0.12109375
fprintf('when R = 0.121090375 \n');
[chopped_number_3,rounded_number_3] = binfrac(0.12109375)

