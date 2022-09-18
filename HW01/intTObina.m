function b = intTObina(d)

b = [];

while d > 0
    r = rem(d,2);
    if (r ==0 || r==1)
        b = [r b];
    else
        fprintf('Error')
    end
    
    q = floor(d/2);
    d = q;
end
if (length(b) <= 20)
    fprintf('b = ');
    disp(b)
else
   fprintf('Error: Type a smaller number \n');
end
end
