%**************************************************************************
%  Expectation_Maximization_GMM.m
%  Modern Signal Processing (2019 Fall)
%  Project: Eye image Segmentation (color image)
%  Director: Prof. Xiaoying Tang
%  Date: 2019/12/17
%  Author: Team 1
%  Github: https://github.com/zjumhy97/MSP_Fa19_Proj_Team_1
%--------------------------------------------------------------------------
%  Note: this function is according to the wikipeia.
%  https://en.wikipedia.org/wiki/Expectation%E2%80%93maximization_algorithm
%**************************************************************************

function [fig_new,Theta] = Expectation_Maximization_GMM(K,epsilon,ThetaInit,fig)
% K - total number of Gaussian components, reference, K = 2
% epsilon - Termination condition parameter, reference, epsilon = 1e-5
% Theta_0 - include the initial value of Tao, Mu, Sigma; e.g. Theta.Tao
% fig - the input figure
tao1 = ThetaInit.Tao(1);
tao2 = ThetaInit.Tao(2);
mu1 = cell2mat(ThetaInit.Mu(1));
mu2 = cell2mat(ThetaInit.Mu(2));
sigma1 = cell2mat(ThetaInit.Sigma(1));
sigma2 = cell2mat(ThetaInit.Sigma(2));

m = size(fig,1);
n = size(fig,2);
N = m * n;
X = reshape(fig,N,3);

t = 1;
for i = 1:N 
    gamma(i,1) = tao1 * mvnpdf(X(i,:)',mu1,sigma1) / (tao1 * mvnpdf(X(i,:)',mu1,sigma1) + tao2 * mvnpdf(X(i,:)',mu2,sigma2));
end
gamma(:,2) = 1 - gamma(:,1);
Q(t) = 0;
for i = 1:N
    Q(t) = Q(t) + (gamma(i,1) * log(mvnpdf(X(i,:)',mu1,sigma1)) + gamma(i,2) * log(mvnpdf(X(i,:)',mu2,sigma2))); 
end
gamma = [];

termination = false;
while ~termination
    t = t + 1;    
% E step
    for i = 1:N 
        gamma(i,1) = tao1 * mvnpdf(X(i,:)',mu1,sigma1) / (tao1 * mvnpdf(X(i,:)',mu1,sigma1) + tao2 * mvnpdf(X(i,:)',mu2,sigma2));
    end
    gamma(:,2) = 1 - gamma(:,1);
    sum_gamma_1 = sum(gamma(:,1));

% M step
    tao1 = sum_gamma_1 / N;
    tao2 = 1 - tao1;
    mu1 = (gamma(:,1)'*X/sum_gamma_1)';
    mu2 = (gamma(:,2)'*X/(N - sum_gamma_1))';
    
    term1 = zeros(3);
    term2 = zeros(3);
    for i = 1:N
       term1 = term1 + gamma(i,1) * (X(i,:) - mu1)' * (X(i,:) - mu1);
       term2 = term2 + gamma(i,2) * (X(i,:) - mu2)' * (X(i,:) - mu2);
    end
    sigma1 = term1 / sum_gamma_1;
    sigma2 = term2 / (N - sum_gamma_1);
    
    Q(t) = 0;
    for i = 1:N
       Q(t) = Q(t) + (gamma(i,1) * log(mvnpdf(X(i,:)',mu1,sigma1)) + gamma(i,2) * log(mvnpdf(X(i,:)',mu2,sigma2))); 
    end
    if t > 200 || Q(t)-Q(t-1)<epsilon  % 循环终止的条件
        termination = true; 
    end
    fprintf('step: %d  delta: %f\n',t,Q(t)-Q(t-1));
end
X_new = zeros(N,1);
X_new(find(gamma(:,1)<gamma(:,2))) = 1;
fig_new = reshape(X_new,m,n);

Theta.Tao = [tao1, tao2];
Theta.Mu(1) = {mu1};
Theta.Mu(2) = {mu2};
Theta.Sigma(1) = {sigma1};
Theta.Sigma(2) = {sigma2};
end





















