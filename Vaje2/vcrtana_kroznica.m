function [S,r]=vcrtana_kroznica(T);
%VCRTANI_KROG vrne sredisce in radij vcrtane kroznice
% [S,r]=vcrtani_krog(T) vrne sredisce in radij trikotniku T vcrtanega kroga
% T je podan kot 3x2 matrika tock, kjer so v prvem
% T = [x1,y1]
%     [x2,y2]
%     [x3,y3]
% stolpcu x koordinate.

a = T(2,:)-T(1,:);
b = T(3,:)-T(1,:);
ea = a/norm(a);
eb = b/norm(b);

A = T(1,:)+ea;
B = T(1,:)+eb;


sim1 = simetrala(A,B);

%podobno za se eno simetralo

a2 = T(1,:)-T(2,:);
b2 = T(3,:)-T(2,:);
ea2 = a2/norm(a2);
eb2 = b2/norm(b2);

A2 = T(2,:)+ea2;
B2 = T(2,:)+eb2;

sim2 = simetrala(A2,B2);

S = presek_premic(sim1,sim2);

da = norm(a);
db = norm(b);
dc = norm(b2);

s = (da+db+dc)/2;

p = sqrt(s*(s-da)*(s-db)*(s-dc));

r = p/s;

end