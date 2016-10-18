function [ texture ] = CourbeNiveauRamp( terrain,inter,rampfile,filename)
%Genere une courbe d eniveau a partir des altitudes
%on part du terrain en uint16, donc on connait min et max prealablement
%   Detailed explanation goes here

epsNoir =1.25;
epsGris = 2;

minT=min(min(terrain));
maxT=max(max(terrain));

imdata = imread(rampfile);
nbCouleurs=size(imdata);%la deuxieme composante contient le nombre de couleurs disponibles 

pas = nbCouleurs(2)/(maxT-minT);
n = size(terrain);

texture = ones(n(1),n(2),3);
texture = uint8(texture);
texture = texture * 240;
    for i=1:n(1),
        for j =1:n(2),
            indexCouleur = (terrain(i,j)-minT)*pas + 1;
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
    
    texture = uint8(texture);
    
    imwrite(texture,filename);

end