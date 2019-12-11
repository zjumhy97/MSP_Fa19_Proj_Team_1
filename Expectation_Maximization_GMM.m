%**************************************************************************
%  Expectation_Maximization_GMM.m
%  Modern Signal Processing (2019 Fall)
%  Project: Eye image Segmentation (color image)
%  Director: Prof. Xiaoying Tang
%  Date: 2019/12/11
%  Author: Team 1
%  Github: https://github.com/zjumhy97/MSP_Fa19_Proj_Team_1
%**************************************************************************

function [Theta] = Expectation_Maximization_GMM(K,epsilon,Theta_0,d)
% K - total number of Gaussian components 
% epsilon - Termination condition parameter
% Theta_0 - include the initial value of Tao, Mu, Sigma; e.g. Theta.Tao
% d - the dimension of x(i)
%% Initialization
t = 1;
Theta(1) = Theta_0;
Q(1) = ;  % Q-function
Q(2) = ;

%% Iteration
t = t + 1;
while norm(Q(t) - Q(t-1)) > epsilon
   t = t + 1;
   % E step: calculate Q(t)
   Q(t) = 0;
   % Q(t)算的不太对
   for i = 1:N 
      for  j = 1:K % total number of Gaussian components
          sum_item = T_ijt * (log() - 0.5*log() - 0.5*log() - d/2*log(2*pi));
          Q(t) = Q(t) + sum_item;
      end
   end
   
   % M step: maximize Q(t),update Theta(t)
   for j = 1:K
       Theta(t).Tao(j) = sum(T(:,j)) / sum(sum(T));
       % Theta(t).Tao(j) = sum(T(:,j)) / N;
       
       
       % T是t时刻的T，而Mu和Sigma都是t+1时刻的
       Temp(j).Mu = zeros(d,1);
       Temp(j).Sigma = zeros(d,d);
       for i = 1:N
          Temp(j).Mu = Temp(j).Mu + T(i,j) * X(i,:)';
          Temp(j).Sigma = Temp(j).Sigma + T(i,j) * (X(i,:)' - Temp(j).Mu)*(X(i,:)' - Temp(j).Mu)';
       end
       
       Theta(t).Mu(j,:) = Temp(j).Mu'/sum(T(:,j)); % line vector
       
       % 这里有问题
       Theta(t).Sigma(j) = Temp(j).Sigma/sum(T(:,j));
   end
   
end
    
    
end





















