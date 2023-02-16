function [Second_match1,Second_match2]=Harris_Smatch(points1,points2) 
% 功能：筛选匹配特征点对，获取高精度的控制点 
% 输入： 粗匹配特征点位置 
% 输出： 精匹配控制点位置 
slope=(points2(:,1)-points1(:,1)+1)./(points2(:,2)-points1(:,2)+1); 
% 加上1防止出现分母为零的情况
for k=1:3 
    slope=slope-mean(slope); 
    len=length(slope); 
    t=sort(abs(slope)); 
    thresh=t(round(0.5*len)); 
    ind=abs(slope)<=thresh; 
    slope=slope(ind); 
    points1=points1(ind,:); 
    points2=points2(ind,:); 
end
Second_match1=points1; 
Second_match2=points2;