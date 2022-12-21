function []=editBOLSIGinput(varname, varvalue, file)
% clear
% close all
% clc
% varname = 'GasMixture';
% varvalue.names = 'CO CO2 H He N N2 O';
% varvalue.fractions = [0    0.9643         0         0         0    0.0357         0];
% file.input = 'input.dat';
% file.output = 'Venus.dat';
% %stop

% Read txt into cell A
fid = fopen(file.input,'r');

i                = 1;
index            = [];
idx.COLLISIONS   = 0;
idx.CONDITIONS   = 0;
idx.RUN          = 0;
idx.SAVERESULTS  = 0;
tline            = fgetl(fid);
A{i}             = tline;
while ischar(tline)
    i = i+1;
    tline = fgetl(fid);
    if strcmp(tline,'READCOLLISIONS')
        index = [index, i] ;
    elseif strcmp(tline,'RUN')
        idx.RUN              = i;
        idx.SpeciesFractions = i-3;
        % idx.SeriesVariable   = i+1;
        % idx.SeriesRange      = i+2;
        % idx.SeriesInstances  = i+3;
    elseif strcmp(tline,'SAVERESULTS')
        idx.SAVERESULTS = i;
        idx.OutputFile  = i+1;
    elseif strcmp(tline,'CONDITIONS')
        idx.CONDITIONS = i;
        idx.E          = i+1;
        idx.Tg         = i+4;
        idx.ne         = i+8;
    end
    A{i} = tline;
end
fclose(fid);

idx.READCOLLISIONS = min(index);
% idx.CollisionFile  = i+1;
% idx.SpeciesNames   = i+2;


if strcmp(varname,'E')
    %% change the electric field
    E = sprintf('%05.2f / Electric field / N (Td)',varvalue);
elseif strcmp(varname,'Tg')
    %% change the neutral gas temperature
    Tg = sprintf('%05.2f / Gas temperature (K)',varvalue);
elseif strcmp(varname,'ne')
    %% change the plasma density
    ne = sprintf('%05.2f / Plasma density (1/m3)',varvalue);
elseif strcmp(varname,'GasMixture')
    %% Gas mixture
    % Search collision files
    spec.name                  = allwords(varvalue.names);
    spec.nb                    = numel(spec.name);
    spec.extrapolate           = 1; % allow extrapolation of crosssections
    collisions.text{5*spec.nb} = [];
    for i=1:spec.nb
        spec.file{i}           = 'Xsec.txt';['Xsec',spec.name{i},'.txt']; %'Earth-collision.txt'; %
        assert( exist( spec.file{i},'file' ) == 2, 'File not found for this cross-section.' );
    end
    for i = 1:spec.nb
        collisions.text{(i-1)*5+1} = 'READCOLLISIONS';
        collisions.text{(i-1)*5+2} = spec.file{i};
        collisions.text{(i-1)*5+3} = [spec.name{i},...
            '          / Species'];
        collisions.text{(i-1)*5+4} = [num2str(spec.extrapolate),...
            '          / Extrapolate: 0= No 1= Yes'];
        collisions.text{(i-1)*5+5} = '';
    end
    
    % Get mole fractions
    if (length(varvalue.fractions)~=length(spec.name))
        error('Dimension mismatch: # species ~= #  mole fractions');
    end
    
    spec.mixture = num2str(varvalue.fractions(1));
    if spec.nb>1
        for i=2:spec.nb
            spec.mixture = [spec.mixture, ' ', num2str(varvalue.fractions(i))];
        end
    end
    
    spec.mixture = [spec.mixture, ' / ', varvalue.names, ' mole fractions'];
end


%% Create new input file
% Initiation
for i=1:idx.READCOLLISIONS-1
    B{i} = A{i};
end

% Collisions
if strcmp(varname,'GasMixture')
    for i=1:5*spec.nb
        B{end+1} = collisions.text{i};
    end
else
    for i=idx.READCOLLISIONS:idx.CONDITIONS-1
        B{end+1} = A{i};
    end
end

idx.cnd.B = numel(B)+1;
% Conditions
for i=idx.CONDITIONS:idx.RUN-1
    B{end+1} = A{i};
end

if strcmp(varname,'E')
    B{idx.cnd.B+1}  = E;
elseif strcmp(varname,'Tg')
    B{idx.cnd.B+4}  = Tg;
elseif strcmp(varname,'ne')
    B{idx.cnd.B+8}  = ne;
elseif strcmp(varname,'GasMixture')
    B{idx.cnd.B+21} = spec.mixture;
end

% Execution
for i=idx.RUN:idx.SAVERESULTS-1
    B{end+1} = A{i};
end

% Storage
B{end+1} = A{idx.SAVERESULTS};
B{end+1} = sprintf('%s',file.output);
for i=idx.SAVERESULTS+2:length(A)
    B{end+1} = A{i};
end

%% Write cell A into txt
fid = fopen(file.input, 'w');
for i = 1:numel(B)
    if B{i+1} == -1
        fprintf(fid,'%s', B{i});
        break
    else
        fprintf(fid,'%s\n', B{i});
    end
end
fclose(fid);
end
