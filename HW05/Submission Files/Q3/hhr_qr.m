% Function to decompose given matrix using HHR method
function [Q,R] = hhr_qr(A)

% Input - A matrix (3*3)
% Output - Q --> dialgonal matrix | R-->Upper triangular matrix

R = A;
[n,n] = size(R);
I = eye(n);
Q=I;

for i = 1:n-1
    col=R(:,i);
    if(i>1)
        col(1:i-1)=0;
    end
    max_col = max(abs(col));
    col = col/max_col;
    e(1:n,1)=0;
    e(i)=1;
    
    mag_col = sqrt(col'*col);
    
    if(col(i) >= 0)
        u = col + mag_col*e;
    else
        u = col - mag_col*e;
    end
    
    beta = 2/(u'*u);
    H = I - (beta*u*u');
    
    Q = Q*H;
    R = H*R;
    
end
