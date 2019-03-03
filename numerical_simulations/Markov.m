function [ seq ] = Markov( n, m, p )
%MARKOV OUTPUT, Markov Sequence. INPUT, p, the probability of random walk
%   For a Markov sequence, probability p to go random, 1-p to follow the
%   path in deterministic sequence.

seq = ones(n,1);
pool = 1:m;
for i = 2:n
    if rand<=p
        seq(i) = rem((seq(i-1)+1),m);
        if seq(i) == 0
            seq(i) = m;
        end
    else
        seq(i) = pool(ceil(rand*m));
    end
end

end

