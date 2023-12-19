using HorizonSideRobots
HSR = HorizonSideRobots
include("librobot-2.jl")
r = Robot("untitled.sit";animate=true)

function bypass!(robot, side::HorizonSide, n::Integer)  #третья переменная для запоминания того, на сколько клеток нужно вернуться
    if !isborder(robot, side)
        move!(robot, side)
        for i = 1:n
            move!(robot, right(side))
        end
    else
        move!(robot, left(side))
        bypass!(robot, side, n+1)
    end
end

bypass!(r, West, 0)