--[[

Simple lumberjack turtle: chops down trees with 1x1 trunks

--]]

os.loadAPI('t')

t.forward()
while turtle.detectUp() do
    t.up()
end
while not turtle.detectDown() do
    turtle.down()
end