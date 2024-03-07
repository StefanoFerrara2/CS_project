function f3 = model3(Z)
% second low-fidelity model for Ishigami function example
% f3 = sin(z1) + 0.6*a*sin(z2)^2 + 9*b*z3^2*sin(z1)
%
% INPUTS
% Z         N-by-3 matrix of uncertain parameters, distributed ~U[-pi,pi]
% a,b       (optional) Ishigami function parameters, default a = 5, b = 0.1
%
% OUTPUT
% f2        N-by-1 vector of model evaluations at the uncertain inputs in Z
%
% AUTHOR
% Elizabeth Qian (elizqian@mit.edu) 14 June 2019



Fs = Z(:,1);
P1 = Z(:,2);
P2 = Z(:,3);
P3 = Z(:,4);
B  = Z(:,5);
D  = Z(:,6);
H  = Z(:,7);
F0 = Z(:,8);
E  = Z(:,9);

L = 7500;

P   = P1 ;
Eb = (pi^2)*E.*B.*D.*(H.^2) ./ (2*(L.^2));

term1 = 1 ./ (2*B.*D);
term2 = F0.*Eb ./ (B.*D.*H.*(Eb-P));

f3 = Fs - P.*(term1 + term2);