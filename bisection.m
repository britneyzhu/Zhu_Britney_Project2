function m = bisection(fn_f, s, e)
% This function serves to find the point on the boundary of the fractal.
% Inputs: fn_f, s, e
% fn_f: indicator function for a particular x
% s: lower bound point, y
% e: upper bound point, y
% Output: m
% m: returns the boundary point of a fractel

    fs = fn_f(s); % creates the sign with the bound point
    fe = fn_f(e); % creates the sign with the bound point
    if fs * fe > 0 % this checks to see if the function has the same signs, if so there will be error. Ex: s should be -1, e should be +1.
        error('The function must have different signs at the endpoints.');
    end
    
    %Below is our bisection loop with a fixed tol of 1e-5.
    while (e - s) > 1e-5 % this loops determines precision of the boundary location
        m = (s + e) / 2; % the midpoint of our current interval
        fm = fn_f(m); % evaluate the indicator at the midpoint
        if fm == 0 % exact boundary
            break; % m is a root
        elseif fs * fm < 0 % different sign
            e = m; % root is in the left half
            fe = fm;
        else
            s = m; % root is in the right half
            fs = fm; % same sign
        end
    end

    m = .5*(s+e); % our final midpoint
end