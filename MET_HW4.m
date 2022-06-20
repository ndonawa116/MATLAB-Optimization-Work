%Question 1 parts and B code
% syms x y z
% C = 2.*x.^2 + 2.*y.^2+ z.^4 + 8.*x + 4.*y+10.*z + 2.*exp(-(z./4).^2)  
% gradient(C,[x,y,z])


%Steepest Decent Questions:  problem 2 and 3

func_steep = @ (x,y) (-exp(-(x./4).^2))./((x.^2-2.*y).^2 +5);


 x_star = 2; y_star = 0;
z_star = func_steep(x_star,y_star);
newleg = {'Function','Contour'};


 for iter = 1:4
     x= x_star 
     y = y_star
     func_gradient =  [
         (x*exp(-x^2/16))/(8*((- x^2 + 2*y)^2 + 5)) - (4*x*exp(-x^2/16)*(- x^2 + 2*y))/((2*y - x^2)^2 + 5)^2
         (exp(-x^2/16)*(- 4*x^2 + 8*y))/((2*y - x^2)^2 + 5)^2
        ]
    neg_gradient = -func_gradient
    
    best_pos = fminsearch(@(d) func_steep(x_star + neg_gradient(1).*d,y_star + neg_gradient(2).*d),0);
    x_star_old = x_star
    y_star_old = y_star
    
    x_star = x_star + neg_gradient(1).* best_pos
    y_star = y_star+ neg_gradient(2).*best_pos
    plot3(x_star,y_star,func_steep(x_star,y_star), 'r*', 'MarkerSize',20);
    x_search = linspace(x_star_old,x_star,20);
    y_search = linspace(y_star_old,y_star,20);
    z_search  = func_steep(x_search,y_search);
    plot3(x_search,y_search,z_search,'k','LineWidth',3);
    newleg{end+1} = ['Solution of Iteration' num2str(iter)];
    newleg{end+1} = ['Search Direction of Iteration' num2str(iter)];
    legend(newleg);
    pause(3)
 end
 
 
         
     

    
