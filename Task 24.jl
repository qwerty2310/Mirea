using HorizonSideRobots
HSR = HorizonSideRobots
r = Robot("untitled.sit";animate=true)
include("librobot.jl")

function halfdist!(robot, side)
    if !isborder(robot, side)
        move!(robot, side)
        no_delayed_action!(robot, side)
        move!(robot, inverse(side)) 
    end
end
function no_delayed_action!(robot,side)
    if !isborder(robot, side)
        move!(robot, side)
        halfdist!(robot, side)
    end
end