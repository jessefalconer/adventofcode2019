format compact;
% Test
% A = [];
A = importdata("2a.csv");
A(2) = 12;
A(3) = 2;
n = 0;

for i = 0 : floor(length(A) - 1 / 4)
    j = (i * 4) + 1;
    if A(j) == 1
        A(A(j+3)+1) = sum(A(A(j+1)+1), A(A(j+2)+1));
    elseif A(j) == 2
        A(A(j+3)+1) = product(A(A(j+1)+1), A(A(j+2)+1));
    elseif A(j) == 99
        break;
    end
end

disp(A);

function out = sum(x,y)
    out = x + y;
end

function out = product(x,y)
    out = x * y;
end