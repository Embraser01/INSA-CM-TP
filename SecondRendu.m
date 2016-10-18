function [ ] = SecondRendu(terrain ,iter, alpha, lambda)
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here

terrainFinal = GenererTerrain(terrain,iter,alpha,lambda);

Exporter16(terrainFinal, 'niveaudegris.png');
CourbeNiveau(terrainFinal, 25 , 'courbeniveau.png');
RenderTerrain('niveaudegris.png','courbeniveau.png','out.png', [-1200 0 700], [400 0 100]);

end

