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
    A = [];
    switch direction{1}
        case "U"
            A = [0 str2num(scalar{1})];
        case "R"
            A = [str2num(scalar{1}) 0];
        case "D"
            number = -1 * str2num(scalar{1});
            A = [0 number];
        case "L"
            number = -1 * str2num(scalar{1});
            A = [number 0];
        otherwise
            disp("Unknown");
    end
    A = A + lastPosition;
    out = A;
end