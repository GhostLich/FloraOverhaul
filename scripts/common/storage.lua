local mjm = mjrequire "common/mjm"
local vec3 = mjm.vec3
local mat3Identity = mjm.mat3Identity
local mat3Rotate = mjm.mat3Rotate

local rng = mjrequire "common/randomNumberGenerator"
local typeMaps = mjrequire "common/typeMaps"
local locale = mjrequire "common/locale"
local resource = mjrequire "common/resource"

local mod = {
    loadOrder = 1,
}

function mod:onload(storage)

    local gameObjectTypeIndexMap = typeMaps.types.gameObject

    local function smallFruitStorage(key, rottenKey, boxSize)
        typeMaps:insert("storage", storage.types, {
            key = key,
            name = locale:get("storage_" .. key),
            displayGameObjectTypeIndex = gameObjectTypeIndexMap[key],
            resources = {
                resource.types[key].index,
                resource.types[rottenKey].index,
            },
            storageBox = {
                size =  vec3(boxSize, boxSize, boxSize),
                rotationFunction = function(uniqueID, seed)
                    local randomValue = rng:valueForUniqueID(uniqueID, seed)
                    local rotation = mat3Rotate(mat3Identity, randomValue * 6.282, vec3(0.0,1.0,0.0))
                    rotation = mat3Rotate(rotation, randomValue * 6.282, vec3(1.0,0.0,0.0))
                    return rotation
                end,
            },
            maxCarryCount = 4,
            maxCarryCountLimitedAbility = 2,
            maxCarryCountForRunning = 1,
            carryType = storage.carryTypes.small,
            carryOffset = vec3(0.0,0.01,0.0),
            windBlowAwayModerateChance = true,
        })
    end

    smallFruitStorage("fig", "figRotten", 0.12)
    smallFruitStorage("date", "dateRotten", 0.12)
    smallFruitStorage("grape", "grapeRotten", 0.18)
    smallFruitStorage("cactusFruit", "cactusFruitRotten", 0.12)
    smallFruitStorage("palmSeed", "palmSeedRotten", 0.12)
    smallFruitStorage("acaciaSeed", "acaciaSeedRotten", 0.12)
    smallFruitStorage("kapokSeed", "kapokSeedRotten", 0.12)
    smallFruitStorage("rubberSeed", "rubberSeedRotten", 0.12)
    smallFruitStorage("acorn", "acornRotten", 0.12)
    smallFruitStorage("olive", "oliveRotten", 0.12)
    smallFruitStorage("cypressCone", "cypressConeRotten", 0.12)
    smallFruitStorage("brazilNut", "brazilNutRotten", 0.15)
    smallFruitStorage("mahoganySeed", "mahoganySeedRotten", 0.12)
    smallFruitStorage("banyanSeed", "banyanSeedRotten", 0.12)
    smallFruitStorage("cycadSeed", "cycadSeedRotten", 0.12)
    smallFruitStorage("juniperBerry", "juniperBerryRotten", 0.12)
    smallFruitStorage("treeFernSpores", "treeFernSporesRotten", 0.12)
    smallFruitStorage("mapleSeed", "mapleSeedRotten", 0.12)
    smallFruitStorage("arganNut", "arganNutRotten", 0.12)
    smallFruitStorage("carobPod", "carobPodRotten", 0.18)
    smallFruitStorage("alderCone", "alderConeRotten", 0.12)
    smallFruitStorage("stonePineCone", "stonePineConeRotten", 0.15)
    smallFruitStorage("chestnut", "chestnutRotten", 0.15)
    smallFruitStorage("hazelnut", "hazelnutRotten", 0.12)
    smallFruitStorage("thyme", "thymeRotten", 0.12)
    smallFruitStorage("arcticWillowSeed", "arcticWillowSeedRotten", 0.12)
    smallFruitStorage("poplarSeed", "poplarSeedRotten", 0.12)
    smallFruitStorage("mangroveSeed", "mangroveSeedRotten", 0.12)
    smallFruitStorage("oleanderSeed", "oleanderSeedRotten", 0.12)
    smallFruitStorage("planeSeed", "planeSeedRotten", 0.12)
    smallFruitStorage("tamariskSeed", "tamariskSeedRotten", 0.12)
    smallFruitStorage("sagebrushSeed", "sagebrushSeedRotten", 0.12)
    smallFruitStorage("sagebrushLeaf", "sagebrushLeafRotten", 0.12)
    smallFruitStorage("baldCypressCone", "baldCypressConeRotten", 0.12)
    smallFruitStorage("reedRhizome", "reedRhizomeRotten", 0.12)
    smallFruitStorage("yarrowFlower", "yarrowFlowerRotten", 0.12)
    smallFruitStorage("gotuKolaLeaf", "gotuKolaLeafRotten", 0.12)
    smallFruitStorage("plantainLeaf", "plantainLeafRotten", 0.12)
    smallFruitStorage("peppermintLeaf", "peppermintLeafRotten", 0.12)
    smallFruitStorage("lemongrass", "lemongrassRotten", 0.12)
    smallFruitStorage("cacaoPod", "cacaoPodRotten", 0.18)

    typeMaps:insert("storage", storage.types, {
        key = "willowBark",
        name = locale:get("storage_willowBark"),
        displayGameObjectTypeIndex = gameObjectTypeIndexMap.willowBark,
        resources = {
            resource.types.willowBark.index,
        },
        storageBox = {
            size =  vec3(0.3, 0.06, 0.1),
            rotationFunction = function(uniqueID, seed)
                local randomValue = rng:valueForUniqueID(uniqueID, seed)
                return mat3Rotate(mat3Identity, randomValue * 6.282, vec3(0.0,1.0,0.0))
            end,
        },
        maxCarryCount = 4,
        maxCarryCountLimitedAbility = 2,
        maxCarryCountForRunning = 1,
        carryType = storage.carryTypes.small,
        carryOffset = vec3(0.0,0.01,0.0),
        windBlowAwayModerateChance = true,
    })
    smallFruitStorage("lingonberry", "lingonberryRotten", 0.12)
    smallFruitStorage("cloudberry", "cloudberryRotten", 0.12)

    typeMaps:insert("storage", storage.types, {
        key = "mesquitePod",
        name = locale:get("storage_mesquitePod"),
        displayGameObjectTypeIndex = gameObjectTypeIndexMap.mesquitePod,
        resources = {
            resource.types.mesquitePod.index,
            resource.types.mesquitePodRotten.index,
        },
        storageBox = {
            size =  vec3(0.1, 0.03, 0.25),
            rotationFunction = function(uniqueID, seed)
                local randomValue = rng:valueForUniqueID(uniqueID, seed)
                local rotation = mat3Rotate(mat3Identity, (randomValue - 0.5) * 0.3, vec3(0.0,1.0,0.0))
                rotation = mat3Rotate(rotation, math.pi * 0.5, vec3(1.0,0.0,0.0))
                return rotation
            end,
        },
        maxCarryCount = 4,
        maxCarryCountLimitedAbility = 2,
        maxCarryCountForRunning = 1,
        carryType = storage.carryTypes.small,
        carryOffset = vec3(0.0,0.03,0.0),
        carryRotation = mat3Rotate(mat3Identity, math.pi * 0.5, vec3(0.0, 0.0, 1.0)),
        windBlowAwayModerateChance = true,
    })

    typeMaps:insert("storage", storage.types, {
        key = "cattailRoot",
        name = locale:get("storage_cattailRoot"),
        displayGameObjectTypeIndex = gameObjectTypeIndexMap.cattailRoot,
        resources = {
            resource.types.cattailRoot.index,
            resource.types.cattailRootRotten.index,
            resource.types.cattailRootCooked.index,
        },
        storageBox = {
            size =  vec3(0.12, 0.12, 0.12),
            rotationFunction = function(uniqueID, seed)
                local randomValue = rng:valueForUniqueID(uniqueID, seed)
                local rotation = mat3Rotate(mat3Identity, randomValue * 6.282, vec3(0.0,1.0,0.0))
                rotation = mat3Rotate(rotation, randomValue * 6.282, vec3(1.0,0.0,0.0))
                return rotation
            end,
        },
        maxCarryCount = 4,
        maxCarryCountLimitedAbility = 2,
        maxCarryCountForRunning = 1,
        carryType = storage.carryTypes.small,
        carryOffset = vec3(0.0,0.01,0.0),
    })

    typeMaps:insert("storage", storage.types, {
        key = "baobabFruit",
        name = locale:get("storage_baobabFruit"),
        displayGameObjectTypeIndex = gameObjectTypeIndexMap.baobabFruit,
        resources = {
            resource.types.baobabFruit.index,
            resource.types.baobabFruitRotten.index,
        },
        storageBox = {
            size =  vec3(0.2, 0.2, 0.2),
            rotationFunction = function(uniqueID, seed)
                local randomValue = rng:valueForUniqueID(uniqueID, seed)
                local rotation = mat3Rotate(mat3Identity, randomValue * 0.2 - 0.1, vec3(0.0,1.0,0.0))
                return rotation
            end,
        },
        carryOffset = vec3(-0.0,0.12,0.07),
        maxCarryCountForRunning = 0,
    })

    typeMaps:insert("storage", storage.types, {
        key = "watermelon",
        name = locale:get("storage_watermelon"),
        displayGameObjectTypeIndex = gameObjectTypeIndexMap.watermelon,
        resources = {
            resource.types.watermelon.index,
            resource.types.watermelonRotten.index,
        },
        storageBox = {
            size =  vec3(0.35, 0.45, 0.38),
            rotationFunction = function(uniqueID, seed)
                local randomValue = rng:valueForUniqueID(uniqueID, seed)
                local rotation = mat3Rotate(mat3Identity, randomValue * 0.2 - 0.1, vec3(0.0,1.0,0.0))
                return rotation
            end,
        },
        carryOffset = vec3(-0.05,0.13,0.1),
        maxCarryCountForRunning = 0,
        carryRotation = mat3Rotate(mat3Identity, 1.2, vec3(0.0, 0.0, 1.0)),
    })
end

return mod
