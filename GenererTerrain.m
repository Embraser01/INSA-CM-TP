function [ terrainFin ] = GenererTerrain( initterrain,nsubdiv,alpha,lambda )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
terrainFin = initterrain;
for i = 1:nsubdiv,
    terrainFin = Subdivise(terrainFin,alpha);
    alpha = alpha*lambda;
end


end