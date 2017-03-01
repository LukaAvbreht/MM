function [S,r]=ocrtana_kroznica(T);
% OCRTANA_KROZNICA vrne sredisce in radij ocrtane kroznice
% [S,r]=OCRTANA_KROZNICA(T) vrne sredisce in radij trikotniku T
% ocrtane kroznice. T je 3x2 matrika, kjer prvi stolpec
% predstavlja x koordinate. S=[x;y], r je stevilo

p1 = simetrala(T(1,:),T(2,:));
p2 = simetrala(T(2,:),T(3,:));
S = presek_premic(p1,p2);

r = norm(S-T(1,:),2);
end