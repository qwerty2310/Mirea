using HorizonSideRobots
HSR = HorizonSideRobots
r = Robot("untitled.sit";animate=true)
sides = [Nord,Sud]
x = 0
y = 0
c = 0
x1 = 0
y1 = 0
function GoToCorner()
    while !isborder(r, Sud)
        move!(r,Sud)
        global y = y + 1
    end
    while !isborder(r, West)
        move!(r,West)
        global x = x + 1
    end
end
function MarkColumn(a)
    while !isborder(r,sides[a%2+1])
        putmarker!(r)
        move!(r,sides[a%2+1])
    end
    putmarker!(r)
end
GoToCorner()
x1 = x
y1 = y
while !isborder(r,Ost)
    MarkColumn(c)
    move!(r,Ost)
    global c = c + 1
end
MarkColumn(c)
GoToCorner()
for i = 1:x1
    move!(r,Ost)
end
for i = 1:y1
    move!(r,Nord)
end