E=1;
V01=1;
V02=1;
Za=0.1;
Zb=0.2;
Zc=0.3;
Y1=(Za+Zc)/(Za*Zc);
Y2=(Zb+Zc)/(Zb*Zc);
H=(Za+Zb+Zc)/(Za*Zb*Zc);
Z1=max(4*Y2/H,4*Y1*Za^2)+10
Z2=max(4*Y1/H,4*Y2*Zb^2)+10
% sysm n1;
% sysm n2;
x1=0:0.01:70;
x2=0:0.01:70;
x1=x1./sqrt(Z1);
x2=x2./sqrt(Z2);
%l=-Y2*V01.*(x1.^2)+H*E*sqrt(Z1).*x1-H*V01;
%k=(V01.*(x1.^2)-E*sqrt(Z1)./(Za.*x1)+Y1*V01);
n2=sqrt((-Y2*V01.*(x1.^2)+H*E*sqrt(Z1).*x1-H*V01)./(V01.*(x1.^2)-E*sqrt(Z1)./(Za.*x1)+Y1*V01));
n1=sqrt((-Y1*V02.*(x2.^2)+H*E*sqrt(Z2).*x2-H*V02)./(V02.*(x2.^2)-E*sqrt(Z2)./(Zb.*x2)+Y2*V02));

figure(1),
plot(x1,min(n2,25),'r',min(n1,25),x2,'g');
title("A Stability Region")
axis([0 25 0 25])
legend("x2 v/s x1","x1 v/s x2")
xlabel("x1");
ylabel("x2");


figure(2)
[x1,x2]=meshgrid(0.1:0.1:70)
%figure(2),
T1=6;
title("Rate of Change of Turn Ratio of OLTC1")
%rate of change of oltc1
X11=(1/(T1*sqrt(Z1))).*(((((Y2+x2.^2))).*(V01.*x1.^2)-(H+(x2.^2)/Za).*((E*sqrt(Z1)).*x1) +(H+Y1*x2.^2).*V01)./(((x1.^2).*(x2.^2)+Y1*x2.^2+Y2*x1.^2+H)));
T2=6;
X21=(1/(T2*sqrt(Z2))).*(((((Y1+x1.^2))).*(V01.*x2.^2)-(H+(x1.^2)/Zb).*((E*sqrt(Z2)).*x2) +(H+Y1*x1.^2).*V01)./(((x1.^2).*(x2.^2)+Y1*x2.^2+Y2*x1.^2+H)));
syms l1;
%X11=(1/(T1*sqrt(Z1)))*(((Y2+l2^2)*(V01*l1.^2)-(H+(l2^2)/Za)*((E*sqrt(Z1))*l1) +(H+Y1*l2^2)*V01)/((l1^2)*(l2^2)+Y1*l2^2+Y2*l1^2+H));
mesh(x1,x2, X11);
figure(3)
title("Rate of Change of Turn Ratio of OLTC2")
mesh(x1,x2, X21);

