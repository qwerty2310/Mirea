using HorizonSideRobots
HSR = HorizonSideRobots
r = Robot("untitled.sit";animate=true)
sides = [Nord,Ost,Sud,West]
moves = []
xr = 1
yr = 1
x = 1
y = 1
function GoToCorner()
    while !isborder(r,Sud) || !isborder(r,West)
        if !isborder(r,Sud)
            move!(r,Sud)
            push!(moves, Nord)
            global yr = yr + 1
        else
            move!(r,West)
            push!(moves,Ost)
            global xr = xr + 1
        end
    end
end
function MarkSide(side)
    if side == Nord
        while !isborder(r, side)
            move!(r, side)
            global y = y + 1
            if y == yr
                putmarker!(r)
            end
        end
    elseif side == Ost
        while !isborder(r, side)
            move!(r, side)
            global x = x + 1
            if x == xr
                putmarker!(r)
            end
        end
    elseif side == Sud
        while !isborder(r, side)
            move!(r, side)
            global y = y - 1
            if y == yr
                putmarker!(r)
            end
        end
    else
        while !isborder(r, side)
            move!(r, side)
            global x = x - 1
            if x == xr
                putmarker!(r)
            end
        end
    end
end
function GoBack()
    for i = 1:length(moves)
        move!(r,moves[i])
    end
end

GoToCorner()
moves = reverse(moves)
for i = 1:4
    MarkSide(sides[i])
end
GoBack()