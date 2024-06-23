x = [0, 1, 2];
f = 1 ./ (1 + x);
divided_differences_table = generate_divided_difference_table(x, f);
disp("a) simple nodes");
disp(divided_differences_table);

x = [0, 0, 1, 1, 2, 2];
f = 1 ./ (1 + x);
%xnorm = [0, 1, 2];
derivative_values = -1./(1+x.*x);
divided_differences_table_double = generate_divided_difference_table_double(x, f, derivative_values);
disp("b) double nodes");
disp(divided_differences_table_double);

x = linspace(1, 2, 11);
x = repelem(x, 2);
f = 1 ./ (1 + x);
divided_differences_table = generate_divided_difference_table(x, f);
derivative_values = -1./(1+x.*x);
divided_differences_table_double = generate_divided_difference_table_double(x, f, derivative_values);
disp("c) 11 equidistant x between [1, 2]");
disp("simple nodes")
disp(divided_differences_table)
disp("double nodes")

disp(divided_differences_table_double)

function divided_differences_table = generate_divided_difference_table(x, f)
    n = length(x);
    divided_differences_table(:,1) = f;

    for j = 2:n
        for i = 1:n-j+1
            divided_differences_table(i,j) = (divided_differences_table(i+1,j-1) - divided_differences_table(i,j-1)) / (x(i+j-1) - x(i));
        end
    end
end

function divided_differences_table = generate_divided_difference_table_double(x, f, derivative_values)
    n = length(x);

    divided_differences_table(:,1) = f;
    divided_differences_table(:,2) = derivative_values;

    for j = 3:n
        for i = 1:n-j+1
            divided_differences_table(i,j) = (divided_differences_table(i+1,j-1) - divided_differences_table(i,j-1)) / (x(i+j-1) - x(i));
        end
    end
end


