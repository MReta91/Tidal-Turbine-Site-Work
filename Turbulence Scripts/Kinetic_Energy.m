%Getting the turbulent kinetic energy profiles, and 
%turbulent energy dissipation. 
%Resolved TKE
kA=.5.*(uuprimeAM+vvprimeAM+wwprimeAM);
kB=.5.*(uuprimeBM+vvprimeBM+wwprimeBM);
kC=.5.*(uuprimeCM+vvprimeCM+wwprimeCM);
kD=.5.*(uuprimeDM+vvprimeDM+wwprimeDM);
%Dissipation 

Ka=.5*mean((uuprimeA+vvprimeA+wwprimeA));
Kb=.5*mean((uuprimeB+vvprimeB+wwprimeB));
Kc=.5*mean((uuprimeC+vvprimeC+wwprimeC));
Kd=.5*mean((uuprimeD+vvprimeD+wwprimeD));

Q2a=mean((uuprimeA+vvprimeA+wwprimeA));
Q2b=mean((uuprimeB+vvprimeB+wwprimeB));
Q2c=mean((uuprimeC+vvprimeC+wwprimeC));
Q2d=mean((uuprimeD+vvprimeD+wwprimeD));