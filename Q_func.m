%**************************************************************************
%  Q_func.m
%  Modern Signal Processing (2019 Fall)
%  Project: Eye image Segmentation (color image)
%  Director: Prof. Xiaoying Tang
%  Date: 2019/12/14
%  Author: Team 1
%  Github: https://github.com/zjumhy97/MSP_Fa19_Proj_Team_1
%--------------------------------------------------------------------------
%  Note: this function is called in the Expectation_Maximization_GMM.m
%  https://en.wikipedia.org/wiki/Expectation%E2%80%93maximization_algorithm
%**************************************************************************
function [Q_val] = Q_func(X,Theta)
%Calculates Q_function which is used in the E-step and termination
%condition for the Expectation_Maximization_GMM.m
%   X - the observed data, each line is a data sample
%   Theta - the parameter variable, including Tao, Mean, Sigma

% N - the numeber of the observed data samples
N = size(X,1);
% K - the number of the total Gaussian components
K = length(Theta.Tao);

% calculate the sum of Q
Q_val = 0;
for i = 1:n
   for j = 1:K
       % 求和式子里的T_ijt还需要看如何计算
       Q_val = Q_val + T_ijt*(log(Theta.Tao(j)))
   end
end

end

