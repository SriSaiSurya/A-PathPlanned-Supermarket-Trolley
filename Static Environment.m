%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Position of obstacles and goals 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
close all;
clf;
%Obstacle 1
K1=0.4;
Obs1=[3 2];
 
%Obstacle 2
K2=0.3;
Obs2=[3 4];
 
close all;
clf;
%Obstacle 3
K3=0.5;
Obs3=[5 6];

%Obstacle 4
K4=0.6;
Obs4=[7 7];
 
%Goal
Kg=0.11;
Goal=[8 9];
 
%Robot
Robot=[1 1];

%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Original Robot Environment
%%%%%%%%%%%%%%%%%%%%%%%%%%%%
circleBlue(Robot(1)*10,Robot(2)*10,2,100); %robot 1
circleBlue(Goal(1)*10,Goal(2)*10,6,8);%goal right

circleBlue(Obs1(1)*10,Obs1(2)*10,5,100);%obstacle
circleBlue(Obs2(1)*10,Obs2(2)*10,4,100);%obstacle
circleBlue(Obs3(1)*10,Obs3(2)*10,6,100);%obstacle
circleBlue(Obs4(1)*10,Obs4(2)*10,9,100);%obstacle

figure(1)
title('Environment')
hold on
axis([0 100 0 100]);
grid on;


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Create Repulsive and attractive potential field forces
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%Matrix X x Y of  100by100
i=1:100;
j=1:100;
[I,J] = meshgrid(i,j);
Z = []; %empty matrix for z-axis plot

for i=1:100 
    for j=1:100 
        pos = [j/10 i/10]; % scaled to fit 100by100 matrix
        z=0;    %accumulator
        
        %Obstacles with exponential curve while goal is by vector  
        z=z+exp(-norm(pos-Obs1)/K1)+exp(-norm(pos-Obs2)/K2)+exp(-norm(pos-Obs3)/K3)+exp(-norm(pos-Obs4))/K4+Kg*(norm(Goal-pos));
    % The potential functions chosen are similar to the function proposed in
    % the document 'apf.pdf'
        Z(i,j) = z; %store in matrix
            
    end
end
 t=(abs(Robot(1)-Goal(1))+abs(Robot(2)-Goal(2))); 
count=0;
 while t>0.1 %check if the robot had reached the specified target; stop when reach target
   
     dx=[0 0];  %accumulation matrix
          
    %Obstacles Accumulate vector sum  %Goal Accumulate
    dx= dx + (Robot-Obs1)*exp((-norm(Robot-Obs1))/K1)+ (Robot-Obs2)*exp(-norm(Robot-Obs2)/K2)+ (Robot-Obs3)*exp((-norm(Robot-Obs3))/K3)+ (Robot-Obs4)*exp((-norm(Robot-Obs4))/K4)+Kg*(Goal-Robot)/norm(Goal-Robot);
         
    %Change in Robot Position over time (differenttiation)
    Robot=Robot+dx;
    
   %Calculate the value difference between the robot and the goal 
   t=(abs(Robot(1)-Goal(1))+abs(Robot(2)-Goal(2))); 
   count=count+1; 
   %update display 
   %calculate distance between robot and goal
   plot(Robot(1,1)*10, Robot(1,2)*10, 'K.','MarkerSize',20);
   title(sprintf('Iteration: %d',count));
   refresh;
   drawnow;
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Plot Figures
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

figure(2)   %Contour figure
title('Contour')
hold on
contour(Z,22) %plot figure with 22 contours 
pause(2)
hold on;

figure(3)   %combine figures
title('Potential Force Field on Contour')
hold on
contour(Z,22) %plot figure with 22 contours 
hold on
[px,py]=gradient(Z); %calculate gradient 
quiver(I,J,-px,-py,'r'), hold on % plot velocity vectors
pause(3)


figure(4)	
title('Potential Function Landscape')
hold on; grid on
surfc(Z)        %plot surface and contour plot
view([100,35,30])       
pause(1)
hold on;


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Path planning for Robot 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
Robot=[1 1];
%Plot current robot motion
 t=(abs(Robot(1)-Goal(1))+abs(Robot(2)-Goal(2))); 
 % The above is one of possibilities to determine the distance between the
 % robot and the goal, which is not strictly Euclidean
 % 
 count=0;
 while t>0.1 %check if the robot had reached the specified target; stop when reach target
   
     dx=[0 0];  %accumulation matrix
          
    %Obstacles Accumulate vector sum  %Goal Accumulate
    dx= dx + (Robot-Obs1)*exp((-norm(Robot-Obs1))/K1)+ (Robot-Obs2)*exp(-norm(Robot-Obs2)/K2)+ (Robot-Obs3)*exp((-norm(Robot-Obs3))/K3)+ (Robot-Obs4)*exp((-norm(Robot-Obs4))/K4)+Kg*(Goal-Robot)/norm(Goal-Robot);
         
    %Change in Robot Position over time (differenttiation)
    Robot=Robot+dx;
    
   %Calculate the value difference between the robot and the goal 
   t=(abs(Robot(1)-Goal(1))+abs(Robot(2)-Goal(2))); 
   count=count+1; 
   %update display 
   %calculate distance between robot and goal
   plot3(Robot(1,1)*10, Robot(1,2)*10, Z(round(Robot(1,2)*10), round(Robot(1,1)*10)),'K.','MarkerSize',20);
   title(sprintf('Iteration: %d',count));
   refresh;
   drawnow;
end
