int_min_func = @(x,y) x.^2 + y.^2;
q_func = @(x,y) exp(x) -y;

x_initial = [0,2];
u_value = 1;
figure;
hold on;
fcontour(int_min_func)

figure;
hold on;

range = [-2 2 -1 3];


for n=1:3
    fx = @(x,y) int_min_func(x,y) + u_value.*barrier(q_func(x,y));
    answer = fminsearch(@(x) fx(x(1), x(2)) ,x_initial);
    x_star = answer(1)
    y_star = answer(2)
    output = int_min_func(x_star,y_star);
    fcontour(fx);
    u_value = u_value/10;
    plot(x_star,y_star,'o', 'MarkerFaceColor', 'r');
end

function y = barrier(constraint)
y = -1./constraint;
y(constraint >0) = inf;
end
    
