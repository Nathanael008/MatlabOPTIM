% Cylinder Optimization Tool
% Goal: Minimize the surface area of a cylinder for a constant volume.
% Volume (V) = 100 ml = 100,000 mm^3
% Diameter (d) range: 5 mm to 100 mm

% 1. Define constants
target_volume = 100000; % in mm^3 (100 ml)

% 2. Create an optimization problem
% We use the problem-based approach which is more intuitive.
prob = optimproblem('Description', 'Cylinder Surface Area Minimization');

% 3. Define optimization variables
% 'h' is height, 'd' is diameter.
% Diameter is constrained between 5 mm and 100 mm.
% Height must be positive, so we set a lower bound of 0.1 for stability.
d = optimvar('d', 'LowerBound', 5, 'UpperBound', 100);
h = optimvar('h', 'LowerBound', 0.1);

% 4. Define the Objective Function (Surface Area)
% Surface Area = 2 * (Area of base) + (Circumference * height)
% SA = 2 * (pi * (d/2)^2) + (pi * d * h)
% SA = (pi * d^2 / 2) + pi * d * h
prob.Objective = (pi * d^2 / 2) + pi * d * h;

% 5. Define Constraints (Constant Volume)
% Volume = (Area of base) * height
% V = (pi * (d/2)^2) * h
% V = (pi * d^2 / 4) * h
prob.Constraints.vol = (pi * d^2 / 4) * h == target_volume;

% 6. Set an initial guess
% Let's start with a reasonable guess, e.g., a cube-like cylinder.
x0.h = 50;
x0.d = 50;

% 7. Solve the problem
% 'solve' will automatically choose the best solver (likely fmincon).
[sol, fval, exitflag, output] = solve(prob, x0);

% 8. Display Results
fprintf('\n--- Optimization Results ---\n');
fprintf('Optimal Height (h):   %.2f mm\n', sol.h);
fprintf('Optimal Diameter (d): %.2f mm\n', sol.d);
fprintf('Minimum Surface Area: %.2f mm^2\n', fval);
fprintf('Number of Iterations: %d\n', output.iterations);

% Verify the volume
calculated_volume = (pi * sol.d^2 / 4) * sol.h;
fprintf('Calculated Volume:    %.2f mm^3 (Target: %.2f mm^3)\n', ...
    calculated_volume, target_volume);

% 9. Visualization
figure('Name', 'Cylinder Optimization Visualization');
d_range = linspace(5, 100, 200); % Range of diameters
h_range = target_volume ./ (pi * d_range.^2 / 4); % Corresponding heights for constant volume
sa_range = (pi * d_range.^2 / 2) + pi * d_range .* h_range; % Corresponding surface areas

plot(d_range, sa_range, 'LineWidth', 2, 'Color', [0, 0.4470, 0.7410]);
hold on;
plot(sol.d, fval, 'ro', 'MarkerSize', 10, 'MarkerFaceColor', 'r'); % Mark the optimal point
grid on;

title('Surface Area vs. Diameter (Constant Volume = 100 ml)');
xlabel('Diameter (d) [mm]');
ylabel('Surface Area (SA) [mm^2]');
legend('Surface Area', 'Optimal Point');

% Optional: Set axis limits for better viewing
ylim([min(sa_range)*0.9, max(sa_range)*1.1]);

fprintf('\nVisualization graph generated.\n');
