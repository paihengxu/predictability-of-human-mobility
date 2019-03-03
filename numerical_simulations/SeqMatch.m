function [ delta, find ] = SeqMatch( seq,i,mode )
%SEQMATCH 此处显示有关此函数的摘要
%   此处显示详细说明
n = length(seq);
str = seq(1:(i-1));
len = 0;
k = 1;
find = 1;
while (~isempty(k))
    if(i+len >n)
        find = 0;
        if mode ==1 
            delta = 0;
        elseif mode == 2
            delta = len+1;
        elseif mode == 3
            delta = n+1;
        end
        break;
    end
    pattern = seq(i:(i+len));
    k = FindUnmatched(str,pattern);
    if (~isempty(k))
        len = len + 1;
    end
    delta = len + 1;
    
end
% if ( len == n-i+1 )  %可以调整以降低时间复杂度
%     delta = n+1;  %有两种策略，周老师采用的是返回 全部长度+1
% end
end

