%%%face recognition
%%Database AT&T face images:400 images of size 119 x 92 pixels. 
clc;clear;
load('image_database.mat');
%%%%%%
im=image(15,:);
im=reshape(im,112,92);
imshow(im);
%%%%%%%%%%%%%%%%%%%%%
im=image(1,:);im=reshape(im,112,92);
subplot(2,2,1), subimage(im)
im=image(11,:);im=reshape(im,112,92);
subplot(2,2,2), subimage(im)
im=image(21,:);im=reshape(im,112,92);
subplot(2,2,3), subimage(im)
im=image(31,:);im=reshape(im,112,92);
subplot(2,2,4), subimage(im)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%Average faces%%%%%%%%%%%
image=double(image);
Ave=zeros(40,10304);
for i=1:40
    for j=1:10
        Ave(i,:)=Ave(i,:)+image((i-1)*10+j,:);
    end
end
Ave=Ave/10;
im=Ave(1,:);im=reshape(im,112,92);
imshow(im,[0 255])
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
im=Ave(1,:);im=reshape(im,112,92);
subplot(2,2,1), subimage(im,[0 255])
im=Ave(2,:);im=reshape(im,112,92);
subplot(2,2,2), subimage(im,[0 255])
im=Ave(3,:);im=reshape(im,112,92);
subplot(2,2,3), subimage(im,[0 255])
im=Ave(4,:);im=reshape(im,112,92);
subplot(2,2,4), subimage(im,[0 255])
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%Randomly split the data into training and testing
%%%Take 80% for training and 20% for testing
index=crossvalind('Kfold',400,5);
train_index=find(index ~=5);test_index=find(index==5);
A=image(train_index,:);A_test=image(test_index,:);
%%%%%%%%Normalize the data%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
m=mean(A,1);
A=A -ones(size(A,1),1)*m;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
C=A'*A;D=A*A';
[V,E]=eig(D);V=A'*V;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
no_col=size(V,2);
V=V(:,no_col-50:no_col);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%Display eigen faces
im=V(:,10);im=im';
im=im+m;im=reshape(im,112,92);subplot(2,2,1), subimage(im,[0 255])
im=V(:,20);im=im';
im=im+m;im=reshape(im,112,92);im=reshape(im,112,92);subplot(2,2,2), subimage(im,[0 255])
im=V(:,30);im=im';
im=im+m;im=reshape(im,112,92);im=reshape(im,112,92);subplot(2,2,3), subimage(im,[0 255])
im=V(:,40);im=im';
im=im+m;im=reshape(im,112,92);im=reshape(im,112,92);subplot(2,2,4), subimage(im,[0 255])
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%Represent training data as linear combination of eigen faces
im=A(1,:);
im_represent=im*V;
im_reconstruct=im_represent*V';
im=im+m;im=reshape(im,112,92);subplot(1,2,1), subimage(im,[0 255])
im_reconstruct=im_reconstruct+m;im_reconstruct=reshape(im,112,92);
subplot(1,2,2), subimage(im_reconstruct,[0 255])
%%%%%%%%%%%%%%%%%%%%%%%%
A_rep=A*V;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%Project average person face on to the eigenface space. 
proj1=(Ave(1,:)-m)*V;subplot(2,2,1),bar(proj1)
proj2=(Ave(2,:)-m)*V;subplot(2,2,2),bar(proj2)
proj3=(Ave(3,:)-m)*V;subplot(2,2,3),bar(proj3)
proj4=(Ave(4,:)-m)*V;subplot(2,2,4),bar(proj4)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%Take a new image%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%Normalize new image
im=A_test(67,:);
subplot(121); 
imshow(reshape(im,112,92),[0 255]);title('Looking for ...','FontWeight','bold','Fontsize',16,'color','red');
im=im-m;
subplot(122);
s=im*V;
score=[];
for i=1:size(A_rep,1)
    score=[score,norm(A_rep(i,:)-s,2)];
    if(rem(i,20)==0),imshow(reshape(A(i,:)+m,112,92),[0 255]),end;
    drawnow;
end

[a,i]=min(score);
subplot(122);
imshow(reshape(A(i,:)+m,112,92),[0 255]);title('Found!','FontWeight','bold','Fontsize',16,'color','red');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%Image of roger federer
im=imread('rg_gray.jpg');im=double(im);im=reshape(im,1,112*92);
subplot(121); 
imshow(reshape(im,112,92),[0 255]);title('Looking for ...','FontWeight','bold','Fontsize',16,'color','red');
im=im-m;
subplot(122);
s=im*V;
score=[];
for i=1:size(A_rep,1)
    score=[score,norm(A_rep(i,:)-s,2)];
    if(rem(i,20)==0),imshow(reshape(A(i,:)+m,112,92),[0 255]),end;
    drawnow;
end

[a,i]=min(score);
subplot(122);
imshow(reshape(A(i,:)+m,112,92),[0 255]);title('Found!','FontWeight','bold','Fontsize',16,'color','red');
