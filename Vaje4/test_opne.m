%Test opne

f = @(r) ones(size(r));

R = 1;
n = 100;
[r,u] = poves_opne(f,R,n);

%plot(r,u)

polar3d(flipud(u)*ones(1,100),0,2*pi,0,R,1)