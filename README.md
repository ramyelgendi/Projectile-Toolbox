# Projectile-Toolbox

## Abstract
This paper aims to create a projectile toolbox while creating MATLAB tools; the project resulted in 5 tools. The first and second tool aimed at calculating the total length of the path of the projectile and the resultant velocity and angle of the projectile versus time respectively, these are calculated given the number of positions x and z versus time of the projectile using numerical tools such as quadratic interpolation, Gauss Jordan, Numerical Integration and Differentiation. The third tool calculates the position (x,y) versus time (t) given the number of points describing velocity (vx, vz) vs time (t) alongside the projectile’s path by utilizing numerical integration methods. Fourth tool addresses resultant velocity and angle of the projectile versus time when given the mass, diameter, initial velocity and initial angle of the projectile using ODEs. The last tool combines all the aforementioned tools by using the initial velocity, or initial angle and target position to identify the total length of the projectile path, the position of the projectile at each time step and the resultant velocity and direction at each time step.
## Background Review Of Problem
The problem addressed here is firing a projectile with the aim of it landing on a specific target, in this research we disregard the impact of air resistance and use the below differential equations to calculate acceleration. It is  important to note that the Vx and VZ are the horizontal and vertical velocity components, t is time and g is gravitational acceleration. Thus the change of horizontal velocity over time is 0 and the change of vertical velocity over time is represented by acceleration of gravity which creates a parabolic trajectory.

By using ordinary differential equations we are able to calculate the initial velocity and initial angle above the horizontal axis which is needed for the projectile to reach the intended target, however, there will exist air resistance when the projectile is targeted at a far target. 

Thus, the equations are modified to put into account air resistance and so the model becomes a non-linear boundary value system of ordinary differential equations.

## Background Review Of Methods
### Quadratic Splines
In quadratic splines, each adjacent pairs of points are connected with a quadratic line in form of ax2+bx+c=f(x). Here, a set of unknowns a,b, and c will be solved using gauss-jordan elimination code

### Gauss-Jordan Elimination
In Gauss-Jordan, the coefficients of a system of linear equations are transformed into a matrix form and reduced into “reduced row-echelon form” which eliminates the need for back substitution (unlike gauss elimination)

### O(h2)  Numerical Differentiation
This is called the two-point central difference method for the first derivative. It uses one point ahead of X_i and one pint behind it to estimate the first derivative with a higher accuracy (O(h^2)) than the normal forward and backward methods. Formula is: f'(x) = f(x+h)-f(x-h)2h, where h here is the step value.

### O(h4) Numerical Differentiation
This is called the four-point central difference method for the first derivative. It uses two points ahead of X_i and two pints behind it to estimate the first derivative with a higher accuracy (O(h^4)) than the two-point central difference method.

### Trapezoidal Rule
In trapezoidal rule, we divide up the area under the curve into trapezoids and by estimating the area of the trapezoids, the integral can be evaluated as Area = (b-a)xf(a)+f(b)2. The approximation becomes more and more accurate as the number of partitions increase

### Simpson’s ⅓ Rule
This rule is more accurate than the trapezoidal rule since it uses a higher order polynomial to connect the points. In ⅓, the function used is a polynomial of 2nd degree.

### Euler’s Method
This is a one step method that uses the slope of a function to predict new values of the function at another point. yi+1=yi+f(xi,yi x h, where h is the step value. The truncation error is: Ea=f'(xi,yi)2!xh2.
 
### RK4’s Method
This method is also known as the classic Runge-Kutta Method. It provides a means of achieving the accuracy of a Taylor series approach without calculating higher derivatives.

### Shooting Method
This method is used to solve boundary value problems by reducing it to a system of initial value problems. After that a trial and error will be implemented to solve for the equations.
 
## Functions Validation
### Tool 1
Tool 1 was divided into 3 functions: Quadratic splines generator, Gauss jordan, and length of the trajectory computer. Each function was tested and validated separately, then the whole tool was gathered and tested. 
For the quadratic splines functions, simple functions with expected behaviors were imputed and the accuracy of the results were compared to the expected results. Ex: x^3 , a*x^2 + b*x+c, e^x , log(x)
For the Gauss jordan function, systems of nonlinear equations examples from the slides and the problem sets, with which answers are known, were utilized. The final coefficients matrix was compared with the answers of these examples
For example, using the same lecture’s problem shown above, the splines coefficients were found to be:

For the length of the trajectory function, the same testing method of the first function was used, simple functions with known lengths were tested, and had their results compared with the known values. 
This part was tested using t = 0:10, x = exp(t)
Theoretical length = 22025.93

### Tool 3

Tool 3 Code & Results:


Online Integral Calculator:

After entering plot points for the function x2from 0 to 6 in our tool 3’s MATLAB code, the final results for trapezoidal was 73, and for simpson’s ⅓ was 72. The answer using online integral is 72 which is exactly the same as Simpson's ⅓ results, but close enough to trapezoidal rule’s result. This shows us that the simpson’s method is more accurate than the trapezoidal since it uses a higher polynomial equation to connect points together.

After entering plot points for the function x3from 0 to 10 in our tool 3’s MATLAB code, the final results for trapezoidal was 2525, and for simpson’s ⅓ was 2500. The answer using online integral is 2500.

### Tool 4
This tool was implemented in phases and each phase was tested separately before putting the whole tool together. First, the projectile velocity was calculated without air resistance, and the results were compared to the results obtained from an online simulation with the same initial criteria.

For euler’s and RK4 parts, the outputs of an online simulation (geogebra) with the same initial conditions were compared to both methods results. As, the simulation only shows the position without showing the velocity, Tool3 was used to sketch the path of the projectile and compare its final position with the simulation. 

### Tool 5
The four tools are verified separately as shown above. As for the shooting method, it is verified after obtaining the initial velocity by using it  to x positions at each time and comparing the last value for x position with the targeted value given as an input. 
Graphical Flow Chart


## Code Manual
### Tool 1
This tool is composed of three functions that call one another to execute the code. The user only has to call the function called “fcts” with a 1-D array of x points and 1-D array of z points and a step. The output of the function is the length of the function z(x).
The following example shows an example of the function z = sqrt(x)+x where x is from 0 to 10.

### Tool 2
You will first need to run the main file. You can enter 2 in order to use tool 2 as it will be shown in the prompt. The program will then ask you to enter  array t, array x, array z respectively. Make sure that the three arrays will have the same size otherwise the program will stop and an error will be printed to screen. You also need to make sure the  difference between values in the time array are consistent or an error will be printed indicating that h is not consistent. The program will then ask you to enter the method. You can enter 2 for O(h^2) method or 4 for O (h^4) method as it will appear in the prompt. After that, the program will compute Vx, Vz, resultant velocity and angle and output them to console

### Tool 3
Before running the code, make sure to add the correct data points for x and y to a variable in the following format: “x = [0 23 42 12 …..]”, and add the time to another variable in the format:      “t = [0 23 42 12 …..]”. Then call either of the two functions in the following format: “trapezoidal(x,t)” or “simpson1_3(x,t)”. 
Attached, there is a demo.m file to demonstrate how to use the functions. All you need to do is change the “T”, “V_x”,”V_z” values, and after running the code, you will be prompted to enter s or t to pick which method to use. Note that V_x is used for x-values, V_z is for z-values, and T is for time values.

### Tool 4
The program asks the user to input the following values, respectively, in order to set the initial conditions of the projectile: initial velocity, Launch angle, time of stoppage, step, mode of air resistance, diameter of the projectile, mass of the projectile. The output is two 1-D arrays of Vx and Vz

Remarks: 
Launch angle is in radians, mass is in Kg, diameter is in m^2 
If the user wants to ignore air resistance, he/she should enter “0”. If they want to incorporate air resistance, they should enter “ 1” for Euler's method and “2” for RK4.
In this example, the user ignored air resistance “0” and set the initial velocity to 50, the angle to 30, the stoppage time at 5 s, and a step of 0.01.

As dvx/dt = 0, the x-component of velocity equals vi x cos(theta) throughout the simulation period. since , vi = 50 and theta= 30. Then, 43.3 which approximately equals the simulated results. Also, as dvz/dt = -9.8 , it was analytically found that vz at t = 5 is -24, which is also exact to the simulated results.
Tool 5
You will first need to run the main file. You can enter 5 to use tool 5 as shown in the prompt. The program will then ask you to enter the initial angle, total time, time step, math diameter, the method for tool 4 whether using air resistance and whether euler or RK4. The program then asks the user to enter 0 for using tool 5 without shooting or 1 to use this tool with shooting method. If the user chooses 0 (with no shooting method) the program will ask the user to enter an initial value for the velocity. The program will then pass this initial velocity and angle to tool 4 to calculate the vx and vz and then use them to calculate vr and and angle and display them. The program will then pass them tool 3 to calculate the corresponding x and z. Then x and z are passed to the tool to compute the length of the path and the length is printed to the console. 
	On the other hand, if you chose 1 to use tool 5 with shooting, the program will ask you to enter the value for your target in the x position. It will then use shooting method to estimate the initial velocity and angle and consequently path results to tool 4 followed by tool 3 followed by to calculate the length of the path
Input Example Screenshot:


## Conclusion
The functions created resulted in the success of the five tool objectives thus, the research succeeded in measuring total length of path of projectile, the resultant velocity and angle versus time, the position against time and hitting a specific target by varying the information given by the user. And while the tools and functions took into account air resistance, the application of such a model in real life is more complex and includes more variables that are constantly interchangeable, for example air resistance cannot always be easily calculated, gravitational forces may change from one area or one height to another, viscosity of air in the atmosphere is also something that can be varying and hard to calculate. Thus, while the used functions and tools strive to produce the best possible results, there remains a margin of error and a chance for increased accuracy given more complex tools that would calculate all needed variables given the circumstances of conducting the experiment. 
## References
[1] https://www.youtube.com/watch?v=UhhfKXBnnEo

[2] https://www.programmersought.com/article/47074724055/

[3] Doctor ElKhayam Dorra’s slides for Engineering Analysis and Computation, Spring 2021.

[4] https://tutorial.math.lamar.edu/classes/de/eulersmethod.aspx

[5] https://textflow.mheducation.com/parser.php?secload=2
