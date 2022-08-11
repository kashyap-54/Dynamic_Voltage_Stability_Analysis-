Vo=1;
n=[0:0.01:50];
Zl=0.1;
E=10;
theta=90;
theta2=30;
T=60;
%V=sin(2*pi.*n);
Z2=1:1:10);

for Z=1:1:10
V1=(n.*E*Z)./sqrt((n.^4)*(Zl^2)+2*Z*Zl*(cos(theta-theta2))+Z^2);
figure(1),
plot(n,V1);
hold on
figure(2)
plot(n,(Vo-V1)/T);
hold on
end

figure(1)
title("graph 1");
legend(Z2)
ylabel("Load Voltage V'");
xlabel("Turns Ratio(n)");
hold on
figure(2)
title("graph 2");
legend(Z2);
ylabel(" Rate of change of turn Ration dn/dt");
xlabel("Turns Ratio(n)");
hold on

