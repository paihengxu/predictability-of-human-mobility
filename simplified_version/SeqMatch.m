function [ delta, find ] = SeqMatch( seq,i )
% 
n = length(seq);
str = seq(1:(i-1));
len = 0;
k = 1;
find = 1;
while (~isempty(k))
    if(i+len >n)
        find = 0;
        delta = len+1;
        break;
    end
    pattern = seq(i:(i+len));
    k = FindUnmatched(str,pattern);
    if (~isempty(k))
        len = len + 1;
    end
    delta = len + 1;
end
end

