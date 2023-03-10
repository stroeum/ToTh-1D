clear
close all
clc

CO2_0_57 = [...
    94.677, 660.26;...
    192.15, 660.26;...
    94.685, 656.59;...
    197.15, 639.64;...
    197.16, 638.07;...
    294.65, 629.50;...
    294.68, 616.40;...
    294.70, 606.79;...
    399.48, 587.84;...
    399.49, 583.44;...
    399.50, 579.73;...
    496.56, 543.22;...
    496.56, 541.70;...
    496.57, 536.59;...
    593.32, 527.11;...
    600.50, 522.76;...
    697.22, 525.69;...
    697.23, 523.42;...
    697.15, 515.42;...
    799.58, 515.42;...
    792.49, 526.58;...
    800.63, 525.62;...
    897.50, 520.54;...
    898.38, 530.88;...
    898.38, 533.66;...
    994.34, 528.59;...
    994.31, 540.27;...
    994.31, 541.80;...
    1098.4, 533.76;...
    1097.5, 543.23;...
    1097.5, 547.73;...
    1201.6, 544.67;...
    1201.6, 552.71;...
    1201.6, 557.12;...
    1298.4, 550.6;...
    1298.4, 567.36;...
    1387.9, 560.74;...
    1387.9, 575.36;...
    1387.9, 580.62;...
    1498.7, 564.43;...
    1498.6, 586.28;...
    1498.6, 588.52;...
    1594.5, 575.49;...
    1594.5, 592.21;...
    1595.7, 597.34;...
    1692.4, 590.65;...
    1692.4, 601.66;...
    1692.4, 605.28;...
    1795.1, 606.73;...
    1795.1, 599.49;...
    1795.1, 590.65;...
    1899.2, 591.37;...
    1899.2, 606.73;...
    1899.2, 611.22;...
    1989.5, 615.56;...
    1989.5, 613.39;...
    1989.6, 609.62;...
    2092.3, 607.45;...
    2092.3, 616.29;...
    2092.2, 629.47;...
    2196.3, 622.08;...
    2196.3, 628.74;...
    2196.3, 630.19;...
    2320.9, 626.72;...
    2320.9, 629.47;...
    2320.9, 639.61;...
    2389.4, 632.37;...
    2389.4, 635.26;...
    2389.4, 644.10;...
    2501.7, 632.36;...
    2500.3, 645.55;...
    2500.3, 652.06;...
    2590.7, 650.62;...
    2590.7, 655.69;...
    2592.0, 660.18;...
    2686.5, 660.32;...
    2686.6, 655.69;...
    2797.5, 654.24;...
    2687.8, 682.19;...
    2798.7, 676.36;...
    2797.9, 684.40;...
    2895.5, 684.40;...
    2895.5, 691.63;...
    2894.7, 692.43;...
    2992.3, 687.31;...
    2991.5, 684.31;...
    2992.3, 675.57];

CO2_2_44 = [...
    74.651, 729.74;...
    67.577, 719.40;...
    74.681, 715.81;...
    95.695, 669.68;...
    94.656, 654.25;...
    102.18, 649.14;...
    122.87, 600.21;...
    123.64, 594.49;...
    122.83, 590.77;...
    144.19, 569.61;...
    143.69, 556.47;...
    150.86, 557.13;...
    171.48, 548.32;...
    171.62, 550.62;...
    171.61, 555.59;...
    200.27, 544.65;...
    199.43, 546.16;...
    219.59, 551.32;...
    219.58, 552.83;...
    199.41, 557.27;...
    219.56, 561.54;...
    240.58, 557.18;...
    248.14, 560.83;...
    247.28, 567.31;...
    269.13, 566.60;...
    268.29, 567.40;...
    296.01, 576.20;...
    296.83, 581.27;...
    268.26, 582.78;...
    295.97, 590.78;...
    323.71, 590.69;...
    323.70, 591.49;...
    323.68, 598.91;...
    344.75, 598.81;...
    420.43, 599.52;...
    344.74, 604.59;...
    344.74, 607.63;...
    371.56, 606.81;...
    371.55, 613.40;...
    400.28, 615.63;...
    420.39, 618.47;...
    448.17, 619.28;...
    420.39, 619.28;...
    392.61, 619.28;...
    371.53, 622.11;...
    392.59, 626.57;...
    448.14, 631.64;...
    475.92, 630.22;...
    469.20, 637.51;...
    420.35, 638.22;...
    441.39, 653.72;...
    475.87, 654.33];

figure('Name','[Stumbo, 2013, Fig. 5]')
plot(CO2_0_57(:,1),CO2_0_57(:,2),'r+',CO2_2_44(:,1),CO2_2_44(:,2),'b+')
xlabel('p_{CO_2} (mTorr)')
ylabel('V (V)')
set(gca,'XTick',0:500:3000,'YTick',500:50:750,'XMinorTick','on','YMinorTick','on','TickDir','out')