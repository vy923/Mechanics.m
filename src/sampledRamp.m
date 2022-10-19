%{
-------------------------------------
    Vladimir V. Yotov
    Te Pūnaha Ātea Space Institute
    University of Auckland

    Version: 30.05.2022
-------------------------------------

Returns a half sine or n-th order smoothstep ramp function mapped to 
[0,xr], [0,ymax], then constant on [xr,xmax], sampled at N tot. points

INPUTS 
    xmax    x-strerch
    ymax    y-stretch
    xr      ramp length
    pts     sample points
    n       order, see smoothstep.m

OUTPUTS 
    g       numeric function
    dat     [x,y] data
%}

function [g,dat] = sampledRamp(xmax,xr,ymax,pts,n)

if ~exist('n','var')    
    n=-1;   
end

[g,~] = smoothstep(n,xr);
g = @(x) ymax.*( (x<xr).*g(x) + (x>=xr) );

dat = [linspace(0,xmax,pts)' g(linspace(0,xmax,pts)')];
