using HorizonSideRobots
include("librobot.jl")
HSR = HorizonSideRobots
r = Robot("untitled.sit";animate=true)
function along_chess!(r, side, flag::Bool)
    while !isborder(r, side)
        if flag
            putmarker!(r)
        end
        move!(r,side)
        flag = !flag
    end
    if flag
        putmarker!(r)
    end
    flag = !flag
    return flag
end
function snake_chess!(robot, (move_side, next_row_side)::NTuple{2,HorizonSide}=(Ost, Nord))   #функция змейки, дополненная до маркировки в шахматном порядке
    x,y = GoToCorner!(r)
    if (x+y)%2==0
        flag = true
    else
        flag = false
    end
    while !isborder(robot,move_side)
        flag = along_chess!(robot, next_row_side, flag)
        if isborder(robot, move_side)
            break
        end
        move!(robot,move_side)
        flag = along_chess!(robot, inverse(next_row_side), flag)
        if isborder(robot, move_side)
            break
        end
        move!(robot, move_side)
    end
    GoToCorner!(r)
    GoBack!(r,x,y)
end

snake_chess!(r)
