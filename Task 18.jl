using HorizonSideRobots
HSR = HorizonSideRobots
r = Robot("untitled.sit";animate=true)
include("librobot.jl")

function shuttle_18!(stop_condition::Function, robot, side, side2)
    c = 1
    while !stop_condition()
        for i = 1:c
            move!(robot,side)
        end
        side = inverse(side)
        c = c + 1
    end
    move!(r, side2)
    for i = 1:(c/2+c%2)
        move!(r, side)
    end
end

function move_18!(stop_condition::Function, robot, side; num_maxsteps::Integer)
    n = 0
    while n < num_maxsteps && stop_condition() == false
        n += 1
        if !isborder(r, side)
            move!(robot, side)
        else
            shuttle_18!(()->!isborder(r, side), r, left(side), side)
        end
    end
    return n
end

function spiral_18!(stop_condition::Function, robot; start_side = Nord, nextside::Function = left)
    side = start_side
    n = 0
    while stop_condition() == false
        n += 1
        move_18!(()->stop_condition(), robot, side; num_maxsteps = n)
        side = nextside(side)
        move_18!(()->stop_condition(), robot, side; num_maxsteps = n)
        side = nextside(side)
    end
end

spiral_18!(()->ismarker(r), r)