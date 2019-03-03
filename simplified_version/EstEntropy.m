function [ entropy ] = EstEntropy( seq,mode )
%ESTENTROPY 此处显示有关此函数的摘要
%   此处显示详细说明
sum_delta = 0;
n = length(seq);
for i = 2:n
    delta = SeqMatch(seq,i,mode);
    sum_delta = sum_delta + delta;
end
entropy = (((1/n)*sum_delta)^(-1))*log(n);

end

