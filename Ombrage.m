function [ texture ] = Ombrage( terrain,inter,rampfile,normales,points,lumiere, filename)
%UNTITLED8 Summary of this function goes here
%   Detailed explanation goes here
n = size(terrain);

epsNoir =1.25;
epsGris = 2;

INTENSITE = 50;

minT=min(min(terrain));
maxT=max(max(terrain));

imdata = imread(rampfile);
nbCouleurs=size(imdata);%la deuxieme composante contient le nombre de couleurs disponibles 

pas = (nbCouleurs(2)-1)/(maxT-minT);

texture = ones(n(1),n(2),3);
texture = uint8(texture);
texture = texture * 240;

for i=1:n(1),
    for j =1:n(2),    
        indexCouleur = (terrain(i,j)-minT+1)*pas;
        if(floor(indexCouleur) > 490 || floor(indexCouleur) < 1)
            tmp = terrain(i, j);
            disp(tmp);
        end
        
        indexCouleur = floor(indexCouleur);
        texture(i,j,1)= imdata(1,indexCouleur,1);
        texture(i,j,2)= imdata(1,indexCouleur,2);
        texture(i,j,3)= imdata(1,indexCouleur,3);
    end
end

% Dessine les lignes (CourbeNiveau)
for i=1:n(1),
    for j =1:n(2),
        if( (abs(mod(terrain(i,j),inter)) < epsNoir  ) || (abs (mod(terrain(i,j),inter) - inter) < epsNoir ) ) 
            texture(i,j,1) = 0;
            texture(i,j,2) = 0;
            texture(i,j,3) = 0;
        elseif((abs(mod(terrain(i,j),inter)) < epsGris  ) || (abs (mod(terrain(i,j),inter) - inter) < epsGris ) ) 
            texture(i,j,1) = 130;
            texture(i,j,2) = 130;
            texture(i,j,3) = 130;
        end;
    end
end
    
for i = 1 : n(1),
   for j = 1: n(2),
       rayon = points(i,j)-lumiere;
       normale = squeeze(normales (i,j, :));
       lum=(dot(rayon, normale))/abs(norm(rayon)) * INTENSITE;%cos
       
       texture(i,j, :) = texture(i, j, :) - lum;
   end
end

texture = uint8(texture);
    
imwrite(texture,filename);

end