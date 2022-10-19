% Inverse transf., mapR3(invR3(p)) = p

function V = invR3(R,t,Vt)                                                  
V = R'*(Vt-t);
