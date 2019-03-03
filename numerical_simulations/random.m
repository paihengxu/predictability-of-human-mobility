clear; clc; close all

%fixed m, change n, no windowsize.
for i = 1:1
    for k = 1:9
        m = 10*i
        n = 2^(k+3)
        p = zeros(100,1);
        exitflag = zeros(100,1);
        exitflag_ln = zeros(100,1);
        exitflag_unc = zeros(100,1);
        for j = 1:100
            
            seq = SeqGen(n,m,'random');
            %         Est_H(j) = EstEntropy(seq);
            [Est_H_R(j,k) mean_delta(j,k)] = EstEntropy_revised(seq,2);
            [Est_H_ln(j,k)] = mean_delta(j,k)^(-1)*log(n);
            [Est_unc(j,k)] = Rand(seq);
            j
            N = length(unique(seq));
            [p(j),fval(j),exitflag(j)] = Predictability_fsolve(Est_H_R(j,k),N);
            [p_ln(j),fval_ln(j),exitflag_ln(j)] = Predictability_fsolve(Est_H_ln(j,k),N);
            [p_unc(j),fval_unc(j),exitflag_unc(j)] = Predictability_fsolve(Est_unc(j,k),N);
            
        end
        all_p(:,k,i) = p;
        all_exitflag(:,k,i) = exitflag;
        all_p_ln(:,k,i) = p_ln;
        all_exitflag_ln(:,k,i) = exitflag_ln;
        all_p_unc(:,k,i) = p_unc;
        all_exitflag_unc(:,k,i) = exitflag_unc;
        
    end
    
    figure
    for kk = 1:size(all_p,2)
        solved_p_ln = all_p_ln(kk,:);
        mean_p_ln(kk,i) = mean(solved_p_ln);
        h_ln(i) = errorbar(kk,mean_p_ln(kk,i),std(solved_p_ln),'>--');
        set(h_ln(i),'handlevisibility','off');
        hold on
        solved_p = all_p(kk,:);
        mean_p(kk,i) = mean(solved_p);
        h(i) = errorbar(kk,mean_p(kk,i),std(solved_p),'r*--');
        set(h(i),'handlevisibility','off');
        hold on
        solved_p_unc = all_p_unc(kk,:);
        mean_p_unc(kk,i) = mean(solved_p_unc);
        h_unc(i) = errorbar(kk,mean_p_unc(kk,i),std(solved_p_unc),'ko--');
        set(h_unc(i),'handlevisibility','off');
        hold on
    end
    

    h1 = plot(1:size(all_p,2),mean_p_ln(:,i),'>--');
    hold on
    h2 = plot(1:size(all_p,2),mean_p(:,i),'r*--');
    hold on
    h3 = plot(1:size(all_p,2),mean_p_unc(:,i),'ko--');
    hold on
    for ii=1:size(all_p,2)
        x_label{ii}=['2^' num2str(ii+3)];
    end
    set(gca,'xtick',1:size(all_p,2),'xticklabel',x_label,'YLim',[0 0.9]);
    xlabel('Length of sequence n')
    ylabel('Predictabliity \Pi_{max}')
    legend('Unmatched bases','Matched bases','Theoretical value')
    hold off
end
