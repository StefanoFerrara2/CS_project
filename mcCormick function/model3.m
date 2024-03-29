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



f3 = (Z(:,1) + Z(:,2)).^2 +Z(:,1) + Z(:,2)   -1.5.*Z(:,1) + 2.5.*Z(:,2) +1;