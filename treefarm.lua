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

t.forward()
for z = 1, 13 do
    for x = 1, 7 do
        for y = 1, 7 do
            local success, block = turtle.inspectDown()
            if success and block.name ~= 'minecraft:torch' then
                t.digDown()
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









            

local success, block = turtle.inspectDown()
if success and block.name == 'minecraft:chest' then
    for i = 1, 16 do
        turtle.select(i)
        turtle.dropDown()
    end
end