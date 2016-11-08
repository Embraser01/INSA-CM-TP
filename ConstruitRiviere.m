function [ texture ] = ConstruitRiviere( terrain, n, texture, iter )
%UNTITLED8 Summary of this function goes here
%   Detailed explanation goes here

SourceX = int16(rand ()*n(1));
SourceY = int16(rand()*n(2));
k=0;
%on determine la source
for i=-k:k,
    for j=-k:k,
        if (SourceX+i>0&&SourceY+j>0&&SourceX+i<n(1)&&SourceY+j<n(2))
            texture(SourceX+i,SourceY+j,1) = 64;
            texture(SourceX+i,SourceY+j,2) = 164;
            texture(SourceX+i,SourceY+j,3) = 223;
        end
    end
end
SourceX1=SourceX;
SourceY1=SourceY;

%on fait descendre la rivière
while SourceX>1&&SourceY>1&&SourceX<n(1)-1&&SourceY<n(2)-1,
    %on determine le pts le plus bas
    z=terrain(SourceX,SourceY);
    desc=0;
    if (terrain (SourceX+1,SourceY-1)< z),
         z=terrain (SourceX-1,SourceY-1);
         SourceX1=SourceX-1;
         SourceY1=SourceY-1;
         desc=1;
    end
    if (terrain (SourceX+1,SourceY-1)< z),
        z=terrain (SourceX+1,SourceY-1);
        SourceX1=SourceX+1;
        SourceY1=SourceY-1;
        desc=1;
    end
    if (terrain (SourceX-1,SourceY+1)< z),
        z=terrain (SourceX-1,SourceY+1);
        SourceX1=SourceX-1;
        SourceY1=SourceY+1;
        desc=1;
    end
    if (terrain (SourceX+1,SourceY+1)< z),
        z=terrain (SourceX+1,SourceY+1);
        SourceX1=SourceX+1;
        SourceY1=SourceY+1;
        desc=1;
    end
    if (desc==0),
        terrain(SourceX,SourceY)=terrain(SourceX,SourceY)+1;
    else
    k=k*1.00000001*iter;
    end
        
     SourceX=SourceX1;
     SourceY=SourceY1;
    
    for i=-k:k,
        for j=-k:k,
             if (SourceX+i>0&&SourceY+j>0&&SourceX+i<n(1)&&SourceY+j<n(2))
                  texture(SourceX+i,SourceY+j,3) = 250;
             end
        end
    end
    
end

texture = uint8(texture);   