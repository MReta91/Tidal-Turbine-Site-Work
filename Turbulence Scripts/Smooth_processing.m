
LaI=LSmooth(:,:,1);
LaIm=squeeze(mean(LaI,1));
for i=1:length(Z)
for t=1:size(LaI,1)
uprimeA(t,i)=LaI(t,i)-LaIm(1,i);
end
end

uuprimeA=uprimeA.*uprimeA;
uuprimeAM=mean(uuprimeA,1);

LaJ=LSmooth(:,:,2);
LaJm=squeeze(mean(LaJ,1));
for i=1:length(Z)
for t=1:size(LaJ,1)
vprimeA(t,i)=LaJ(t,i)-LaJm(1,i);
end
end

vvprimeA=vprimeA.*vprimeA;
vvprimeAM=mean(vvprimeA,1);

LaK=LSmooth(:,:,3);
LaKm=squeeze(mean(LaK,1));
for i=1:length(Z)
for t=1:size(LaK,1)
wprimeA(t,i)=LaK(t,i)-LaKm(1,i);
end
end

wwprimeA=wprimeA.*wprimeA;
wwprimeAM=mean(wwprimeA,1);

(um/2)*(1-um/2)`