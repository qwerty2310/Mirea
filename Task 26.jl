using HorizonSideRobots
HSR = HorizonSideRobots
r = Robot("untitled.sit";animate=true)

inverse(s::HorizonSide) = HorizonSide(mod(Int(s)+2, 4))

function mark_maze!(r)
    if !ismarker(r)
        putmarker!(r)
        for s in (Nord, West, Sud, Ost)
            if !isborder(r,s)
                move!(r, s)
                mark_maze!(r)
                move!(r, inverse(s))
            end 
        end
    end
end

mark_maze!(r)