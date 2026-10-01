local gameObject = mjrequire "common/gameObject"

local rottenItemTimeDays = 2.0

local mod = {
    loadOrder = 1,
}

function mod:onload(evolvingObject)

    local prevInit = evolvingObject.init
    evolvingObject.init = function(evolvingObject_, dayLength, yearLength)
        prevInit(evolvingObject_, dayLength, yearLength)

        local function addFruitRot(key, rotTime)
            evolvingObject.evolutions[gameObject.types[key].index] = {
                minTime = rotTime,
                toType = gameObject.types[key .. "Rotten"].index,
                categoryIndex = evolvingObject.categories.rot.index,
            }
            evolvingObject.evolutions[gameObject.types[key .. "Rotten"].index] = {
                minTime = dayLength * rottenItemTimeDays,
                categoryIndex = evolvingObject.categories.despawn.index,
            }
        end

        addFruitRot("fig", dayLength * rottenItemTimeDays)
        addFruitRot("grape", dayLength * rottenItemTimeDays)
        addFruitRot("barley", dayLength * rottenItemTimeDays)
        addFruitRot("date", yearLength)
        addFruitRot("watermelon", yearLength)
        addFruitRot("baobabFruit", yearLength)
        addFruitRot("cactusFruit", yearLength)
        addFruitRot("mesquitePod", yearLength)
        addFruitRot("palmSeed", yearLength)
        addFruitRot("acaciaSeed", yearLength)
        addFruitRot("kapokSeed", yearLength)
        addFruitRot("rubberSeed", yearLength)
        addFruitRot("acorn", yearLength)
        addFruitRot("olive", dayLength * 4)
        addFruitRot("cypressCone", yearLength)
        addFruitRot("brazilNut", yearLength)
        addFruitRot("mahoganySeed", yearLength)
        addFruitRot("cycadSeed", yearLength)
        addFruitRot("juniperBerry", yearLength)
        addFruitRot("treeFernSpores", yearLength)
        addFruitRot("mapleSeed", yearLength)
        addFruitRot("arganNut", yearLength)
        addFruitRot("carobPod", yearLength)
        addFruitRot("alderCone", yearLength)
        addFruitRot("stonePineCone", yearLength)
        addFruitRot("poplarSeed", yearLength)
        addFruitRot("mangroveSeed", yearLength)
        addFruitRot("oleanderSeed", yearLength)
        addFruitRot("planeSeed", yearLength)
        addFruitRot("tamariskSeed", yearLength)
        addFruitRot("baldCypressCone", yearLength)
        addFruitRot("reedRhizome", yearLength)
        addFruitRot("yarrowFlower", yearLength)
        addFruitRot("gotuKolaLeaf", yearLength)
        addFruitRot("plantainLeaf", yearLength)
        addFruitRot("peppermintLeaf", yearLength)
        addFruitRot("lemongrass", yearLength)
        addFruitRot("cacaoPod", dayLength * 4)
        addFruitRot("lingonberry", yearLength)
        addFruitRot("cloudberry", dayLength * rottenItemTimeDays)

        addFruitRot("cattailRoot", yearLength)
        evolvingObject.evolutions[gameObject.types.palmLeaf.index] = {
            minTime = 120.0,
            toType = gameObject.types.palmLeafDried.index,
            categoryIndex = evolvingObject.categories.dry.index,
        }
        evolvingObject.evolutions[gameObject.types.palmLeafDried.index] = {
            minTime = yearLength,
            toType = gameObject.types.hayRotten.index,
            categoryIndex = evolvingObject.categories.rot.index,
        }
        evolvingObject.evolutions[gameObject.types.cattailRootCooked.index] = {
            minTime = yearLength,
            toType = gameObject.types.cattailRootRotten.index,
            categoryIndex = evolvingObject.categories.rot.index,
        }
    end
end

return mod
