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

%% 
K = 2;
epsilon = 1e-3; % 先用1e-2测试，牺牲精度换取速度，随后用1e-5保证精度
% 需要通过kmenas的方法确定Theta的初始值。
ThetaInit.Tao = [0.7952;0.2048];
ThetaInit.Mu(1) = {[0.9822;0.9917;0.9920]};
ThetaInit.Mu(2) = {[0.1187;0.4582;0.6209]};
ThetaInit.Sigma(1) = {[0.00291864830136754,0.00110085113292398,0.000621650700252833;0.00110085113292398,0.000588324525010634,0.000383446318771079;0.000621650700252833,0.000383446318771079,0.000338358607016605]};
ThetaInit.Sigma(2) = {[0.0134280068677897,0.00657102627105072,0.00258089540851694;0.00657102627105072,0.0161002713301740,0.0170049990158547;0.00258089540851694,0.0170049990158547,0.0208782366505169]};

% [fig_new_5,Theta] = Expectation_Maximization_GMM(K,epsilon,ThetaInit,fig5);
[fig_new_1,Theta] = Expectation_Maximization_GMM(K,epsilon,ThetaInit,fig1);
%[fig_new_2,Theta] = Expectation_Maximization_GMM(K,epsilon,ThetaInit,fig2);
%[fig_new_3,Theta] = Expectation_Maximization_GMM(K,epsilon,ThetaInit,fig3);
%[fig_new_4,Theta] = Expectation_Maximization_GMM(K,epsilon,ThetaInit,fig4);




