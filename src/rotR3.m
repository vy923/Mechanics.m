%{
-------------------------------------
    Vladimir V. Yotov
    Te Pūnaha Ātea Space Institute
    University of Auckland

    Version: 02.03.2022
-------------------------------------

INPUTS
    angVec  [psi theta phi]  angle vector
    angSet  rotation order, i.e. 313 for 3-1-3 rotation, default 3-2-1

OUTPUTS
    R       Euler rotation matrix
%}


function R = rotR3(angVec,angSet)

if (nargin==1)    
    angSet = 321;   
end

s1 = sin(angVec(1));
s2 = sin(angVec(2));
s3 = sin(angVec(3));  
c1 = cos(angVec(1));     
c2 = cos(angVec(2));     
c3 = cos(angVec(3));

switch angSet
    case 123
        R = [   c2*c3               -c2*s3              s2
                s1*s2*c3 + s3*c1    -s1*s2*s3 + c3*c1   -s1*c2
                -c1*s2*c3 + s3*s1   c1*s2*s3 + c3*s1    c1*c2   ];
    case 231
        R = [   c1*c2   -c1*s2*c3 + s3*s1   c1*s2*s3 + c3*s1
                s2      c2*c3               -c2*s3
                -s1*c2  s1*s2*c3 + s3*c1    -s1*s2*s3 + c3*c1   ];
    case 312
        R = [   c1*c3 - s1*s2*s3   -c2*s1   c1*s3 + c3*s1*s2
                c3*s1 + c1*s2*s3    c1*c2   s1*s3 - c1*c3*s2
                -c2*s3              s2      c2*c3               ];
    case 132
        R = [   c2*c3               -s2     c2*s3
                c1*s2*c3 + s3*s1    c1*c2   c1*s2*s3 - c3*s1
                s1*s2*c3 - s3*c1    s1*c2   s1*s2*s3 + c3*c1    ];
    case 213
        R = [   s1*s2*s3 + c3*c1    s1*s2*c3 - s3*c1    s1*c2
                c2*s3               c2*c3               -s2
                c1*s2*s3 - c3*s1    c1*s2*c3 + s3*s1    c1*c2   ];
    case 321
        R = [   c1*c2   c1*s2*s3 - c3*s1    s1*s3 + c1*c3*s2   
                c2*s1   c1*c3 + s1*s2*s3    c3*s1*s2 - c1*s3
                -s2     c2*s3               c2*c3               ];
    case 121
        R = [   c2      s2*s3               s2*c3
                s1*s2   -s1*c2*s3 + c3*c1   -s1*c2*c3 - s3*c1
                -c1*s2  c1*c2*s3 + c3*s1    c1*c2*c3 - s3*s1    ];
    case 131
        R = [   c2      -s2*c3              s2*s3
                c1*s2   c1*c2*c3 - s3*s1    -c1*c2*s3 - c3*s1
                s1*s2   s1*c2*c3 + s3*c1    -s1*c2*s3 + c3*c1   ];
    case 212
        R =[    -s1*c2*s3 + c3*c1   s1*s2   s1*c2*c3 + s3*c1
                s2*s3               c2      -s2*c3
                -c1*c2*s3 - c3*s1   c1*s2   c1*c2*c3 - s3*s1    ];
    case 232
        R = [   c1*c2*c3 - s3*s1    -c1*s2  c1*c2*s3 + c3*s1
                s2*c3               c2      s2*s3
                -s1*c2*c3 - s3*c1   s1*s2   -s1*c2*s3 + c3*c1   ];
    case 313
        R = [   c1*c3 - c2*s1*s3    -c1*s3 - c2*c3*s1   s1*s2
                c3*s1 + c1*c2*s3    -s1*s3 + c1*c2*c3   -c1*s2
                s2*s3               c3*s2               c2      ]; 
    case 323
        R = [   c1*c2*c3 - s3*s1    -c1*c2*s3 - c3*s1   c1*s2
                s1*c2*c3 + s3*c1    -s1*c2*s3 + c3*c1   s1*s2
                -s2*c3              s2*s3               c2      ];
    otherwise 
        R = [];
end













