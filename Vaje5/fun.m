function RP = fun(x,a)
%FUN vrne vrednosti na robu kvadrata x krat x
%vrednosti na stranicah zlozi v vrstice
%RP=FUN(x,a)
%RP je matrika dimenzije 4x(n+2),
%prva vrstica leve vrednosti (od spodaj navzgor)
%druga vrstica zgornje vrednosti (od leve na desno)
%tretja vrstica desne vrednosti (od spodaj navzgor)
%cetrta vrstica spodnje vrednosti (od leve na desno)


n = length(x);

RP = [a^2-x.^2; x.^2-a^2;(x-a).*(x-a/3);zeros(1,n)];
end