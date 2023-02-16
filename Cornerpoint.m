function point=Cornerpoint(img,alpha) 
img=double(img);
hx=[-1 0 1]; Ix=filter2(hx,img); 
hy=[-1;0;1]; Iy=filter2(hy,img); 
Ix2=Ix.*Ix; Iy2=Iy.*Iy; Ixy=Ix.*Iy;
h=fspecial('gaussian',[7 7],2); 
Ix2=filter2(h,Ix2); Iy2=filter2(h,Iy2); 
Ixy=filter2(h,Ixy);

[heigth,width]=size(img);
R=zeros(heigth,width);
for i=1:heigth
    for j=1:width 
        M=[Ix2(i,j) Ixy(i,j);Ixy(i,j) Iy2(i,j)]; 
        R(i,j)=det(M)-alpha*(trace(M)^2); 
    end
end
Rmax=max(max(R));
pMap=zeros(heigth,width); 
for i=2:heigth-1 
    for j=2:width-1 
        if R(i,j)>0.01*Rmax 
            tm=R(i-1:i+1,j-1:j+1); 
            tm(2,2)=0; 
            if R(i,j)>tm 
               pMap(i,j)=1;
            end
        end
    end
end
[row,col]=find(pMap==1); 
point=[row,col];
