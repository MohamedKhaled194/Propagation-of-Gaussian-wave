w=30*10^-6;  %waist
lambda= 2.4*10^-6;
k=2*pi/lambda;
zo= pi*w^2/lambda;
dx= sqrt(2)*pi/k;
x= -10*w:dx:10*w;
y= -10*w:dx:10*w;
z1=0.5*zo;
z2=1*zo;
z3=2*zo;

fs=1/dx;     %%%%% sampling F %%%%
[field,max_U] = input_plots(w,dx);

[max_Uz1,n1,ni1] = Output_plots(field,k,dx,fs,zo,z1,w,0);
[max_Uz2,n2,ni2] = Output_plots(field,k,dx,fs,zo,z2,w,8);
[max_Uz3,n3,ni3] = Output_plots(field,k,dx,fs,zo,z3,w,16);
figure(33);
plot(x,max_U,'k','LineWidth',3);
hold on;
plot(x-n1,max_Uz1,'b','LineWidth',3);
hold on;
plot(x-n2,max_Uz2,'r','LineWidth',3);
hold on;
plot(x-n3,max_Uz3,'m','LineWidth',3);
legend('input','z=0.5*zo','z=1*zo','z=2*zo');
title('The max. field when Y=0 at input and all z ');
grid on;
xlim([-100*10^-6 100*10^-6]);
hold off;

figure(34);
plot(x,max_U.^2,'k','LineWidth',3);
hold on;
plot(x-ni1,max_Uz1.^2,'b','LineWidth',3);   %%%%%we use x-n to remove the error sift 
hold on;                                            %%% due to matlab numerical error         
plot(x-ni2,max_Uz2.^2,'r','LineWidth',3);
hold on;
plot(x-ni3,max_Uz3.^2,'m','LineWidth',3);
legend('input','z=0.5*zo','z=1*zo','z=2*zo');
title('The max. field intensity U^2 when Y=0 at input and all z ');
grid on;
xlim([-100*10^-6 100*10^-6]);
hold off;
