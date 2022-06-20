clear;

%% Marching Grid Algorithm
T_func=@(x,y) sqrt(50^2+x.^2)/7+sqrt(20^2+(y-x).^2)/4+sqrt(30^2+(100-y).^2)/2;
h=figure;fcontour(T_func,[0 100 0 100]);hold on;
xlabel('x (sand to shallow)')
ylabel('y (shallow to deep)')

% Initialize
x_star=50;
y_star=50;
dx=20;
dy=20;

nIter=10; % total number of iterations
gifFrames = []; % for gif animation

for ii = 1:nIter
    
    % Step 1:
    % A grid with 9 points, and the relative positions in figures: 
    % 7   8   9
    % 4   5   6
    % 1   2   3
    x(1)=x_star-dx;y(1)=y_star-dx;
    x(2)=x_star-dx;y(2)=y_star;
    x(3)=x_star-dx;y(3)=y_star+dx;
    x(4)=x_star;y(4)=y_star-dx;
    x(5)=x_star;y(5)=y_star;
    x(6)=x_star;y(6)=y_star+dx;
    x(7)=x_star+dx;y(7)=y_star-dx;
    x(8)=x_star+dx;y(8)=y_star;
    x(9)=x_star+dx;y(9)=y_star+dx;
    T=T_func(x,y);
    [~,index]=min(T); % find the index of the minimum
    
    %%%%%%%%%%% This part is for the plot only %%%%%%%%%%%
    fcontour(T_func,[0 100 0 100]);hold on;
    xlabel('x (sand to shallow)')
    ylabel('y (shallow to deep)')
    title(['Grid (Iteration)  ' num2str(ii)]);
    plot(x,y,'or');
    plot(x([1,3,9,7,1,4,6,5,8,2]),y([1,3,9,7,1,4,6,5,8,2]),'r')
    pause(1);
    gifFrames{end+1} = getframe(h); % for gif animation
    plot(x(index),y(index),'*k','MarkerSize',10);
    hold off;
    pause(1);
    gifFrames{end+1} = getframe(h); % for gif animation
    %%%%%%%%%%%  the plot only %%%%%%%%%%%
        
    % Step 2:
    % update the grid
    x_star=x(index);
    y_star=y(index);
    if (index == 5)
        dx=dx/2;
        dy=dy/2;
    end
end
x_star
y_star

%% create the gif animation
axis tight manual % this ensures that getframe() returns a consistent size
filename = 'marchiing_grid.gif';
for n = 1:length(gifFrames)
  % Capture the plot as an image 
  frame = gifFrames{n}; 
  im = frame2im(frame); 
  [imind,cm] = rgb2ind(im,256); 
  % Write to the GIF File 
  if n == 1 
      imwrite(imind,cm,filename,'gif', 'Loopcount',inf); 
  else 
      imwrite(imind,cm,filename,'gif','WriteMode','append','DelayTime', 1); 
  end 
end
