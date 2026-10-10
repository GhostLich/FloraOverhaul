local mjm = mjrequire "common/mjm"
local vec3 = mjm.vec3
local normalize = mjm.normalize
local cross = mjm.cross
local length = mjm.length
local mat3Rotate = mjm.mat3Rotate

local gameObject = mjrequire "common/gameObject"
local rng = mjrequire "common/randomNumberGenerator"
local timer = mjrequire "common/timer"
local terrain = mjrequire "server/serverTerrain"

local mod = {
    loadOrder = 1,
}

function mod:onload(serverGOM)

    local function addWaterPlants(objectID, tryCount, maxDistance, maxDepth)
        local object = serverGOM:getObjectWithID(objectID)
        if not object then
            return
        end

        local serverWorld = mjrequire "server/serverWorld"
        local serverFlora = mjrequire "server/objects/serverFlora"
        local key = "waterPlants_" .. objectID
        if serverWorld.worldDatabase:dataForKey(key) then
            return
        end
        serverWorld.worldDatabase:setDataForKey(true, key)

        local gameObjectType = gameObject.types[object.objectTypeIndex]

        for i = 1,tryCount do
            local perpNormal = normalize(cross(normalize(rng:vecForUniqueID(objectID, 4471 + i)), object.normalizedPos))
            local distance = mj:mToP(1.5 + maxDistance * rng:valueForUniqueID(objectID, 8123 + i))
            local point = terrain:getHighestDetailTerrainPointAtPoint(normalize(object.pos + perpNormal * distance))
            local altitude = length(point) - 1.0
            if altitude < mj:mToP(-0.05) and altitude > mj:mToP(-maxDepth) then
                local newObjectID = serverGOM:createGameObject({
                    objectTypeIndex = object.objectTypeIndex,
                    addLevel = mj.SUBDIVISIONS - 3,
                    pos = point,
                    rotation = mat3Rotate(object.rotation, math.pi * 2.0 * rng:valueForUniqueID(objectID, 6211 + i), vec3(0.0,1.0,0.0)),
                    velocity = vec3(0.0,0.0,0.0),
                    scale = object.scale,
                    renderType = RENDER_TYPE_STATIC,
                    hasPhysics = gameObjectType.hasPhysics,
                    sharedState = {},
                    privateState = {},
                })
                local newObject = newObjectID and serverGOM:getObjectWithID(newObjectID)
                if newObject then
                    serverFlora:refillInventory(newObject, newObject.sharedState, true, true)
                end
            end
        end
    end

    local prevInit = serverGOM.init
    serverGOM.init = function(serverGOM_)
        prevInit(serverGOM_)

        local mangroveTypes = {
            gameObject.types.mangrove1.index,
            gameObject.types.mangrove2.index,
        }
        local reedTypes = {
            gameObject.types.cattail.index,
            gameObject.types.bulrush.index,
            gameObject.types.commonReed.index,
            gameObject.types.giantReed.index,
            gameObject.types.papyrus.index,
            gameObject.types.cordgrass.index,
            gameObject.types.cottonGrass.index,
        }

        serverGOM:addObjectLoadedFunctionForTypes(mangroveTypes, function(object)
            if not serverGOM:isStored(object.uniqueID) and rng:integerForUniqueID(object.uniqueID, 6151, 2) == 0 then
                if length(object.pos) - 1.0 < mj:mToP(2.0) then
                    local objectID = object.uniqueID
                    timer:addCallbackTimer(1.0, function()
                        addWaterPlants(objectID, 4, 8.0, 0.7)
                    end)
                end
            end
        end)

        serverGOM:addObjectLoadedFunctionForTypes(reedTypes, function(object)
            if not serverGOM:isStored(object.uniqueID) and rng:integerForUniqueID(object.uniqueID, 6157, 4) == 0 then
                if length(object.pos) - 1.0 < mj:mToP(2.0) then
                    local objectID = object.uniqueID
                    timer:addCallbackTimer(1.0, function()
                        addWaterPlants(objectID, 2, 3.5, 0.4)
                    end)
                end
            end
        end)
    end
end

return mod
