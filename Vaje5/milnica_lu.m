function [U,x]=milnica_lu(a,fun,n);
%MILNICA_LU resuje Laplaceovo enacbo z LU razcepom
%na kvadratu [-a,a]^2
%in narise resitev
%[U,x]=MILNICA_LU(a,fun,n);
%U so vrednosti funkcije na mrezi
%x je vektor delilnih tock mreze
%a je desno krajisce kvadrata
%n je stevilo notranjih tock
%fun je funkcija, ki racuna robne vrednosti

[A,b,robovi] = naredi_matriko(a,fun,n);
u = A\b;

U = reshape(u,n,n);
U = [robovi(1,:)' [(robovi(2,2:n+1));U;(robovi(3,2:n+1))] robovi(4,:)' ];

x = linspace(-a,a,n+2);

% poèistimo graficno okno
clf;
hold on
% #d pogled
view(3)
% izrisemo 3d surface
surf(x,x,U);
% oznacimo robove
robx = [-a*ones(1,n+2), x , a*ones(1,n+2) , fliplr(x)];
roby = [x,a*ones(1,n+2), fliplr(x), -a*ones(1,n+2)];

robovi1 = [robovi(1,:),robovi(2,:),fliplr(robovi(3,:)),fliplr(robovi(4,:))];

robz = reshape(robovi1', 1, 4*length(robovi));

surf(robx,roby,robz, 'r', 'LineWidth',5);

axis equal

hold off

end