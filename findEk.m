function [Ek] = findEk(E0,ng,Tg,species,file)
options = optimset('Display','iter','UseParallel',1,'TolX',1e-4);%,'PlotFcns',{@optimplotx,@optimplotfval});%,'FunValCheck','on','TolX',1e-5,'TolFun',1e-10,
% Emin = 50;
% Emax = 300;
myfun = @(E)alpha_eff(E,ng,Tg,species,file);
% [Emin alpha_min] = fminbnd(myfun,Emin,Emax);
[Ek, ~, exitflag] = fzero(myfun,E0,options);
if(exitflag<0)
    Ek=-1;
    warning('Ek/N not found')
end
end