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

Z(:, 1) = lognrnd(0.4,0.035,[N,1]); %yield stress(GPa) Fs
Z(:, 2) =  normrnd(5, 0.5, [N,1]); %dead weight load(10^5 N) P1
Z(:,3)  = -0.9 .* log(-log(rand(N, 1))) + 6; %variable load(10^5 N) P2
Z(:,4)  =  -0.9 .* log(-log(rand(N, 1))) + 6; %variable load(10^5 N) P3
Z(:,5)  =  lognrnd(30,0.3,[N,1]); %flange breadth(cm) B
Z(:,6)  = lognrnd(2,0.2,[N,1]); %flange thickness(cm) D
Z(:,7)  = lognrnd(30,0.5,[N,1]); %profile height(cm) H
Z(:,8)  = normrnd(3, 1, [N,1]); %initial deflection(cm) F0
Z(:,9)  = wblrnd(210, 4.2, [N,1]); %Young's modulus(GPa) E