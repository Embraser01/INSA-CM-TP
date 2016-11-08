function [ matrice ] = MatriceParam( origine, cible )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
    matrice = zeros(4);
    matrice (4,4) = 1;
    %w : relie origine a la cible : OC
    %t : correspond a o

    %w
    OC = cible - origine;
    w = OC/abs(norm(OC));
    matrice (1,3) = w(1);
    matrice (2,3) = w(2);
    matrice (3,3) = w(3);

    %translation t
    matrice (1,4) = origine(1);
    matrice (2,4) = origine(2);
    matrice (3,4) = origine(3);
    %premiere direction u :
    u = cross([0 0 1],w);
    u = u/abs(norm(u));
    matrice (1,1) = u(1);
    matrice (2,1) = u(2);
    matrice (3,1) = u(3);
    %deuxieme direction v:
    v = cross(w,u);
    matrice (1,2) = v(1);
    matrice (2,2) = v(2);
    matrice (3,2) = v(3);
end