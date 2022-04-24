function [m,n,n2] = Output_plots(U,k,dx,fs,zo,z,w,i)

x= -10*w:dx:10*w;
y= -10*w:dx:10*w;
[X,Y]= meshgrid(x,y);
Uk=fft2(U);
Uk_shift=abs(fftshift(Uk));
kx=(-fs/2:fs/length(U):fs/2-fs/length(U)).*(2*pi);
ky=(-fs/2:fs/length(U):fs/2-fs/length(U)).*(2*pi);
[KX,KY]= meshgrid(kx,ky);
kz=k-((KX.^2-KY.^2)./(2*k));

Uz=Uk_shift.*exp(-1i.*kz.*z);
U_z=abs(ifftshift(ifft2(Uz)));

figure(9+i);
surf(X,Y,U_z);
xlim([-1.5*10^-4 1.5*10^-4]);
ylim([-1.5*10^-4 1.5*10^-4]);
title("The 3D gaussian distribution of field at z = " + z/zo + "*zo");

figure(10+i);
imagesc(x,y,U_z);
title("The field projection on XY plane at z = " + z/zo + "*zo");
xlim([-1*10^-4 1*10^-4]);
ylim([-1*10^-4 1*10^-4]);
colorbar;

figure(11+i);
plot(x,U_z);
xlim([-1*10^-4 1*10^-4]);
title("The field gaussian distribution when Y=0 at z = " + z/zo + "*zo");



%%%%%%%%%%%%%%%the following 4 lines are used to remove the phase shift
   %%%%%%%%%%%%%%%due to maltlab numerical error
   
m = max(U_z);
q= find(m == max(m));
n = x(q);

figure(12+i);
plot(x-n,max(U_z),'LineWidth',3);
title("The max. field when Y=0 at with straight line where the intersection point represent the waist" + z/zo + "*zo");
hold on;
g1=max(max(U_z)).*1/exp(1);
fplot(g1,'LineWidth',3);
xlim([-100*10^-6 100*10^-6]);
hold off;
     %%%%%%% output intensity at different z

figure(13+i);
surf(X,Y,U_z.^2);
xlim([-1.5*10^-4 1.5*10^-4]);
ylim([-1.5*10^-4 1.5*10^-4]);
title("The 3D gaussian distribution of intensity U^2 at z = " + z/zo + "*zo");

figure(14+i);
imagesc(x,y,U_z.^2);
title("The intensity U^2 projection on XY plane at z = " + z/zo + "*zo");
xlim([-1*10^-4 1*10^-4]);
ylim([-1*10^-4 1*10^-4]);

colorbar;
figure(15+i);
plot(x,U_z.^2);
title("The intensity U^2 gaussian distribution when Y=0 at z = " + z/zo + "*zo");
xlim([-1*10^-4 1*10^-4]);
   %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

m2 = max(U_z.^2);
q2= find(m2 == max(m2));
n2 = x(q2);

figure(16+i);
plot(x-n2,max(U_z.^2),'LineWidth',3);
title("The max. intensity U^2 when Y=0 at z = " + z/zo + "*zo");
xlim([-1*10^-4 1*10^-4]);


end

