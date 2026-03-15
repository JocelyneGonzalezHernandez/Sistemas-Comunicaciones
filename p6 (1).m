figure(1) 
num = [10 100 0]; 
den = [1 101 100]; 
H = tf(num, den); 
bode(H, 'r'), grid 

t = -3:0.1:3; % para 3sin 
%t = -3:0.01:3; % para 4cos 
%t = -3:0.1:3; % para 2*sin 

%signal = 2.*sin((0.1).*t + 30); 
%signal = 4.*cos(10.*t + 30); 
signal = 3.*sin(1000.*t + 20); 

% Multiply the signal by the transfer function 
filtered_signal = lsim(H, signal, t); 

% Calculate the phase of the filtered signal in degrees 
phase_filtered_rad = unwrap(angle(filtered_signal)); 
phase_filtered_deg = rad2deg(phase_filtered_rad); 

% Plot the original signal and the filtered signal 
figure; 
plot(t, signal, 'b', 'LineWidth', 2); % Original signal in blue 
hold on; 
plot(t, filtered_signal, 'r', 'LineWidth', 2); % Filtered signal in red 
hold off; 

% Set plot properties 
xlabel('Time'); 
ylabel('Magnitude'); 
title('Filtered Signal vs Original'); 
legend('Original Signal', 'Filtered Signal'); 
grid on; 

  
% Plot the phase of the filtered signal in degrees 
figure; 
plot(t, phase_filtered_deg, 'r', 'LineWidth', 2); 
xlabel('Time'); 
ylabel('Phase (degrees)'); 
title('Phase of Filtered Signal'); 
grid on;  