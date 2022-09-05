% Plot Cart Angles and Positions for Lab 1 - Inverted Pendulum (z5260252)

load('Lab_Data/z5260252.mat'); % Load experimental data

figure(1);

% Plot Cart Position
subplot(2,1,1);
hold on;
grid on;
title('Cart Position');
xlabel('Time (s)');
ylabel('Position (mm)');
plot(CartPositions(:,1),CartPositions(:,2)); % Time vs Setpoints
plot(CartPositions(:,1),CartPositions(:,3)); % Time vs ExData
plot(CartPositions(:,1),CartPositions(:,4)); % Time vs SimData
legend('Set Points','Experimental Data','Simulation Data');
hold off;

% Plot Pendulum Angle
subplot(2,1,2);
hold on;
grid on;
title('Pendulum Angle');
xlabel('Time (s)');
ylabel('Angle (degs)');
plot(CartAngles(:,1),CartAngles(:,2)); % Time vs ExData
plot(CartAngles(:,1),CartAngles(:,3)); % Time vs SimData
legend('Experimental Data','Simulation Data');
hold off;