function stats = estimate_statistics(fcns,N,vec)
% estimate statistics of high- and low-fidelity models using N samples
%
% INPUTS
% fcns      k-by-1cell array of anonymous functions corresponding to high-
%           and low-fidelity models (hi-fid must be first)
% N         number of samples to use to estimate statistics
% vec       k-by-1 vector that indicates whether the models in fcns are
%           vectorized or not. 0 (false) is default. 1 is vectorized. all
%           2's indicates that functions bootstrap from samples.
%
% OUTPUT
% stats     struct with fields {mu, sigma, delta, tau, q, rho}
%
% AUTHOR
% Elizabeth Qian (elizqian@mit.edu) 14 June 2019

if nargin == 2
    vec = zeros(size(fcns));
end

if any(vec == 2)
    assert(all(vec==2),'If computing indices via bootstrapping, fcns need to have special form and the vectorization flag needs to be 2 for all models')
end

Z = generate_inputs(N);

k = length(fcns);

f_vals = zeros(N,k);

% loop through models
for i = 1:k
    if vec(i) == 1
        % if vectorized, evaluate functions at all inputs at once
        f_vals(:,i) = fcns{i}(Z);
    elseif vec(i) == 0
        % if not vectorized, loop through inputs and evaluate function
        for j = 1:N
            f_vals(j,i) = fcns{i}(Z(j,:));
        end
    elseif vec(i) == 2
        % if bootstrapping, grab sample outputs
        [yA,~,~] = fcns{i}(Z);
        f_vals(:,i) = yA;
    end
end

stats.mu      = mean(f_vals)';
stats.sigma   = std(f_vals)';

g_vals        = (f_vals - stats.mu').^2;

a             = N^2/((N-1)*(N^2-3*N+3));
b             = 3*(2*N-3)/(N^2-3*N+3);
stats.delta   = (a*sum(g_vals.^2) - b*stats.sigma'.^4)';

stats.tau     = std(g_vals)';

stats.q       = [1; zeros(k-1,1)];
stats.rho     = [1; zeros(k-1,1)];
for i = 2:k
    stats.rho(i) = sum((f_vals(:,1)-stats.mu(1)).*(f_vals(:,i)-stats.mu(i)))/((N-1)*stats.sigma(1)*stats.sigma(i));
    stats.q(i)   = (g_vals(:,1)-stats.sigma(1)^2)'*(g_vals(:,i)-stats.sigma(i)^2)/((N-1)*stats.tau(1)*stats.tau(i));
end