% Dynamic Programming Algorithm to solve Knapsack Problem

weights=[2 2 3 3 3 5 3 7 7 1 1];
values=[4 4 7 7 7 2 8 4 4 2 2];

global optimal_table
optimal_table=zeros(11,14); % 5: the count of items, 15: the weight capacity
% this table does not include the column with 0 weight capacity 

for row=1:11
    for col=1:14
        if weights(row)<=col % the weight of the new item should be within the capacity
            % we have two possiblities: pack this item or not            
            % pack it            
            obj1=values(row)+get_optimal_value(row-1,col-weights(row))
            % don't pack it
            obj2=get_optimal_value(row-1,col);
            
            % we take the bigger one among obj1 and obj2
            optimal_table(row,col)=max(obj1,obj2);
        else % the weight is larger than the the capacity
            % we can not pack this item, we just have the previous optimal solution
            optimal_table(row,col)=get_optimal_value(row-1,col);
        end
    end
end
optimal_table

function obj=get_optimal_value(row,col)
global optimal_table
if (row>=1 && col>=1) % this condition ensures that the row and col are meaningful
    obj=optimal_table(row,col)
else
    obj=0; % the column with 0 capcity has 0 obj value.
end
end
