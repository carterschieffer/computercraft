--[[

Advanced Turtle API

--]]

-- Item selection
-- check if turtle has a specific item and select it
function selectItem(item_name)
    for i = 1, 16 do
        turtle.select(i)
        local item = turtle.getItemDetail()
        if item and item.name == item_name then
            return true
        end
    end
    return false
end


-- Digging with falling block detection
function dig()
    local tries = 0
    while turtle.detect() do
        turtle.dig()
        sleep(0.4)
        tries = tries + 1
        if tries > 64 then
            print('Error: dug for too long')
            return false
        end
    end
    return true
end

function digUp()
    local tries = 0
    while turtle.detectUp() do
        turtle.digUp()
        sleep(0.4)
        tries = tries + 1
        if tries > 64 then
            print('Error: dug up for too long')
            return false
        end
    end
    return true
end

function digDown()
    local tries = 0
    while turtle.detectDown() do
        turtle.digDown()
        sleep(0.4)
        tries = tries + 1
        if tries > 64 then
            print('Error: dug down for too long')
            return false
        end
    end
    return true
end


-- Traveling: attempts to move in a direction
function forward(amount)
    amount = amount or 1
    for i = 1, amount do
        local tries = 0
        while not turtle.forward() do
            turtle.dig()
            turtle.attack()
            sleep(0.2)
            tries = tries + 1
            if tries > 64 then
                print('Error: can\'t move forward')
                return false
            end
        end
    end
    return true
end

function up(amount)
    amount = amount or 1
    for i = 1, amount do
        local tries = 0
        while not turtle.up() do
            turtle.dig()
            turtle.attack()
            sleep(0.2)
            tries = tries + 1
            if tries > 64 then
                print('Error: can\'t move up')
                return false
            end
        end
    end
    return true
end

function down(amount)
    amount = amount or 1
    for i = 1, amount do
        local tries = 0
        while not turtle.down() do
            turtle.dig()
            turtle.attack()
            sleep(0.2)
            tries = tries + 1
            if tries > 64 then
                print('Error: can\'t move down')
                return false
            end
        end
    end
    return true
end

function back(amount)
    amount = amount or 1
    for i = 1, amount do
        if not turtle.back() then
            turnAround()
            forward()
            turnAround()
        end
    end
end


-- Place items: Doesn't place when the item is already placed
function place()
    if not turtle.compare() then
        dig()
        turtle.place()
    end
end

function placeUp()
    if not turtle.compareUp() then
        digUp()
        turtle.placeUp()
    end
end

function placeDown()
    if not turtle.compareDown() then
        digDown()
        turtle.placeDown()
    end
end

function placeRight()
    turtle.turnRight()
    place()
    turtle.turnLeft()
end

function placeLeft()
    turtle.turnLeft()
    place()
    turtle.turnRight()
end

function placeBack()
    turnAround()
    place()
    turnAround()
end


-- Turning
function turnAround()
    turtle.turnRight()
    turtle.turnRight()
end

function goRight(amount)
    amount = amount or 1
    turtle.turnRight()
    forward(amount)
end

function goLeft(amount)
    amount = amount or 1
    turtle.turnLeft()
    forward(amount)
end

function strafeRight(amount)
    amount = amount or 1
    goRight(amount)
    turtle.turnLeft()
end

function strafeLeft(amount)
    amount = amount or 1
    goLeft(amount)
    turtle.turnRight()
end