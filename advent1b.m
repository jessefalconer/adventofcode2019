format longG;
masses = []; 
sum = 0;
for i = 1 : length(masses)
    sum = sum + recursion(masses(i));
end

display(additive_fuel);

function out = recursion(mass)
    fuel = floor((mass / 3) - 2);
    if fuel >= 0
        out = fuel + recursion(fuel);
    else
        out = 0;
    end
end