%**************************************************************************
%  getTheta_kmeans.m
%  Modern Signal Processing (2019 Fall)
%  Project: Eye image Segmentation (color image)
%  Director: Prof. Xiaoying Tang
%  Date: 2019/12/16
%  Author: Team 1
%  Github: https://github.com/zjumhy97/MSP_Fa19_Proj_Team_1
%**************************************************************************

function [Theta] = getTheta_kmeans(K,fig)
[m,n,d] = size(fig);
N = m * n;
X = reshape(fig,N,d);

[idx,mu] = kmeans(X,K);
for k = 1:K
    Theta.Tao(k) = sum(idx == k)/N;
    Theta.Mu(k) = {mu(k,:)}; 
    Theta.Sigma(k) = {cov(X(idx == k,:))};
end
Theta.Tao = Theta.Tao';

end