function out = algorithm_opt3_pktsize(n1,n2,td,p1,p2,p3,up)
% Number of nodes: N = 50
% Given values
  n_1 = n1; n_2 = n2; % Number of Groups: m =3
  %t_tr = 0.1063; 
  T = 64;
  t_ack = 0.0057;
  td_t = td; upbound = up;
  % QoS requirements
  p_1 = p1; p_2 = p2; p_3 = p3;
  n3_max = 0;

% n_1 = 5; n_2 = 15;
% t_tr = 0.1;
% t_ack = 0.0057;
% T_p = 140;
% p_1 = 0.95;
% p_2 = 0.8;
% p_3 = 0.7;
% n3_max = 0;
% upbound = 7;

 % Possible values of xi = 1,..,7 (interger)
 %lambda_max = (n1*x1+n2*x1+n3*x3)/T; % maybe this is a function
 %t = 2*t_tr;
 %t = 2*(t_tr + t_ack)
 %t = 2*t_tr
 t = 2*td_t
 index = 0;
 %f_min = n1*x1 + n2*x2 + n3*x3; % this is another function 
 % Loop to find x1
 
 for i = 1:upbound  % x1 = i
     for j = 1:upbound
         for k = 1:upbound
             index = index +1;
                 i;
                 j;
                 k;
             n_3 = -((T/t)*log(1-(1-p_3)^(1/k))+n_1*i+n_2*j)/k
             lambda_max = lambdaFun(i,j,k,n_1,n_2,n_3,T);
             p_x1 = pxFun(i,lambda_max,t);
             p_x2 = pxFun(j,lambda_max,t);
             p_x3 = pxFun(k,lambda_max,t);
         if (p_x1 >= p_1) && (p_x2 >= p_2) && (p_x3 >= p_3)
             temp = n_3;
             
               %xi = ' ';
                %disp([i,j,k]);
             if temp > n3_max
                 n3_max = temp
                 x1_opt = i;
                 x2_opt = j;
                 x3_opt = k;
                 px1_opt = p_x1;
                 px2_opt = p_x2;
                 px3_opt = p_x3;
                
             end
         end
         end
     end
 end


index
 if n3_max == 0
    solution = 'No feasible solution'
 else
    xi = ' '
    disp([x1_opt])
    disp([x2_opt])
    disp([x3_opt])
    p_xi = ' '
    disp([px1_opt])
    disp([px2_opt])
    disp([px3_opt])
    n3_max
 end
 
 % %Write data to textfile output
  td_tt = num2str(td_t)
  n_11 = num2str(n_1)
  n_22 = num2str(n_2)
  n_33 = num2str(n_3);
  p_11 = num2str(p_1);
  p_22 = num2str(p_2);
  p_33 = num2str(p_3);
  px_file_name = strcat('./opt3_BF_paper_pktsize_13-2-14/','opt3_pktTime_',td_tt,'_n1_',n_11,'_n2_',n_22,'_p1_',p_11,'_p2_',p_22,'_p3_',p_33,'.txt');
  file_1 = fopen(px_file_name,'wt');

  tab = char(9);
       fprintf(file_1,'%s%s%.4f\n','P1_equ',tab,px1_opt);
       fprintf(file_1,'%s%s%.4f\n','P2_equ',tab,px2_opt);
       fprintf(file_1,'%s%s%.4f\n','P3_equ',tab,px3_opt);
       fprintf(file_1,'%s%s%d\n','x1',tab,x1_opt);
       fprintf(file_1,'%s%s%d\n','x2',tab,x2_opt);
       fprintf(file_1,'%s%s%d\n','x3',tab,x3_opt);
       fprintf(file_1,'%s%s%.2f\n','n3-max',tab,n3_max);

 fclose('all');
end
 