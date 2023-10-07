using HorizonSideRobots
HSR = HorizonSideRobots
r = Robot("untitled.sit";animate=true)
sides = [Nord,Ost,Sud,West]
sides1 = [Nord,Sud]
v = 0
s = 0
n = 0
v1 = 0
s1 = 0
n1 = 0
c = 0
x = 1
x1 = 1
function GoToCorner()
    while !isborder(r, Nord)
        move!(r,Nord)
        global v = v + 1
    end
    while !isborder(r, West)
        move!(r,West)
        global s = s + 1
    end
    while !isborder(r,Sud)
        move!(r,Sud)
        global n = n + 1
    end
end
function MarkSide(side)
    while !isborder(r, side)
        putmarker!(r)
        move!(r, side)
    end
end
function MarkSide2(side1,side2)
    while isborder(r,side1)
        putmarker!(r)
        move!(r, side2)
    end
    putmarker!(r)
    move!(r,side1)
end
function GoBack()
    for i = 1:n1
        move!(r, Nord)
    end
    for i = 1:s1
        move!(r, Ost)
    end
    for i = 1:v1
        move!(r,Sud)
    end
end
function search(a)
    while !isborder(r,sides1[a%2+1])
        move!(r,sides1[a%2+1])
        global x1 = x1 + 1
    end
end

GoToCorner()
v1 = v
s1 = s
n1 = n
for j = 1:4
    MarkSide(sides[j])
end
while !isborder(r,Nord)
    move!(r,Nord)
    global x = x + 1
end
while !isborder(r,Sud)
    move!(r,Sud)
end
while !isborder(r,Ost)
    search(c)
    if x1<x
        break
    end
    global x1 = 1
    move!(r,Ost)
    global c = c + 1
end
if c%2==1
    MarkSide2(Sud,Ost)
    MarkSide2(West,Sud)
    MarkSide2(Nord,West)
    MarkSide2(Ost,Nord)
else
    MarkSide2(Nord,Ost)
    MarkSide2(West,Nord)
    MarkSide2(Sud,West)
    MarkSide2(Ost,Sud)
end
GoToCorner()
GoBack()