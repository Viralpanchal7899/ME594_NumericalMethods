% Binary fractions
% Q3
function [chopped,rounded] = binfrac(R)
format long
i = 1;
i_max = 7;
a = [];

while (i<=i_max) && (R > 0)
    R = 2 * R;
    d = floor(R);
    a = [a d];
    R = R - d;
    i = i + 1;
end

% printing in 0.dddd way
chopped = '0.';
for j = 1:i-1
    chopped = strcat(chopped,(int2str(a(j))));
end

% When the number can be represented exactly
rounded = 'Rounding is not required';

% When the number requires additional unavailable digits
if (R > 0)
    fprintf('Failed to store the entire number \n');
    R = 2 * R;
    d = floor(R);
    b = a;
    c = i_max;
    while (d==1)
        f = d + b(c);
        b(c) = mod(f,2);
        d = f - d;
        c = c - 1;
    end
    
    % printing the new rounded value in 0.ddddd format
    rounded = '0.';
    for j = 1:i-1
        rounded = strcat(rounded,(int2str(b(j))));
    end
    
    % Computing the decimal representations after chooping and rounding
    chopped_dec = 0;
    rounded_dec = 0;
    for j = 1:i_max
        chopped_dec = chopped_dec + a(j)/2^j;
        rounded_dec = rounded_dec + b(j)/2^j;
    end
    
    %printing the decimal values 
    fprintf('\n Decimal representation after chopping = ');
    disp(chopped_dec)
    fprintf('\n Decimal representation after rounding = ');
    disp(rounded_dec)
end

        