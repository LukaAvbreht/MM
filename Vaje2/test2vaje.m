f = @(x) sin(x);
df = @(x) cos(x);
interval  = [-pi,pi];
st_tock = 100;
tangenta(f,df,interval,st_tock);