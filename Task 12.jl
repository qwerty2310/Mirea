using HorizonSideRobots
include("librobot.jl")
HSR = HorizonSideRobots
r = Robot("untitled.sit";animate=true)
function count!(robot::HorizonSideRobots.Robot)
    x,y = GoToCorner!(r)
    c = 0
    n = 0
    status = false
    while !isborder(robot, Nord)
        while !isborder(robot, Ost)
            move!(robot, Ost)
            if !status && isborder(robot, Nord)
                status = true
            elseif status && !isborder(robot, Nord)
                if n==0
                    n = 1
                    continue
                else
                    c+=1
                    n = 0
                    status = false
                end
            elseif status && isborder(robot, Nord) && n==1
                n = 0
            end
        end
    if n==1
        c+=1
    end
    n = 0
    status = false
    along!(robot, West)
    move!(robot, Nord)
    end
    along!(robot, Sud)
    GoBack!(robot,x,y)
    print(c)
end

count!(r)