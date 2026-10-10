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
        addFruitRot("banyanSeed", yearLength)
        addFruitRot("cycadSeed", yearLength)
        addFruitRot("juniperBerry", yearLength)
        addFruitRot("treeFernSpores", yearLength)
        addFruitRot("mapleSeed", yearLength)
        addFruitRot("arganNut", yearLength)
        addFruitRot("carobPod", yearLength)
        addFruitRot("alderCone", yearLength)
        addFruitRot("stonePineCone", yearLength)
        addFruitRot("chestnut", yearLength)
        addFruitRot("hazelnut", yearLength)
        addFruitRot("thyme", yearLength)
        addFruitRot("syrianRue", yearLength)
        addFruitRot("angelicaRoot", yearLength)
        addFruitRot("ephedra", yearLength)
        addFruitRot("hennaLeaf", yearLength)
        addFruitRot("myrrh", yearLength)
        addFruitRot("dragonsBlood", yearLength)
        addFruitRot("arcticWillowSeed", yearLength)
        addFruitRot("seaBuckthorn", yearLength)
        addFruitRot("poplarSeed", yearLength)
        addFruitRot("mangroveSeed", yearLength)
        addFruitRot("oleanderSeed", yearLength)
        addFruitRot("planeSeed", yearLength)
        addFruitRot("tamariskSeed", yearLength)
        addFruitRot("sagebrushSeed", yearLength)
        addFruitRot("sagebrushLeaf", yearLength)
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
        addFruitRot("doumFruit", yearLength)
        addFruitRot("saxaulSeed", yearLength)
        addFruitRot("ephedraSeed", yearLength)
        addFruitRot("hennaSeed", yearLength)
        addFruitRot("myrrhSeed", yearLength)
        addFruitRot("dragonsBloodSeed", yearLength)
        addFruitRot("groundFernSpores", yearLength)
        addFruitRot("featherGrassRhizome", yearLength)
        addFruitRot("elephantGrassRhizome", yearLength)
        addFruitRot("cordgrassRhizome", yearLength)
        addFruitRot("cottonGrassRhizome", yearLength)
        addFruitRot("papyrusRhizome", yearLength)
        addFruitRot("giantReedRhizome", yearLength)
        addFruitRot("bulrushRhizome", yearLength)
        addFruitRot("agaveHeart", yearLength)
        addFruitRot("larchCone", yearLength)
        addFruitRot("maritimePineCone", yearLength)

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
        evolvingObject.evolutions[gameObject.types.agaveHeartCooked.index] = {
            minTime = yearLength,
            toType = gameObject.types.agaveHeartRotten.index,
            categoryIndex = evolvingObject.categories.rot.index,
        }
        evolvingObject.evolutions[gameObject.types.rhizomeCooked.index] = {
            minTime = yearLength,
            toType = gameObject.types.reedRhizomeRotten.index,
            categoryIndex = evolvingObject.categories.rot.index,
        }
        evolvingObject.evolutions[gameObject.types.acornCooked.index] = {
            minTime = yearLength,
            toType = gameObject.types.acornRotten.index,
            categoryIndex = evolvingObject.categories.rot.index,
        }
        evolvingObject.evolutions[gameObject.types.reedStem.index] = {
            minTime = 120.0,
            toType = gameObject.types.reedStemDried.index,
            categoryIndex = evolvingObject.categories.dry.index,
        }
        evolvingObject.evolutions[gameObject.types.reedStemDried.index] = {
            minTime = yearLength,
            toType = gameObject.types.hayRotten.index,
            categoryIndex = evolvingObject.categories.rot.index,
        }
        evolvingObject.evolutions[gameObject.types.frond.index] = {
            minTime = 120.0,
            toType = gameObject.types.frondDried.index,
            categoryIndex = evolvingObject.categories.dry.index,
        }
        evolvingObject.evolutions[gameObject.types.frondDried.index] = {
            minTime = yearLength,
            toType = gameObject.types.hayRotten.index,
            categoryIndex = evolvingObject.categories.rot.index,
        }
        evolvingObject.evolutions[gameObject.types.agaveLeaf.index] = {
            minTime = dayLength * 2.0,
            toType = gameObject.types.agaveFibre.index,
            categoryIndex = evolvingObject.categories.dry.index,
        }
        evolvingObject.evolutions[gameObject.types.agaveFibre.index] = {
            minTime = dayLength * rottenItemTimeDays,
            toType = gameObject.types.flaxRotten.index,
            categoryIndex = evolvingObject.categories.rot.index,
        }
        evolvingObject.evolutions[gameObject.types.nettle.index] = {
            minTime = dayLength * 2.0,
            toType = gameObject.types.nettleFibre.index,
            categoryIndex = evolvingObject.categories.dry.index,
        }
        evolvingObject.evolutions[gameObject.types.nettleFibre.index] = {
            minTime = dayLength * rottenItemTimeDays,
            toType = gameObject.types.flaxRotten.index,
            categoryIndex = evolvingObject.categories.rot.index,
        }
        evolvingObject.evolutions[gameObject.types.kapokFibre.index] = {
            minTime = dayLength * rottenItemTimeDays,
            toType = gameObject.types.flaxRotten.index,
            categoryIndex = evolvingObject.categories.rot.index,
        }

        evolvingObject:loadDerivedEvolutions()
        evolvingObject:createFromTypesByToTypes()
    end
end

return mod
