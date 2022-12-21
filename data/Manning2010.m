clearvars
close all
clc

load('Manning2010_orig.mat')
L = 0.15; % _cm

pr.sph.CO2.M10       = 10.^Fig_4_CO2(:,1)*L; % _cm_Torr
V_cr.sph.CO2.M10     = 10.^Fig_4_CO2(:,2); % _V
pr.sph.N2.M10        = 10.^Fig_4_N2(:,1)*L; % _cm_Torr
V_cr.sph.N2.M10      = 10.^Fig_4_N2(:,2); % _V
pr.sph.He.M10        = 10.^Fig_4_He(:,1)*L; % _cm_Torr
V_cr.sph.He.M10      = 10.^Fig_4_He(:,2); % _V

pr.sph.Mars.M10{1}   = 10.^Fig_5_circle_open(:,1)*L; % _cm_Torr
V_cr.sph.Mars.M10{1} = 10.^Fig_5_circle_open(:,2); % _V
pr.sph.Mars.M10{2}   = 10.^Fig_5_circ_filled(:,1)*L; % _cm_Torr
V_cr.sph.Mars.M10{2} = 10.^Fig_5_circ_filled(:,2); % _V
pr.sph.Mars.M10{3}   = 10.^Fig_5_crosses(:,1)*L; % _cm_Torr
V_cr.sph.Mars.M10{3} = 10.^Fig_5_crosses(:,2); % _V
pr.sph.Mars.M10{4}   = 10.^Fig_5_diamond_open(:,1)*L; % _cm_Torr
V_cr.sph.Mars.M10{4} = 10.^Fig_5_diamond_open(:,2); % _V
pr.sph.Mars.M10{5}   = 10.^Fig_5_square_open(:,1)*L; % _cm_Torr
V_cr.sph.Mars.M10{5} = 10.^Fig_5_square_open(:,2); % _V
pr.sph.Mars.M10{6}   = 10.^Fig_5_square_filled(:,1)*L; % _cm_Torr
V_cr.sph.Mars.M10{6} = 10.^Fig_5_square_filled(:,2); % _V
pr.sph.Mars.M10{7}   = 10.^Fig_5_triangle_open(:,1)*L; % _cm_Torr
V_cr.sph.Mars.M10{7} = 10.^Fig_5_triangle_open(:,2); % _V

pr.cyl.N2.M10{1}     = 10.^Fig_6_N2_negative(:,1)*L; % _cm_Torr
V_cr.cyl.N2.M10{1}   = 10.^Fig_6_N2_negative(:,2); % _V
pr.cyl.N2.M10{2}     = 10.^Fig_6_N2_positive(:,1)*L; % _cm_Torr
V_cr.cyl.N2.M10{2}   = 10.^Fig_6_N2_positive(:,2); % _V
pr.cyl.Mars.M10{1}   = 10.^Fig_6_Mars_negative_R1(:,1)*L; % _cm_Torr
V_cr.cyl.Mars.M10{1} = 10.^Fig_6_Mars_negative_R1(:,2); % _V
pr.cyl.Mars.M10{2}   = 10.^Fig_6_Mars_positive_R1(:,1)*L; % _cm_Torr
V_cr.cyl.Mars.M10{2} = 10.^Fig_6_Mars_positive_R1(:,2); % _V
pr.cyl.Mars.M10{3}   = 10.^Fig_6_Mars_negative_R2(:,1)*L; % _cm_Torr
V_cr.cyl.Mars.M10{3} = 10.^Fig_6_Mars_negative_R2(:,2); % _V
pr.cyl.Mars.M10{4}   = 10.^Fig_6_Mars_positive_R2(:,1)*L; % _cm_Torr
V_cr.cyl.Mars.M10{4} = 10.^Fig_6_Mars_positive_R2(:,2); % _V

pr.cyl.CO2.M10{1}    = 10.^Fig_7_CO2_negative_positive(:,1)*L; % _cm_Torr
V_cr.cyl.CO2.M10{1}  = 10.^Fig_7_CO2_negative_positive(:,2); % _V
pr.cyl.CO2.M10{2}    = 10.^Fig_7_CO2_positive_negative(:,1)*L; % _cm_Torr
V_cr.cyl.CO2.M10{2}  = 10.^Fig_7_CO2_positive_negative(:,2); % _V
pr.cyl.Mars.M10{5}   = 10.^Fig_7_Mars_negative_positive(:,1)*L; % _cm_Torr
V_cr.cyl.Mars.M10{5} = 10.^Fig_7_Mars_negative_positive(:,2); % _V

clear Fig*

figure('Name','Manning et al., 2010: Paschen curves');
subplot(221)
loglog(...
    pr.sph.CO2.M10 , V_cr.sph.CO2.M10 , 'r--',...
    pr.sph.N2.M10  , V_cr.sph.N2.M10  , 'b-' ,...
    pr.sph.He.M10  , V_cr.sph.He.M10  , 'k:' )
set(gca,'TickDir','out','XMinorGrid','on','YMinorGrid','on')
legend('CO_2','N_2','He','Location','best')
legend boxoff
xlim([1e-2 1e2])
ylim([1e2 1e4])
xlabel('pd (cm.Torr)')
ylabel('V (V)')

subplot(222)
loglog(...
    pr.cyl.N2.M10{2}   , V_cr.cyl.N2.M10{2}   , 'b+-' ,...
    pr.cyl.N2.M10{1}   , V_cr.cyl.N2.M10{1}   , 'b--' ,...
    pr.cyl.Mars.M10{2} , V_cr.cyl.Mars.M10{2} , 'k+-' ,...
    pr.cyl.Mars.M10{4} , V_cr.cyl.Mars.M10{4} , 'r+-' ,...
    pr.cyl.Mars.M10{1} , V_cr.cyl.Mars.M10{1} , 'k--' ,...
    pr.cyl.Mars.M10{3} , V_cr.cyl.Mars.M10{3} , 'r--' )
set(gca,'TickDir','out','XMinorGrid','on','YMinorGrid','on')
legend('N_2 (+)','N_2 (-)','Mars (+,R1)','Mars (+,R2)','Mars (-,R1)','Mars (-,R2)','Location','best')
legend boxoff
xlim([1e-2 1e2])
ylim([1e2 1e4])
xlabel('pd (cm.Torr)')
ylabel('V (V)')

subplot(223)
loglog(...
    pr.sph.Mars.M10{2} , V_cr.sph.Mars.M10{2} ,'r--' ,...
    pr.sph.Mars.M10{1} , V_cr.sph.Mars.M10{1} ,'b-'  ,...
    pr.sph.Mars.M10{3} , V_cr.sph.Mars.M10{3} ,'b-'  ,...
    pr.sph.Mars.M10{4} , V_cr.sph.Mars.M10{4} ,'r--' ,...
    pr.sph.Mars.M10{6} , V_cr.sph.Mars.M10{6} ,'r--' ,...
    pr.sph.Mars.M10{5} , V_cr.sph.Mars.M10{5} ,'b-'  ,...
    pr.sph.Mars.M10{7} , V_cr.sph.Mars.M10{7} ,'b-'  )
legend('-','+','Location','best')
set(gca,'TickDir','out','XMinorGrid','on','YMinorGrid','on')
legend boxoff
xlim([1e-2 1e2])
ylim([1e2 1e4])
xlabel('pd (cm.Torr)')
ylabel('V (V)')

subplot(224)
loglog(...
    pr.cyl.Mars.M10{5} , V_cr.cyl.Mars.M10{5} ,'k-'  ,...
    pr.cyl.CO2.M10{2}  , V_cr.cyl.CO2.M10{2}  ,'r--' ,...
    pr.cyl.CO2.M10{1}  , V_cr.cyl.CO2.M10{1}  ,'r-'  )
legend('Mars (1-,2+)','CO_2 (1+,2-)','CO_2 (1-,2+)','Location','best')
set(gca,'TickDir','out','XMinorGrid','on','YMinorGrid','on')
legend boxoff
xlim([1e-2 1e2])
ylim([1e2 1e4])
xlabel('pd (cm.Torr)')
ylabel('V (V)')

%%
figure('Name','Manning et al., 2010: Original');
subplot(221)
loglog(...
    pr.sph.CO2.M10 /L, V_cr.sph.CO2.M10 , 'r--',...
    pr.sph.N2.M10  /L, V_cr.sph.N2.M10  , 'b-' ,...
    pr.sph.He.M10  /L, V_cr.sph.He.M10  , 'k:' )
set(gca,'TickDir','out','XMinorGrid','on','YMinorGrid','on')
legend('CO_2','N_2','He','Location','best')
legend boxoff
xlim([1e-2 1e2])
ylim([1e2 1e4])
xlabel('p (Torr)')
ylabel('V (V)')
title('Figure 4')

subplot(222)
loglog(...
    pr.cyl.N2.M10{2}   /L, V_cr.cyl.N2.M10{2}   , 'b+-' ,...
    pr.cyl.N2.M10{1}   /L, V_cr.cyl.N2.M10{1}   , 'b--' ,...
    pr.cyl.Mars.M10{2} /L, V_cr.cyl.Mars.M10{2} , 'r+-' ,...
    pr.cyl.Mars.M10{4} /L, V_cr.cyl.Mars.M10{4} , 'k+-' ,...
    pr.cyl.Mars.M10{3} /L, V_cr.cyl.Mars.M10{3} , 'r--' ,...
    pr.sph.Mars.M10{1} /L, V_cr.sph.Mars.M10{1} , 'k--' )
set(gca,'TickDir','out','XMinorGrid','on','YMinorGrid','on')
legend('N_2 (+)','N_2 (-)','Mars (+,R1)','Mars (+,R2)','Mars (-,R1)','Mars (-,R2)','Location','best')
legend boxoff
xlim([1e-2 1e2])
ylim([1e2 1e4])
xlabel('p (Torr)')
ylabel('V (V)')
title('Figure 6')

subplot(223)
loglog(...
    pr.sph.Mars.M10{2} /L, V_cr.sph.Mars.M10{2} , 'r--' ,...
    pr.sph.Mars.M10{1} /L, V_cr.sph.Mars.M10{1} , 'b-'  ,...
    pr.sph.Mars.M10{3} /L, V_cr.sph.Mars.M10{3} , 'b-'  ,...
    pr.sph.Mars.M10{4} /L, V_cr.sph.Mars.M10{4} , 'r--' ,...
    pr.sph.Mars.M10{6} /L, V_cr.sph.Mars.M10{6} , 'r--' ,...
    pr.sph.Mars.M10{5} /L, V_cr.sph.Mars.M10{5} , 'b-'  ,...
    pr.sph.Mars.M10{7} /L, V_cr.sph.Mars.M10{7} , 'b-'  )
legend('-','+','Location','best')
set(gca,'TickDir','out','XMinorGrid','on','YMinorGrid','on')
legend boxoff
xlim([1e-2 1e2])
ylim([1e2 1e4])
xlabel('p (Torr)')
ylabel('V (V)')
title('Figure 5')

subplot(224)
loglog(...
    pr.cyl.Mars.M10{5} /L, V_cr.cyl.Mars.M10{5} ,'k-'  ,...
    pr.cyl.CO2.M10{2}  /L, V_cr.cyl.CO2.M10{2}  ,'r--' ,...
    pr.cyl.CO2.M10{1}  /L, V_cr.cyl.CO2.M10{1}  ,'r-'  )
legend('Mars (1-,2+)','CO_2 (1+,2-)','CO_2 (1-,2+)','Location','best')
set(gca,'TickDir','out','XMinorGrid','on','YMinorGrid','on')
legend boxoff
xlim([1e-2 1e2])
ylim([1e2 1e4])
xlabel('p (Torr)')
ylabel('V (V)')
title('Figure 7')

%%
% pR.CO2.M10   = [pr.sph.CO2.M10 ; pr.cyl.CO2.M10{2}; pr.cyl.CO2.M10{1}];
% Vcr.CO2.M10  = [V_cr.sph.CO2.M10 ; V_cr.cyl.CO2.M10{2}; V_cr.cyl.CO2.M10{1}];
% 
% pR.N2.M10    = [pr.sph.N2.M10  ; pr.cyl.N2.M10{2}; pr.cyl.N2.M10{1}];
% Vcr.N2.M10   = [V_cr.sph.N2.M10  ; V_cr.cyl.N2.M10{2}; V_cr.cyl.N2.M10{1}];
% 
% pR.He.M10    = pr.sph.He.M10;
% Vcr.He.M10   = V_cr.sph.He.M10;
% 
% pR.Mars.M10  = [...
%     pr.cyl.Mars.M10{1} ; pr.cyl.Mars.M10{2} ; pr.cyl.Mars.M10{3} ; pr.cyl.Mars.M10{4} ;...
%     pr.sph.Mars.M10{1} ; pr.sph.Mars.M10{2} ; pr.sph.Mars.M10{3} ; pr.sph.Mars.M10{4} ;...
%     pr.sph.Mars.M10{5} ; pr.sph.Mars.M10{6}; pr.sph.Mars.M10{7}; pr.cyl.Mars.M10{5}];
% 
% Vcr.Mars.M10  = [...
%     V_cr.cyl.Mars.M10{1} ; V_cr.cyl.Mars.M10{2} ; V_cr.cyl.Mars.M10{3} ; V_cr.cyl.Mars.M10{4} ;...
%     V_cr.sph.Mars.M10{1} ; V_cr.sph.Mars.M10{2} ; V_cr.sph.Mars.M10{3} ; V_cr.sph.Mars.M10{4} ;...
%     V_cr.sph.Mars.M10{5} ; V_cr.sph.Mars.M10{6}; V_cr.sph.Mars.M10{7}; V_cr.cyl.Mars.M10{5}];

% figure('Name','Global')
% subplot(121)
% loglog(...
%     pR.CO2.M10  , Vcr.CO2.M10  , 'r+' , ...
%     pR.N2.M10   , Vcr.N2.M10   , 'b+' , ...
%     pR.He.M10   , Vcr.He.M10   , 'g+' , ...
%     pR.Mars.M10 , Vcr.Mars.M10 , 'k+' )
% set(gca,'TickDir','out','XMinorGrid','on','YMinorGrid','on')
% legend('CO_2','N_2','He','Mars','Location','best')
% legend boxoff
% xlim([1e-2 1e2])
% ylim([1e2 1e4])
% xlabel('pd (cm.Torr)')
% ylabel('V (V)')
% 
% subplot(122)
% clear pr V_cr d
% [~,idx]       = sort(pR.CO2.M10);
% pr.CO2.M10    = pR.CO2.M10(idx);
% V_cr.CO2.M10  = Vcr.CO2.M10(idx);
% [~,idx]       = sort(pR.N2.M10);
% pr.N2.M10     = pR.N2.M10(idx);
% V_cr.N2.M10   = Vcr.N2.M10(idx);
% [~,idx]       = sort(pR.He.M10);
% pr.He.M10     = pR.He.M10(idx);
% V_cr.He.M10   = Vcr.He.M10(idx);
% [~,idx]       = sort(pR.Mars.M10);
% pr.Mars.M10   = pR.Mars.M10(idx);
% V_cr.Mars.M10 = Vcr.Mars.M10(idx);
% clear pR Vcr idx
% 
% loglog(...
%     pr.CO2.M10  , V_cr.CO2.M10  , 'r+' , ...
%     pr.N2.M10   , V_cr.N2.M10   , 'b+' , ...
%     pr.He.M10   , V_cr.He.M10   , 'g+' , ...
%     pr.Mars.M10 , V_cr.Mars.M10 , 'k+' )
% set(gca,'TickDir','out','XMinorGrid','on','YMinorGrid','on')
% legend('CO_2','N_2','He','Mars','Location','best')
% legend boxoff
% xlim([1e-2 1e2])
% ylim([1e2 1e4])
% xlabel('pd (cm.Torr)')
% ylabel('V (V)')

save('Manning2010_sorted.mat')