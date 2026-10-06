local resource = mjrequire "common/resource"

local mod = {
    loadOrder = 1,
}

function mod:onload(fuel)
    for i,key in ipairs({"cypressCone", "alderCone", "baldCypressCone", "larchCone", "maritimePineCone"}) do
        local resourceTypeIndex = resource.types[key].index
        fuel.fuelGroups.campfire.resources[resourceTypeIndex] = {
            fuelAddition = 1.0,
        }
        fuel.fuelGroups.kiln.resources[resourceTypeIndex] = {
            fuelAddition = 1.0,
        }
        fuel.fuelGroups.litObject.resources[resourceTypeIndex] = {
            fuelAddition = 1.0,
        }
    end
end

return mod
