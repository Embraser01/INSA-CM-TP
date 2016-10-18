function [ points3D ] = ConstruitPoints3D( terrain,xmin,xmax,ymin,ymax )
%UNTITLED7 Summary of this function goes here
%   Detailed explanation goes here
n= size(terrain);
points3D=zeros(n(1),n(2),3);
deltaX = (xmax-xmin)/n(1);
deltaY = (ymax-ymin)/n(2);
for i = 1 : n(1),
    for j = 1:n(2),
        points3D(i,j,1)=xmin+i*deltaX;
        points3D(i,j,2)=ymin+j*deltaY;
        points3D(i,j,3)=terrain(i,j);
    end
end

end