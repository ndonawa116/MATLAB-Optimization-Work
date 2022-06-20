%Binary search Phase 1 and 2
min_func=@(x) -x.*exp(-x/5)
ezplot(min_func,[0 12])
sample_x = 0:3:12
sample_t = min_func(sample_x)

hold on;
plot(sample_x, sample_t, 'ro')

[T,index]= min(sample_t)
x_star = sample_x(index)

dx = 3

%phase 2 First iteration (half the error range once)
dx = dx/2

x1 = x_star - dx

x2 = x_star

x3 = x_star + dx

x_new_sample = [x1 x2 x3]

t_new_sample = min_func(x_new_sample)

hold on; plot(x_new_sample,t_new_sample,'k+')

[T, index] = min(t_new_sample)
x_star = x_new_sample(index)

%Phase 2 Second interation (half the error range twice)  
dx = dx/2

x1= x_star - dx
x2 = x_star
x3 = x_star + dx

x_new_sample = [x1 x2 x3]

t_new_sample  = min_func(x_new_sample)

hold on; plot(x_new_sample, t_new_sample, 'k')
[T, index] = min(t_new_sample)
x_star = x_new_sample(index) 



% Qudadratic Approximation 
% x1 = x_star - dx
% x2 = x_star
% x3= x_star + dx
% 
% y1 = min_func(x1)
% y2 = min_func(x2)
% y3 = min_func(x3)
% 
% 
% 
% P = [
%     x1^2 x1 1
%     x2^2 x2 1
%     x3^2 x3 1
%     ]
% q = [
%     y1
%     y2
%     y3
%     ]
% 
% z = P\q
% 
% a= z(1)
% b =z(2)
% c = z(3)
% 
% hold on; 
% fplot(@(x) a*x.^2+b*x+c,[0,10])
% old_x_star = x_star
% x_star = -b/(2*a)
% 
% if (abs(x_star-old_x_star)<dx)
%     dx = dx/2
% else 
%     dx=dx
% end




