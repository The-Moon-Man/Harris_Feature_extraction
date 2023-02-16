function HarrisDraw(img1,points1,img2,points2,mode) 
if mode == 0
    X1=points1(:,2);
    Y1=points1(:,1);
    X2=points2(:,2);
    Y2=points2(:,1); 
    dif=size(img1,2); 
    imshowpair(img1,img2,'montage'); 
    hold  on
    for k=1:length(X1) 
        plot(X1(k),Y1(k),'b*');
        plot((X2(k)+dif),Y2(k),'b*'); 
        line([X1(k),X2(k)+dif],[Y1(k),Y2(k)],'Color','r'); 
    end
    set(gcf,'Color','w');
else
    X1=points1(:,2);
    Y1=points1(:,1);
    X2=points2(:,2);
    Y2=points2(:,1); 
    dif=size(img1,2); 
    imshowpair(img1,img2,'montage'); 
    hold  on
    plot(X1,Y1,'b*');
    plot(X2+dif,Y2,'b*');
    set(gcf,'Color','w');
end