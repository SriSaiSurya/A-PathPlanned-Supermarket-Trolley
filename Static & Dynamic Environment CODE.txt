clc;
clear all;
close all;
%Defining the intial conditions
target=[46.5 20]; %Final point 
pos=[2 20]; %Initial point
%Defining the position of Obstacle 5
origin_x5 = [40 41 41 40]; %// initial coordinates of vertices
origin_y5 = [5 5 15 15];
%Defining the position of Obstacle 6
origin_x6 = [40 41 41 40]; %// initial coordinates of vertices
origin_y6 = [25 25 35 35];
%Defining the position of Obstacle 7
origin_x7 = [30 31 31 30]; %// initial coordinates of vertices
origin_y7 = [5 5 15 15];
%Defining the position of Obstacle 8
origin_x8 = [30 31 31 30]; %// initial coordinates of vertices
origin_y8 = [25 25 35 35];
%Defining the position of Obstacle 9
origin_x9 = [25 26 26 25]; %// initial coordinates of vertices
origin_y9 = [5 5 15 15];
%Defining the position of Obstacle 10
origin_x10 = [25 26 26 25]; %// initial coordinates of vertices
origin_y10 = [25 25 35 35];
%Defining the position of Obstacle 11
origin_x11 = [10 11 11 10]; %// initial coordinates of vertices
origin_y11 = [5 5 15 15];
%Defining the position of Obstacle 12
origin_x12 = [10 11 11 10]; %// initial coordinates of vertices
origin_y12 = [25 25 35 35];
%Defining the position of Obstacle 13
origin_x13 = [45 46 46 45]; %// initial coordinates of vertices
origin_y13 = [5 5 15 15];
%Defining the position of Obstacle 14
origin_x14 = [45 46 46 45]; %// initial coordinates of vertices
origin_y14 = [25 25 35 35];
%Defining the position of Obstacle 15
origin_x15 = [5 6 6 5]; %// initial coordinates of vertices
origin_y15 = [5 5 15 15];
%Defining the position of Obstacle 16
origin_x16 = [5 6 6 5]; %// initial coordinates of vertices
origin_y16 = [25 25 35 35];
%Defining the position of Obstacle 17
origin_x17 = [47 55 55 47]; %// initial coordinates of vertices
origin_y17 = [18.75 18.75 18.9 18.9];
%Defining the position of Obstacle 18
origin_x18 = [47 58.5 58.5 47]; %// initial coordinates of vertices
origin_y18 = [22.5 22.5 22.75 22.75];
%Defining the position of Obstacle 3
origin_x3 = [35 37 37 35]; %// initial coordinates of vertices
origin_y3 = [28 28 29 29];
destination_x3 = origin_x3+0; %// final coordinates of vertices
destination_y3 = origin_y3-12; 
%Defining the position obstacle 1
origin_x1 = [20 22 22 20]; %// initial coordinates of vertices
origin_y1 = [0 0 1 1];
destination_x1 = origin_x1 +0; %// final coordinates of vertices
destination_y1 = origin_y1 +36;
%Defining the position of Obstacle 2
origin_x2 = [15 17 17 15]; %// initial coordinates of vertices
origin_y2 = [0 0 1 1];
destination_x2 = origin_x2 +0; %// final coordinates of vertices
destination_y2 = origin_y2 +14;
n_steps = 100; %// number of "frames"
t_pause = 0.1; %// seconds between frames
%Properties of the obstacles
h5 = fill(origin_x5, origin_y5, 'b'); %// create object at initial position
hold on
h6 = fill(origin_x6, origin_y6, 'b'); %// create object at initial position
hold on
h7 = fill(origin_x7, origin_y7, 'b'); %// create object at initial position
hold on
h8 = fill(origin_x8, origin_y8, 'b'); %// create object at initial position
hold on
h9 = fill(origin_x9, origin_y9, 'b'); %// create object at initial position
hold on
h10 = fill(origin_x10, origin_y10, 'b'); %// create object at initial position
hold on
h11 = fill(origin_x11, origin_y11, 'b'); %// create object at initial position
hold on
h12 = fill(origin_x12, origin_y12, 'b'); %// create object at initial position
hold on
h13 = fill(origin_x13, origin_y13, 'b'); %// create object at initial position
hold on
h14 = fill(origin_x14, origin_y14, 'b'); %// create object at initial position
hold on
h15 = fill(origin_x15, origin_y15, 'b'); %// create object at initial position
hold on
h16 = fill(origin_x16, origin_y16, 'b'); %// create object at initial position
hold on
h17 = fill(origin_x17, origin_y17, 'b'); %// create object at initial position
hold on
h18 = fill(origin_x18, origin_y18, 'b'); %// create object at initial position
hold on
h3 = fill(origin_x3, origin_y3, 'r'); %// create object at initial position
hold on
h1 = fill(origin_x1, origin_y1, 'r'); %// create object at initial position
hold on
h2 = fill(origin_x2, origin_y2, 'r'); %// create object at initial position
%Declaring the Area
A=rectangle('position',[0 0 60 40]);
axis equal %// same scale in both axes
axis manual %// prevent axes from auto-scaling
%Empty Matrices for Initialisation and storing the values
X1=[];
da1=[];
X2=[];
da2=[];
X3=[];
da3=[];
axis equal %// same scale in both axes
axis manual %// prevent axes from auto-scaling
%Initial Constants
AFC=0.008;
d=0.6;
RFC=[0.1 0.3 1.2];
 for t = linspace(0,1,n_steps)
    pre_pos=pos;
    calc=target-pos;
%Defining the initial position 
    initial_position=rectangle('position',[pos(1) pos(2) 1 1],'curvature',[1 1],'facecolor','y');
% Defining the target and the position
    target_location=rectangle('position',[target(1) target(2) 2 2],'curvature',[1 1],'facecolor','g');
%To make Obs 3 to move along y axis
    x3 = destination_x3;  %// update x
    y3 = (1-t)*origin_y3 + t*destination_y3; %// update y
    set(h3, 'Vertices', [x3(:) y3(:)]); %// change object's position
    X3=[x3;y3]';
%To make Obs 1 to move along y axis
    x1 = destination_x1; %// update x
    y1 = (1-t)*origin_y1 + t*destination_y1; %// update y
    set(h1, 'Vertices', [x1(:) y1(:)]); %// change object's position
    X1=[x1;y1]'; 
%To make Obs 2 to move along y axis
    x2 = destination_x2;  %// update x
    y2 =(1-t)*origin_y2 + t*destination_y2; %// update y
    set(h2, 'Vertices', [x2(:) y2(:)]); %// change object's position
    X2=[x2;y2]'; 
%Conditions for Repulsive force  
%Obs 1
for i1=1:length(X1)
     da1=[da1;(([X1(i1,1) X1(i1,2)])-pos)];
    Fa1=-(RFC(1)*(([X1(i1,1) X1(i1,2)])-pos)/norm(([X1(i1,1) X1(i1,2)]-pos))^3);
        Fr1=Fa1;
end
%Obs 2
for i2=1:length(X2)
     da2=[da2;(([X2(i2,1) X2(i2,2)])-pos)];
    Fa2=-(RFC(2)*(([X2(i2,1) X2(i2,2)])-pos)/norm(([X2(i2,1) X2(i2,2)]-pos))^3);
        Fr2=Fa2;
end
%Obs 3
for i3=1:length(X3)
     da3=[da3;(([X3(i3,1) X3(i3,2)])-pos)];
    Fa3=-(RFC(3)*(([X3(i3,1) X3(i3,2)])-pos)/norm(([X3(i3,1) X3(i3,2)]-pos))^3);
        Fr3=Fa3;
end
%Attractive Force
FA=AFC*(calc); 
Fr=Fr1+Fr2+Fr3;
Ft=FA+Fr;
angle = atan(Ft(2)/Ft(1));
pos(1)=pre_pos(1)+(d*cos(angle));
pos(2)=pre_pos(2)+(d*sin(angle));
if pos (1) >=target(1)-0.5
      pos=pre_pos;
      Fr=[0 0];
      Ft=[0 0];
end
pause(t_pause) %// a pause is needed to make movement slower
 end
 
 
%Defining the intial conditions
target=[58.5 20]; %Final point 
pos=[46.5 20]; %Initial point
%Defining the position of Obstacle 4
origin_x4 = [56.5 57.5 57.5 56.5]; %// initial coordinates of vertices
origin_y4 = [20 20 21 21];
destination_x4 = origin_x4+0; %// final coordinates of vertices
destination_y4 = origin_y4-3;
n_steps = 18; %// number of "frames"
t_pause = 0.25; %// seconds between frames
h4 = fill(origin_x4, origin_y4, 'y'); %// create object at initial position
hold on
%Declaring the Area
A=rectangle('position',[0 0 60 40]);
axis equal %// same scale in both axes
axis manual %// prevent axes from auto-scaling
%Empty Matrices for Initialisation and storing the values
X4=[];
da4=[];
axis equal %// same scale in both axes
axis manual %// prevent axes from auto-scaling
%Initial Constants
AFC=0.008;
d=0.6;
 for t = linspace(0,1,n_steps)
    pre_pos=pos;
    calc=target-pos;
% Defining the initial position 
    initial_position=rectangle('position',[pos(1) pos(2) 1 1],'curvature',[1 1],'facecolor','y');
% Defining the target and the position
    target_location=rectangle('position',[target(1) target(2) 2 2],'curvature',[1 1],'facecolor','g');
%To make Obs 4 to move along y axis
    x4 = destination_x4;  %// update x
    y4 = (1-t)*origin_y4 + t*destination_y4; %// update y
    set(h4, 'Vertices', [x4(:) y4(:)]); %// change object's position
    X4=[x4;y4]';
%Attractive Force
FA=AFC*(calc); 
Ft=FA;
angle = atan(Ft(2)/Ft(1));
pos(1)=pre_pos(1)+(d*cos(angle));
pos(2)=pre_pos(2)+(d*sin(angle));
if pos (1) >=target(1)-0.5
      pos=pre_pos;
      Ft=[0 0];
end
pause(t_pause) %// a pause is needed to make movement slower
      end