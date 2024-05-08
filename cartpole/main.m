

clear 
close all
clc

out=sim("cartepole.slx");

cart_position=out.p;
time=cart_position.time;
cart_position=cart_position.data;
cart_position=squeeze(cart_position);


theta=out.theta;
theta=theta.data;
theta=squeeze(theta);


u=out.u;
u=u.data;
u=squeeze(u);

figure
plot(time,cart_position,LineWidth=2)
xlabel("Time (s)")
ylabel("Position (m)")
title("X as position of the cart")
grid on


figure
plot(time,theta,LineWidth=2)
xlabel("Time (s)")
ylabel("Theta (degree)")
title("Theta as angle of the pendulum")
grid on


figure
plot(time,u,LineWidth=2)
xlabel("Time (s)")
ylabel("u")
title("u as control effort")
grid on


