clear;clc
uniqueset =[];
for i=1:26
    serialnum(i)=char(i+64);
end
countt = 1;
for i=1:35
    if i<=26                                                          %对应EXCEL的列号生成
        colnum=strcat(serialnum(i),':',serialnum(i));
    else if i>26
            colnum1=strcat(serialnum(ceil(i/26)-1),serialnum(mod(i,26)));
            colnum = strcat(colnum1,':',colnum1);
        end
    end
    raw_seq = [];
    colnum
    raw_seq = xlsread('result_one_sheet.xlsx','Sheet1',colnum);
    seq = [];
    count = 1;
    for j = 1:length(raw_seq)
        if j == 1
            seq(count) = raw_seq(j);
        else
            if raw_seq(j) == raw_seq(j-1)
                continue;
            elseif raw_seq(j) == 0
                continue;
            else
                count = count + 1;
                seq(count) = raw_seq(j);
            end
        end
    end
    unique_seq = unique(seq);
    for ii = 1:length(unique_seq)
        if isempty(find(uniqueset == unique_seq(ii)))
            uniqueset(countt) = unique_seq(ii);
            countt = countt + 1;
        end
    end

%     ent_ln(i) = EstEntropy(seq,2);
%     ent_R(i) = EstEntropy_revised(seq,2);
%     m(i) = length(unique(seq));
%     [p_ln(i),fval_ln(i),exitflag_ln(i)] = Predictability_fsolve(ent_ln(i),m(i));
%     [p_R(i),fval_R(i),exitflag_R(i)] = Predictability_fsolve(ent_R(i),m(i));
    i
end
% solved_p_R = p_R(exitflag_R == 1);
% solved_p_ln = p_ln(exitflag_R == 1);
% figure
% h1 = hist(solved_p_ln);
% h2 = hist(solved_p_R);

