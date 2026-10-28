%% ROCKET TRAJECTORY SIMULATOR
% Author: Sofia Silva
% Description: Simulates vertical rocket ascent and coasting
% Language: MATLAB
% Units: SI (m, kg, s, N)
%
% Features:
% - Variable rocket mass during powered ascent
% - Gravitational acceleration
% - Atmospheric density variation with altitude
% - Aerodynamic drag
% - Apogee detection using an ODE event function
%
% Limitations:
% - Vertical flight only
% - Constant thrust during powered flight
% - Simplified atmospheric model
% - No wind or steering
% Vertical rocket flight with thrust, mass loss, and drag
% Units: SI (m, kg, s, N)

clear;
clc;
close all;

%% 1. Define rocket and environment

p.g = 9.81;          % Gravity (m/s^2)
p.m0 = 100;          % Initial mass (kg)
p.mp = 40;           % Propellant mass (kg)
p.mdry = p.m0-p.mp;  % Dry mass (kg)

p.T=2500;           
p.tb = 5;             % Burn duration (s)
p.mdot = p.mp/p.tb;  % Mass flow rate (kg/s)

p.Cd = 0.5;           % Drag coefficient
p.A = 0.03;           % Reference area (m^2)
p.rho0 = 1.225;       % Sea-level air density (kg/m^3)
p.H = 8500;           % Atmospheric scale height (m)

%% 2. Simulate powered flight

y0 = [0; 0];          % Initial altitude and velocity
opts = odeset('RelTol',1e-8,'AbsTol',1e-9);

[t1,Y1] = ode45(@(t,y) rocketODE(t,y,p), ...
    [0 p.tb], y0, opts);

h_cut = Y1(end,1);    % Burnout altitude (m)
v_cut = Y1(end,2);    % Burnout velocity (m/s)

%% 3. Simulate coasting until apogee

pc=p;
pc.T =0;
pc.mdot=0;
pc.m0 = p.mdry;

opts_coast= odeset(opts,'Events',@apogeeEvent);

[t2,Y2]= ode45(@(t,y) rocketODE(t,y,pc),...
    [p.tb p.tb+300],[h_cut;v_cut],opts_coast);

%%  4.Combine flight phases
 t=[t1;t2(2:end)];
 Y=[Y1;Y2(2:end,:)];

h= Y(:,1);
v= Y(:,2);

m =p.m0-p.mdot*min(t,p.tb);
m(t>=p.tb)= p.mdry;

%% 5.Display results

%% 5. DISPLAY PERFORMANCE RESULTS

fprintf('\n====================================\n');
fprintf('     ROCKET SIMULATION RESULTS\n');
fprintf('====================================\n');

fprintf('Burnout altitude:   %8.2f m\n', h_cut);
fprintf('Burnout velocity:  %8.2f m/s\n', v_cut);
fprintf('Maximum altitude:  %8.2f m\n', max(h));
fprintf('Time to apogee:    %8.2f s\n', t(end));

fprintf('====================================\n');

%% 6.Plot altitude

figure;
plot(t,v,'LineWidth',2);
xlabel('Time(s)');
ylabel('Altitude(m)');
title('Rocket Altitude vs.Time');
grid on;
set(gca, 'FontSize',12);

%% 7.Plot velocity

figure
plot(t,v,'LineWidth',2);
xlabel('Time(s)');
ylabel('Vertical Velocity (m/s)');
title('Rocket Velocity vs.Time');
grid on;
set(gca, 'FontSize',12);

%% 8.Plot mass

figure;
plot(t,v,'LineWidth',2);
xlabel('Time(s)');
ylabel('Mass(kg)');
title('Rocket Mass vs. Time');
grid on;
set(gca, 'FontSize',12);

