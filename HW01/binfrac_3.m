function [chopped,rounded] = binfrac(R)

i = 1;
i_max = 7;
rounded = 'No rounding required';

while (i<=i_max)&&(R>0)
    R = 2 * R;
    bin_dig_A(i,1) = floor(R);
    R = R - bin_dig_A(i,1);
   i = i + 1;
end

% Printing the binary of chopped number

chopped = '0.';
for j = 1:(size(bin_dig_A,1))
    chopped = strcat(chopped,(int2str(bin_dig_A(j,1))));
end

% if digits > 7;

if (R > 0)
    fprintf('\n Failed to store the entire number \n');
    
    % for rounding
    R = 2 * R;
    bin_dig_A(i,1) = floor(R);
    bin_dig_B = bin_dig_A;
    k = i_max;
    while (bin_dig_A(i,1) == 1)
        l = bin_dig_A(i,1) + bin_dig_B(k,1);
        bin_dig_B(k,1) = mod(l,2);
        bin_dig_A(i,1) = l - bin_dig_A(i,1);
        k = k-1;
    end
    
    rounded = '0.';
    for j=1:i_max-1
        rounded = strcat(rounded,(int2str(bin_dig_B(j,1))));
    end
    
    chopped_decimal = 0;
    rounded_decimal = 0;
    for j=1:i_max
        chopped_decimal = chopped_decimal + bin_dig_A(j,1);
        rounded_decimal = rounded_decimal + bin_dig_B(j,1);
    end
    
    fprintf('\n Chopped number represented in decimal = %10.7f', chopped_decimal);
    fprintf('\n Rounded number represented in decimal = %10.7f', rounded_decimal);
end

        