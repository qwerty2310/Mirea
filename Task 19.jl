using HorizonSideRobots
HSR = HorizonSideRobots
r = Robot("untitled.sit";animate=true)

function along_recursion!(robot, side::HorizonSide)
    if !isborder(robot, side)
        move!(r, side)
        along_recursion!(robot, side)
    end
end

along_recursion!(r, Nord)