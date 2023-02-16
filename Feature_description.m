function  feature=Feature_description(img,points)
len=length(points); 
feature=zeros(8,len); 
for k=1:len 
    p=points(k,:); 
    pc=img(p(1),p(2)); 
    feature(1,k)=img(p(1)-1,p(2)-1)-pc;
    feature(2,k)=img(p(1),p(2)-1)-pc; 
    feature(3,k)=img(p(1)+1,p(2)-1)-pc; 
    feature(4,k)=img(p(1)+1,p(2))-pc; 
    feature(5,k)=img(p(1)+1,p(2)+1)-pc; 
    feature(6,k)=img(p(1),p(2)+1)-pc; 
    feature(7,k)=img(p(1)-1,p(2)+1)-pc; 
    feature(8,k)=img(p(1)-1,p(2))-pc;
    feature(:,k)=feature(:,k)/sum(feature(:,k)); 
end