
-- check if turtle has a specific item
function hasItem(item_name)
    for i = 1, 16 do
        local item = turtle.getItemDetail(i)
        if item and item.name == item_name then
            return true
        end
    end
    return false
end