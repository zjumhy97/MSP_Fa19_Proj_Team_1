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
% Theta_Init - include the initial value of Tao, Mu, Sigma; e.g. Theta.Tao
% fig - the input figure

[m,n,d] = size(fig); % for the color image,d is 3.
N = m * n;
X = reshape(fig,N,d);

% Initialization of the parameter Theta = [tao, mu, sigma]
% calculate the probability density of ThetaInit
tao = ThetaInit.Tao; % K by 1
for j = 1:K
    mu(j,:) = cell2mat(ThetaInit.Mu(j)); % 1 by 3
    sigma(j) = ThetaInit.Sigma(j); % 3 by 3,注意sigma是cell
    % mu(j) is 1 by 3 vector, prob_density_Theta is N by K matrix.
    prob_density_Theta(:,j) = mvnpdf(X,mu(j,:),cell2mat(sigma(j)));
end

% gamma - membership probabilities
gamma = [];
for j = 1:K
    gamma(:,j) = tao(j) * prob_density_Theta(:,j)./(prob_density_Theta * tao); 
end

t = 1;
Q(t) = 0;
for j = 1:K
    Q(t) = Q(t) + gamma(:,j)' * log(tao(j) * mvnpdf(X,mu(j,:),cell2mat(sigma(j))));
end


termination = false;
while ~termination
    t = t + 1;    
% E step
%     sum_gamma_1 = sum(gamma(:,1));
    for j = 1:K
        gamma(:,j) =  tao(j) * prob_density_Theta(:,j) ./ (prob_density_Theta * tao); 
    end

% M step
    tao = 1/N * sum(gamma)'; % sum(gamma): 1 by 2
    mu = (X'*gamma./sum(gamma))';
    for j = 1:K
       term = sqrt(gamma(:,j)).*(X - mu(j,:)); % N*1 .* N*3 get N*3
       sigma(j) = {term'*term / sum(gamma(:,j))};
    end
    
    % 实际上Q(t) 一直是NaN 没起作用
    Q(t) = 0;
    for j = 1:K
        p=log(tao(j) * mvnpdf(X,mu(j,:),cell2mat(sigma(j))));

        % Q(t) = Q(t) + gamma(1:2470000,j)' *p(1:2470000);
        Q(t) = Q(t) + gamma(:,j)' * p;
    end

        
    
    % Condition of the termination
    if t > 50 || Q(t)-Q(t-1) < epsilon  
        termination = true;         
    end
    fprintf('step: %d  delta: %f  Q(t): %s\n',t,Q(t)-Q(t-1),Q(t));
end

% 这部分关于图像的代码之后移出去这个程序吧，现在先用这个测试
X_new = ones(N,1);
X_new(find(gamma(:,1)<gamma(:,2))) = 0;
fig_new = reshape(X_new,m,n);

% Ouput the parameter, Theta
Theta.Tao = tao;
for j = 1:K
Theta.Mu(j) = {mu(j)};
Theta.Sigma(j) = {sigma(j)};
end

end





















