using HorizonSideRobots
HSR = HorizonSideRobots
include("librobot-2.jl")
r = Robot("untitled.sit";animate=true)

function along_marker_recursion!(robot, side::HorizonSide, n::Integer)  #третья переменная для запоминания того, на сколько клеток нужно вернуться
    if !isborder(robot, side)
        move!(r, side)
        along_marker_recursion!(robot, side, n + 1)
    else
        putmarker!(r)
        for i = 1:n
            move!(r, inverse(side))
        end
    end
end

along_marker_recursion!(r, Nord, 0)