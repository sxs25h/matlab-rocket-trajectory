%% %% ROCKET EXPERIMENT COMPARISON
clear;
clc;
close all;

% Maximum altitude from each experiment (m)
baseline = 792.55;
increasedThrust = 1178.76;
increasedDrag = 756;

altitudes = [baseline, increasedThrust, increasedDrag];
labels = {'Baseline', 'Increased Thrust', 'Increased Drag'};

% Plot results
figure;
bar(altitudes);
xticks(1:3);
xticklabels(labels);
ylabel('Maximum Altitude (m)');
title('Rocket Performance Comparison');
grid on;

% Calculate percentage changes from baseline
thrustChange = ...
    (increasedThrust - baseline) / baseline * 100;

dragChange = ...
    (increasedDrag - baseline) / baseline * 100;

fprintf('Thrust experiment altitude change: %.2f%%\n', ...
    thrustChange);
fprintf('Drag experiment altitude change: %.2f%%\n', ...
    dragChange);
