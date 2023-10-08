using HorizonSideRobots
HSR = HorizonSideRobots
r = Robot("untitled.sit";animate=true)
c = 1
s = 1 #индекс стороны в которую крутим спираль
sides = [Nord,West,Sud,Ost]
while !ismarker(r)
    for j = 1:2
        for i = 1:c
            move!(r,sides[s%4+1])
        end
        global s = s + 1
    end
    global c = c + 1
end