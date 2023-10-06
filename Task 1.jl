using HorizonSideRobots
HSR = HorizonSideRobots
r = Robot("untitled.sit";animate=true)
sides = [Sud,Nord,West,Ost]
sides1 = [Nord,Sud,Ost,West]
c = 0
function MarkToBorder(Num)
    while !isborder(r, sides[Num])
        move!(r,sides[Num])
        global c = c + 1
    end
    while c>0
        putmarker!(r)
        move!(r, sides1[Num])
        global c = c - 1
    end
end
for i = 1:4
    MarkToBorder(i)
    global c = 0
end
putmarker!(r)
