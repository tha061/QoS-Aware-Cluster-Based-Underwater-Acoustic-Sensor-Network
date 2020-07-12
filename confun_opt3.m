function [c,ceq] = confun_opt3(x)
% given values:
t_tr = 0.1063;
t_ack = 0.0057;

%   T_t= ; % leads to the network load is 1Kbps
%   p_1= p1; p_2= p2; p_3= p3;
%   n_1= n1; n_2= n2;
global p_1 p_2  p_3  T_t n_1 n_2;
t = 2*t_tr;
%t = 2*(t_tr + t_ack);
%n3 = -((T/t)*(log(1-(1-p2))^(1/x(2)))+n1*x(1)+n2*x(2))/x(3)
%n3 = -((T/t)+n1*x(1)+n2*x(2))/x(3)

n_3 = - objfun_opt3(x);
lambda_max = (n_1*x(1)+n_2*x(2)+n_3*x(3))/T_t;


%nonlinear inequality constraints:
c = [1 - exp(-lambda_max*t) - (1-p_1)^(1/x(1));
     1 - exp(-lambda_max*t) - (1-p_2)^(1/x(2));
     1 - exp(-lambda_max*t) - (1-p_3)^(1/x(3))];
 
% nonlinear equality constraints:
ceq = [];
end