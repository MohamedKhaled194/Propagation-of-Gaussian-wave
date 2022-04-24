function [U,m] = input_plots(w,dx)

x= -10*w:dx:10*w;
y= -10*w:dx:10*w;
[X,Y]= meshgrid(x,y);
Z = X.^2+Y.^2;   %%%%% Z= row^2
U = exp(-Z./(w^2));   %%%%% A0=1
figure(1);
surf(X,Y,U);
xlim([-1.5*10^-4 1.5*10^-4]);
ylim([-1.5*10^-4 1.5*10^-4]);

title('The 3D gaussian distribution of input field');
figure(2);
imagesc(x,y,U);
title('The input field projection on XY plane');
colorbar;
xlim([-1*10^-4 1*10^-4]);
ylim([-1*10^-4 1*10^-4]);

figure(3);
plot(x,U);
xlim([-1*10^-4 1*10^-4]);
title('The input field gaussian distribution when Y=0');
m = max(U);
figure(4);
plot(x,max(U),'LineWidth',3);
xlim([-100*10^-6 100*10^-6]);
title('The max. input field when Y=0 with straight line where the intersection point represent the waist');
hold on; 
g=max(max(U)).*1/exp(1);
fplot(g,'LineWidth',3);
xlim([-100*10^-6 100*10^-6]);
hold off;

        %%%%%%%%%%%%%  input Power U^2
figure(5);
surf(X,Y,U.^2);
xlim([-1.5*10^-4 1.5*10^-4]);
ylim([-1.5*10^-4 1.5*10^-4]);
title('The 3D gaussian distribution of input intensity U^2');

figure(6);
imagesc(x,y,U.^2);
title('The input intensity U^2 projection on XY plane');
colorbar;
xlim([-1*10^-4 1*10^-4]);
ylim([-1*10^-4 1*10^-4]);

figure(7);
plot(x,U.^2);
title('The input intensity U^2 gaussian distribution when Y=0');
xlim([-1*10^-4 1*10^-4]);
figure(8);
title('The max. input intensity U^2 when Y=0');
plot(x,max(U.^2),'LineWidth',3);
xlim([-1*10^-4 1*10^-4]);
end

