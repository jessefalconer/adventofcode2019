% integers = importdata("2a.csv");
integers = [1,9,10,3,2,3,11,0,99,30,40,50];
disp(advance(1, integers));

function out = advance(index, integers)
    if integers(index) == 1
        integers(index+3) = sum(integers(integers(index+1)+1), integers(integers(index+2)+1));
        advance(index+4, integers);
    elseif integers(index) == 2
        integers(index+3) = product(integers(integers(index+1)+1), integers(integers(index+2)+1));
        advance(index+4, integers);
    elseif integers(index) == 99
        return
    end
out = integers;
end

function out = sum(x,y)
    out = x + y;
end

function out = product(x,y)
    out = x * y;
end