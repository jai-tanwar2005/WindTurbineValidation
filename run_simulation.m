
clc;
clear;
close all;

% Controller settings
target = 12;
current = 5;
responseRate = 0.2;
steps = 30;

% Store simulation results
output = zeros(1, steps);

% Run the controller for 30 steps
for k = 1:steps
    current = controller_step(target, current, responseRate);
    output(k) = current;
end

% Plot the results
figure;
plot(1:steps, output, '-o', 'LineWidth', 1.5);
hold on;
yline(target, '--r', 'Target');

xlabel('Simulation Step');
ylabel('Output Value');
title('Simplified Controller Response');
legend('Simulated Output', 'Target');
grid on;

% Validate the simulation
assert(all(isfinite(output)), 'Output contains invalid values.');
assert(all(diff(output) > 0), 'Output should increase.');
assert(output(end) < target, 'Unexpected final output.');

fprintf('Simulation completed successfully.\n');
fprintf('Initial value: %.2f\n', 5);
fprintf('Final value: %.4f\n', output(end));
fprintf('Target value: %.2f\n', target);
