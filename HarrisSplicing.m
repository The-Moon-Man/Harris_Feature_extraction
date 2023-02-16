%% 数据准备
clc 
clear
close all
img1=imread('t003s01.jpg'); 
img2=imread('t003s02.jpg'); 
if length(size(img1))==3 
    img1=rgb2gray(img1); 
end
if length(size(img2))==3
    img2=rgb2gray(img2); 
end
%% 获取角点
Point1 = Cornerpoint(img1,0.06);
Point2 = Cornerpoint(img2,0.06);
figure(1) 
HarrisDraw(img1,Point1,img2,Point2,1);
%% 对Harris角点的特征进行描述并进行第一次匹配
feature1 = Feature_description(img1,Point1);
feature2 = Feature_description(img2,Point2);
% 第一次匹配
first_match = Harris_Fmatch(feature1,feature2);
% 取出对应匹配点
match_points1=Point1(first_match(:,1),:);
match_points2=Point2(first_match(:,2),:); 
% 第一次匹配点连线
figure(2)
HarrisDraw(img1,match_points1,img2,match_points2,0);
title('Harris第一次匹配连线');
%% 进行精匹配
%对原有匹配点进行筛选
[Second_match1,Second_match2]=Harris_Smatch(match_points1,match_points2); 
% 第二次匹配点连线
figure(3)
HarrisDraw(img1,Second_match1,img2,Second_match2,0); 
title('Harris第二次匹配点连线');
%% 图像拼接 
image=Splicing(img1,Second_match1,img2,Second_match2); 
figure(4)
imshow(image); 
title('拼接后的图像');
set(gcf,'Color','w');

