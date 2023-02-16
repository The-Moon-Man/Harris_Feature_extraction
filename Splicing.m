function image=Splicing(img1,Second_match1,img2,Second_match2)
%   功能：获取拼接之后的图片
%   输入：pic1、pic2：待拼接图片\newLoc1、newLoc2：变换控制点矩阵
%   输出：im：拼接后的图片
if length(size(img1))==2 
    img1=cat(3,img1,img1,img1); 
end
if length(size(img2))==2 
    img2=cat(3,img2,img2,img2); 
end
SZ=2000; 
X1=Second_match1(:,2);
Y1=Second_match1(:,1); 
X2=Second_match2(:,2); 
Y2=Second_match2(:,1); 
sel=randperm(length(Second_match1),3);
x=X2(sel)'; 
y=Y2(sel)'; 
X=X1(sel)'; 
Y=Y1(sel)'; 
U=[x;y;ones(1,3)];
V=[X;Y;ones(1,3)];
T=V/U;
cntrX=SZ/2; 
cntrY=SZ/2; 
image=zeros(SZ,SZ,3); 
for i=1:size(img2,1) 
    for j=1:size(img2,2) 
        tmp=T*[j;i;1]; 
        nx=round(tmp(1))+cntrX;
        ny=round(tmp(2))+cntrY; 
        if nx>=1 && nx<=SZ && ny>=1 && ny<=SZ
            image(ny,nx,:)=img2(i,j,:); 
        end
    end
end
image=imresize(image,1,'bicubic'); 
tpic1=zeros(SZ,SZ,3);
tpic1(1+cntrY:size(img1,1)+cntrY,1+cntrX:size(img1,2)+cntrX,:)=img1;
re=rgb2gray(uint8(image))-rgb2gray(uint8(tpic1));
for k=1:3 
    ta=image(:,:,k);
    tb=tpic1(:,:,k); 
    ta(re==0)=tb(re==0); 
    image(:,:,k)=ta; 
end
clear ta tb re tpic1 
image=getUseful(image,SZ);
image=uint8(image);
