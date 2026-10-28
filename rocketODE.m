function dydt = rocketODE(t,y,p)
% ROCKETODE equations of motion for vertical rocket flight
% y(1)= altitude(m)
% y(2)= vertical velocity(m/s)

h=max(y(1),0);
v =y(2);

% Atmospheric density
rho = p.rho0 *exp(-h/p.H);

% Drag opposes the direction of motion 
D=0.5*rho*p.Cd*p.A*v*abs(v);

% Thrust and mass during powered flight 
if t<p.tb
    T =p.T;
    m =p.m0-p.mdot*t;
else
    T =0;
    m =p.mdry;
end

% Equations of motion 
dhdt=v;
dvdt =(T-m*p.g-D)/m;

% Return derivatives as a column vector
dydt= [dhdt;dvdt];

end

