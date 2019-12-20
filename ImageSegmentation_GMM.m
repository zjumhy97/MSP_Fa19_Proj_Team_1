%**************************************************************************
%  ImageSegmentation_GMM.m
%  Modern Signal Processing (2019 Fall)
%  Project: Eye image Segmentation (color image)
%  Director: Prof. Xiaoying Tang
%  Date: 2019/12/15
%  Author: Team 1
%  Github: https://github.com/zjumhy97/MSP_Fa19_Proj_Team_1
%**************************************************************************

%% function body
function [fig_segmented,Theta] = ImageSegmentation_GMM(K,epsilon,ThetaInit,fig)
% m,n - the line number and column number of the input figure

% read the image
[m,n,d] = size(fig);
N = m * n;
X = reshape(fig,N,d);

% image segmentation based GMM
[posterior_probability,Theta] = EM_GMM(K,epsilon,ThetaInit,X);

X_new = ones(N,3);
[M,I] = max(posterior_probability'); % example: I = [2,2,3,3,2,1,1]
for j = 1:K
    X_new(find(I==j),:) = ones(length(find(I==j)),3).*cell2mat(Theta.Mu(j));    
end

fig_segmented = reshape(X_new,m,n,3);
image(fig_segmented);
end










