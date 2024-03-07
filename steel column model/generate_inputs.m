function Z = generate_inputs(N)
% generates random inputs for mcCormick function example
%
% INPUT
% N     number of inputs to generate
%
% OUTPUT
% Z     N-by-2 matrix of random McCormick function inputs
%
% AUTHOR
% Elizabeth Qian (elizqian@mit.edu) 14 June 2019

Z(:, 1) = lognrnd(400,35,[N,1]); %yield stress(MPa) Fs
Z(:, 2) =  normrnd(500000, 50000, [N,1]); %dead weight load(N) P1
Z(:,3)  = -90000 .* log(-log(rand(N, 1))) + 600000; %variable load(N) P2
Z(:,4)  =  -90000 .* log(-log(rand(N, 1))) + 600000; %variable load(N) P3
Z(:,5)  =  lognrnd(300,3,[N,1]); %flange breadth(mm) B
Z(:,6)  = lognrnd(20,2,[N,1]); %flange thickness(mm) D
Z(:,7)  = lognrnd(300,5,[N,1]); %profile height(mm) H
Z(:,8)  = normrnd(30, 10, [N,1]); %initial deflection(mm) F0
Z(:,9)  = wblrnd(210000, 4200, [N,1]); %Young's modulus(MPa) E