% Rotatin + translation, 3xN array

function Vt = mapR3(R,t,V)
Vt = R*V + t;
