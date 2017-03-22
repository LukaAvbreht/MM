function [A,b,robovi]=naredi_matriko(a,robna_fun,n)
%NAREDI_MATRIKO vrne Laplaceovo matriko in desno stran
%[A,b,robovi]=NAREDI_MATRIKO(a,robna_fun,n)
%a je desna meja kvadrata [-a,a]^2
%robna_fun je ime funkcije, ki racuna robne vrednosti
%n+2 je stevilo tock v eni rezini (matrika je torej dim n^2xn^2)
%A je matrika sistema, b je desna stran, robovi so rezultat robne_fun

% Vrednost na robovih
xx = linspace(-a,a,n+2);
robovi = feval(robna_fun,xx,a);

% Matrika A
% Prva vrstica v A
A = zeros(n^2,n^2);
L = eye(n) * (-4) + diag(ones(1,n-1),1)+diag(ones(1,n-1),-1);
Id = eye(n);
A(1:n,1:2*n) = [L,Id];
for i = 1:n-2
    % Tuki si prpravmo matrike oblike L
    %L = eye(n) * (-4) + diag(ones(1,n-1),1)+diag(ones(1,n-1),-1);
    %Id = eye(n);
    % Dodamo l in identitete na A
    size(A(((i)*n):((i+1)*n)-1,((i)*n):((i+2)*n)-1))
    A(((i)*n)+1:((i+1)*n),((i-1)*n)+1:((i+2)*n)) = [Id,L,Id];
end
% Zadna vrstica v A
%L = eye(n) * (-4) + diag(ones(1,n-1),1)+diag(ones(1,n-1),-1);
%Id = eye(n);
A(n^2-n+1:n^2,n^2-(2*n)+1:n^2) = [Id,L];

% Generiramo vektor b
b = zeros(n^2,1);
b(1:n) = b(1:n) - robovi(4,2:n+1)';
b(n^2-n+1:n^2) = b(n^2-n+1:n^2)-robovi(2,2:n+1)';

indeksi_levo = find(rem(1:n^2,n)==1);
indeksi_desno = find(rem(1:n^2,n)==0);

b(indeksi_levo) = b(indeksi_levo) - robovi(1,2:n+1)';
b(indeksi_desno) = b(indeksi_desno) - robovi(3,2:n+1)';


end