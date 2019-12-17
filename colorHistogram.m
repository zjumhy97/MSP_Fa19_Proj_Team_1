%**************************************************************************
%  colorHistogram.m
%  Modern Signal Processing (2019 Fall)
%  Project: Eye image Segmentation (color image)
%  Director: Prof. Xiaoying Tang
%  Date: 2019/12/117
%  Author: Team 1
%  Github: https://github.com/zjumhy97/MSP_Fa19_Proj_Team_1
%**************************************************************************
%% Import Image Data
%fig = imread('./pic/Input_sample.jpg');
fig = imread('./pic/test1.jpg');
fig_gray = rgb2gray(fig);
% fig = imread('./pic/test.jpg');
m = size(fig,1);
n = size(fig,2);
N = m * n;
R = fig(:,:,1);
G = fig(:,:,2);
B = fig(:,:,3);
for i = 1:256
   prob_R(i) = sum(sum(R(:,:)==i-1)) / N; 
   prob_G(i) = sum(sum(G(:,:)==i-1)) / N;
   prob_B(i) = sum(sum(B(:,:)==i-1)) / N;
   prob_gray(i) = sum(sum(fig_gray(:,:)==i-1)) / N;
end
% image segmentation using the simple threshold method 
fig_new = [];
threshold = 120;
fig_new(find(fig_gray>threshold))=0;
fig_new(find(fig_gray<=threshold))=255;
fig_new = reshape(fig_new,m,n);

%% Plot 
x = [0:255];
figure()
sgtitle('Input Image and the Histogram');
subplot(2,2,1) % plot the original Image
imshow(fig)
title('Input Image')
subplot(2,2,2) % plot Image segmented with threshold
imshow(fig_new)
title(strcat('Segmented Image with Threshold = ',num2str(threshold)));
subplot(2,2,3) % Plot color histogram
plot(x,prob_R,'r');hold on
plot(x,prob_G,'g');hold on
plot(x,prob_B,'b');hold on
legend('R','G','B');
xlim([0,255]);
ylim([0,0.06]);
title('Color Histogram of the Input Image')
subplot(2,2,4) % Plot gray histogram
plot(x,prob_gray,'k');hold on
plot(threshold * ones(2,1),[0,0.035],'r');hold on
legend('Gray','Segmented Threshold');
xlim([0,255]);
ylim([0,0.035]);
title('Gray Histogram of the Input Image')




