function it = fractal(c)
% Checking how many iterations it takes for a point to diverge (|z| > 2.0).
% Input: c complex point c (to represent the coordinates)
% Output: the number of iterations after which |z| > 2.0.
    
    z = zeros(size(c)); % Creates variables z before using it in the for loop
    it = zeros(size(c)); % Creates variable it to see the number of iterations, our output
    points = true(size(c)); % Creates a true or false array so we dont repeat the points that already occured.

    maxit = 100; % Set the max iterations to 500 thus we don't go on a forever loop. Doesn't have to be specifically 100. But we will use 100 since 5.3 indicated "before 100 iterations is not in the set"

    for i = 1:maxit % Use for loops for iterations, we do the z = fc(fc(fc(fc(...fc(0)...)))) 100 times.
        z(points) = z(points).^2 + c(points); % Formula in 5.2   (Note: .^2 for number squaring)
        diverg = abs(z) > 2; % check if diverge |z| > 2.0.
        new = diverg & points; % Looks for the point that just diverged this iteration.
        it(new) = i; % stores the number iteration i as it increases in iterations
        points(new) = false; % marking that point so it won't repeat.
        if ~any(points) % checking that all points have diverged or not, this so can end the iteration early.
            break; % stops the for loop.
        end
    end
end