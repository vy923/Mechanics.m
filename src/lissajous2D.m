function [ampl,coeffs] = lissajous2D(fx,fy)
%  ------------------------------------------------------------------------------------------------
%   DESCRIPTION
%       [ampl,coeffs] = lissajous2D(fx,fy)
%
%   IPUTS
%       fx, fy      complex arrays, e.g. x-axis and y-axis complex forces
% 
%   OUTPUTS
%       ampl        SEMI-major axis/amplidute of lissajous ellipse w. center (0,0)
%       coeffs      ellipse coefficients: Ax^2 + Bxy + Cy^2 + F = 0
%
%   VERSION
%   v1.1 / 09.07.25 / --    xfig plot
%   v1.0 / 10.02.22 / V.Y.
%  ------------------------------------------------------------------------------------------------

% Ellipse coefficients
    A = 1./abs(fx).^2;    
    C = 1./abs(fy).^2;
    B = -2*cos(angle(fx)-angle(fy)).*sqrt(A.*C);  
    F = -sin(angle(fx)-angle(fy)).^2;
    
% Ellipse semi-major axis T
    D = B.^2-4*A.*C;
    ampl = sqrt(2*D.*F.*(A+C+sqrt((A-C).^2+B.^2)))./-D; 

% Structure with all coefficients
    coeffs.A = A;
    coeffs.B = B;
    coeffs.C = C;
    coeffs.D = D;
    coeffs.F = F;
    coeffs.T = ampl;

%  ------------------------------------------------------------------------------------------------
%{
% PLOT EXAMPLE

	fx = [-7 4*sqrt(-1)]*[.5-rand(2,1)];                                    % Random complex number
	fy = [2 -3*sqrt(-1)]*[.5-rand(2,1)]; 
	wt = linspace(-pi,pi,100)';
    complex2cos = @(x,wt) abs(x)*cos(wt+angle(x));                          % Complex to time signal

    t = tiledlayout(1,2);
    ax(1) = xfig(nexttile(t,1));
        set(ax(1),'XLim',[min(wt) max(wt)]);
        plot(wt,complex2cos(fx,wt),'-b')
        plot(wt,complex2cos(fy,wt),'-r')
        title('Out of phase harmonic forces')
    ax(2) = xfig(nexttile(t,2));
        plot(complex2cos(fx,wt), complex2cos(fy,wt), '-m')              % Lissajous curve/ellipse
        title('Force in $xy$-plane over 1 cycle') 
%}
%  ------------------------------------------------------------------------------------------------



