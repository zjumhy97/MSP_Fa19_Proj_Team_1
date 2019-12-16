%**************************************************************************
%  getTheta_kmeans.m
%  Modern Signal Processing (2019 Fall)
%  Project: Eye image Segmentation (color image)
%  Director: Prof. Xiaoying Tang
%  Date: 2019/12/16
%  Author: Team 1
%  Github: https://github.com/zjumhy97/MSP_Fa19_Proj_Team_1
%**************************************************************************

function [Theta,mu] = getTheta_kmeans(K,X)
% 这个函数不确定，先暂时不要用，后续还得再看



row_num = size(X,1);
n_channel = size(X,2);

[labels,mu] = kmeans(X,K);
%用MLE计算初始的权重（pai）和方差sigma
for k = 1:K
    Theta.Tao(k) = sum(labels == k)/row_num; 
    Theta.Sigma{k} = cov(X(labels == k,:)); 
end


end