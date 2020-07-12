function f = objfun_opt3(x)
  global p_3 T_t n_1 n_2;
   %t = 2*(0.1063 + 0.0057)
   t = 2*0.1063;
   g = -((T_t/t)*log(1-(1-p_3)^(1/x(3)))+n_1*x(1)+n_2*x(2))/x(3);
   temp = abs(g);
   f = -temp;
 
end