function [ texture ] = CourbeNiveau( terrain, pas , filename )
%Genere une courbe d eniveau a partir des altitudes
%   Detailed explanation goes here
n = size(terrain);
epsNoir =1.25;
epsGris = 2;
texture = ones(n(1),n(2),3);
texture = uint8(texture);
texture = texture * 240;
    for i=1:n(1),
        for j =1:n(2),
            if( (abs(mod(terrain(i,j),pas)) < epsNoir  ) || (abs (mod(terrain(i,j),pas) - pas) < epsNoir ) ) 
                texture(i,j,1) = 0;
                texture(i,j,2) = 0;
                texture(i,j,3) = 0;
            elseif((abs(mod(terrain(i,j),pas)) < epsGris  ) || (abs (mod(terrain(i,j),pas) - pas) < epsGris ) ) 
                texture(i,j,1) = 130;
                texture(i,j,2) = 130;
                texture(i,j,3) = 130;
            end;
        end
    end
    
    texture = uint8(texture);
    
    if exist('filename','var')
        imwrite(texture,filename);
    end

end