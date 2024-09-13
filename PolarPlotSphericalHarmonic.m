% Matlab Code to Plot Spherical Harmonics 

% Define the range of theta and phi
theta = linspace(0, pi, 100);
phi = linspace(0, 2*pi, 100);

% Create a grid for plotting
[phi, theta] = meshgrid(phi, theta);

% Plot the spherical harmonics for different l and m values
figure;

% Colors for positive and negative parts
colors = [0 0 1; 1 1 0]; % blue and yellow

% Define the normalization constant for spherical harmonics
normalize = @(l, m) sqrt((2*l+1)/(4*pi) * factorial(l-abs(m))/factorial(l+abs(m)));

% Plot the spherical harmonics
plot_idx = 1;
for l = 0:2
    for m = -l:l
        % Calculate the spherical harmonics
        Plm = legendre(l, cos(theta));
        
        % Extract the required Plm term
        if m >= 0
            Plm = squeeze(Plm(m+1, :, :));
            Y = normalize(l, m) * Plm .* cos(m * phi);  % use real part
        else
            Plm = squeeze(Plm(abs(m)+1, :, :));
            Y = normalize(l, abs(m)) * Plm .* sin(abs(m) * phi);  % use imaginary part
        end

        % Calculate the radius (use absolute value for normalization)
        R = abs(Y);

        % Convert to Cartesian coordinates
        x = R .* sin(theta) .* cos(phi);
        y = R .* sin(theta) .* sin(phi);
        z = R .* cos(theta);

        % Plot the surface
        subplot(3, 5, plot_idx);
        surf(x, y, z, Y);
        shading interp;
        colormap(colors);
        caxis([-1 1]); % normalize color axis to make blue and yellow as per given
        axis equal;
        axis off;
        title(['l=' num2str(l) ', m=' num2str(m)], 'Interpreter', 'tex');
        plot_idx = plot_idx + 1;
    end
end


