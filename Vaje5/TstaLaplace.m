% Matrika A
% Prva vrstica v A

n = 5;
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
