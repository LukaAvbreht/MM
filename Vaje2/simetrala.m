function p=simetrala(A,B);
% SIMETRALA vrne simetralo daljice AB
% p=simetrala(A,B);
% p=[a b c] (ax+by+c=0)
% A=[x1,y1], B=[x2,y2]

C = (A+B)/2;
if (A(2) == B(2))
   p = [1,0,-C(1)]; 
else
   kp = -((B(1)-A(1))/(B(2)-A(2))); 
   np = C(2)-kp*C(1);
   p = [kp,-1,np];
end