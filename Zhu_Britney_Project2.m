% AMS 595 Project 2:
% This is the main script to approximate the rough circumference or the coastline length of a
% Mandelbrot Set Fractal.

% Since we are asked to find the fractal boundary for x ∈ [−2, 1] for at least 1000 points, we create 1000 evenly spaced points from -2 to 1.
% We define yRange to store any complex imaginary numbers
xRange = linspace(-2, 1, 1000);
yRange = zeros(size(xRange));

%Here we loop each of the real number in xRange. And use the
%indicator_fn_at_x(x) function to see whther the point is inside or out of
%the Mandelbrot set.
for k = 1:numel(xRange)
    x = xRange(k);
    fn = indicator_fn_at_x(x);

    fs = fn(0);   % lower bound at the real axis
    fe = fn(2);    % upper bound where the point diverges

    if fs * fe > 0
        % if no boundary crossing at this x, it will be NaN
        yRange(k) = NaN;
    else
        % We then run the bisection function that we created. 
        yRange(k) = bisection(fn, 0, 2);
    end
end

% 7: Polynomial Function Fitting
% Remove NaNs before fitting. Creates variables xValid and yValid that
% excludes the NaNs found in yRange.
validIdx = ~isnan(yRange);
xValid = xRange(validIdx);
yValid = yRange(validIdx);

% We can use the p = polyfit(x,y, order) in Matlab
% In this example, we want to fit a polynomial of order 15 to our fractal
% boundary data point.
order = 15;
p = polyfit(xValid, yValid, order);

% We evaluate the polynomial at the xValid points.
fittedValues = polyval(p, xValid);

% Plot the original data and the polynomial fit
figure;
plot(xValid, yValid, 'b.', 'DisplayName', 'Original Data'); % This plots the original data in blue.
hold on;
plot(xValid, fittedValues, 'r-', 'DisplayName', 'Polynomial Fit'); % This plots the red curve which is our polynomial fit.
xlabel('Real Part'); % our x axis is the real number point
ylabel('Imaginary Part'); % our y axis is the imaginary number point
title('Mandelbrot Set Boundary: Comparing OG Data vs Polynomial Fit');
legend show; % shows the key

% 8: Find the fractal boundary for x x ∈ [−2, 1] for at least 10^3 points.
s = min(xValid); % setting this to -2 will make the arc length 314,603.
e = max(xValid); % setting this to 1 will make the arc length 314,603.
l = poly_len(p, s, e); % we use the function poly_len that we implemented to compute the arc length integral of the polynomial curve.
fprintf('Approximate length of the fractal = %.3f\n', l); % this will be the length of the fractal in 3 decimal places.