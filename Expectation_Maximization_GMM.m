%**************************************************************************
%  Expectation_Maximization_GMM.m
%  Modern Signal Processing (2019 Fall)
%  Project: Eye image Segmentation (color image)
%  Director: Prof. Xiaoying Tang
%  Date: 2019/12/11
%  Author: Team 1
%  Github: https://github.com/zjumhy97/MSP_Fa19_Proj_Team_1
%--------------------------------------------------------------------------
%  Note: this function is according to the wikipeia.
%  https://en.wikipedia.org/wiki/Expectation%E2%80%93maximization_algorithm
%**************************************************************************

function [Theta] = Expectation_Maximization_GMM(K,epsilon,ThetaInit,d,X)
% K - total number of Gaussian components, reference, K = 2
% epsilon - Termination condition parameter, reference, epsilon = 1e-5
% Theta_0 - include the initial value of Tao, Mu, Sigma; e.g. Theta.Tao
% d - the dimension of x(i)
% X - the observed data, each line correspondes a data sample.
%% Initialization
% t: time index, add 1 in each iteration until termination
t = 1;
% d: the dimension of x(t)
d = length(X(1,:));
% Theta records the information of unknown parameters of GMM during
% iterations, includeing Tao(the weight vector of each Gaussian Model), Mu
% (the mean of each Gaussian Model,vector of d dimension), Sigma (the 
% covariance maatrix of each Gaussian Model, matrix of d*d dimension)
Theta(1) = ThetaInit;
% Q-function: expectation of the log-likelihood function under the
% condition that data X and Theta(t) are known.
Q(1) = ; 

%% Iteration
t = t + 1; % t=2,但是我需要Q(2)和Q(1)的信息，才能满足下面的循环开始条件

while norm(Q(t) - Q(t-1)) > epsilon
% Iterations begin from t = 3.
   t = t + 1; % 进来以后t = 3， 需要计算Q(3)，即Q(t),这里的Q的计算公式要拿去上面计算Q(1)和Q(2)
   
   % E step: calculate Q(t)
   Q(t) = 0;
   for i = 1:N
       for j = 1:K
           % 确认下面的式子里面，关于t的正确性，是t还是t-1,括号还不正确
          Q(t) = Q(t) + T(i,j,t) * (log(Theta(t).Tao(j)) - ...
              0.5*log(det(cell2mat(Theta(t).Sigma(j))) - ...
              0.5*log( (X(i,:)' - cell2mat(Theta(t).Mu(j)')'  ...
              * cell2mat(Theta(t).Sigma(j))^{-1} * (X(i,:)' - ...
              cell2mat(Theta(t).Mu(j)'))  ) - d/2*log(2*pi)));
       end
   end
   
   % M step: maximize Q(t),update Theta(t)
   for j = 1:K
       % T - T(i,j,t) represents the "mebemership probabilities"      
       % Tao - column vector
       Theta(t).Tao(j) = sum(T(:,j,t-1)) / N;
       
       % Mu - column vector
       Temp.Mu = zeros(d,1);
       for i = 1:N
          Temp.Mu = Temp.Mu + T(i,j,t-1) * X(i,:)';  
       end
       Theta(t).Mu(j) = {Temp.Mu / sum(T(:,j,t-1))};
       
       % Sigma - covariance matrix
       Temp.Sigma = zeros(d,d);
       for i = 1:N
          Temp.Sigma = Temp.Sigma + T(i,j,t-1) * (X(i,:)' - cell2mat(Theta(t).Mu(j))) * (X(i,:)' - cell2mat(Theta(t).Mu(j)))';  
       end
       Theta(t).Sigma(j) = {Temp.Sigma(j)};
   end   
end
    
    
end





















