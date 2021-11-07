# A-PathPlanned-Supermarket-Trolley
SLAM (Simultaneous localization and mapping) based Robotics

We implement an Artificial Potential Function (APF) method path planning to an autonomous trolley to achieve the goal position which adapts to the environment having static and dynamic obstacles. 
So, our goal is to design a trolley carrying the products, path plans itself to the starting point of the queue from where the customer left the trolley and finally queues up in the billing section representing the respective customer.
To overcome the GNRON problem, a repulsive potential field function is introduced by a distance correction factor. To enhance the local minima issue, the regular hexagonal method is suggested. Additionally, for the dynamic environment, the relative velocity approach for detecting and preventing moving particles is suggested. This approach analyses not just the spatial position, but rather the magnitude and path of the velocity for the moving particles, which will in fact prevent dynamic obstacles. 
