%**************************************************************************
%  main.m
%  Modern Signal Processing (2019 Fall)
%  Project: Eye image Segmentation (color image)
%  Director: Prof. Xiaoying Tang
%  Date: 2019/12/10
%  Author: Team 1
%  Github: https://github.com/zjumhy97/MSP_Fa19_Proj_Team_1
%**************************************************************************

%% Input Figure
% the original jpg is in RGB, HSV information may need.
clear
clc
fig1 = imread('./pic/Input_sample.jpg');fig1 = im2double(fig1);
fig2 = imread('./pic/075.jpg');fig2 = im2double(fig2);
fig3 = imread('./pic/077.jpg');fig3 = im2double(fig3);
fig4 = imread('./pic/079.jpg');fig4 = im2double(fig4);
fig5 = imread('./pic/test.jpg');fig5 = im2double(fig5);
fig1_output = imread('./pic/Output_sample.jpg');

fig1_hsv = rgb2hsv(fig1);
fig2_hsv = rgb2hsv(fig2);
fig3_hsv = rgb2hsv(fig3);
fig4_hsv = rgb2hsv(fig4);

%% Experiment
K = 2;
epsilon = 1e-7; 

% try some different initial values of Theta
% ThetaInit.Tao = [0.7952;0.2048];
% ThetaInit.Mu(1) = {[0.0479 0.1157 0.1989]};
% ThetaInit.Mu(2) = {[0.4068 0.7476 0.4329]};
% ThetaInit.Sigma(1) = {[0.0019 0.0044 0.0037;0.0044 0.0116 0.0087;0.0037 0.0087 0.0271]};
% ThetaInit.Sigma(2) = {[0.0176 0.0185 0.0032;0.0185 0.0238 0.0016;0.0032 0.0016 0.0325]};

[ThetaInit1] = getTheta_kmeans(K,fig1);
[fig_new_1,Theta] = ImageSegmentation_GMM(K,epsilon,ThetaInit1,fig1);

%[fig_new_2,Theta] = Expectation_Maximization_GMM(K,epsilon,ThetaInit,fig2);
%[fig_new_3,Theta] = Expectation_Maximization_GMM(K,epsilon,ThetaInit,fig3);
%[fig_new_4,Theta] = Expectation_Maximization_GMM(K,epsilon,ThetaInit,fig4);
%[fig_new_5,Theta] = Expectation_Maximization_GMM(K,epsilon,ThetaInit,fig5);




