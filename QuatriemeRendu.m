function [ ] = QuatriemeRendu(terrain ,iter, alpha, lambda)
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here

terrainFinal = GenererTerrain(terrain,iter,alpha,lambda);
points = ConstruitPoints3D(terrainFinal, -600,600 ,-450 ,450);
normales = ConstruitNormales(points);

Exporter16(terrainFinal, 'niveaudegris.png');
Ombrage(terrainFinal, 25 , 'colorramp.png', normales, points, [1200 0 100], 'courbeniveau2.png');
RenderTerrain('niveaudegris.png','courbeniveau2.png','out2.png', [-1200 0 700], [400 0 100]);

end

