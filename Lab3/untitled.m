x = [-2 -1 0 1 2 3 4];
f = [-5 1 1 1 7 25 60];
divided_differences_table = generate_divided_difference_table(x, f);
disp("a) simple nodes");
disp(divided_differences_table);
disp("b) forward differences");
forward_table = generate_forward_differences_table(f);
disp(forward_table);
disp("c) backward differences");
backward_table = generate_backward_differences_table(f);
disp(backward_table);

function divided_differences_table = generate_divided_difference_table(x, function_values)
    n = length(x);
    divided_differences_table(:,1) = function_values;

    for j = 2:n
        for i = 1:n-j+1
            divided_differences_table(i,j) = (divided_differences_table(i+1,j-1) - divided_differences_table(i,j-1)) / (x(i+j-1) - x(i));
        end
    end
end

function forward_differences_table = generate_forward_differences_table(function_values)
    n = length(function_values);
    forward_differences_table(:,1) = function_values;

    for j = 2:n
        for i = 1:n-j+1
            forward_differences_table(i,j) = forward_differences_table(i+1,j-1) - forward_differences_table(i,j-1);
        end
    end
end

function backward_differences_table = generate_backward_differences_table(function_values)
    n = length(function_values);
    backward_differences_table(:,1) = function_values;
    
    for j = 2:n
        for i = n:-1:j
            backward_differences_table(i,j) = backward_differences_table(i,j-1) - backward_differences_table(i-1,j-1);
        end
    end
end