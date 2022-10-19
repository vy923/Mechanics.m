% Rotatin + translation, [3 x N] array

function Vt = mapR3(R,t,V)
Vt = R*V + t;
