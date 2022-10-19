%  ------------------------------------------------------------------------------------------------
%   DESCRIPTION
%       B = velR3(angVec,angSet)
%
%   INPUTS
%       angVec      [psi theta phi]  angle vector
%       angSet      rotation order, i.e. 313 for 3-1-3 rotation, default 3-2-1
% 
%   OUTPUTS
%       B           transformation matrix s.t. wb = B*angVecDot
%
%   VERSION
%       v1.0 / 02.03.22 / V.Yotov
%  ------------------------------------------------------------------------------------------------

function B = velR3(angVec,angSet)

if (nargin==1)    
    angSet = 321;   
end

s2 = sin(angVec(2));
s3 = sin(angVec(3));
c2 = cos(angVec(2));
c3 = cos(angVec(3));

switch angSet
    case 123
        B = [   c2*c3   s3      0
                -c2*s3  c3      0
                s2      0       1   ];
    case 231
        B = [   s2      0       1
                c2*c3   s3      0
                -c2*s3  c3      0   ];
    case 312
        B = [   -c2*s3  c3      0
                s2      0       1
                c2*c3   s3      0   ];
    case 132
        B = [   c2*c3   -s3     0
                -s2     0       1
                c2*s3   c3      0   ];
    case 213
        B = [   c2*s3   c3      0
                c2*c3   -s3     0
                s2      0       1   ];
    case 321
        B = [   -s2     0       1
                c2*s3   c3      0
                c2*c3   -s3     0   ];
    case 121
        B = [   c2      0       1 
                s2*s3   c3      0
                s2*c3   -s3     0   ];
    case 131
        B = [   c2      0       1
                -s2*c3  s3      0
                s2*s3   c3      0   ];
    case 212
        B = [   s2*s3   c3      0
                c2      0       1
                -s2*c3  s3      0   ];
    case 232
        B = [   s2*c3   -s3     0
                c2      0       1
                s2*s3   c3      0   ];
    case 313
        B = [   s2*s3   c3      0
                s2*c3   -s3     0
                c2      0       1   ];
    case 323
        B = [   -s2*c3  s3      0
                s2*s3   c3      0
                c2      0       1   ];
    otherwise 
        B = [];
end













