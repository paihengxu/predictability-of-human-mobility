% Markovian process descriped in the paper
% Simplified to run just one sequence
clear;clc;

%% Initialization
IMPLEMENT = 10;
n = 100;  % length of sequence
m = 5;   % number of distinct locations in the sequence
StepValue = 0.025;
steps = 1/StepValue + 1;
Entropy = ones(IMPLEMENT,1);
p = 0.5;  % probability of random walk

%% Simulation
for i = 1:IMPLEMENT
    fprintf('Independent implementation %d\n', i )
    seq = Markov(n,m,p);
    Entropy(i,1) = EstEntropy_revised(seq);
end
mean_ent = mean(Entropy);
[pre, fval, exitflag]  = Predictability_fsolve(mean_ent,m);
theoretical_10 = p+(1-p)/m;

%% Save results
filename = ['markovian_n' num2str(n) 'm' num2str(m) '.mat'];
save (filename)
