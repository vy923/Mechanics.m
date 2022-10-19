%  ------------------------------------------------------------------------------------------------
%   DESCRIPTION
%       [g,s] = smoothstep(n,xmax)
%
%       Returns a half sine or n-th order smoothstep polynomial mapped to 
%       [0,xmax] for numeric and [0,t] for symbolic handles g and s
%
%   INPUTS 
%       n           order
%       xmax        x-strerch
% 
%   OUTPUTS 
%       g           numeric function
%       s           symbolic function
%
%   VERSION
%       v1.0 / 03.03.22 / V.Yotov
%  ------------------------------------------------------------------------------------------------

function [g,s] = smoothstep(n,xmax)

    syms s(x,t)
    if xmax == 0                                                            % no ramping
        g = @(x)1.;
        return
    elseif n < 0                                                            % sinusoid
        s(x,t) = sym(@(x,t)sin(.5*pi*x./t).^2);
    else                                                                    % polynomial
        k = arrayfun(@(k)(-1)^k*nchoosek(n+k,k)*nchoosek(2*n+1,n-k),[0:n]);
        s(x,t) = sym(@(x,t)sum(k.*(x/t).^(n+1+[0:n])));
    end
	g = matlabFunction(s(x,xmax));                                          % numeric function g(x)










