local flora = mjrequire "common/flora"
local gameObject = mjrequire "common/gameObject"
local terrainTypes = mjrequire "common/terrainTypes"
local terrain = mjrequire "server/serverTerrain"

local mod = {
    loadOrder = 1,
}

function mod:onload(serverFlora)
    local reedSoilQualities = {
        [terrainTypes.baseTypes.riverSand.index] = flora.soilQualities.rich,
        [terrainTypes.baseTypes.beachSand.index] = flora.soilQualities.normal,
    }

    local prevGetGrowthMediumQuality = serverFlora.getGrowthMediumQuality
    serverFlora.getGrowthMediumQuality = function(serverFlora_, object)
        local soilQuality = prevGetGrowthMediumQuality(serverFlora_, object)
        if gameObject.types[object.objectTypeIndex].floraTypeIndex == flora.types.reedPlant.index then
            local vert = terrain:getVertWithID(terrain:getClosestVertIDToPos(object.normalizedPos))
            if vert and reedSoilQualities[vert.baseType] then
                return reedSoilQualities[vert.baseType]
            end
        end
        return soilQuality
    end
end

return mod
