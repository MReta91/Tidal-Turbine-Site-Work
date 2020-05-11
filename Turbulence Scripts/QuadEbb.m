%10,20 and 50% of lines 1, 6 and 11 
Z1=(LinesEbb(6).Dimensions.Z./-min(LinesEbb(6).Dimensions.Z)); %24,27,36
Z2=(LinesEbb(11).Dimensions.Z./-min(LinesEbb(11).Dimensions.Z)); %23,26,35
Z3=(LinesEbb(1).Dimensions.Z./-min(LinesEbb(1).Dimensions.Z)); %22,25,32
%Create the u' and w; values for the three subsets 
NsA=4685;
NsR=1930;
%Extraction of u
% A1i=-LinesEbb(6).Velocities.Vi(:,36);
% A2i=-LinesEbb(6).Velocities.Vi(:,27);
% A3i=-LinesEbb(6).Velocities.Vi(:,24);
A1i=LSmooth(:,35,1); %For the flat channel
A2i=LSmooth(:,27,1);
A3i=LSmooth(:,24,1);


B1i=-LinesEbb(11).Velocities.Vi(:,35);
B2i=-LinesEbb(11).Velocities.Vi(:,26);
B3i=-LinesEbb(11).Velocities.Vi(:,23);

C1i=-LinesEbb(1).Velocities.Vi(:,32);
C2i=-LinesEbb(1).Velocities.Vi(:,25);
C3i=-LinesEbb(1).Velocities.Vi(:,22);

%Extraction of w
% A1k=LinesEbb(6).Velocities.Vk(:,36);
% A2k=LinesEbb(6).Velocities.Vk(:,27);
% A3k=LinesEbb(6).Velocities.Vk(:,24);
A1k=LSmooth(:,35,3); %For the flat channel
A2k=LSmooth(:,27,3);
A3k=LSmooth(:,24,3);

B1k=LinesEbb(11).Velocities.Vk(:,35);
B2k=LinesEbb(11).Velocities.Vk(:,26);
B3k=LinesEbb(11).Velocities.Vk(:,23);

C1k=LinesEbb(1).Velocities.Vk(:,32);
C2k=LinesEbb(1).Velocities.Vk(:,25);
C3k=LinesEbb(1).Velocities.Vk(:,22);

%-----------------------------
%Aprimes
uprimeA1=A1i-mean(A1i);
wprimeA1=A1k-mean(A1k);

uprimeA2=A2i-mean(A2i);
wprimeA2=A2k-mean(A2k);

uprimeA3=A3i-mean(A3i);
wprimeA3=A3k-mean(A3k);

uprimeB1=B1i-mean(B1i);
wprimeB1=B1k-mean(B1k);

uprimeB2=B2i-mean(B2i);
wprimeB2=B2k-mean(B2k);

uprimeB3=B3i-mean(B3i);
wprimeB3=B3k-mean(B3k);

uprimeC1=C1i-mean(C1i);
wprimeC1=C1k-mean(C1k);

uprimeC2=C2i-mean(C2i);
wprimeC2=C2k-mean(C2k);

uprimeC3=C3i-mean(C3i);
wprimeC3=C3k-mean(C3k);
%Done with the primes
%start with the function for the kernal 
x=[uprimeA3./std(A3i) wprimeA3./std(A3k)];
MIN_XY=[-4 -4];
MAX_XY=[4 4];
data=x;
[bandwidth,density,X,Y]=kde2d(data,256,MIN_XY,MAX_XY);
Q1 = sum(x(:,1)>0 & x(:,2)>0)/size(x,1);
Q3 = sum(x(:,1)<0 & x(:,2)<0)/size(x,1);
Q2 = sum(x(:,1)<0 & x(:,2)>0)/size(x,1);
Q4 = sum(x(:,1)>0 & x(:,2)<0)/size(x,1);

figure
%contour3(X,Y,density,'LinesEbbtyle','none'), view([0,60])
contour3(X,Y,density,8,'Linewidth',1.5)
r=[MIN_XY(1,1):0.01:MAX_XY(1,1)];
y = zeros(length(r),1);
xlabel('u''/\sigma_u','Fontsize',10)
ylabel('w''/\sigma_w','Fontsize',10)
hold on 
%plot(r,y,'w')
%plot(y,r,'w')
xlim([MIN_XY(1,1) MAX_XY(1,1)])
ylim([MIN_XY(1,2) MAX_XY(1,2)])
grid off
view(0,90)
pbaspect([1 1 1])
%set(gcf,'paperunits','inches')
%set(gcf,'position',[x y 3 3])

strmin = ['Q3 = ',num2str(Q3)];
text(MIN_XY(1,1)+.25,MIN_XY(1,2)+.25,strmin,'HorizontalAlignment','left','Color','black','FontSize',9);
strmin = ['Q1 = ',num2str(Q1)];
text(MAX_XY(1,1)-.25,MAX_XY(1,2)-.25,strmin,'HorizontalAlignment','right','Color','black','FontSize',9);
strmin = ['Q2 = ',num2str(Q2)];
text(MIN_XY(1,1)+.25,MAX_XY(1,2)-.25,strmin,'HorizontalAlignment','left','Color','black','FontSize',9);
strmin = ['Q4 = ',num2str(Q4)];
text(MAX_XY(1,1)-.25,MIN_XY(1,2)+.25,strmin,'HorizontalAlignment','right','Color','black','FontSize',9);
c = colorbar;
c.Label.String = 'Probability Density Function','Fontsize',10;
c.Limits=[0 0.25];
k=0;
X=-4:.01:4;
plot(X,ones(size(X)) * k,'Color','black','Linewidth',1)
plot(ones(size(X)) * k,X,'Color','black','Linewidth',1)
HyperbolasForQA



