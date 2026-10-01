local gameObject = mjrequire "common/gameObject"
local constructable = mjrequire "common/constructable"

local mod = {
    loadOrder = 1,
}

function mod:onload(inspectCraftPanel)

    local prevLoad = inspectCraftPanel.load
    inspectCraftPanel.load = function(...)

        local list = inspectCraftPanel.itemLists[gameObject.typeIndexMap.campfire]
        local afterFoundIndex = nil
        for i,otherType in ipairs(list) do
            if otherType == constructable.types.campfireRoastedBeetroot.index then
                afterFoundIndex = i
                break
            end
        end
        table.insert(list, afterFoundIndex and (afterFoundIndex + 1) or (#list + 1), constructable.types.campfireRoastedCattailRoot.index)

        prevLoad(...)
    end
end

return mod
