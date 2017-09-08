%% *Project nr. 1.*
% _Groupe 3. Tobias*Eirik^2_
%
% |Abstract:| 
% 
%
%% *Substitutional-self diffusion, derive analytical solution*
%
% $$C(x,t)=\frac{C_1+C_2}{2}-\frac{C_1+C_2}{2}\cdot erf \big( \frac{x}{2\sqrt{Dt}} \big)$$ 
%

%% *Substitutional-self diffusion, Anlytical solution*

clear all
close all

<<<<<<< HEAD
D_Ni = 10^-5; % ref: D. Porter, K Easterling, M. Sherif. Phase Transformations in Metal and Alloys. Third edition. tabel 2.2
D_Cu = ???;

=======
D = 10^-5; % ref: D. Porter, K Easterling, M. Sherif. Phase Transformations in Metal and Alloys. Third edition. table 2.2
>>>>>>> 0583d2532ab2bb1fc9dfd88410b5677b5eab506a
C1 = 1;
C2 = 0;

% Analytical solution of ficks law:
<<<<<<< HEAD
funCxt = @(x,t,D) (C1 + C2)/2 - ((C1 - C2)/2) * erf(x/(D*t));
%vi tester en endring. 
=======
funCxt = @(x,t) (C1 + C2)/2 - ((C1 - C2)/2) * erf(x/(D*t));

>>>>>>> 0583d2532ab2bb1fc9dfd88410b5677b5eab506a

t = 0;    % [s]
dt = 1000;  % [s]
C = [];     % [quantity m^3] composition
x = linspace(-1,1,50); % [mm] position

i = 0;

while t < 30*60*60 % [s] run for 30 hours
i = i +1;  
	for j = 1:length(x)
        if x(j) > 0
            D = D_Ni;
        else
            D = D_Cu;
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