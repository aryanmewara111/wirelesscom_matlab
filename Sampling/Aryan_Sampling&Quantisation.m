%  College Name: Indian Institute of Information Technology Nagpur
%  Subject: Wireless Communication
%  Created By: Aryan Mewara
%  Created On: 21.01.2024 
%  Project Name: Sampling and Quantization of a given signal 
%  Tool: Matlab
%  Description: 
  

clc
clear all
close all
%take input of sampling frequency
fs = input('enter sampling frequency-');
%take input of signal frequency
f1 = input('enter signal frequency-');
%define time
t = 0:1/fs:1;
%define signal
x = 2*sin(2*pi*f1*t)+5*cos(2*pi*f1*t);
%plot original signal
subplot(2,2,1)
plot(t,x)
xlabel('\bf time');
ylabel('\bf Amlitude');
title('continuous original signal');
%plot discrete version of original signal
subplot(2,2,2)
stem(t,x)
xlabel('\bf time');
ylabel('\bf Amplitude');
title('discrete original signal');
%extract time for sampling purpose
t1 = t(1:2:end);
%define signal for sampling
x1 = 2*sin(2*pi*f1*t1)+5*cos(2*pi*f1*t1);
% plot sample signal with less number of sample
subplot(2,2,3)
plot(t1,x1)
xlabel('\bf time');
ylabel('\bf Amplitude');
title('continuous sampled signal');
%plot discrete version of sampled signal
subplot(2,2,4)
stem(t1, x1)
xlabel('\bf time');
ylabel('\bf Amplitude');
title('discrete sampled signal');
%extreme value of signal
x_max = max(x1);
x_min = min(x1);
xquant=x1/x_max;
%number of quantization level
n=16;

%step size for accomdate n quantization level
d = (x_max-x_min)/n;

%store value of level for quantization purpose
 q = (x_min:d:x_max);
 for ii=1:n
    q1(ii)=(q(ii)+q(ii+1))/2;
 end


%here we have quantised our signal and also changed it in decimal value
for jj=1:n
    xquant(find((q1(jj)-d/2<=x)&(x<=q1(jj)+d/2))) = q1(jj).*ones(1,length(find((q1(jj)-d/2<=x)&(x<=q1(jj)+d/2))));
    deci(find(xquant==q1(jj)))=(jj-1).*ones(1,length(find(xquant==q1(jj))));
end


%plot quantised signal 
figure(2);
plot(t,xquant);
xlabel('Time');
ylabel('Amplitude');
title('Quantised Signal');

%change decimal value of level into binary numbers 
%or encoded string
x_binary = cell(size(deci));
for kk=1:length(deci)
    x_binary{kk}=flip(de2bi(deci(kk), 4));
end


