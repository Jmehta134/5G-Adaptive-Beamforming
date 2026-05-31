%% 1. System & Array Parameters
fc = 28e9;                  % Carrier frequency (28 GHz for 5G mmWave)
c = physconst('LightSpeed');% Speed of light
freq_range = [20e9, 40e9];  % Array operating range from 20 GHz to 40 GHz
lambda = c / fc;            % Wavelength
M = 8;                      % Number of rows in Uniform Planar Array (UPA)
N = 8;                      % Number of columns in UPA
dx = lambda / 2;            % Element spacing (x-axis)
dy = lambda / 2;            % Element spacing (y-axis)

%% 2. Scenario Parameters (User Movement Limits)
sim_time = 10;              % Total simulation time (seconds)
sample_time = 1e-3;         % 1 millisecond solver step size

%% 3. Extremum Seeking Control (ESC) Parameters
% We will fine-tune these later, but we need them in the workspace now.
omega_theta = 2 * pi * 50;  % Dither frequency for Azimuth (50 Hz)
omega_phi = 2 * pi * 70;    % Dither frequency for Elevation (70 Hz) 
% Note: Frequencies must be different!

a_theta = 1.5;              % Dither amplitude for Azimuth (degrees)
a_phi = 1.5;                % Dither amplitude for Elevation (degrees)

k_theta = 100;               % Integrator learning rate (Azimuth)
k_phi = 100;                 % Integrator learning rate (Elevation)

%% 4. Stateflow Transition Thresholds
Thresh_Acq = 0.5;   % Power required to lock on and start tracking
Thresh_Drop = 0.45;   % Power drop that triggers a lost-signal recovery