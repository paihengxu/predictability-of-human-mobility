clear;clc;
Entropy10_0 = ones(41,1);
Entropy10_ln_0 = ones(41,1);
Entropy10_len = ones(41,1);
Entropy10_ln_len = ones(41,1);
Entropy10_n = ones(41,1);
Entropy10_ln_n = ones(41,1);
count = 1;
for i = 1:1
    n = 200;
    m = 20;
    for j = 1:100
        count = 1;
        j
        tic
        while (count~=41)
            p = 0:0.025:1;
            
            seq10 = Markov(n,m,p(count));
%             Entropy10_0(count,j) = EstEntropy_revised(seq10,1);
%             Entropy10_ln_0(count,j) = EstEntropy(seq10,1);
            Entropy10_len(count,j) = EstEntropy_revised(seq10,2);
            Entropy10_ln_len(count,j) = EstEntropy(seq10,2);
            Entropy10_n(count,j) = EstEntropy_revised(seq10,3);
            Entropy10_ln_n(count,j) = EstEntropy(seq10,3);
            count = count + 1;
        end
        toc
    end
    for k = 1:size(Entropy10_0,1)
        
%         mean_0(k,i) = mean(Entropy10_0(k,:));
%         [pre_0(k,i), fval_0(k,i), exitflag_0(k,i)]  = Predictability_fsolve(mean_0(k,i),10);
%         mean_ln_0(k,i) = mean(Entropy10_ln_0(k,:));
%         [pre_ln_0(k,i), fval_ln_0(k,i), exitflag_ln_0(k,i)]  = Predictability_fsolve(mean_ln_0(k,i),10);
        
        mean_len(k,i) = mean(Entropy10_len(k,:));
        [pre_len(k,i), fval_len(k,i), exitflag_len(k,i)]  = Predictability_fsolve(mean_len(k,i),m);
        mean_ln_len(k,i) = mean(Entropy10_ln_len(k,:));
        [pre_ln_len(k,i), fval_ln_len(k,i), exitflag_ln_len(k,i)]  = Predictability_fsolve(mean_ln_len(k,i),m);
        
        mean_n(k,i) = mean(Entropy10_n(k,:));
        [pre_n(k,i), fval_n(k,i), exitflag_n(k,i)]  = Predictability_fsolve(mean_n(k,i),m);
        mean_ln_n(k,i) = mean(Entropy10_ln_n(k,:));
        [pre_ln_n(k,i), fval_ln_0(k,i), exitflag_ln_0(k,i)]  = Predictability_fsolve(mean_ln_n(k,i),m);
    end
end
theoretical_10 = p+(1-p)/m;
% for i = 1:3
%     for k = 1:size(Entropy5,1)
%         [pre_5(k,i), fval_5(k,i), exitflag_5(k,i)] = Predictability_fsolve(mean_5(k,i),5);
%         [pre_10(k,i), fval_10(k,i), exitflag_10(k,i)] = Predictability_fsolve(mean_10(k,i),10);
%     end
% end
%m=5
save markovian_r1_n200m20.mat

figure
plot(0:0.025:1,pre_ln_n(:,1),'bd--','LineWidth',2) %Unmatched -- blue
hold on
plot(0:0.025:1,pre_ln_len(:,1),'bs--','LineWidth',2)
hold on
% plot(0:2.5:100,pre_ln_0(:,1),'o--')
% 
% hold on
plot(0:0.025:1,pre_n(:,1),'r^--','LineWidth',2) %Matched -- red
hold on
plot(0:0.025:1,pre_len(:,1),'ro--','LineWidth',2)
hold on
% plot(0:2.5:100,pre_0(:,1),'ro--')
% hold on

plot(0:0.025:1,theoretical_10,'k-','LineWidth',2)
hold off
xticks(0:0.1:1)
xlabel('P')
ylabel('Predictability \Pi_{max}')
set(gca,'YLim',[0 1], 'XLim', [0 1])
legend('Unmatched bases (\Lambda = n+1)','Unmatched bases (\Lambda = k+1)',...
    'Matched bases (\Lambda = n+1)','Matched bases (\Lambda = k+1)','Theoretical value')