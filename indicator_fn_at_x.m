function fn = indicator_fn_at_x(x)
% returns an indicator function along a vertical line at a given x
% it uses equivalence of logical variables (true - 1, false - 0)
% to produce a value of 1 for divergence and -1 for no divergence
    fn = @(y) (fractal(x+1i*y)>0) * 2 - 1;
end