function [ ] = RenderTerrainMatrix( terrain,texture,outfile,origin,target )
    matrix = MatriceParam(origin,target)
    repertoire = '\\servif-home\fic_eleves\Espace Pedagogique\3IF\Modeles et Outils Mathematiques\Images fondements\image\Mitsuba';
    cmd = strcat('"',repertoire,'\mitsuba" -Dhfile=',terrain,' -Dtfile=',texture,' -Dmatrix="',sprintf('%f ',matrix'),'" -o ',outfile,' texture-matrix.xml');
    disp(cmd);
    system(cmd);

end