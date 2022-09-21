function [chopped_number,rounded_number] = binfrac_2(R)
%R = 0.12109375;
i = 1;
i_max = 7;
rounded_number = 'Rounding not required';

while  (i<=i_max) && (R>0)
    R = 2 * R;
    d(i,1) = floor(R);
    R = R - d(i,1);
    i = i+1;
end

chopped_number = '0.';
for j = 1:size(d,1)
    dig = int2str(d(j,1));
    chopped_number = strcat(chopped_number,dig);
end

% fprintf('The binary representation is = ');
% disp (p)

if (R > 0)
    %chopped_number = d;
    rounded_number = d;
    R = 2 * R;
    rounded_number(i,1) = floor(R);
    while (rounded_number(i,1) == 1)
        q = rounded_number(i,1) + rounded_number(j,1);
        rounded_number(j,1) = mod(q,2);
        rounded_number(i,1) = q - rounded_number(i,1);
        j = j-1;
    end
    
    s = '0.';
    for j = 1:i_max
        dig = int2str(rounded_number(j,1));
        s = strcat(s,dig);
    end

    m = 0;
    n = 0;

    for l = 1:i_max
       % m = m + chopped_number(l,1)/2^l;
        n = n + rounded_number(l,1)/2^l;
    end
    %fprintf('Number represented after chopping is %0.7f \n', m)
    fprintf('Number represented after rounding is %0.7f \n \n', n)
    fprintf('The chopped binary representation is = ');
    disp (chopped_number)
    fprintf('The rounded binary representation is = ');
    disp (s)
else
    fprintf('Number represented after chopping is ');
    %disp (m)
    fprintf('\n No rounding needed')
end
end



    
    

