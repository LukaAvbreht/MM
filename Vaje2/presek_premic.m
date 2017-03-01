function Tp=presek_premic(P_1,P_2)
% PRESEK_PREMIC vrne presecisce dveh premic
% Tp=presek_premic(P1,P2) vrne koordinati presecisca premic
% P1 in P2, ki sta zapisana implicitno z vektorjema [a1,b1,c1], [a2, b2, c2]
% (a1x+b1y+c1=0, a2x+b2y+c2=0 ).
% Predpostavljamo, da presecisce obstaja.
if nargin <2
   P_1 = [1,-1,0];
   P_2 = [-1,-1,2];
end
a = P_1(1);
b = P_1(2);
c = P_1(3);
A = P_2(1);
B = P_2(2);
C = P_2(3);

x = ((c/b)-(C/B)) / ((A/B)-(a/b));
y = ((c/a)-(C/A)) / ((B/A)-(b/a));
Tp = [x y];
end