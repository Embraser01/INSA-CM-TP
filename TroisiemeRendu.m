function [ ] = TroisiemeRendu(terrain ,iter, alpha, lambda)
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here

terrainFinal = GenererTerrain(terrain,iter,alpha,lambda);

Exporter16(terrainFinal, 'niveaudegris.png');
CourbeNiveauRamp(terrainFinal, 25 , 'colorramp.png', 'courbeniveau.png');
RenderTerrain('niveaudegris.png','courbeniveau.png','out.png', [-1500 0 900], [400 0 100]);

end

