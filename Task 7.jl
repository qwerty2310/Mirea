using HorizonSideRobots
HSR = HorizonSideRobots
r = Robot("untitled.sit";animate=true)
c = 1
sides = [West,Ost]
while isborder(r,Nord)
    for i = 1:c
        move!(r,sides[c%2+1])
    end
    global c = c + 1
end