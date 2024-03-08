function f2 = model2(Z)
% first low-fidelity model for Ishigami function example
% f2 = sin(z1) + 0.95*a*sin(z2)^2 + b*z3^4*sin(z1)
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

P   = P1 + P2 + P3;
Eb = (pi^2)*E.*B.*D.*(H.^2) ./ (2*(L^2));

term1 = 1 ./ (2*B.*D);
term2 = Eb ./ (B.*D.*H.*(Eb-P));

f2 = Fs - P.*(term1 + term2);