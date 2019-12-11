%% main.m
%  Modern Signal Processing (2019 Fall)
%  Project: Eye image Segmentation (color image)
%  Director: Prof. Xiaoying Tang
%  Date: 2019/12/10
%  Author: Team 1
%  Github: https://github.com/zjumhy97/MSP_Fa19_Proj_Team_1

%% Input Figure
% the original jpg is in RGB, HSV information may need.
clear
clc
fig1 = imread('./pic/Input_sample.jpg');
fig2 = imread('./pic/075.jpg');
fig3 = imread('./pic/077.jpg');
fig4 = imread('./pic/079.jpg');
fig1_output = imread('./pic/Output_sample.jpg');

fig1_hsv = rgb2hsv(fig1);
fig2_hsv = rgb2hsv(fig2);
fig3_hsv = rgb2hsv(fig3);
fig4_hsv = rgb2hsv(fig4);

%% 