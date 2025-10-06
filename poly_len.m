function l = poly_len(p,s,e)
% This functions finds the length of the fractal boundary
% We wereite an anonmyous function ds with only x as its arguments.
% Inputs: p, s, e
% p: the fitted polynomial coefficients
% s: the left bound on x
% e: the right bound on x
% Output: l: the curve legenth of the polynomial

    dp = polyder(p); % finds the derivative of polynomial p
    ds = @(x) sqrt(1 + (polyval(dp,x)).^2); % finds ds using the formula given in 8.1
    l = integral(ds, s, e); %matlab integral function to find length using integral of ds with bounds s and e.
end
