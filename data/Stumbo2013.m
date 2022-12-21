clearvars
close all
clc

% gamma = 1e-2;
% Q     = 1/gamma+1;
% pd    = linspace(0,2,100);
% 
% Air_A = 15;
% Air_B = 365;
% Air_C = log(Air_A/log(1/gamma+1));
% Air_V = Air_B*pd./(Air_C+log(pd));
% Air_V(Air_V<0) = nan;
% 
% CO2_A = 20;
% CO2_B = 466;
% CO2_C = log(CO2_A/log(1/gamma+1));
% CO2_V = CO2_B*pd./(CO2_C+log(pd));
% CO2_V(CO2_V<0) = nan;

load('Stumbo2013_orig')

d1                  = 0.57*1e-2; %_m
d2                  = 2.44*1e-2; %_m
 pr.Crt.Air.S13{1}  = Air_0_57(:,1)* % _cm_Torr
V_cr.Crt.Air.S13{1} = Air_0_57(:,2); % _V
 pr.Crt.Air.S13{2}  = Air_2_44(:,1)*1e-3*d2*1e2; % _cm_Torr
V_cr.Crt.Air.S13{2} = Air_2_44(:,2); % _V
 pr.Crt.CO2.S13{1}  = CO2_0_57(:,1)*1e-3*d1*1e2; % _cm_Torr
V_cr.Crt.CO2.S13{1} = CO2_0_57(:,2); % _V
 pr.Crt.CO2.S13{2}  = CO2_2_44(:,1)*1e-3*d2*1e2; % _cm_Torr
V_cr.Crt.CO2.S13{2} = CO2_2_44(:,2); % _V

%% Plots
figure('Name','[Stumbo, 2013]')
subplot(6,2,[1,3,5])
plot(pr.Crt.Air.S13{1}/(1e-3*d1*1e2),V_cr.Crt.Air.S13{1},'r+',pr.Crt.Air.S13{2}/(1e-3*d1*1e2),V_cr.Crt.Air.S13{2},'b+')
xlabel('p_{air} (mTorr)')
ylabel('V (V)')
title('Air');
set(gca,'TickDir','out',...
    'XMinorTick','on','XTick',0:500:3000,...
    'YMinorTick','on','YTick',300:50:600)

subplot(6,2,[7,9,11])
plot(pr.Crt.CO2.S13{1}/(1e-3*d1*1e2),V_cr.Crt.CO2.S13{1},'r+',pr.Crt.CO2.S13{2}/(1e-3*d1*1e2),V_cr.Crt.CO2.S13{2},'b+')
xlabel('p_{CO_2} (mTorr)')
ylabel('V (V)')
title('CO_2');
set(gca,'TickDir','out',...
    'XMinorTick','on','XTick',0:500:3000,...
    'YMinorTick','on','YTick',500:50:750)

subplot(6,2,[2,4])
plot(pr.Crt.Air.S13{1},V_cr.Crt.Air.S13{1},'r+',pr.Crt.Air.S13{2},V_cr.Crt.Air.S13{2},'b+')
xlabel('pd (cm.Torr)')
ylabel('V (V)')
title('Air');
set(gca,'TickDir','out',...
    'XMinorTick','on','XTick',0:.4:3.2,...
    'YMinorTick','on','YTick',300:50:600)

subplot(6,2,[6,8])
plot(pr.Crt.CO2.S13{1},V_cr.Crt.CO2.S13{1},'r+',pr.Crt.CO2.S13{2},V_cr.Crt.CO2.S13{2},'b+')
xlabel('pd (cm.Torr)')
ylabel('V (V)')
title('CO_2');
set(gca,'TickDir','out',...
    'XMinorTick','on','XTick',0:.4:3.2,...
    'YMinorTick','on','YTick',300:50:750)

subplot(6,2,[10,12])
plot(...
    pr.Crt.Air.S13{1},V_cr.Crt.Air.S13{1},'b+',...
    pr.Crt.Air.S13{2},V_cr.Crt.Air.S13{2},'b+',...
    pr.Crt.CO2.S13{1},V_cr.Crt.CO2.S13{1},'r+',...
    pr.Crt.CO2.S13{2},V_cr.Crt.CO2.S13{2},'r+')
xlabel('pd (cm.Torr)')
ylabel('V (V)')
set(gca,'TickDir','out',...
    'XMinorTick','on','XTick',0:.4:3.2,...
    'YMinorTick','on','YTick',200:200:1800)

clearvars -except pr V_cr

save Stumbo2013_sorted