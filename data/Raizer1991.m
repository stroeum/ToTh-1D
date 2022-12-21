clearvars
close all
clc

load('Raizer1991_orig')
p_g_Torr = 760; % _Torr

R.Crt.Air.R91{1}    = 10.^bl(:,1); % _cm
R.Crt.Air.R91{2}    = 10.^left(:,1); % _cm
R.Crt.Air.R91{3}    = 10.^right(:,1); % _cm
R.Crt.Air.R91{4}    = 10.^solid(:,1); % _cm
R.Crt.Air.R91{5}    = 10.^tr(:,1); % _cm
R.Crt.Air.R91{6}    = 10.^up(:,1); % _cm

pr.Crt.Air.R91{1}   = p_g_Torr*R.Crt.Air.R91{1} ; % _cm_Torr
pr.Crt.Air.R91{2}   = p_g_Torr*R.Crt.Air.R91{2}; % _cm_Torr
pr.Crt.Air.R91{3}   = p_g_Torr*R.Crt.Air.R91{3}; % _cm_Torr
pr.Crt.Air.R91{4}   = p_g_Torr*R.Crt.Air.R91{4}; % _cm_Torr
pr.Crt.Air.R91{5}   = p_g_Torr*R.Crt.Air.R91{5}; % _cm_Torr
pr.Crt.Air.R91{6}   = p_g_Torr*R.Crt.Air.R91{6}; % _cm_Torr

E_cr.Crt.Air.R91{1} = bl(:,2)*1e5; % _V/_m
E_cr.Crt.Air.R91{2} = left(:,2)*1e5; % _V/_m
E_cr.Crt.Air.R91{3} = right(:,2)*1e5; % _V/_m
E_cr.Crt.Air.R91{4} = solid(:,2)*1e5; % _V/_m
E_cr.Crt.Air.R91{5} = tr(:,2)*1e5; % _V/_m
E_cr.Crt.Air.R91{6} = up(:,2)*1e5; % _V/_m


gamma               = 1e-2;
Q                   = 1/gamma+1;
bar                 = 1013.25*1e2; %_Pa
k_B                 = 1.3806e-23; %_m2_kg_s-2_K-1

A.Air.R91           = 15; % 1/(_cm_Torr)
B.Air.R91           = 365; % _V/(_cm_Torr)
C.Air.R91           = log(A.Air.R91/log(1/gamma+1));
n_g.Air             = 2.688e25; %_m-3
T_g.Air             = 1*bar/(k_B*n_g.Air); %_K
p_g.Air             = n_g.Air*k_B*T_g.Air; %_Pa
p_g.Torr.Air        = p_g.Air*760/101325; %_Torr
alpha.Air.R91_th    = @(Ef)A.Air.R91*p_g.Air*exp(-B.Air.R91*p_g.Air./Ef); % _cm^-1
V_cr.Crt.Air.R91_th = @(PD)(PD>log(Q)/A.Air.R91) .* (B.Air.R91*PD./(C.Air.R91+log(PD))); % _V
E_cr.Crt.Air.R91_th = @(D)V_cr.Crt.Air.R91_th(p_g.Torr.Air*D)./(D*1e-2); % _V/_m (D must be in _cm)

A.CO2.R91           = 20; % 1/(_cm_Torr)
B.CO2.R91           = 466; % _V/(_cm_Torr)
C.CO2.R91           = log(A.CO2.R91/log(1/gamma+1));
n_g.CO2             = 1.88863e+23; %_m^-3
T_g.CO2             = 231.2; %_K
p_g.CO2             = n_g.CO2*k_B*T_g.CO2; %_Pa
p_g.Torr.CO2        = p_g.CO2*760/101325; %_Torr

alpha.CO2.R91_th    = @(Ef)A.CO2.R91*p_g.CO2*exp(-B.CO2.R91*p_g.CO2./Ef); % _cm^-1
V_cr.Crt.CO2.R91_th = @(PD)(PD>log(Q)/A.CO2.R91) .* (B.CO2.R91*PD./(C.CO2.R91+log(PD))); % _V
E_cr.Crt.CO2.R91_th = @(D)V_cr.Crt.CO2.R91_th(p_g.Torr.CO2*D)./(D*1e-2); % _V/_m (D must be in _cm)

%% Plots
figure('Name', '[Raizer, 1991, Fig. 7.4]')
subplot(121)
semilogx(...
    10.^bl(:,1)   , bl(:,2)   ,'ko',...
    10.^left(:,1) , left(:,2) ,'k+',...
    10.^right(:,1), right(:,2),'kx',...
    10.^solid(:,1), solid(:,2),'ks',...
    10.^tr(:,1)   , tr(:,2)   ,'kd',...
    10.^up(:,1)   , up(:,2)   ,'k*')

xlabel('d (cm)')
ylabel('E_t (kV/cm)')
xlim([0.05 3])
ylim([28 60])
set(gca,'TickDir','out',...
    'XMinorTick','on','XTick',[.05 .1 .2 .4 .6 .8 1 2 3],...
    'YMinorTick','on','YTick',[32 40 48 56])

subplot(122)
D = logspace(-2,1,101); % _cm_Torr
semilogx(...
    R.Crt.Air.R91{1} , E_cr.Crt.Air.R91{1}     *1e-5 , 'ko' ,...
    R.Crt.Air.R91{2} , E_cr.Crt.Air.R91{2}     *1e-5 , 'k+' ,...
    R.Crt.Air.R91{3} , E_cr.Crt.Air.R91{3}     *1e-5 , 'kx' ,...
    R.Crt.Air.R91{4} , E_cr.Crt.Air.R91{4}     *1e-5 , 'ks' ,...
    R.Crt.Air.R91{5} , E_cr.Crt.Air.R91{5}     *1e-5 , 'kd' ,...
    R.Crt.Air.R91{6} , E_cr.Crt.Air.R91{6}     *1e-5 , 'k*' ,...
    D                , E_cr.Crt.Air.R91_th(D)  *1e-5 , 'k-' )
xlabel('d (cm)')
ylabel('E_t (kV/cm)')
xlim([0.05 3])
ylim([28 60])
set(gca,...
    'TickDir'   ,'out',...
    'XMinorTick','on' ,...
    'YMinorTick','on' ,...
    'XTick',[.05 .1 .2 .4 .6 .8 1 2 3],...
    'YTick',[32 40 48 56])

figure('Name', '[Raizer, 1991, Fig. 7.4]')
PD = logspace(-1,1,101); % _cm_Torr
plot(...
    PD , V_cr.Crt.CO2.R91_th(PD) , 'r-' ,...
    PD , V_cr.Crt.Air.R91_th(PD) , 'k-' )
xlabel('PD (cm.Torr)')
ylabel('V (V)')
set(gca,...
    'TickDir'   ,'out',...
    'XMinorTick','on' ,...
    'YMinorTick','on' )
%% Closing
clearvars -except alpha V_cr E_cr pr R
save('Raizer1991_sorted.mat')