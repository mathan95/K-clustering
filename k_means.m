clear ; close all; clc
fprintf('\nRunning K-Means clustering on pixels from an image.\n\n');
A = double(imread('7.jpg'));
A = A / 255;
img_size = size(A);
mat12=zeros(img_size(1) * img_size(2),2);
for i=1:img_size(1)
    for j=1:img_size(2)
        mat12((i-1)*img_size(1)+j,1)=0.5*i/(img_size(1));
        mat12((i-1)*img_size(1)+j,2)=0.5*j/(img_size(2));
    end
end
mat12(img_size(1)*2+1:img_size(1)*2+4,:)
X = reshape(A, img_size(1) * img_size(2), 3);
X=[X mat12];
K = 4; 
max_iters = 15;

randidx = randperm(size(X, 1));
initial_centroids = X(randidx(1:K), :);
[m n] = size(X);
centroids = initial_centroids;
previous_centroids = centroids;
idx = zeros(m, 1);



for i=1:max_iters
    
    fprintf('K-Means iteration %d/%d...\n', i, max_iters);
    
    idx = zeros(size(X,1), 1);
    
    for p=1:size(X,1)
        mat=X(p,:);
        errlist=zeros(K,1);
        for j=1:K
            mat2=centroids(j,:);
            mat3=mat-mat2;
            err=sum(mat3.*mat3);
            errlist(j,1)=err;
        end
        [mini val]=min(errlist);
        idx(p,1)=val;
     end
    
    
    
    % Given the memberships, compute new centroids
    for i=1:K
        mat1=(idx==i);
        mat2=mat1;
        for j=1:n-1
            mat2=[mat2 mat1];
        end
        mat3=X.*mat2;
        mag=sum(mat1);
        centroids(i,:)=(1/mag)*sum(mat3);
    end
end

for i=1:size(centroids,1)
    im5=zeros(img_size(1)* img_size(2), 3);
    i5=(idx==i).*idx;
    for j=1:size(i5)
        if i5(j)==0
            im5(j,1:3)=zeros(1,3);
        else 
            im5(j,1:3)=X(j,1:3);
        end
    end
    im5 = reshape(im5, img_size(1), img_size(2), 3);
    
    subplot(size(centroids,1),1,i)
    imshow(im5)
end