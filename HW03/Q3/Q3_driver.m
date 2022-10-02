% Q3 driver

theta_1 = 48.4 * (pi/180);
theta_2 = 66.0 * (pi/180);
theta_3 = 26.6 * (pi/180);
theta_4 = 56.3 * (pi/180);

A = [0 0 0 1 0 cos(theta_1) 0 0 0 0 0 0
     1 0 0 0 0 sin(theta_1) 0 0 0 0 0 0
     0 0 0 -1 1 0 -cos(theta_2) 0 0 0 0 0
     0 0 0 0 0 0 sin(theta_2) 0 0 0 0 0 
     0 0 0 0 -1 0 0 -cos(theta_3) 1 0 0 cos(theta_4)
     0 0 0 0 0 0 0 sin(theta_3) 0 0 0 sin(theta_4)
     0 0 0 0 0 -cos(theta_1) cos(theta_2) cos(theta_3) 0 0 1 0
     0 0 0 0 0 -sin(theta_1) -sin(theta_2) -sin(theta_3) 0 0 0 0
     0 1 0 0 0 0 0 0 -1 0 0 0
     0 0 1 0 0 0 0 0 0 1 0 0
     0 0 0 0 0 0 0 0 0 0 -1 -cos(theta_4)
     0 0 0 0 0 0 0 0 0 -1 0 -sin(theta_4)]

B = [0
    0
    0
    2000
    0
    2500
    0
    0
    0
    0
    0
    0]

x = truss(A,B)
