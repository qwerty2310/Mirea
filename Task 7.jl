using HorizonSideRobots
HSR = HorizonSideRobots
r = Robot("untitled.sit";animate=true)
sides = [West,Ost]
function search(r::Robot)
    c = 1
    while isborder(r,Nord)
        for i = 1:c
            move!(r,sides[c%2+1])
        end
        c = c + 1
    end
end
search(r)