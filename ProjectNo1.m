%% *Project nr. 1.*
% _Groupe 3. Tobias*Eirik*Eirik_
%
% |Abstract:| 
% 
%
%% *Substitutional-self diffusion, derive analytical solution*
%
% https://link.springer.com/content/pdf/bbm%3A978-1-4020-7860-6%2F1.pdf
%
% $$C(x,t)=\frac{C_1+C_2}{2}-\frac{C_1+C_2}{2}\cdot erf \big( \frac{x}{2\sqrt{Dt}} \big)$$ 
%

%% *Substitutional-self diffusion, Anlytical solution*

clear all
close all

T = 1273;   %[K]
R = 8.1345; % ?

D0_Ni = 190*10^-3; % [m^2/s] 
D0_Cu = 31*10^-3;  % [m^2/s] 

Q_Ni = 200.3*1000;  % [j/mol]
Q_Cu =  279.7*1000; % [j/mol]

% Equation for  diffusion:
D_Ni = D0_Ni*exp(-Q_Ni/(R*T)); % enhet 
D_Cu  = D0_Cu*exp(-Q_Ni/(R*T)); % enhet

C1 = 1; % Initial cond. 
C2 = 0; % Initial cond. 

% Analytical solution of ficks law:
funCxt = @(x,t,D) (C1 + C2)/2 - ((C1 - C2)/2) * erf(x/(D*t));

t = 0;    % [s]
dt = 1000;  % [s]
C = [];     % [quantity m^3] composition
x = linspace(-1,1,1000)*10^-3; % [m] position

i = 0;

while t < 30*60*60 % [s] run for 30 hours
i = i +1;  
	for j = 1:length(x)
        if x(j) > 0
            D = D_Ni;
        else
            D = D_Cu;
        end  
        C(i,j) = funCxt(x(j),t(i),D); 
    end 
t(i+1) = t(i) + dt;
end

% Plotting consentration profile at 5 different times:
j = 1;
for i = floor(linspace(1,(length(t)-1),5))
    legends{j} = [num2str(round(t(i)/60/60,3)),' hours'];
    j = j+1; % counter for legend
    plot(x,C(i,:))
    hold on
end

title('Concentrationprofile in bar')
xlabel('x [mm] ?? blir det riktig med mm???')
legend(legends)

%%
%  Vi kan se at profilen er symmetrisk om midtpunktet av baren.. blablabla

%% *Substitutional-self diffusion, Numerical solution*