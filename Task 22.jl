using HorizonSideRobots
r = Robot("22.sit", animate = true)
include("funct.jl")

function double!(r,side)
    if isborder(r, side)
        return 0
    end
    move!(r, side)
    double!(r, side)
    move!(r, inverse(side))
    move!(r, inverse(side))

end

double!(r,Sud)