function Tp=presek_premic(P1,P2)
% PRESEK_PREMIC vrne presecisce dveh premic
% Tp=presek_premic(P1,P2) vrne koordinati presecisca premic
% P1 in P2, ki sta zapisana implicitno z vektorjema [a1,b1,c1], [a2, b2, c2]
% (a1x+b1y+c1=0, a2x+b2y+c2=0 ).
% Predpostavljamo, da presecisce obstaja.

A  = [p1(1:2),p2(1:2)];
b = [-p1(3);-p2(3)];
Tp=A\b;
Tp = Tp';
end