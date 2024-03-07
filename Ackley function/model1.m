function f1 = model1(Z)
% high-fidelity model for Ishigami function example
% f1 = sin(z1) + a*sin(z2)^2 + b*z3^4*sin(z1)
%
% INPUTS
% Z         N-by-2 matrix of uncertain parameters, Z1 U[-32.768,32.768], Z2 U[-32.768,32.768]
% a,b       (optional) Ishigami function parameters, default a = 5, b = 0.1
%
% OUTPUT
% f1        N-by-1 vector of model evaluations at the uncertain inputs in Z
%
% AUTHOR
% Elizabeth Qian (elizqian@mit.edu) 14 June 2019


f1 = -20*exp(-0.2*sqrt(0.5*(Z(:,1).^2 + Z(:,2).^2))) -exp(0.5*(cos(2*pi*Z(:,1) + cos(2*pi*Z(:,2)))))...
    +exp(1) + 20;
