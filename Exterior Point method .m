obj_fun=@(x,y) x.^2+y.^2;
x0=[10;10];

R=100;
g1_fun=@(x,y)x+y-4;
g2_fun=@(x,y)1-x;
g3_fun=@(x,y)1-y;
obj_penalty_fun=@(x,y) obj_fun(x,y)+R*(max(0,g1_fun(x,y))).^2+R*(max(0,g2_fun(x,y))).^2+R*(max(0,g3_fun(x,y))).^2;

solution=fminsearch(@(x)obj_penalty_fun(x(1),x(2)),x0)



plot_range=[-1 3 -1 3]; % -4<x<4, -3<y<5

figure;
hold on;
[X, Y]=meshgrid(plot_range(1):0.1:plot_range(2),plot_range(3):0.1:plot_range(4));
Z=obj_penalty_fun(X,Y);
surf(X,Y,Z,'EdgeColor','none');
xlabel('x');
ylabel('y');
contour3(X,Y,Z,60,'black','LineWidth',1);

[X, Y]=meshgrid(plot_range(1):0.1:plot_range(2),plot_range(3):0.1:plot_range(4));
Z=obj_fun(X,Y);
surf(X,Y,Z,'EdgeColor','none');
xlabel('x');
ylabel('y');
contour3(X,Y,Z,60,'black','LineWidth',1);

fill([1 3 1],[1 1 3],'k');
% (1,1),(3,1),(1,3)
legend('Penalized Objective','Penalized Objective','Original Objective','Original Objective','feasible region');

axis vis3d
axis(plot_range)
plotbrowser('on')
