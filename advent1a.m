format longG;
masses = []; 
sum = 0;
for i = 1 : length(masses)
    sum = sum + floor((masses(i) / 3) - 2);
end

display(sum);