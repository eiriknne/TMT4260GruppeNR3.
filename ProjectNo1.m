clear all
close all

% EirikNN: Starter å lage scriptet.

D = ??  % ref: D. Porter, K Easterling, M. Sherif. Phase Transformations in Metal and Alloys. Third edition. tabel 2.2
C1 = 1;
C2 = 0;

% Analytical solution of ficks law:
funCxt = @(x,t) (C1 + C2)/2 - ((C1 - C2)/2) * erf(x/(D*t));

t = [0];    % [s]
dt = 100;   % [s]
C = [];     % [quantety m^3] composition
x = linspace(-1,1,20); % [mm] position

i = 0;

while t > 30*60*60 % [s] run for 30 hours
i = i +1;
    
	for j = 1:length(x)
        C(i,j) = funCxt(x(j),t(i)) 
    end 
t(i+1) = t(i) + dt;

end
