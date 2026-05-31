function live_3D_beam(theta, phi)
    % Keep variables alive between simulation steps
    persistent hArray hSteer hFig counter
    
    % Initialize the array, steering vector, and figure on the first step
    if isempty(hFig) || ~isvalid(hFig)
        hFig = figure('Name', 'Live 5G Beam Tracker', 'NumberTitle', 'off', 'Color', 'k');
        
        % Physics parameters
        fc = 28e9;
        c = 3e8;
        lambda = c / fc;
        
        % 1. Create the base Uniform Rectangular Array (URA)
        hArray = phased.URA('Size', [8, 8], 'ElementSpacing', [lambda/2, lambda/2]);
        
        % 2. Create the Steering Vector to calculate phase shifts
        hSteer = phased.SteeringVector('SensorArray', hArray, 'PropagationSpeed', c);
        
        % Initialize frame counter
        counter = 0;
    end
    
    % Increment frame counter
    counter = counter + 1;
    
    % FRAME LIMITER: Update every 100 simulation steps (10 FPS)
    if mod(counter, 100) == 0
        
        % 3. Calculate the complex phase weights (The line I forgot!)
        w = hSteer(28e9, [theta; phi]);
        
        % 4. Draw the 3D pattern (with DynamicRange set to 15 to hide sidelobes)
        pattern(hArray, 28e9, 'PropagationSpeed', 3e8, 'Weights', w, ...
            'CoordinateSystem', 'polar', 'Type', 'powerdb');
        
        % --- THE SMOOTH ANIMATION FIX ---
        ax = gca;
        
        % Lock the camera viewing angle (Azimuth 40°, Elevation 25°)
        view(ax, 40, 25); 
        
        % Hard-lock the grid limits based on absolute power
        xlim(ax, [-40 40]);
        ylim(ax, [-40 40]);
        zlim(ax, [0 40]); % Cuts off sidelobes below 0 dB natively!% Z is positive because the planar array faces "up"
        
        % Stop MATLAB from stretching the axes to fit the window
        axis(ax, 'manual');
        % --------------------------------
        
        % Add a dynamic title
        title(sprintf('ESC Beam Steering: Az = %.1f°, El = %.1f°', theta, phi));
        
        % Force MATLAB to draw it immediately without freezing
        drawnow limitrate;
    end
end