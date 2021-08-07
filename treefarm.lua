--[[

Builds and chops down a 7x7x? compact tree farm

--]]

os.loadAPI('t')

args = {...}

chop = true
if args[1] == 'build' then
    chop = false
end


if t.selectItem('minecraft:chest') then
    t.placeDown()
end

-- todo: pick up saplings before chopping

t.forward()
for z = 1, 5 do
    for x = 1, 7 do
        for y = 1, 7 do
            if z == 1 then
                local success, block = turtle.inspectDown()
                -- if there is a block below and it's not a torch
                if success and block.name ~= 'minecraft:torch' and block.name ~= 'minecraft:oak_sapling' then
                    t.digDown()
                    if t.selectItem('minecraft:oak_sapling') then
                        t.placeDown()
                    end
                -- else if there is empty space below
                elseif not success then
                    if t.selectItem('minecraft:oak_sapling') then
                        t.placeDown()
                    end
                end
            end

            -- last row
            if y == 7 then
                -- not last column
                if x ~= 7 then
                    if x % 2 == 0 then
                        turtle.turnLeft()
                        t.forward()
                        turtle.turnLeft()
                    else
                        turtle.turnRight()
                        t.forward()
                        turtle.turnRight()
                    end
                -- last column
                else
                    t.up()
                    t.turnAround()
                end
            else
                t.forward()
            end
        end
    end
end

turtle.turnLeft()
t.forward(6)
turtle.turnLeft()
t.forward(7)
while not turtle.detectDown() do
    turtle.down()
end
t.turnAround()
local success, block = turtle.inspectDown()
if success and block.name == 'minecraft:chest' then
    for i = 1, 16 do
        turtle.select(i)
        turtle.dropDown()
    end
end