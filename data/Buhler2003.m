clearvars
close all
clc

load('Buhler2003_orig.mat')

pr.Crt.CO2.B03{1}    = CO2n(:,1); %_cm_Torr
pr.Crt.CO2.B03{2}    = CO2p(:,1); %_cm_Torr
pr.Crt.CO2.B03{3}    = CO2n2(:,1); %_cm_Torr
V_cr.Crt.CO2.B03{1}  = CO2n(:,2); %_V
V_cr.Crt.CO2.B03{2}  = CO2p(:,2); %_V
V_cr.Crt.CO2.B03{3}  = CO2n2(:,2); %_V

pr.Crt.Mars.B03{1}   = MarsN(:,1); %_cm_Torr
pr.Crt.Mars.B03{2}   = MarsP(:,1); %_cm_Torr
pr.Crt.Mars.B03{3}   = MarsN2(:,1); %_cm_Torr
V_cr.Crt.Mars.B03{1} = MarsN(:,2); %_V
V_cr.Crt.Mars.B03{2} = MarsP(:,2); %_V
V_cr.Crt.Mars.B03{3} = MarsN2(:,2); %_V

clearvars -except pr V_cr

%% Plots
figure('Name','Buhler et al., 2003: Paschen curves');
subplot(121)
plot(...
    pr.Crt.CO2.B03{1} , V_cr.Crt.CO2.B03{1}  , 'ko-' , ...
    pr.Crt.CO2.B03{2} , V_cr.Crt.CO2.B03{2}  , 'kp-' , ...
    pr.Crt.Mars.B03{1}, V_cr.Crt.Mars.B03{1} , 'ro-' , ...
    pr.Crt.Mars.B03{2}, V_cr.Crt.Mars.B03{2} , 'rp-' );
set(gca,'TickDir','out','XMinorGrid','on','YMinorGrid','on')
legend('CO_2 (-)','CO_2 (+)','Mars (-)','Mars (+)','Location','best')
legend boxoff
xlim([1e-2 1e2])
ylim([1e2 1e4])
xlabel('pd (cm.Torr)')
ylabel('V (V)')

subplot(122)
plot(...
    pr.Crt.CO2.B03{3} , V_cr.Crt.CO2.B03{3}  , 'kp-' , ...
    pr.Crt.Mars.B03{3}, V_cr.Crt.Mars.B03{3} , 'rp-' )
set(gca,'TickDir','out','XMinorGrid','on','YMinorGrid','on')
legend('CO_2 (-)','Mars (-)','Location','best')
legend boxoff
xlim([0 1])
ylim([420 560])
xlabel('pd (cm.Torr)')
ylabel('V (V)')

save('Buhler2003_sorted.mat')