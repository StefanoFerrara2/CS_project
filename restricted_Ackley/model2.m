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



f2 =  -20*exp(-0.2*sqrt(0.5*(Z(:,1).^2 + Z(:,2).^2))) +exp(1) + 20;