clear;clc
m_pool = 10;
len = 10;
exitflag = ones(size(m_pool,2),len)*(-2);
for i = 1:len
    for j = 1:size(m_pool,2)
        seq = SeqGen(2^(i),m_pool(j),'markov');
        [Est_H_R(j,i) mean_delta(j,i)] = EstEntropy_revised(seq,2);
        [Est_H(j,i)] = mean_delta(j,i)^(-1)*log(2^(i));
        N = length(unique(seq));
        [p(j,i),fval(j,i),exitflag(j,i)] = Predictability_fsolve(Est_H_R(j,i),N);
        p(j,i) = double(p(j,i));
        [p_ln(j,i),fval_ln(j,i),exitflag_ln(j,i)] = Predictability_fsolve(Est_H(j,i),N);
        p_ln(j,i) = double(p_ln(j,i));
        
    end
end

figure
plot(1:len,p_ln(1,1:len),'b>--')
hold on
plot(1:len,p(1,1:len),'r*--')
% hold off
% text(2,0.9,'(a)','FontSize',14)

x_label='';
for i=1:len
    x_label{i}=['2^' num2str(i)];
end
set(gca,'xtick',1:len,'xticklabel',x_label,'YLim',[0 1]);
legend('Unmatched bases','Matched bases')
xlabel('Length of Sequence n')
ylabel('Predictability \Pi_{max}')

% figure
% plot(1:len,p_ln(2,1:len),'b>--')
% hold on
% plot(1:len,p(2,1:len),'r*--')
% hold off
% text(2,0.9,'(b)','FontSize',14)
% x_label='';
% for i=1:len
%     x_label{i}=['2^' num2str(i)];
% end
% set(gca,'xtick',1:len,'xticklabel',x_label,'YLim',[0 1]);
% legend('Unmatched bases','Matched bases')
% xlabel('Length of Sequence n')
% ylabel('Predictability \Pi_{max}')


% figure
% plot(1:len,p_ln(3,1:len),'b>--')
% hold on
% plot(1:len,p(3,1:len),'r*--')
% hold off
% text(2,0.9,'(c)','FontSize',14)
% x_label='';
% for i=1:len
%     x_label{i}=['2^' num2str(i)];
% end
% set(gca,'xtick',1:len,'xticklabel',x_label,'YLim',[0 1]);
% legend('Unmatched bases','Matched bases')
% xlabel('Length of Sequence n')
% ylabel('Predictability \Pi_{max}')
% 
% 
% figure
% plot(1:len,p_ln(4,1:len),'b>--')
% hold on
% plot(1:len,p(4,1:len),'r*--')
% hold off
% text(2,0.9,'(d)','FontSize',14)
% x_label='';
% for i=1:len
%     x_label{i}=['2^' num2str(i)];
% end
% set(gca,'xtick',1:len,'xticklabel',x_label,'YLim',[0 1]);
% legend('Unmatched bases','Matched bases')
% xlabel('Length of Sequence n')
% ylabel('Predictability \Pi_{max}')
