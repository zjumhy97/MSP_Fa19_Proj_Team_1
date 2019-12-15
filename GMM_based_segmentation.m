%**************************************************************************
%  GMM_based_segmentation.m
%  Modern Signal Processing (2019 Fall)
%  Project: Eye image Segmentation (color image)
%  Director: Prof. Xiaoying Tang
%  Date: 2019/12/15
%  Author: Team 1
%  Github: https://github.com/zjumhy97/MSP_Fa19_Proj_Team_1
%**************************************************************************

%% function body
function [] = GMM_based_segmentation(K,epsilon,ThetaInit,fig)
% 感觉这里可以只输入图像的三维信息，可以在这里将图像的三维信息转化为一个序列
% m,n - the line number and column number of the input figure
m = size(fig,1);
n = size(fig,2);
i = 1;
for p = 1:m
    for q = 1:n
        X(i,:) = squeeze(fig(p,q,:));
        i = i+1;
    end
end


% if needed, Theta, Q, T could be output to test.
[Theta,Q,T] = Expectation_Maximization_GMM(K,epsilon,ThetaInit,X);
% Implement segmentation according to the EM-algorithm result.
% create a new N-length vector, each element belongs to {0,1}
X_new = [];
for i = 1:N
    if 
        X_new(i) = 1;
    else
        X_new(i) = 0; 
    end
end
% transform the N-length {0,1}sequence to matrix(figure)


end




