using HorizonSideRobots
HSR = HorizonSideRobots
include("librobot-2.jl")
r = Robot("untitled.sit";animate=true)

spiral!(()->ismarker(r), r)