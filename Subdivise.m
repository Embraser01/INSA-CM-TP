function [ nouvelle ] = Subdivise( terrain, alpha )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
n=size(terrain);
nouvelle = zeros (n(1)*2-1,n(2)*2-1);
%Mise matrice initiale
for i=1:n(1),
    for j=1:n(2),
        nouvelle(i*2-1,j*2-1)=terrain (i,j);
    end
end
%diamond
for i = 2:2:(n(1)*2-2),
    for j = 2:2:(n(2)*2-2),
        nouvelle(i,j)= (nouvelle (i-1,j-1)...
                     + nouvelle (i+1,j-1)...
                     + nouvelle (i-1,j+1)...
                     + nouvelle (i+1,j+1))/4  + rand()*(2*alpha)-alpha;
    end
end
%square centre
for i = 2:2:(n(1)*2-2),
    for j = 3:2:(n(2)*2-3),
        nouvelle(i,j)= (nouvelle (i-1,j)...
                     + nouvelle (i+1,j)...
                     + nouvelle (i,j+1)...
                     + nouvelle (i,j-1))/4  + rand()*(2*alpha)-alpha;
    end
end
for i = 3:2:(n(1)*2-3),
    for j = 2:2:(n(2)*2-2),
        nouvelle(i,j)= (nouvelle (i-1,j)...
                     + nouvelle (i+1,j)...
                     + nouvelle (i,j+1)...
                     + nouvelle (i,j-1))/4  + rand()*(2*alpha)-alpha;
    end
end


%square vertical

for i = 2:2:(n(1)*2-2),
    nouvelle(i,1)= (nouvelle (i-1,1)...
                 + nouvelle (i+1,1))...
                 /2  + rand()*(2*alpha)-alpha;

     nouvelle(i,(n(2)*2-1))= (nouvelle (i-1,n(2)*2-1)...
                             + nouvelle (i+1,n(2)*2-1))...
                             /2  + rand()*(2*alpha)-alpha;
end
%square horizontals
for i = 2:2:(n(2)*2-2),
    nouvelle(1,i)= (nouvelle (1,i+1)...
                 + nouvelle (1,i-1))...
                 /2  + rand()*(2*alpha)-alpha;

     nouvelle((n(1)*2-1),i)= (nouvelle (n(1)*2-1,i+1)...
                             + nouvelle (n(1)*2-1,i-1))...
                             /2 + rand()*(2*alpha)-alpha;
end
end

