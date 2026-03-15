%           1
%  H(w)=--------
%       4jw +1
%       s=jw
%       w=2pif
num=1;
den=[4 1];
H=tf(num,den);
bode(H), grid