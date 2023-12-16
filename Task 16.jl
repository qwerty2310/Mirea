using HorizonSideRobots
HSR = HorizonSideRobots
r = Robot("untitled.sit";animate=true)
include("librobot.jl")

shuttle!(()->!isborder(r,Nord), r, West)