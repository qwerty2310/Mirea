using HorizonSideRobots
include("librobot.jl")
HSR = HorizonSideRobots
r = Robot("untitled.sit";animate=true)
function count!(robot::HorizonSideRobots.Robot)
    x,y = GoToCorner!(r)
    c = 0
    status = false
    while !isborder(robot, Nord)
        while !isborder(robot, Ost)
            move!(robot, Ost)
            if !status && isborder(robot, Nord)
                status = true
            elseif status && !isborder(robot, Nord)
                c+=1
                status = false
            end
        end
    along!(robot, West)
    move!(robot, Nord)
    end
    along!(robot, Sud)
    GoBack!(robot,x,y)
    print(c)
end

count!(r)