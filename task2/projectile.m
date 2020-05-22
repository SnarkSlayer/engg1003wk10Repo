v = 100; %initial velocity
o = 90 * pi/180; %theta
g = -9.8; %gravity up
t = 0:1:-(2*v*sin(o)/g); %time range

x = v*t*cos(o);
y = v*t*sin(o) + 0.5*g*t.^2;

plot (x,y,'x');