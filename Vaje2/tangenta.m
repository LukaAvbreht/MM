function tangenta(f,df,interval,st_tock)
%tangenta izrise animacijo 'drsenja' tangente po grafu funkcije
%tangenta(f,df,interval,st_tock)
%f je funkcija, df je njen odvod
%interval=[a,b] je interval, kjer risemo sliko
%tock je stevilo tock pri risanju
% dodana je tudi moznost odbijanja

% korak = (interval(2)-interval(1))/st_tock;
% 
% X = interval(1):korak:interval(2);
% Y = f(X);
% 
% plot(X,Y,'r');

%uradna resitev 
a = interval(1);
b = interval(2);
x1 = linspace(a,b,st_tock);
Yf = feval(f,x1);

clf;
hold on;
plot(x1,Yf,'k','LineWidth',4);
% premica = [];
% tocka = [];
% Fixirano okno
axis([a,b,min(Yf),max(Yf)]);


odboji = 2;
i=1; 
for odboj=0:odboji
    if(i==1)
        leva=1;
        desna = st_tock;
        korak = 1;
    else
        if(i == st_tock)
            leva = st_tock;
            desna = 1;
            korak = -1;
        end
    end
    for i=leva:korak:desna
        c = x1(i);
        fc = f(c);
        kp = df(c);
        np = fc - kp*c;
        yp = polyval([kp,np],x1);
        %tuki hocmo da osnovni gref pusti, za nazaj pa pobrise tangento
        
        premica = plot(x1,yp,'b--','LineWidth',2);
        tocka = plot(c,fc,'or','MarkerSize',10);
        
        pause(0.1);
        
        delete(premica);
        delete(tocka);
    end
end
end