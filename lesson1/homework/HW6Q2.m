%
% Venkatraman Renganathan 
% MECH 6325 - Optimal Estimation & Kalman Filtering, Term: Fall 2019
% MATLAB Code for HW6Q2 
%
clear; clc; close all;

%% Problem Data
H  = [1 0]; % Output Matrix
Qw = 1;     % Process Noise Covariance
Q  = [Qw 0; % Augmented Process Noise Covariance diag(Qw,Q_phi),Q_phi = 0
      0 0];
N  = 100;   % Simulation Time Steps

% Initial values
x       = 1;
Pplus   = eye(2);
phiTrue = 0.9;
xHat    = 0;
phiHat  = 0;
varPhi  = [phiHat];
% Simulate the Discrete-Time EKF
for i = 1:N            
    x      = phiTrue*x + sqrt(Qw).*randn; % x = phi*x + w, w~(0,1)
    y      = x;
    F      = [phiHat xHat;
              0      1];
    Pminus = F*Pplus*F' + Q;
    xHat   = phiHat*xHat;    
    K      = Pminus*H'*inv(H*Pminus*H');
    z      = [xHat; phiHat];
    z      = z + K*(y - xHat);
    xHat   = z(1);
    phiHat = z(2);
    Pplus  = (eye(2) - K*H)*Pminus;
    % Store Value of phiHat
    varPhi = [varPhi phiHat];
end
% Plot the results
figure;
timeVec = 0:N;
plot(timeVec, varPhi);
hold on;
plot(timeVec, phiTrue*ones(N+1,1)); 
set(gca,'FontSize',12); set(gcf,'Color','White'); set(gca,'Box','on');
xlabel('time step(k)','interpreter','latex');
ylabel('$\hat{\phi}_{k}$','interpreter','latex');
legend('$\hat{\phi}_{k}$', '$\phi_{true}$','interpreter','latex');
a = findobj(gcf, 'type', 'axes');
h = findobj(gcf, 'type', 'line');
set(h, 'linewidth', 4);
set(a, 'linewidth', 4);
set(a, 'FontSize', 30);
set(gca,'TickLabelInterpreter','latex');
