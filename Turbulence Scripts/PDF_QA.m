
%Create the u' and w; values for the three subsets 
NsA=4685;
NsR=1930;
%Extraction of u
A1i=LinesRD(6).Velocities.Vi(:,51);
A2i=LinesRD(6).Velocities.Vi(:,34);
A3i=LinesRD(6).Velocities.Vi(:,28);

B1i=LinesRD(11).Velocities.Vi(:,48);
B2i=LinesRD(11).Velocities.Vi(:,32);
B3i=LinesRD(11).Velocities.Vi(:,27);

C1i=LinesRD(1).Velocities.Vi(:,43);
C2i=LinesRD(1).Velocities.Vi(:,29);
C3i=LinesRD(1).Velocities.Vi(:,27);

%Extraction of w
A1k=LinesRD(6).Velocities.Vk(:,51);
A2k=LinesRD(6).Velocities.Vk(:,34);
A3k=LinesRD(6).Velocities.Vk(:,28);

B1k=LinesRD(11).Velocities.Vk(:,48);
B2k=LinesRD(11).Velocities.Vk(:,32);
B3k=LinesRD(11).Velocities.Vk(:,27);

C1k=LinesRD(1).Velocities.Vk(:,43);
C2k=LinesRD(1).Velocities.Vk(:,29);
C3k=LinesRD(1).Velocities.Vk(:,27);

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
x=[uprimeC3./std(C3i) wprimeC3./std(C3k)];
MIN_XY=[-4 -4];
MAX_XY=[4 4];
data=x;
[bandwidth,density,X,Y]=kde2d(data,256,MIN_XY,MAX_XY);
Q1 = sum(x(:,1)>0 & x(:,2)>0)/size(x,1);
Q3 = sum(x(:,1)<0 & x(:,2)<0)/size(x,1);
Q2 = sum(x(:,1)<0 & x(:,2)>0)/size(x,1);
Q4 = sum(x(:,1)>0 & x(:,2)<0)/size(x,1);

figure
%contour3(X,Y,density,'LinesRDtyle','none'), view([0,60])
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



