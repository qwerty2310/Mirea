using HorizonSideRobots
HSR = HorizonSideRobots
r = Robot("untitled.sit";animate=true)
sides = [Nord,West,Sud,Ost]
x = 0
y = 0
function GoToCorner()
    while !isborder(r, Sud)
        move!(r,Sud)
        global y = y + 1
    end
    while !isborder(r, Ost)
        move!(r,Ost)
        global x = x + 1
    end
end
function MarkSide(side)
    while !isborder(r, side)
        putmarker!(r)
        move!(r, side)
    end
end
function GoBack()
    for i = 1:x
        move!(r, West)
    end
    for i = 1:y
        move!(r, Nord)
    end
end
GoToCorner()
for i = 1:4
    MarkSide(sides[i])
end
GoBack()