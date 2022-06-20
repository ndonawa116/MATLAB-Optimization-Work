%question 1 code
min_func=@(x) -x.*exp(-x/5) %function being evaluated 
k_plot = fplot(min_func, [0,10])
legend('True Function') %displays a legend on the plot
set(k_plot,'LineWidth',4) %varies the line width of the plot


x_star = 2

dx = 2
%First Iteration
x1 = x_star -dx
x2 = x_star
x3 = x_star + dx

y1 = min_func(x1)
y2 = min_func(x2)
y3 = min_func(x3)


P = [
    x1^2 x1 1
    x2^2 x2 1
    x3^2 x3 1
    ]
q = [
    y1
    y2
    y3
    ]

z = P\q

a= z(1)
b =z(2)
c = z(3)

hold on; 
fplot(@(x) a*x.^2+b*x+c,[0,10])

old_x_star = x_star
x_star = -b/(2*a)

if (abs(x_star-old_x_star)<dx)
    dx = dx/2
else 
    dx=dx
end

%second iteration 
x1 = x_star -dx
x2 = x_star
x3 = x_star + dx

y1 = min_func(x1)
y2 = min_func(x2)
y3 = min_func(x3)


P = [
    x1^2 x1 1
    x2^2 x2 1
    x3^2 x3 1
    ]
q = [
    y1
    y2
    y3
    ]

z = P\q

a= z(1)
b =z(2)
c = z(3)
hold on; 
fplot(@(x) a*x.^2+b*x+c,[0,10])
old_x_star = x_star
x_star = -b/(2*a)

if (abs(x_star-old_x_star)<dx)
    dx = dx/2
else 
    dx=dx
end

%Third Iteration
x1 = x_star -dx
x2 = x_star
x3 = x_star + dx

y1 = min_func(x1)
y2 = min_func(x2)
y3 = min_func(x3)


P = [
    x1^2 x1 1
    x2^2 x2 1
    x3^2 x3 1
    ]
q = [
    y1
    y2
    y3
    ]

z = P\q

a= z(1)
b =z(2)
c = z(3)
hold on; 
fplot(@(x) a*x.^2+b*x+c,[0,10])
old_x_star = x_star
x_star = -b/(2*a)

if (abs(x_star-old_x_star)<dx)
    dx = dx/2
else 
    dx=dx
end



