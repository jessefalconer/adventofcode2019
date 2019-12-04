close all;
clear all;

wires = importdata("3a.csv");
wire1 = split(wires(1), ",");
wire2 = split(wires(2), ",");
A = matricize(wire1);
Ax = A(:,1);
Ay = A(:,2);
B = matricize(wire2);
Bx = B(:,1);
By = B(:,2);
C = [A;B];

major = max(max(C)) + 5;
minor = min(min(C)) - 5;

X = intersect(A,B, 'rows');
X = X(any(X,2));
X = abs(X);
X = sum(X,2);

lowest = min(X);

display(lowest);

plot(Ax, Ay, '-x');
hold on;
plot(Bx, By, '-*');
hold off;
axis([minor, major, minor, major]);
grid on;

function out = matricize(wire)
    positions = zeros(1,2);
    for i = 1 : length(wire)
        direction = extractBefore(wire(i),2);
        scalar = extractAfter(wire(i),1);
        lastPosition = positions(end,:);
        A = vectorize(direction, scalar, lastPosition);
        positions = [positions; A];
    end
    out = positions;
end


function out = vectorize(direction, scalar, lastPosition)
    X = zeros(str2num(scalar{1}),2);
    switch direction{1}
        case "U"
            X(:,2) = 1:str2num(scalar{1});
        case "R"
            X(:,1) = 1:str2num(scalar{1});
        case "D"
            X(:,2) = 1:str2num(scalar{1});
            X = X * -1;
        case "L"
            X(:,1) = 1:str2num(scalar{1});
            X = X * -1;
        otherwise
            disp("Unknown");
    end
    X = X + lastPosition;
    out = X;
end