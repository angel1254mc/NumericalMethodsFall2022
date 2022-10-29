function [norm_val] = vector_norm(x,normnum)
    %%calc_norm computes the 1-, 2-, or infinity-norm of a vector
    %%Inputs: x - vector whose norm is to be calculated
     %        normnum - which norm is to be computed
    %%Output: norm_val - computed norm value
    %%Author: Angel Lopez Pol
    p = normnum;
    if normnum == Inf
        norm_val = max(x);
    else
        norm_val = (sum(x.^p))^(1/p);
    end
end

% The formula is lowkey very simple to execute using matlab.