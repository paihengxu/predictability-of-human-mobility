clear;clc

for j = 1:13
    seq = 1:2^(j+1);
    Est_H(j) = EstEntropy(seq,2);
    [p_ln(j), fval_ln(j),exitflag_ln(j)] = Predictability_fsolve(Est_H(j),2^(j+1));
    rp(j) = double(real(p_ln(j)));
    Est_H_R(j) = EstEntropy_revised(seq,2);
    [p_r(j), fval(j),exitflag(j)] = Predictability_fsolve(Est_H_R(j),2^(j+1));
    rp_r(j) = double(real(p_r(j)));
end

save exploration_r1.mat
figure

plot(1:13,rp,'>--')
hold on
plot(1:13,rp_r,'ro--')
hold on

theoretical = ones(1,121);
for i = 1:1210
    theoretical(i) = 1/2^(0.1*(i+9)+1);
end
plot(1:0.01:13,theoretical,'k--')

for ii=1:size(p_r,2)
    x_label{ii}=['2^' num2str(ii+1)];
end
set(gca,'xtick',1:size(p_r,2),'xticklabel',x_label,'YLim',[0 0.6]);
xlabel('Number of distinct locations m')
ylabel('Predictabliity \Pi_{max}')
legend('Unmatched bases','Matched bases','Theoretical value')