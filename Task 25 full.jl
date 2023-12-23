using HorizonSideRobots
HSR = HorizonSideRobots
r = Robot("untitled.sit";animate=true)

function along_recursion!(robot, side::HorizonSide, n::Integer)
    if !isborder(robot, side)
        move!(r, side)
        chessline!(r, side, n+1)
    end
end

function chessline!(r,side::HorizonSideRobots.HorizonSide, n::Integer)
    if n%2==0
        putmarker!(r)
    end
    along_recursion!(r, side, n)
end

chessline!(r, Ost, 1)  #В зависимости от того, какую часть (а или б) мы решаем, ставим 0 или 1 в третий парметр
sleep(5)