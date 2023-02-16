function im=getUseful(img,SZ) 
% 功能：获取图像有用区域 
% 输入：img：拼接图像 SZ：预定图像尺寸 
% 输出：有用区域图像 
if length(size(img))==2 
    img=cat(3,img,img,img); 
end
k=1; 
while k<SZ 
    if any(any(img(k,:,:)))
        break 
    end
    k=k+1; 
end
ceil=k; 
%上边界 
k=SZ;
while k>0 
    if any(any(img(k,:,:))) 
        break 
    end
    k=k-1; 
end
bottom=k; 
%下边界
k=1; 
while k<SZ
    if any(any(img(:,k,:)))
        break
    end
    k=k+1; 
end
left=k; 
%左边界
k=SZ; 
while k>0 
    if any(any(img(:,k,:)))
        break
    end
    k=k-1; 
end
right=k;
%右边界
%%获取图像 
im=img(ceil:bottom,left:right,:);
        