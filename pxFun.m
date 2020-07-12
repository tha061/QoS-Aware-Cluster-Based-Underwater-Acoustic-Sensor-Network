function output = pxFun(x,lambda_max,t)
output = 1 - (1-exp(-lambda_max*t))^x;
end