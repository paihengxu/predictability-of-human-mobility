function [ index ] = FindUnmatched( str, pattern )
%UNTITLED 此处显示有关此函数的摘要
%   此处显示详细说明
n = length(str);
m = length(pattern);
count = 1;
find = 0;
for i = 1:n
    if (i+m)>n
        break;
    end
    if str(i:(i+m-1)) == pattern
        index(count) = i;
        find = 1;
        %         count = count + 1;
        break;
    end
end

if find == 0
    index = [];

end

