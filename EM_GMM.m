%**************************************************************************
%  EM_GMM.m
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

function [posterior_probability,Theta] = EM_GMM(K,epsilon,ThetaInit,X)
% K - total number of Gaussian components, reference, K = 2
% epsilon - Termination condition parameter, reference, epsilon = 1e-5
% Theta_Init - include the initial value of Tao, Mu, Sigma; e.g. Theta.Tao
% X - data matrix, N by d

[N,d] = size(X); % for the color image,d is 3.

% Initialization of the parameter Theta = [tao, mu, sigma]
% calculate the probability density of ThetaInit
tao = ThetaInit.Tao; % K by 1
for j = 1:K
    mu(j,:) = cell2mat(ThetaInit.Mu(j)); % 1 by 3
    sigma(j) = ThetaInit.Sigma(j); % 3 by 3,×¢ÒâsigmaÊÇcell
    % mu(j) is 1 by 3 vector, prior_probability is N by K matrix.
    % P(x|z), N by K, prior_probability
    prior_probability(:,j) = mvnpdf(X,mu(j,:),cell2mat(sigma(j)));
end

% posterior_probability - membership probabilities, posterior probability
% posterior_probability could also be viewed as the responsibility that 
% component k takes for 'explaining' the observation X
posterior_probability = [];
% P(x), N by 1, incomplete_probability;
% P(z), K by 1, tao, 
% P(x) = P(x|z) * P(z)
incomplete_probability = prior_probability * tao;
for j = 1:K
    %  P(z|x) = P(x,z)/P(x); P(x) = \sum_(z)P(z=z_i)P(x,z_i)    
    posterior_probability(:,j) = tao(j) * ...
        prior_probability(:,j)./incomplete_probability; 
end

iteration = 1;
Q(iteration) = -inf;

termination = false;
while ~termination
    iteration = iteration + 1;    
% E step
    incomplete_probability = prior_probability * tao;
    for j = 1:K    
        posterior_probability(:,j) = tao(j) * ...
            prior_probability(:,j)./incomplete_probability; 
    end

% M step
    tao = 1/N * sum(posterior_probability)'; % 1 by 2
    % X, N by 3;posterior_probability, N by K 
    mu = (X'*posterior_probability./sum(posterior_probability))';
    for j = 1:K
       term = sqrt(posterior_probability(:,j)).*(X - mu(j,:)); 
       sigma(j) = {term'*term / sum(posterior_probability(:,j))};
    end
    
    % calculate the log-likelihood function
    likelihood = 0;
    for j = 1:K
       likelihood = likelihood + tao(j) * ...
           sum(mvnpdf(X,mu(j,:),cell2mat(sigma(j)))); 
    end
    Q(iteration) = log(likelihood);   
    
    % Condition of the termination 
    if iteration > 50 || Q(iteration) - Q(iteration-1) < epsilon
        termination = true;         
    end
    fprintf('step: %d  delta: %f  Log-likelihood: %f\n',...
        iteration,Q(iteration)-Q(iteration-1),Q(iteration));
end
% Ouput the parameter, Theta
Theta.Tao = tao;
for j = 1:K
Theta.Mu(j) = {mu(j,:)};
Theta.Sigma(j) = {sigma(j)};
end
end





















