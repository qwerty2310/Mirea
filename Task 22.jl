using HorizonSideRobots
HSR = HorizonSideRobots
include("librobot.jl")
r = Robot("untitled.sit";animate=true)

function double!(r, side::HorizonSideRobots.HorizonSide)
    n = along!(r, side)
    x = 0
    flag = true
    for i=1:(n*3)
        if isborder(r, inverse(side))
            flag = false
            break
        end
        move!(r, inverse(side))
        x+=1
    end
    if !flag
        for i = 1:x
            move!(r, inverse(side))
        end
    end
    return flag
end

double!(r, West)