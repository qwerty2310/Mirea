using HorizonSideRobots
include("librobot.jl")
HSR = HorizonSideRobots
r = Robot("untitled.sit";animate=true)
function MarkColumn!(robot::HorizonSideRobots.Robot, n::Integer, y::Integer)
    for j = 1:n
        full = y/(n*2)
        for i = 1:full
            drawcolumn!(robot, n)
            numsteps_along!(robot, Nord, n+1)
        end
        drawcolumn!(robot, n)
        numsteps_along!(robot, Nord, n+1)
        along!(robot, Sud)
        if isborder(robot, Ost)
            break
        end
        move!(robot, Ost)
    end
end
function MarkColumnMirrored!(robot::HorizonSideRobots.Robot, n::Integer, y::Integer)
    for j = 1:n
        full = y/(n*2)
        numsteps_along!(robot, Nord, n)
        for i = 1:full-1
            drawcolumn!(robot, n)
            numsteps_along!(robot, Nord, n+1)
        end
        drawcolumn!(robot, n)
        numsteps_along!(robot, Nord, n+1)
        if !isborder(robot, Nord)
            drawcolumn!(robot, n)
        end
        along!(robot,Sud)
        if isborder(robot,Ost)
            break
        end
        move!(robot, Ost)
    end
end
function chessN!(robot::HorizonSideRobots.Robot, n::Integer, x::Integer, y::Integer)
    full = x/(n*2)
    print(full)
    for i = 1:full
        MarkColumn!(robot, n, y)
        MarkColumnMirrored!(robot, n, y)
    end
    if !isborder(robot, Ost)
        MarkColumn!(robot, n, y)
    end
    if !isborder(robot, Ost)
        MarkColumnMirrored!(robot, n, y)
    end
    along!(robot, West)
end
sides = [Nord,Sud]
x = 0
y = 0
x0 = 0 #ширина поля
y0 = 0 #высота поля
n = readline()
n = parse(Int64, n)
x,y = GoToCorner!(r)
y0 = along!(r, Nord)+1
x0 = along!(r, Ost)+1
GoToCorner!(r)
chessN!(r, n, x0, y0)
GoBack!(r, x, y)