--[[

Digs a 3x3 mineshaft. Place turtle in middle block of the 3x3. Turtle will 
place chest at the beginning and torches along the way if it has them.

todo: refueling logic

--]]

os.loadAPI('t')

local depth = 0

local function getEmptyCount()
    local empties = 0
    for i = 1, 16 do
        if turtle.getItemCount(i) == 0 then
            empties = empties + 1
        end
    end

    return empties
end

while getEmptyCount() > 2 do
    if turtle.getFuelLevel() < depth + 5 then
        break
    end

    t.digUp()
    t.digDown()

    if depth == 0 then
        if t.selectItem('minecraft:chest') then
            t.placeDown()
        end
    end

    turtle.turnLeft()
    t.dig()
    t.forward()
    t.digUp()
    t.digDown()

    t.turnAround()
    t.forward()

    t.dig()
    t.forward()
    t.digUp()
    t.digDown()

    t.turnAround()
    t.forward()

    if depth % 6 == 0 then
        if t.selectItem('minecraft:torch') then
            t.place()
        end
    end

    turtle.turnRight()
    t.dig()
    t.forward()

    depth = depth + 1
end

t.turnAround()
t.forward(depth)

local success, block = turtle.inspectDown()
if success and block.name == 'minecraft:chest' then
    for i = 1, 16 do
        turtle.select(i)
        turtle.dropDown()
    end
end