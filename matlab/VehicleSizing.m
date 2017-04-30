clear all; clc; format compact;
steps = 100000;
acc=zeros(1,steps);
vel=zeros(1,steps);
pos=zeros(1,steps);
pos(1) = 2066;
acc(1) = -32.174;
for i = 2:steps
    [acc(i), vel(i), pos(i)] = physStep((i-1)*10/steps,i*10/steps,acc(1),vel(i-1),pos(i-1));
end
figure(1)
plot(linspace(0,9.99,steps),acc)
grid()
xlabel('Time (s)')
ylabel('Acceleration (f/s^2)')
figure(2)
plot(linspace(0,9.99,steps),vel)
grid()
xlabel('Time (s)')
ylabel('Velocity (f/s)')
figure(3)
plot(linspace(0,9.99,steps),pos)
grid()
xlabel('Time (s)')
ylabel('Position (feet)')
shg()

function [a1,v1,x1] = physStep(t0, t1, a0, v0, x0)
    x1 = 0;v1 = 0;a1 = 0;
    lx = 1000;lv = 1000;la = 1000;
    while abs(lx-x1) > 1e-6 && abs(lv-v1) > 1e-6 && abs(la-a1) > 1e-6
        lx = x1;
        lv = v1;
        la = a1;
        dv = (9154.2*log(191.5/(191.5 -3.51*t1)) - 32.174*t1 ...
            -(9154.2*log(191.5/(191.5 -3.51*t0)) - 32.174*t0))...
            -(0.5*0.5*0.545*0.076474252*(288.15/(288.15-0.0019812*x1))^(1+32.174*0.0639/(89494.6*-0.0019812))*v1^2/(191.5 -3.51*t1))*(t1-t0)...
            +(0.5*0.5*0.545*0.076474252*(288.15/(288.15-0.0019812*x0))^(1+32.174*0.0639/(89494.6*-0.0019812))*v0^2/(191.5 -3.51*t0))*(t1-t0);
        da = a0+dv/(t1-t0);
        v1 = v0+dv;
        dx = v1*(t1-t0);
        x1 = x0+dx;
        a1 = a0+da;        
    end
end