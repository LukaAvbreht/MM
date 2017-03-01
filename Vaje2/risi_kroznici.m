function risi_kroznici(T);
% risi_kroznici(T) narise trikotnik ter vcrtano in ocrtano kroznico
% skupaj s srediscema.
% Trikotnik T je podan kot matrika 3x2 tock, prvi stolpec so
% x koordinate.
% T= [ x1 y1; x2 y2; x3 y2]

if nargin < 1
    T = [1 2;3 1;0 -1];
end

clf;

hold on;
plot(T(:,1),T(:,2),'or');
% matriki t dodamo na koncu se enkrat prvo vrstico zato da narisemo poln
% triotnik ukaz plot namrec narise lomljenko med tockami v matriki TT
TT = [T;T(1,:)];
plot(TT(:,1),TT(:,2),'r');
[So,ro] = ocrtana_kroznica(T);
[Sv,rv] = vcrtana_kroznica(T);

%narisemo ocrtano kroznico
fi = linspace(0,2*pi,360);
xo = So(1)+ro*cos(fi);
yo = So(2)+ro*sin(fi);
plot(xo,yo,'g');
plot(So(1),So(2),'xg');

%narisemo vcrtano kroznico
fv = linspace(0,2*pi,360);
xv = Sv(1)+rv*cos(fv);
yv = Sv(2)+rv*sin(fv);
plot(xv,yv,'b');
plot(Sv(1),Sv(2),'xb');

axis equal;
hold off;
end