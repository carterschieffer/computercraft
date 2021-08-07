
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


function checkForFallingBlock()
end