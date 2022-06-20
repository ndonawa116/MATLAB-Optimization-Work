% Newtons method example application 
min_func=@(x,y)(x.^3 - 3.*x.*y.^2 -1).^2 + (3.*x.^2.*y - y.^3).^2;


syms x y;
gradient_s=gradient(min_func,[x,y])
hessian_s=hessian(min_func,[x,y]);

gradient_func=matlabFunction(gradient_s);
hessian_func=matlabFunction(hessian_s);


figure;
hold on;
plot_range=[-1 1 -1 1]; 
[X, Y]=meshgrid(plot_range(1):0.1:plot_range(2),plot_range(3):0.1:plot_range(4));
Z=min_func(X,Y);
surf(X,Y,Z,'EdgeColor','none');
xlabel('x');
ylabel('y');
levels=0.0002+[0:0.005:0.13]; 
contour3(X,Y,Z,levels,'black','LineWidth',1);
newleg = {'Function','Contour'}; 
legend(newleg);
axis vis3d


x_star=0.1;y_star=0.1;
z_star=min_func(x_star,y_star);
plot3(x_star,y_star,min_func(x_star,y_star),'ro','MarkerSize',5); 
newleg{end+1} = 'Initial Guess';
legend(newleg);

for n=1:20

    hessian_=hessian_func(x_star,y_star);
    gradient_=gradient_func(x_star,y_star);
    S=-inv(hessian_)*gradient_;
    

    d_best=fminsearch(@(d) min_func(x_star+S(1)*d,y_star+S(2)*d),0);
    x_star_old=x_star;y_star_old=y_star; 
    x_star=x_star+S(1)*d_best
    y_star=y_star+S(2)*d_best

   
    plot3(x_star,y_star,min_func(x_star,y_star),'r*','MarkerSize',20);
    x_search=linspace(x_star_old,x_star,20);
    y_search=linspace(y_star_old,y_star,20);
    z_search=min_func(x_search,y_search);
    plot3(x_search,y_search,z_search,'y','LineWidth',3);
    newleg{end+1} = ['Solution of Iteration ' num2str(n)];newleg{end+1} = ['Search Direction of Iteraion '  num2str(n)];
    legend(newleg);

end
