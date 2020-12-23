clear all
close all
clc

x=0.1:1/22:1;
y=(1+0.6*sin(2*pi*x/0.7))+(0.3*sin(2*pi*x))/2;
s=length(x);
%mokymų skaičius 
ms = 1000;
c1=0.18;
c2=0.9;

r1=0.2;
r2=0.2;

w0=rand(1);
w1=rand(1);
w2=rand(1);
%mnokymo = zingsnis
lr=0.1;

for k=1:ms
    
    for j=1:s
        
        %spindulio tipo funkcijos 
        f1=exp(-(x(j)-c1)^2/(2*r1^2));
        f2=exp(-(x(j)-c2)^2/(2*r2^2));
        
        d=f1*w1+f2*w2+w0; 
        e=y(j)-d;

        w1=w1+(lr*e*f1);
        w2=w2+(lr*e*f2);
        w0=w0+(lr*e);
    end
end

for j=1:s
    
        f1=exp(-(x(j)-c1)^2/(2*r1^2));
        f2=exp(-(x(j)-c2)^2/(2*r2^2));
        
        d=f1*w1+f2*w2+w0;
        
        yy(j)=d;
end    

plot(x,y,x,yy);
legend('Norimas gauti signalas','Aproksimuotas')
title('Aproksimacijos atvaizdavimas')

