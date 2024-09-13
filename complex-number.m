% MATLAB code to visualize complex numbers and their phase

% Create a figure window
figure;

% Define a grid of real and imaginary parts
reals = linspace(-2, 2, 5); % Real parts
imags = linspace(-2, 2, 5); % Imaginary parts

% Create a mesh of complex numbers
[Re, Im] = meshgrid(reals, imags);
complexNumbers = Re + 1i * Im;

% Calculate magnitudes and phases
magnitudes = abs(complexNumbers);
phases = angle(complexNumbers);

% Visualizing the complex numbers
subplot(1, 2, 1);
compass(complexNumbers(:), 'r'); % Compass plot shows the phase and magnitude
title('Complex numbers on the complex plane');
xlabel('Real Part');
ylabel('Imaginary Part');

% Visualizing the magnitude and phase separately
subplot(1, 2, 2);
polarplot(phases(:), magnitudes(:), 'o'); % Polar plot to show the magnitudes and phases
title('Magnitude and Phase of Complex Numbers');
rlim([0 max(magnitudes(:)) + 1]);

% Adjusting the polar plot to better visualize the phases
ax = gca;
ax.ThetaZeroLocation = 'top';
ax.ThetaDir = 'clockwise';

sgtitle('Visualization of Complex Numbers and Phases');
