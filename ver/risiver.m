function T_min=risiver(T1,T2,l,tol,nt,barva)
%RISIVER narise diskretno veriznico in poisce minimum
%T_min=RISIVER(T1,T2,l,ro,tol,nt,barva)
%T_min je tocka, kjer je veriznica najnizje
%T1 in T2 sta krajisci veriznice oblike
%T1=[a,A], T2=[b,B], l je dolzina,
%tol toleranca pri iteraciji,
%nt stevilo tock risanja in barva barva izrisa

if nargin < 6; barva='r';end
if nargin < 5; nt=100;end
if nargin < 4; tol = 1e-10;end
if nargin < 3; l = 20;end
if nargin < 2; T2=[5;3];end
if nargin < 1; T1=[0;5];end

z0 = 1;

z = isciz(T1, T2, l, z0, tol);

a = T1(1);
A = T1(2);
b = T2(1);
B = T2(2);

arg = (B-A)/l;

v = atanh(arg) + z;
u = atanh(arg) - z;

C = (b-a)/(v-u);
D = (a*v - b*u)/(v-u);

lambda = A - C*cosh((a-D)/C);

w = @(x) (lambda +C.*cosh((x-D)./C));

T_min = [D;lambda+C];

xx = linspace(a,b, nt);
yy = w(xx);

clf;
hold on;
grid on;
axis equal;
plot(xx, yy, barva);

plot([a,b],[A,B], 'ko', 'MarkerSize', 10);

plot(T_min(1),T_min(2), 'ko', 'MarkerSize', 10, 'MarkerFaceColor', 'g');

hold off;

a1 = w(2)
a2 = T_min(1)
a3 = fzero(@(x) (w(x)-x), 0)

f2 = @(x) w(x)-4;
x_pres = fzero(f2, 1);

df = @(x) sinh((x-D)/C);

dol = @(x) sqrt(1 + df(x).^2);
a5 = quad(dol, x_pres, b)

end