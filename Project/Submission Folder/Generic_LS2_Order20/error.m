function MSE = error(y_ls,y_act,N)
% N --> Number of samples

MSE = (sum(y_act - y_ls)^2)/N;

end
