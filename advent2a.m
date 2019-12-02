integers = [1,9,10,3,2,3,11,0,99,30,40,50];
display(loop(1, integers));

function out = loop(starting, integers)
    for i = starting : length(integers)
        if integers(i) == 1
            integers(i+3) = sum(integers(integers(i+1)), integers(integers(i+2)));
            loop(i+4, integers);
            break
        elseif integers(i) == 2
            integers(i+3) = product(integers(integers(i+1)), integers(integers(i+2)));
            loop(i+4, integers);
            break
        elseif integers(i) == 99
            break;
        end
    end
    out = integers;
end

function out = sum(x,y)
    out = x + y;
end

function out = product(x,y)
    out = x * y;
end