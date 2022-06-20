%defined function to be evaluated 
newton_func = @ (x,y) (-exp(-(x./4).^2))./((x.^2-2.*y).^2 +5);

%finding the gradient and hessain matrices
syms x y;
get_gradient = gradient(newton_func,[x,y]);
get_hessian = hessian(newton_func,[x,y]);

%%converting expression to a function
get_gradient_func = matlabFunction(get_gradient);
get_hessian_func =  matlabFunction(get_hessian);

%intialize variables of x_star and y_star
x_star = 1;
y_star = 0;


for iter = 1:10
    ans_hessian = get_hessian_func(x_star,y_star);
    ans_gradient = get_gradient_func(x_star,y_star); % search direction 
    N = -inv(ans_hessian)*ans_gradient;
    
    dir_best = fminsearch(@(d) newton_func(x_star+N(1)*d , y_star+N(2)*d),0)
    x_star = x_star + N(1)*dir_best; % 1-D search for best position within search direction
    y_star = y_star + N(2)*dir_best;
end
   

