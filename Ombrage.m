function [ texture ] = Ombrage( terrain,inter,rampfile,normales,points,lumiere, filename)
%UNTITLED8 Summary of this function goes here
%   Detailed explanation goes here
n = size(terrain);

epsNoir =1.25;
epsGris = 1.8;

INTENSITE = 1;

minT=min(min(terrain));
maxT=max(max(terrain));

imdata = imread(rampfile);
nbCouleurs=size(imdata);%la deuxieme composante contient le nombre de couleurs disponibles 

pas = (nbCouleurs(2)-1)/(maxT-minT);

texture = ones(n(1),n(2),3);
texture = uint8(texture);

for i=1:n(1),
    for j =1:n(2),    
        indexCouleur = floor((terrain(i,j)-minT+1)*pas);   
        texture(i,j,1)= imdata(1,indexCouleur,1);
        texture(i,j,2)= imdata(1,indexCouleur,2);
        texture(i,j,3)= imdata(1,indexCouleur,3);
    end
end

% Calcul l'ombre
for i = 1 : n(1),
   for j = 1: n(2),
       rayon = lumiere - points(i,j);
       normale = -squeeze(normales (i,j, :));
       lum=dot(rayon/abs(norm(rayon)), normale) * INTENSITE;%cos
       
       % Si la source lumineuse est visible
       if lum > 0
           texture(i,j, :) = texture(i, j, :) * lum;
       else
           texture(i,j, :) = [0 0 0];
       end
   end
end

% Dessine les lignes (CourbeNiveau)
% for i=1:n(1),
%    for j =1:n(2),
%        if( (abs(mod(terrain(i,j),inter)) < epsNoir  ) || (abs (mod(terrain(i,j),inter) - inter) < epsNoir ) ) 
%            texture(i,j,1) = 0;
%            texture(i,j,2) = 0;
%            texture(i,j,3) = 0;
%        elseif((abs(mod(terrain(i,j),inter)) < epsGris  ) || (abs (mod(terrain(i,j),inter) - inter) < epsGris ) ) 
%            texture(i,j,1) = 90;
%            texture(i,j,2) = 90;
%            texture(i,j,3) = 100;
%        end;
%    end
% end

texture = uint8(texture);
    
imwrite(texture,filename);

end