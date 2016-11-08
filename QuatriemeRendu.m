function [ ] = QuatriemeRendu(terrain ,iter, alpha, lambda)
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here

terrainFinal = GenererTerrain(terrain,iter,alpha,lambda);
points = ConstruitPoints3D(terrainFinal, -450,450 ,-600 ,600);
normales = ConstruitNormales(points);

Exporter16(terrainFinal, 'niveaudegris.png');
Ombrage(terrainFinal, 25 , 'colorramp.png', normales, points, [0 700 1200], 'courbeniveau2.png');
RenderTerrain('niveaudegris.png','courbeniveau2.png','out2.png', [0 -900 1100], [0 0 450]);

end

