function [ ] = PremierRendu(terrain ,iter, alpha, lambda)
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here

Exporter16(GenererTerrain(terrain,iter,alpha,lambda), 'niveaudegris.png');
RenderTerrain('niveaudegris.png','grille.png','out.png', [-1000 -1000 500], [400 400 100]);

end

