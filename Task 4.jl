using HorizonSideRobots
HSR = HorizonSideRobots
r = Robot("untitled.sit";animate=true)
sides = [[Sud,West],[Sud,Ost],[Nord,Ost],[Nord,West]]
sides1 = [[Nord,Ost],[Nord,West],[Sud,West],[Sud,Ost]]
c = 0
function MarkToBorder(Num)
    while !isborder(r, sides[Num][1]) && !isborder(r, sides[Num][2])
        move!(r,sides[Num][1])
        move!(r,sides[Num][2])
        global c = c + 1
    end
    while c>0
        putmarker!(r)
        move!(r, sides1[Num][1])
        move!(r, sides1[Num][2])
        global c = c - 1
    end
end
for i = 1:4
    MarkToBorder(i)
    global c = 0
end
putmarker!(r)