
function out = opt3(T,p1,p2,p3,n1,n2)
x0 = randi([1, 7],1,3)
lb = [1,1,1];
ub = [7,7,7];
global p_1 p_2  p_3  T_t n_1 n_2;
p_1 = p1;
p_2 = p2;
p_3 = p3;
T_t = T;
n_1 = n1;
n_2 = n2;
options = optimset('Algorithm','interior-point');
options = optimset('Algorithm','active-set');

%options.TolFun = Inf;
%options.Tolx = Inf;
[x,fval,EXITFLAG] = fmincon('objfun_opt3',x0,[],[],[],[],lb,ub,'confun_opt3',options)
[c, ceq] = confun_opt3(x) ;
px1 = p_1 - c(1,1);
px2 = p_2 - c(2,1);
px3 = p_3 - c(3,1);

% %Write data to textfile output
  T_tt = num2str(T_t);
  n_11 = num2str(n_1);
  n_22 = num2str(n_2);
  p_11 = num2str(p_1);
  p_22 = num2str(p_2);
  p_33 = num2str(p_3);
  px_file_name = strcat('./opt3_fmin_paper_changeP3_12-2-14/','opt3_period_',T_tt,'_n1_',n_11,'_n2_',n_22,'_p1_',p_11,'_p2_',p_22,'_p3_',p_33,'.txt');
  file_1 = fopen(px_file_name,'wt');

  tab = char(9);
       fprintf(file_1,'%s%s%.4f\n','P1_equ',tab,px1);
       fprintf(file_1,'%s%s%.4f\n','P2_equ',tab,px2);
       fprintf(file_1,'%s%s%.4f\n','P3_equ',tab,px3);

 fclose('all');
end

