im=imread('555.jpg');         subplot(1,2,1); imshow(im); title('Orginal');              
img=rgb2gray(im); 
bw=imbinarize(img,graythresh(img)*.98);   
bw=imcomplement(bw);
s1=strel('disk',5);
bw=imerode(bw,s1);                        
bw=bwareaopen(bw,200);                    
bw=imfill(bw,'holes');                    
s2=strel('disk',3);
bw=imclose(bw,s2);                       
[x,n]=bwlabel(bw);
s=regionprops(bw,'Area');                 

m=zeros(1,n);
for i=1:n
    tmp=s(i);
    m(1,i)=tmp.Area;
end
m=sort(m);
min=m(1);
count=0;
for i=1:size(m,2)
   
    if  (m(i)-min) <=1000
       count=count+1;
    end
end

 subplot(1,2,2); imshow(bw); title(strcat('Strawberry number= ', num2str(count)));