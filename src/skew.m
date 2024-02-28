function W = skew(D)
%  ------------------------------------------------------------------------------------------------
%   DESCRIPTION
%       W = skew(D)
%
%   INPUTS
%       D           [1 x 3] or [3 x d2 x ... x dn] array 
% 
%   OUTPUTS
%       W           [3 x 3 x d2 x ... x dn] skew-symmetric operator 
%
%   VERSION
%   v2.0 / 28.02.24 / --    input can be [3 x d2 x ... x dn] array
%   v1.0 / 19.10.22 / V.Y.
%  ------------------------------------------------------------------------------------------------

if isvector(D)
    assert(numel(D)==3, "skew: D must be a 3-vector")
    
    W = [  0    -D(3)   D(2)
           D(3)  0     -D(1)
          -D(2)  D(1)   0   ];
else 
    assert(size(D,1)==3, "skew: D must be [3 x d2 x ... x dn]")

    W = zeros([3 size(D)]);
    c = 1:9:3*numel(D);
    W([5 6 1]' + c) = D;
    W([7 2 3]' + c) = -D;
end

%  ------------------------------------------------------------------------------------------------
%{
% Example 1: vector input
    D = 1:3;
    disp([skew(D) skew(D')])

% Example 2: 3-dim input
    D = rand(3,2,4);
    for i = 1:size(W,3)
        for j = 1:size(W,4)
            Q(:,:,i,j) = skew(D(:,i,j));
        end
    end
    disp(skew(D)-Q)
%}
%  ------------------------------------------------------------------------------------------------