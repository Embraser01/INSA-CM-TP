function [ niveaudegris ] = Exporter16( terrain , filename)
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
    n = size(terrain);
    niveaudegris = zeros(n(1), n(2));
    min= terrain(1,1);
    max= terrain(1,1);
    for i=1:n(1),
        for j =1:n(2),
            cellule = terrain(i,j);
            if(cellule > max)
                max = cellule;
            end
            if(cellule < min)
                min = cellule;
            end
        end
    end
    
    for i=1:n(1),
        for j =1:n(2),
            niveaudegris(i,j) = (terrain(i,j)- min ) * (65535/(max-min));
        end
    end
    
    niveaudegris = uint16(niveaudegris);
    imwrite(niveaudegris, filename);
end