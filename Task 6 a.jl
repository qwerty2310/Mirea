using HorizonSideRobots
HSR = HorizonSideRobots
r = Robot("untitled.sit";animate=true)
sides = [Nord,Ost,Sud,West]
moves = []
function GoToCorner()
    while !isborder(r,Sud) || !isborder(r,West)
        if !isborder(r,Sud)
            move!(r,Sud)
            push!(moves, Nord)
        else
            move!(r,West)
            push!(moves,Ost)
        end
    end
end
function MarkSide(side)
    while !isborder(r, side)
        putmarker!(r)
        move!(r, side)
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