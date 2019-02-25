% 2-Regime Markov Switching Model Description of U.S. Economy;
% A Simplified Version with State-Independent Mean and Variance
% Tao Wang
% para_est stores all estimates of parameters. 


clc;
clear;

% Download Data
url = 'https://fred.stlouisfed.org/';
c = fred(url);
series = 'GDPC1';   % Real GDP Quarterly(2012 Dollars);

d = fetch(c,series);
dta = d.Data;
date = datestr(dta(:,1),'dd-mmm-yyyy');
gdp = dta(:,2);
for t =2:length(gdp)
y(t) = (log(gdp(t))-log(gdp(t-1)))*400;   % Annualized GDP growth rate;
end


%%%% Model %%%%%%%
% y_t = alpha+ beta * s_t + epsilon_t
% y is the GDP growth;
% s_t =1 in good state; s_t = 0 in bad state;
% p=p(s_t=1|s_t-1=1)
% q=p(s_t=0|s_t-1=0)
% Transition Matrix from [s=0,s=1]' is [q,1-p;1-q,p] 
% para_est stores all estimates of parameters. 
%%%%%%%%%%%%%%%%%

% Estimation 
% The log-likihood function is defined at the bottom

obfunc = @(para)(-(loglh(y,para)));   %The first output of the func; 
                                       %neg log-likelihood based on data Y1;
init = [1,1,1,0.5,0.5];   % Some initial values;
A = [];               % No linear constraints;
b = [];                % No linear constraints;
Aeq =[];              % No linear equality constraints;
beq =[];              % No linear equality constraints;
lb =[];               % Lower bounds for parameters. p and q bounded below;
ub =[];               % Upper bounds for parameters. p and q bounded below;    
nlcon=@constr;       % Use non-linear constraints to bound p and q below 1;

% fmincon is the optimization algorithm;
para_est = fmincon(obfunc,init,A,b,Aeq,beq,lb,ub,nlcon); 


%%% Based on estimates of parameters and data; compute filtered probabilities

[llh,filter1,pr1,pdf] = loglh(y,para_est);  % filter1: prob of good state;
                                            % pr1: predicted prob of good state 
filter0 = 1-filter1;   % prob of bad state: recession;
 

% Plots of GDP growth and Filtered Probs;

y_ts=timeseries(y,date);
prob_ts=timeseries(filter0,date);
y_ts.TimeInfo.Format='dd-mm-yyyy';
prob_ts.TimeInfo.Format='dd-mm-yyyy';

plot(y_ts,'k-'); 
ylabel('Real GDP Growth');
hold on;
yyaxis right;
plot(prob_ts,'r--');
ylabel('(Filtered) Prob of Recession');
title('Probability of the U.S. Economy in Recession');
legend('Real GDP Growth','Prob of Recession');

saveas(gcf,'Figure1.png');


% Function of Constraints

function [c,ceq]=constr(para)
     c = para*[0,0,0,1,0;0,0,0,0,1].'-[1,1];
     ceq=[];
end

% Estimation Function of Markov Switching Model;
% Outputs include:
%%% Loglikelihood llh;
%%% Vector of updated prob s=1|Y_t at time t;
%%% Vector of predicted probs s=1|Y_t-1 at time t-1;
%%% Vector of predicted probs y_t|y_t-1;

function [llh,update1,prdict1,f1]=loglh(Y,para)   %para = [alpha,beta,sigma,p,q]
   alpha=para(1);            
   beta =para(2);
   sigma =para(3); 
   p=para(4);   
   q =para(5);  
   T = length(Y);
   llh = 0;
   update0(1) =(1-p)/(2-p-q); % p(s=0|Y_0)
   update1(1) = 1-update0;    % p(s=1|Y_1)
   
   for t=2:T
       prdict1(t) = (1-q)*update0(t-1)+p*update1(t-1); % p(s_t=1|y_t-1);
       pdf_t_1 =normpdf(Y(t),alpha+beta,sigma)* prdict1(t);  % f(y_t|s_t=1,Y_t-1)
       pdf_t_0 =normpdf(Y(t),alpha,sigma)*(1-prdict1(t)); % f(y_t|s_t=0,Y_t-1)
       
       f1(t)= pdf_t_1+pdf_t_0;     % f1= f(y_t|Y_t-1)
       llh_pred = log(f1(t));     % log( f(y_t|Y_t-1))
       llh = llh + llh_pred;   % llh_pred = log(f(y_t|Y_t-1))
       
       update1(t) = pdf_t_1/( pdf_t_1+ pdf_t_0);  % p(s_t=0|y_t-1) 
       update0(t) = 1-update1(t);                    % p(s_t=1|y_t-1)
   end
end