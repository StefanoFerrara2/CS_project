function Z = generate_inputs(N)

Z(:,1) = normrnd(0.10, 0.0161812, N, 1);
Z(:,2) = lognrnd(7.71, 1.0056, N, 1);
Z(:,3) = (rand(N, 1) * (115600 - 63070)) +63070 ; 
Z(:,4) = (rand(N, 1) * (1110 - 990)) +990 ; 
Z(:,5) = (rand(N, 1) * (116 - 63.1)) +63.1  ; 
Z(:,6) = (rand(N, 1) * (820 - 700)) +700 ;
Z(:,7) = (rand(N, 1) * (1680 - 1120)) +1120 ; 
Z(:,8) = (rand(N, 1) * (12045 - 9855)) +9855;

end