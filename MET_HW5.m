%Defining the function 
conjgrad_func =  @(x,y) x.^2 + 2.*y.^2


newleg = {'Function','Contour'}; % this variable collects all the legend entries
legend(newleg);


x_star=1; y_star=1;
z0=conjgrad_func(x_star,y_star);
plot3(x_star,y_star,conjgrad_func(x_star,y_star),'ro','MarkerSize',5) % plot the initial guess
newleg{end+1} = 'Initial Guess';
legend(newleg);


%finding the search direction 
dir_f0 = grab_Gradient(x_star,y_star);
neg_dir = -dir_f0;
%iteration 1 
dir_best = fminsearch (@(d) conjgrad_func(x_star+neg_dir(1) .*d, y_star+neg_dir(2).*d),0)
x_star_new = x_star + neg_dir(1).* dir_best
y_star_new = y_star + neg_dir(2).*dir_best 

plot3([x_star x_star_new] , [y_star y_star_new], conjgrad_func([x_star x_star_new] ,  [y_star y_star_new]), 'r', 'LineWidth',4)
%%%%%iteration #2
dir_f1 = grab_Gradient (x_star_new,y_star_new);
beta = (norm(dir_f1).^2/ (norm(dir_f0).^2))
neg_dir_2 = -dir_f1 + beta* neg_dir
dir_best = fminsearch (@(d) conjgrad_func(x_star_new +neg_dir_2(1) .*d, y_star_new+neg_dir_2(2).*d),0);
x2 = x_star_new + neg_dir_2 (1) * dir_best
y2 = y_star_new + neg_dir_2(2) * dir_best 

























%%%%%%gradient function%%%%%%%%%%%

function grad = grab_Gradient(x,y)

grad = [
     2.*x
     4.*y
    ];
end
