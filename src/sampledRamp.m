function [g,dat] = sampledRamp(xmax,xr,ymax,pts,n)
%  ------------------------------------------------------------------------------------------------
%   DESCRIPTION
%       [g,dat] = sampledRamp(xmax,xr,ymax,pts,n)
%
%       Returns a half sine or n-th order smoothstep polynomial function mapped to 
%       [0,xr], [0,ymax], then constant on [xr,xmax], sampled at N tot. points
%
%   INPUTS 
%       xmax        x-strerch
%       ymax        y-stretch
%       xr          ramp length
%       pts         sample points
%       n           order, see smoothstep.m
% 
%   UTPUTS 
%       g           numeric function
%       dat         [x,y] data
%
%   VERSION
%   v1.0 / 30.05.22 / V.Y.
%  ------------------------------------------------------------------------------------------------

if ~exist('n','var')    
    n=-1;   
end

[g,~] = smoothstep(n,xr);
g = @(x) ymax.*( (x<xr).*g(x) + (x>=xr) );

dat = [linspace(0,xmax,pts)' g(linspace(0,xmax,pts)')];
