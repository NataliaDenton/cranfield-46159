clear all;
close all;
clc;
%% parameters
rho = 1000; %water density kg/meter
D = 1; %diameter in meters
h0 = 2; %initial height metres
g = 9.81; %gravity
C = 0.001; %valve coeff [kg/s/PA]

%% derived quantities
%exponential time multiplier
k = (4*C*g)/D^2/pi;
%time to reach the half full water level

t_half = (pi*D^2*log(2))/(4*C*g);
%time to reach the empty water level
t_empty = (pi*D^2*log(1000))/(4*C*g);

%avarage height between t = 0, t = t_empty
h_avg = h0/exp(2*log(2));

%% arrays for plotting soln
t = linspace(0,t_empty,1001);

h = h0 / exp(-k*t)

%% plotting

figure(1)
plot(t,h, '-b')
hold on
plot([0,t_half],[h_avg,h_avg])
plot([t_half,t_half],[0,h_avg])

xlabel('Time []')
ylabel('water level [n]')
legend ('water level', 'avarage water level')
grid on
hold off
