local mjm = mjrequire "common/mjm"
local vec3 = mjm.vec3
local mat3Identity = mjm.mat3Identity
local mat3Rotate = mjm.mat3Rotate

local resource = mjrequire "common/resource"
local constructable = mjrequire "common/constructable"
local selectionGroup = mjrequire "common/selectionGroup"
local gameConstants = mjrequire "common/gameConstants"
local model = mjrequire "common/model"
local terrain = mjrequire "common/terrain"
local locale = mjrequire "common/locale"

local mod = {
    loadOrder = 1,
}

local function getUpvalue(func, name)
    local i = 1
    while true do
        local upvalueName, value = debug.getupvalue(func, i)
        if not upvalueName then
            return nil
        end
        if upvalueName == name then
            return value
        end
        i = i + 1
    end
end

local function getFloraUpvalue(func, name)
    while func do
        local value = getUpvalue(func, name)
        if value then
            return value
        end
        func = getUpvalue(func, "prevLoad")
    end
    return nil
end

function mod:onload(flora)
    local seasons = gameConstants.seasons

    table.insert(flora.logTypeBaseKeys, "fig")
    table.insert(flora.logTypeBaseKeys, "datePalm")
    table.insert(flora.logTypeBaseKeys, "baobab")
    table.insert(flora.logTypeBaseKeys, "acacia")
    table.insert(flora.logTypeBaseKeys, "kapok")
    table.insert(flora.logTypeBaseKeys, "rubber")
    table.insert(flora.logTypeBaseKeys, "oak")
    table.insert(flora.logTypeBaseKeys, "olive")
    table.insert(flora.logTypeBaseKeys, "cypress")
    table.insert(flora.logTypeBaseKeys, "brazilNut")
    table.insert(flora.logTypeBaseKeys, "mahogany")
    table.insert(flora.logTypeBaseKeys, "banyan")
    table.insert(flora.logTypeBaseKeys, "juniper")
    table.insert(flora.logTypeBaseKeys, "maple")
    table.insert(flora.logTypeBaseKeys, "argan")
    table.insert(flora.logTypeBaseKeys, "carob")
    table.insert(flora.logTypeBaseKeys, "alder")
    table.insert(flora.logTypeBaseKeys, "poplar")
    table.insert(flora.logTypeBaseKeys, "plane")
    table.insert(flora.logTypeBaseKeys, "baldCypress")
    table.insert(flora.branchTypeBaseKeys, "fig")
    table.insert(flora.branchTypeBaseKeys, "baobab")
    table.insert(flora.branchTypeBaseKeys, "mesquite")
    table.insert(flora.branchTypeBaseKeys, "acacia")
    table.insert(flora.branchTypeBaseKeys, "kapok")
    table.insert(flora.branchTypeBaseKeys, "rubber")
    table.insert(flora.branchTypeBaseKeys, "oak")
    table.insert(flora.branchTypeBaseKeys, "olive")
    table.insert(flora.branchTypeBaseKeys, "cypress")
    table.insert(flora.branchTypeBaseKeys, "brazilNut")
    table.insert(flora.branchTypeBaseKeys, "mahogany")
    table.insert(flora.branchTypeBaseKeys, "banyan")
    table.insert(flora.branchTypeBaseKeys, "juniper")
    table.insert(flora.branchTypeBaseKeys, "maple")
    table.insert(flora.branchTypeBaseKeys, "argan")
    table.insert(flora.branchTypeBaseKeys, "alder")
    table.insert(flora.branchTypeBaseKeys, "poplar")
    table.insert(flora.branchTypeBaseKeys, "carob")
    table.insert(flora.branchTypeBaseKeys, "mangrove")
    table.insert(flora.branchTypeBaseKeys, "plane")
    table.insert(flora.branchTypeBaseKeys, "baldCypress")
    table.insert(flora.branchTypeBaseKeys, "tamarisk")

    local prevLoad = flora.load

    local addFlora = getFloraUpvalue(prevLoad, "addFlora")
    local addFruit = getFloraUpvalue(prevLoad, "addFruit")
    local getClientModelFunction = getFloraUpvalue(prevLoad, "getClientModelFunction")
    local treeMarkerPositions = getFloraUpvalue(prevLoad, "treeMarkerPositions")
    local bushMarkerPositions = getFloraUpvalue(prevLoad, "bushMarkerPositions")
    local tallPlantMarkerPositions = getFloraUpvalue(prevLoad, "tallPlantMarkerPositions")
    local tinyPlantMarkerPositions = getFloraUpvalue(prevLoad, "tinyPlantMarkerPositions")
    local treeFollowCamOffset = getFloraUpvalue(prevLoad, "treeFollowCamOffset")

    flora.load = function(flora_, gameObject)
        prevLoad(flora_, gameObject)

        if not (addFlora and addFruit and getClientModelFunction and treeMarkerPositions and bushMarkerPositions and tallPlantMarkerPositions and tinyPlantMarkerPositions) then
            mj:warn("Flora Overhaul: flora functions not found")
            return
        end

        addFruit("fig", "whFig")
        addFruit("date", "whDate")
        addFruit("grape", "whGrape")
        addFruit("watermelon", "whWaterMelon")
        addFruit("baobabFruit", "whBaobabFruit")
        addFruit("cactusFruit", "whCactusFruit")
        addFruit("cattailRoot", "whCattailRoot")
        addFruit("palmSeed", "whPalmSeed")
        addFruit("lingonberry", "whLingonberry")
        addFruit("cloudberry", "whCloudberry")
        addFruit("mesquitePod", "whMesquitePod")
        addFruit("acaciaSeed", "whAcaciaSeed")
        addFruit("kapokSeed", "whKapokSeed")
        addFruit("rubberSeed", "whRubberSeed")
        addFruit("acorn", "whAcorn")
        addFruit("olive", "whOlive")
        addFruit("cypressCone", "whCypressCone")
        addFruit("brazilNut", "whBrazilNut")
        addFruit("mahoganySeed", "whMahoganySeed")
        addFruit("banyanSeed", "whBanyanSeed")
        addFruit("cycadSeed", "whCycadSeed")
        addFruit("juniperBerry", "whJuniperBerry")
        addFruit("treeFernSpores", "whTreeFernSpores")
        addFruit("mapleSeed", "whMapleSeed")
        addFruit("arganNut", "whArganNut")
        addFruit("carobPod", "whCarobPod")
        addFruit("alderCone", "whAlderCone")
        addFruit("poplarSeed", "whPoplarSeed")
        addFruit("mangroveSeed", "whMangroveSeed")
        addFruit("oleanderSeed", "whOleanderSeed")
        addFruit("planeSeed", "whPlaneSeed")
        addFruit("tamariskSeed", "whTamariskSeed")
        addFruit("stonePineCone", "whStonePineCone")
        addFruit("baldCypressCone", "whBaldCypressCone")
        addFruit("cacaoPod", "whCacaoPod")
        addFruit("reedRhizome", "whReedRhizome")
        addFruit("yarrowFlower", "whYarrowFlower")
        addFruit("gotuKolaLeaf", "whGotuKolaLeaf")
        addFruit("plantainLeaf", "whPlantainLeaf")
        addFruit("peppermintLeaf", "whPeppermintLeaf")
        addFruit("lemongrass", "whLemongrass")

        local function addItem(key, modelName, resourceTypeIndex)
            gameObject:addGameObject(key, {
                name = locale:get("object_" .. key),
                plural = locale:get("object_" .. key .. "_plural"),
                modelName = modelName,
                scale = 1.0,
                hasPhysics = true,
                resourceTypeIndex = resourceTypeIndex,
                objectViewRotationFunction = function(object)
                    return mat3Rotate(mat3Identity, 0.1, vec3(1.0, 0.0, 0.0))
                end,
                markerPositions = {
                    {
                        worldOffset = vec3(0.0, mj:mToP(0.2), 0.0)
                    }
                },
            })
        end

        addItem("barley", "whBarley", resource.types.wheat.index)
        addItem("barleyRotten", "whBarleyRotten", resource.types.wheatRotten.index)
        addItem("cattailRootCooked", "whCattailRootCooked", resource.types.cattailRootCooked.index)
        addItem("palmLeaf", "whPalmLeaf", resource.types.grass.index)
        addItem("palmLeafDried", "whPalmLeafDried", resource.types.hay.index)
        addItem("willowBark", "whWillowBark", resource.types.willowBark.index)

        local willowResourceGroupsDone = {}
        for i,key in ipairs({"willow1", "willow2"}) do
            local willowResourceGroup = flora.types[key].resourceGroup
            if not willowResourceGroupsDone[willowResourceGroup] then
                willowResourceGroupsDone[willowResourceGroup] = true
                willowResourceGroup.seasonalReplenish[gameObject.typeIndexMap.willowBark] = 2
                table.insert(willowResourceGroup.gatherableTypes, gameObject.typeIndexMap.willowBark)
            end
        end

        local coconutResourceGroup = flora.types.coconutTree.resourceGroup
        if not coconutResourceGroup.seasonalReplenish then
            coconutResourceGroup.seasonalReplenish = {}
        end
        coconutResourceGroup.seasonalReplenish[gameObject.typeIndexMap.palmLeaf] = 3
        table.insert(coconutResourceGroup.gatherableTypes, gameObject.typeIndexMap.palmLeaf)

        local function addVariations(keys)
            local constructableTypeIndexes = {}
            for i,key in ipairs(keys) do
                table.insert(constructableTypeIndexes, flora.types[key].constructableTypeIndex)
            end
            constructable.types[constructableTypeIndexes[1]].variationsAllowRandom = true
            constructable:addVariations(constructableTypeIndexes)
        end

        local function requireSeedObject(floraKey, seedObjectKey)
            constructable.types[flora.types[floraKey].constructableTypeIndex].requiredResources[1].objectTypeIndex = gameObject.typeIndexMap[seedObjectKey]
        end

        addFlora("figTree", {
            name = locale:get("flora_figTree"),
            plural = locale:get("flora_figTree_plural"),
            summary = locale:get("flora_figTree_summary"),
            saplingName = locale:get("flora_figTree_sapling"),
            saplingPlural = locale:get("flora_figTree_sapling_plural"),
            modelName = "whFigTree",
            saplingModelName = "whFigTreeSapling",
            resourceGroup = {
                baseInventory = {
                    [gameObject.typeIndexMap.figBranch] = 2,
                    [gameObject.typeIndexMap.figLog] = 2,
                },
                seasonalReplenish = {
                    [gameObject.typeIndexMap.figBranch] = 2,
                },
                fruitReplenish = {
                    [gameObject.typeIndexMap.fig] = 6,
                },
                gatherableTypes = {
                    gameObject.typeIndexMap.fig,
                    gameObject.typeIndexMap.figBranch,
                },
            },
            requiresAxeToChop = true,
            markerPositions = treeMarkerPositions,
            followCamOffset = treeFollowCamOffset,
            clientModelFunction = getClientModelFunction("whFigTree", "whFigTree", true, false, false),
            saplingClientModelFunction = getClientModelFunction("whFigTree", "whFigTreeSapling", true, false, true),
            fruitSeason = seasons.summer,
            seedResourceTypeIndex = resource.types.fig.index,
            isPathFindingCollider = false,
            useCraftSimple = true,
            isFoodCrop = true,
            playBirdSounds = true,
        })

        local datePalmSelectionGroupTypeIndex = selectionGroup:addGroup("allDatePalms", locale:get("flora_datePalm"), locale:get("flora_datePalm_plural"), nil)
        for i = 1,3 do
            local key = "datePalm" .. mj:tostring(i)
            addFlora(key, {
                name = locale:get("flora_datePalm"),
                plural = locale:get("flora_datePalm_plural"),
                summary = locale:get("flora_datePalm_summary"),
                saplingName = locale:get("flora_datePalm_sapling"),
                saplingPlural = locale:get("flora_datePalm_sapling_plural"),
                modelName = "whDatePalm" .. mj:tostring(i),
                saplingModelName = "whDatePalmSapling",
                resourceGroup = {
                    baseInventory = {
                        [gameObject.typeIndexMap.datePalmLog] = 3,
                    },
                    seasonalReplenish = {
                        [gameObject.typeIndexMap.palmLeaf] = 3,
                    },
                    fruitReplenish = {
                        [gameObject.typeIndexMap.date] = 6,
                    },
                    gatherableTypes = {
                        gameObject.typeIndexMap.date,
                        gameObject.typeIndexMap.palmLeaf,
                    },
                },
                requiresAxeToChop = true,
                markerPositions = treeMarkerPositions,
                followCamOffset = treeFollowCamOffset,
                saplingClientModelFunction = getClientModelFunction("whDatePalm", "whDatePalmSapling", false, false, true),
                fruitSeason = seasons.autumn,
                seedResourceTypeIndex = resource.types.date.index,
                speciesSelectionGroupTypeIndex = datePalmSelectionGroupTypeIndex,
                maturityDurationDays = 8,
                isPathFindingCollider = false,
                useCraftSimple = true,
                isFoodCrop = true,
                playBirdSounds = true,
            })
        end
        addVariations({"datePalm1", "datePalm2", "datePalm3"})

        local wildPalmSelectionGroupTypeIndex = selectionGroup:addGroup("allWildPalms", locale:get("flora_wildPalm"), locale:get("flora_wildPalm_plural"), nil)
        for i = 1,3 do
            addFlora("wildPalm" .. mj:tostring(i), {
                name = locale:get("flora_wildPalm"),
                plural = locale:get("flora_wildPalm_plural"),
                summary = locale:get("flora_wildPalm_summary"),
                saplingName = locale:get("flora_wildPalm_sapling"),
                saplingPlural = locale:get("flora_wildPalm_sapling_plural"),
                modelName = "whWildPalm" .. mj:tostring(i),
                saplingModelName = "whDatePalmSapling",
                resourceGroup = {
                    baseInventory = {
                        [gameObject.typeIndexMap.datePalmLog] = 3,
                    },
                    seasonalReplenish = {
                        [gameObject.typeIndexMap.palmLeaf] = 3,
                    },
                    fruitReplenish = {
                        [gameObject.typeIndexMap.palmSeed] = 2,
                    },
                    gatherableTypes = {
                        gameObject.typeIndexMap.palmSeed,
                        gameObject.typeIndexMap.palmLeaf,
                    },
                },
                requiresAxeToChop = true,
                markerPositions = treeMarkerPositions,
                followCamOffset = treeFollowCamOffset,
                saplingClientModelFunction = getClientModelFunction("whDatePalm", "whDatePalmSapling", false, false, true),
                fruitSeason = seasons.summer,
                seedResourceTypeIndex = resource.types.palmSeed.index,
                speciesSelectionGroupTypeIndex = wildPalmSelectionGroupTypeIndex,
                maturityDurationDays = 8,
                isPathFindingCollider = false,
                useCraftSimple = true,
                playBirdSounds = true,
            })
        end
        addVariations({"wildPalm1", "wildPalm2", "wildPalm3"})

        addFlora("lingonberryBush", {
            name = locale:get("flora_lingonberryBush"),
            plural = locale:get("flora_lingonberryBush_plural"),
            summary = locale:get("flora_lingonberryBush_summary"),
            saplingName = locale:get("flora_lingonberryBush_sapling"),
            saplingPlural = locale:get("flora_lingonberryBush_sapling_plural"),
            modelName = "whLingonberryBush",
            saplingModelName = "whLingonberryBushSapling",
            resourceGroup = {
                baseInventory = {},
                fruitReplenish = {
                    [gameObject.typeIndexMap.lingonberry] = 6,
                },
                gatherableTypes = {
                    gameObject.typeIndexMap.lingonberry,
                },
            },
            markerPositions = bushMarkerPositions,
            interactable = true,
            addToPhysics = true,
            fruitSeason = seasons.autumn,
            seedResourceTypeIndex = resource.types.lingonberry.index,
            useCraftSimple = true,
            isFoodCrop = true,
        })

        addFlora("cloudberryBush", {
            name = locale:get("flora_cloudberryBush"),
            plural = locale:get("flora_cloudberryBush_plural"),
            summary = locale:get("flora_cloudberryBush_summary"),
            saplingName = locale:get("flora_cloudberryBush_sapling"),
            saplingPlural = locale:get("flora_cloudberryBush_sapling_plural"),
            modelName = "whCloudberryBush",
            saplingModelName = "whCloudberryBushSapling",
            resourceGroup = {
                baseInventory = {},
                fruitReplenish = {
                    [gameObject.typeIndexMap.cloudberry] = 6,
                },
                gatherableTypes = {
                    gameObject.typeIndexMap.cloudberry,
                },
            },
            markerPositions = bushMarkerPositions,
            interactable = true,
            addToPhysics = true,
            fruitSeason = seasons.summer,
            seedResourceTypeIndex = resource.types.cloudberry.index,
            useCraftSimple = true,
            isFoodCrop = true,
        })

        addFlora("mesquiteTree", {
            name = locale:get("flora_mesquiteTree"),
            plural = locale:get("flora_mesquiteTree_plural"),
            summary = locale:get("flora_mesquiteTree_summary"),
            saplingName = locale:get("flora_mesquiteTree_sapling"),
            saplingPlural = locale:get("flora_mesquiteTree_sapling_plural"),
            modelName = "whMesquiteTree",
            saplingModelName = "whMesquiteTreeSapling",
            requiresAxeToChop = true,
            resourceGroup = {
                baseInventory = {
                    [gameObject.typeIndexMap.mesquiteBranch] = 6,
                },
                seasonalReplenish = {
                    [gameObject.typeIndexMap.mesquiteBranch] = 3,
                },
                fruitReplenish = {
                    [gameObject.typeIndexMap.mesquitePod] = 6,
                },
                gatherableTypes = {
                    gameObject.typeIndexMap.mesquitePod,
                    gameObject.typeIndexMap.mesquiteBranch,
                },
            },
            markerPositions = bushMarkerPositions,
            saplingClientModelFunction = getClientModelFunction("whMesquiteTree", "whMesquiteTreeSapling", false, false, true),
            interactable = true,
            addToPhysics = true,
            fruitSeason = seasons.summer,
            seedResourceTypeIndex = resource.types.mesquitePod.index,
            useCraftSimple = true,
            isFoodCrop = true,
        })

        addFlora("grapevinePlant", {
            name = locale:get("flora_grapevinePlant"),
            plural = locale:get("flora_grapevinePlant_plural"),
            summary = locale:get("flora_grapevinePlant_summary"),
            saplingName = locale:get("flora_grapevinePlantSapling"),
            saplingPlural = locale:get("flora_grapevinePlantSapling_plural"),
            modelName = "whGrapevinePlant",
            saplingModelName = "whGrapevinePlantSapling",
            resourceGroup = {
                baseInventory = {},
                fruitReplenish = {
                    [gameObject.typeIndexMap.grape] = 6,
                },
                gatherableTypes = {
                    gameObject.typeIndexMap.grape,
                },
            },
            markerPositions = bushMarkerPositions,
            interactable = true,
            addToPhysics = true,
            fruitSeason = seasons.autumn,
            seedResourceTypeIndex = resource.types.grape.index,
            useCraftSimple = true,
            isFoodCrop = true,
        })

        addFlora("barleyPlant", {
            name = locale:get("flora_barleyPlant"),
            plural = locale:get("flora_barleyPlant_plural"),
            summary = locale:get("flora_barleyPlant_summary"),
            saplingName = locale:get("flora_barleyPlantSapling"),
            saplingPlural = locale:get("flora_barleyPlantSapling_plural"),
            modelName = "whBarleyPlantCluster",
            saplingModelName = "whBarleyPlantSaplingCluster",
            resourceGroup = {
                baseInventory = {
                    [gameObject.typeIndexMap.barley] = 2,
                },
                gatherableTypes = {
                    gameObject.typeIndexMap.barley,
                },
                revertToSeedlingGatherResourceCounts = {
                    [gameObject.typeIndexMap.barley] = 1,
                },
            },
            markerPositions = tinyPlantMarkerPositions,
            seedResourceTypeIndex = resource.types.wheat.index,
            maturityDurationDays = 3,
            fruitImmediatelyWhenMature = true,
            interactable = true,
        })
        requireSeedObject("barleyPlant", "barley")
        requireSeedObject("wheatPlant", "wheat")

        addFlora("watermelonPlant", {
            name = locale:get("flora_watermelonPlant"),
            plural = locale:get("flora_watermelonPlant_plural"),
            summary = locale:get("flora_watermelonPlant_summary"),
            saplingName = locale:get("flora_watermelonPlantSapling"),
            saplingPlural = locale:get("flora_watermelonPlantSapling_plural"),
            modelName = "whWatermelonPlant",
            saplingModelName = "whWatermelonPlantSapling",
            resourceGroup = {
                baseInventory = {},
                fruitReplenish = {
                    [gameObject.typeIndexMap.watermelon] = 1,
                },
                gatherableTypes = {
                    gameObject.typeIndexMap.watermelon,
                },
            },
            markerPositions = bushMarkerPositions,
            interactable = true,
            addToPhysics = true,
            fruitSeason = seasons.summer,
            seedResourceTypeIndex = resource.types.watermelon.index,
            useCraftSimple = true,
            isFoodCrop = true,
        })

        addFlora("cattail", {
            name = locale:get("flora_cattail"),
            plural = locale:get("flora_cattail_plural"),
            summary = locale:get("flora_cattail_summary"),
            saplingName = locale:get("flora_cattailSapling"),
            saplingPlural = locale:get("flora_cattailSapling_plural"),
            modelName = "whCattail",
            saplingModelName = "whCattailSapling",
            resourceGroup = {
                baseInventory = {
                    [gameObject.typeIndexMap.cattailRoot] = 2,
                },
                gatherableTypes = {
                    gameObject.typeIndexMap.cattailRoot,
                },
                revertToSeedlingGatherResourceCounts = {
                    [gameObject.typeIndexMap.cattailRoot] = 1,
                },
            },
            markerPositions = tallPlantMarkerPositions,
            seedResourceTypeIndex = resource.types.cattailRoot.index,
            maturityDurationDays = 3,
            fruitImmediatelyWhenMature = true,
            interactable = true,
            useCraftSimple = true,
            isFoodCrop = true,
        })

        for i = 1,3 do
            local key = "cactus" .. mj:tostring(i)
            addFlora(key, {
                name = locale:get("flora_cactus"),
                plural = locale:get("flora_cactus_plural"),
                summary = locale:get("flora_cactus_wild_summary"),
                saplingName = locale:get("flora_cactus_sapling"),
                saplingPlural = locale:get("flora_cactus_sapling_plural"),
                modelName = "whCactus" .. mj:tostring(i),
                saplingModelName = "whCactusSapling",
                resourceGroup = {
                    baseInventory = {},
                    fruitReplenish = {
                        [gameObject.typeIndexMap.cactusFruit] = 4,
                    },
                    gatherableTypes = {
                        gameObject.typeIndexMap.cactusFruit,
                    },
                },
                requiresAxeToChop = true,
                markerPositions = bushMarkerPositions,
                fruitSeason = seasons.autumn,
                seedResourceTypeIndex = resource.types.cactusFruit.index,
                maturityDurationDays = 6,
                isPathFindingCollider = true,
                useCraftSimple = true,
                isFoodCrop = true,
            })
        end
        addVariations({"cactus1", "cactus2", "cactus3"})

        addFlora("baobab1", {
            name = locale:get("flora_baobab"),
            plural = locale:get("flora_baobab_plural"),
            summary = locale:get("flora_baobab_summary"),
            saplingName = locale:get("flora_baobab_sapling"),
            saplingPlural = locale:get("flora_baobab_sapling_plural"),
            modelName = "whBaobab1",
            saplingModelName = "whBaobabSapling",
            resourceGroup = {
                baseInventory = {
                    [gameObject.typeIndexMap.baobabBranch] = 6,
                    [gameObject.typeIndexMap.baobabLog] = 12,
                },
                seasonalReplenish = {
                    [gameObject.typeIndexMap.baobabBranch] = 6,
                },
                fruitReplenish = {
                    [gameObject.typeIndexMap.baobabFruit] = 6,
                },
                gatherableTypes = {
                    gameObject.typeIndexMap.baobabFruit,
                    gameObject.typeIndexMap.baobabBranch,
                },
            },
            requiresAxeToChop = true,
            markerPositions = treeMarkerPositions,
            followCamOffset = treeFollowCamOffset,
            clientModelFunction = getClientModelFunction("whBaobab", "whBaobab1", true, false, false),
            saplingClientModelFunction = getClientModelFunction("whBaobab", "whBaobabSapling", false, false, true),
            fruitSeason = seasons.autumn,
            seedResourceTypeIndex = resource.types.baobabFruit.index,
            maturityDurationDays = 16,
            isPathFindingCollider = true,
            useCraftSimple = true,
            isFoodCrop = true,
            playBirdSounds = true,
        })

        local function addWildTree(key, modelName, info, logCount, branchCount)
            local branchKey = info.woodKey .. "Branch"
            local baseInventory = {}
            if logCount > 0 then
                baseInventory[gameObject.typeIndexMap[info.woodKey .. "Log"]] = logCount
            end
            addFlora(key, {
                name = locale:get("flora_" .. info.localeKey),
                plural = locale:get("flora_" .. info.localeKey .. "_plural"),
                summary = locale:get("flora_" .. info.localeKey .. "_summary"),
                saplingName = locale:get("flora_" .. info.localeKey .. "_sapling"),
                saplingPlural = locale:get("flora_" .. info.localeKey .. "_sapling_plural"),
                modelName = modelName,
                saplingModelName = info.saplingModelName,
                resourceGroup = {
                    baseInventory = baseInventory,
                    seasonalReplenish = {
                        [gameObject.typeIndexMap[branchKey]] = branchCount,
                    },
                    fruitReplenish = {
                        [gameObject.typeIndexMap[info.seedKey]] = info.fruitCount or 2,
                    },
                    gatherableTypes = {
                        gameObject.typeIndexMap[info.seedKey],
                        gameObject.typeIndexMap[branchKey],
                    },
                },
                requiresAxeToChop = true,
                markerPositions = treeMarkerPositions,
                followCamOffset = treeFollowCamOffset,
                clientModelFunction = (info.seasonal or info.snow) and getClientModelFunction(info.moundKey, modelName, info.seasonal, info.snow, false) or nil,
                saplingClientModelFunction = getClientModelFunction(info.moundKey, info.saplingModelName, false, false, true),
                fruitSeason = info.fruitSeason or seasons.summer,
                fruitFrequencyInYears = info.fruitFrequencyInYears,
                seedResourceTypeIndex = resource.types[info.seedKey].index,
                speciesSelectionGroupTypeIndex = info.selectionGroupTypeIndex,
                maturityDurationDays = info.maturityDurationDays,
                isPathFindingCollider = true,
                useCraftSimple = true,
                isFoodCrop = info.isFoodCrop,
                playBirdSounds = true,
            })
        end

        local acaciaInfo = {
            localeKey = "acacia",
            woodKey = "acacia",
            seedKey = "acaciaSeed",
            moundKey = "whAcacia",
            saplingModelName = "whAcaciaSapling",
            selectionGroupTypeIndex = selectionGroup:addGroup("allAcacias", locale:get("flora_acacia"), locale:get("flora_acacia_plural"), nil),
        }
        addWildTree("acacia1", "whAcacia1", acaciaInfo, 3, 3)
        addWildTree("acacia2", "whAcacia2", acaciaInfo, 2, 2)
        addWildTree("acacia3", "whAcacia3", acaciaInfo, 3, 3)
        addVariations({"acacia1", "acacia2", "acacia3"})

        local kapokSelectionGroupTypeIndex = selectionGroup:addGroup("allKapoks", locale:get("flora_kapok"), locale:get("flora_kapok_plural"), nil)
        local kapokInfo = {
            localeKey = "kapok",
            woodKey = "kapok",
            seedKey = "kapokSeed",
            moundKey = "whKapok",
            saplingModelName = "whKapokSapling",
            selectionGroupTypeIndex = kapokSelectionGroupTypeIndex,
            maturityDurationDays = 12,
        }
        addWildTree("kapok1", "whKapok1", kapokInfo, 12, 6)
        addWildTree("kapok2", "whKapok2", kapokInfo, 15, 8)
        addWildTree("kapok3", "whKapok3", kapokInfo, 12, 6)
        addVariations({"kapok1", "kapok2", "kapok3"})

        addWildTree("kapokBig1", "whKapokBig1", {
            localeKey = "kapokBig",
            woodKey = "kapok",
            seedKey = "kapokSeed",
            moundKey = "whKapok",
            saplingModelName = "whKapokSapling",
            selectionGroupTypeIndex = kapokSelectionGroupTypeIndex,
            fruitFrequencyInYears = 5,
            maturityDurationDays = 24,
        }, 30, 14)

        local rubberTreeInfo = {
            localeKey = "rubberTree",
            woodKey = "rubber",
            seedKey = "rubberSeed",
            moundKey = "whRubberTree",
            saplingModelName = "whRubberTreeSapling",
            selectionGroupTypeIndex = selectionGroup:addGroup("allRubberTrees", locale:get("flora_rubberTree"), locale:get("flora_rubberTree_plural"), nil),
        }
        addWildTree("rubberTree1", "whRubberTree1", rubberTreeInfo, 5, 4)
        addWildTree("rubberTree2", "whRubberTree2", rubberTreeInfo, 6, 4)
        addWildTree("rubberTree3", "whRubberTree3", rubberTreeInfo, 5, 3)
        addWildTree("rubberTree4", "whRubberTree4", rubberTreeInfo, 5, 4)
        addVariations({"rubberTree1", "rubberTree2", "rubberTree3", "rubberTree4"})

        local oakInfo = {
            localeKey = "oak",
            woodKey = "oak",
            seedKey = "acorn",
            moundKey = "whOak",
            saplingModelName = "whOakSapling",
            selectionGroupTypeIndex = selectionGroup:addGroup("allOaks", locale:get("flora_oak"), locale:get("flora_oak_plural"), nil),
            seasonal = true,
            fruitSeason = seasons.autumn,
        }
        addWildTree("oak1", "whOak1", oakInfo, 5, 4)
        addWildTree("oak2", "whOak2", oakInfo, 6, 4)
        addWildTree("oak3", "whOak3", oakInfo, 5, 3)
        addWildTree("oak4", "whOak4", oakInfo, 5, 4)
        addVariations({"oak1", "oak2", "oak3", "oak4"})

        local oliveTreeInfo = {
            localeKey = "oliveTree",
            woodKey = "olive",
            seedKey = "olive",
            moundKey = "whOliveTree",
            saplingModelName = "whOliveTreeSapling",
            selectionGroupTypeIndex = selectionGroup:addGroup("allOliveTrees", locale:get("flora_oliveTree"), locale:get("flora_oliveTree_plural"), nil),
            fruitCount = 6,
            fruitSeason = seasons.autumn,
            isFoodCrop = true,
        }
        addWildTree("oliveTree", "whOliveTree", oliveTreeInfo, 4, 4)
        addWildTree("oliveTree2", "whOliveTree2", oliveTreeInfo, 4, 4)
        addVariations({"oliveTree", "oliveTree2"})

        addWildTree("cypress1", "whCypress1", {
            localeKey = "cypress",
            woodKey = "cypress",
            seedKey = "cypressCone",
            moundKey = "whCypress",
            saplingModelName = "whCypressSapling",
        }, 4, 3)

        addWildTree("brazilNutTree", "whBrazilNutTree", {
            localeKey = "brazilNutTree",
            woodKey = "brazilNut",
            seedKey = "brazilNut",
            moundKey = "whBrazilNutTree",
            saplingModelName = "whBrazilNutTreeSapling",
            fruitCount = 6,
            fruitSeason = seasons.autumn,
            isFoodCrop = true,
            maturityDurationDays = 24,
        }, 24, 10)

        local mahoganyInfo = {
            localeKey = "mahogany",
            woodKey = "mahogany",
            seedKey = "mahoganySeed",
            moundKey = "whMahogany",
            saplingModelName = "whMahoganySapling",
            selectionGroupTypeIndex = selectionGroup:addGroup("allMahoganies", locale:get("flora_mahogany"), locale:get("flora_mahogany_plural"), nil),
            maturityDurationDays = 16,
        }
        addWildTree("mahogany1", "whMahogany1", mahoganyInfo, 14, 6)
        addWildTree("mahogany2", "whMahogany2", mahoganyInfo, 14, 6)
        addVariations({"mahogany1", "mahogany2"})

        local banyanInfo = {
            localeKey = "banyan",
            woodKey = "banyan",
            seedKey = "banyanSeed",
            moundKey = "whBanyan",
            saplingModelName = "whBanyanSapling",
            selectionGroupTypeIndex = selectionGroup:addGroup("allBanyans", locale:get("flora_banyan"), locale:get("flora_banyan_plural"), nil),
            maturityDurationDays = 16,
        }
        addWildTree("banyan1", "whBanyan1", banyanInfo, 10, 8)
        addWildTree("banyan2", "whBanyan2", banyanInfo, 12, 8)
        addVariations({"banyan1", "banyan2"})

        local juniperInfo = {
            localeKey = "juniper",
            woodKey = "juniper",
            seedKey = "juniperBerry",
            moundKey = "whJuniper",
            saplingModelName = "whJuniperSapling",
            selectionGroupTypeIndex = selectionGroup:addGroup("allJunipers", locale:get("flora_juniper"), locale:get("flora_juniper_plural"), nil),
            snow = true,
            fruitCount = 4,
            fruitSeason = seasons.autumn,
        }
        addWildTree("juniper1", "whJuniper1", juniperInfo, 2, 3)
        addWildTree("juniper2", "whJuniper2", juniperInfo, 2, 3)
        addVariations({"juniper1", "juniper2"})

        local mapleInfo = {
            localeKey = "maple",
            woodKey = "maple",
            seedKey = "mapleSeed",
            moundKey = "whMaple",
            saplingModelName = "whMapleSapling",
            selectionGroupTypeIndex = selectionGroup:addGroup("allMaples", locale:get("flora_maple"), locale:get("flora_maple_plural"), nil),
            seasonal = true,
            fruitSeason = seasons.autumn,
        }
        addWildTree("maple1", "whMaple1", mapleInfo, 5, 4)
        addWildTree("maple2", "whMaple2", mapleInfo, 5, 4)
        addWildTree("maple3", "whMaple3", mapleInfo, 4, 3)
        addWildTree("maple4", "whMaple4", mapleInfo, 4, 4)
        addVariations({"maple1", "maple2", "maple3", "maple4"})

        local alderInfo = {
            localeKey = "alder",
            woodKey = "alder",
            seedKey = "alderCone",
            moundKey = "whAlder",
            saplingModelName = "whAlderSapling",
            selectionGroupTypeIndex = selectionGroup:addGroup("allAlders", locale:get("flora_alder"), locale:get("flora_alder_plural"), nil),
            seasonal = true,
            fruitSeason = seasons.autumn,
        }
        addWildTree("alder1", "whAlder1", alderInfo, 4, 3)
        addWildTree("alder2", "whAlder2", alderInfo, 4, 3)
        addVariations({"alder1", "alder2"})

        addWildTree("poplar1", "whPoplar1", {
            localeKey = "poplar",
            woodKey = "poplar",
            seedKey = "poplarSeed",
            moundKey = "whPoplar",
            saplingModelName = "whPoplarSapling",
            seasonal = true,
            maturityDurationDays = 6,
        }, 5, 3)

        addWildTree("arganTree", "whArganTree", {
            localeKey = "arganTree",
            woodKey = "argan",
            seedKey = "arganNut",
            moundKey = "whArganTree",
            saplingModelName = "whArganTreeSapling",
            fruitCount = 4,
            fruitSeason = seasons.summer,
            isFoodCrop = true,
        }, 4, 4)

        local mangroveInfo = {
            localeKey = "mangrove",
            woodKey = "mangrove",
            seedKey = "mangroveSeed",
            moundKey = "whMangrove",
            saplingModelName = "whMangroveSapling",
            selectionGroupTypeIndex = selectionGroup:addGroup("allMangroves", locale:get("flora_mangrove"), locale:get("flora_mangrove_plural"), nil),
        }
        addWildTree("mangrove1", "whMangrove1", mangroveInfo, 0, 4)
        addWildTree("mangrove2", "whMangrove2", mangroveInfo, 0, 4)
        addVariations({"mangrove1", "mangrove2"})

        addWildTree("carobTree", "whCarobTree", {
            localeKey = "carobTree",
            woodKey = "carob",
            seedKey = "carobPod",
            moundKey = "whCarobTree",
            saplingModelName = "whCarobTreeSapling",
            fruitCount = 6,
            fruitSeason = seasons.autumn,
            isFoodCrop = true,
        }, 4, 4)

        local dwarfBirchSelectionGroupTypeIndex = selectionGroup:addGroup("allDwarfBirches", locale:get("flora_dwarfBirch"), locale:get("flora_dwarfBirch_plural"), nil)
        for i = 1,3 do
            addFlora("dwarfBirch" .. mj:tostring(i), {
                name = locale:get("flora_dwarfBirch"),
                plural = locale:get("flora_dwarfBirch_plural"),
                summary = locale:get("flora_dwarfBirch_summary"),
                saplingName = locale:get("flora_dwarfBirch_sapling"),
                saplingPlural = locale:get("flora_dwarfBirch_sapling_plural"),
                modelName = "whDwarfBirch" .. mj:tostring(i),
                saplingModelName = "whDwarfBirchSapling",
                resourceGroup = {
                    baseInventory = {
                        [gameObject.typeIndexMap.birchBranch] = 2,
                    },
                    seasonalReplenish = {
                        [gameObject.typeIndexMap.birchBranch] = 2,
                    },
                    fruitReplenish = {
                        [gameObject.typeIndexMap.birchSeed] = 1,
                    },
                    gatherableTypes = {
                        gameObject.typeIndexMap.birchSeed,
                        gameObject.typeIndexMap.birchBranch,
                    },
                },
                markerPositions = bushMarkerPositions,
                clientModelFunction = getClientModelFunction("whDwarfBirch", "whDwarfBirch" .. mj:tostring(i), true, false, false),
                saplingClientModelFunction = getClientModelFunction("whDwarfBirch", "whDwarfBirchSapling", false, false, true),
                interactable = true,
                addToPhysics = true,
                fruitSeason = seasons.autumn,
                seedResourceTypeIndex = resource.types.birchSeed.index,
                speciesSelectionGroupTypeIndex = dwarfBirchSelectionGroupTypeIndex,
                useCraftSimple = true,
            })
        end
        addVariations({"dwarfBirch1", "dwarfBirch2", "dwarfBirch3"})

        local doumPalmSelectionGroupTypeIndex = selectionGroup:addGroup("allDoumPalms", locale:get("flora_doumPalm"), locale:get("flora_doumPalm_plural"), nil)
        for i = 1,3 do
            addFlora("doumPalm" .. mj:tostring(i), {
                name = locale:get("flora_doumPalm"),
                plural = locale:get("flora_doumPalm_plural"),
                summary = locale:get("flora_doumPalm_summary"),
                saplingName = locale:get("flora_doumPalm_sapling"),
                saplingPlural = locale:get("flora_doumPalm_sapling_plural"),
                modelName = "whDoumPalm" .. mj:tostring(i),
                saplingModelName = "whDoumPalmSapling",
                resourceGroup = {
                    baseInventory = {
                        [gameObject.typeIndexMap.datePalmLog] = 3,
                    },
                    seasonalReplenish = {
                        [gameObject.typeIndexMap.palmLeaf] = 3,
                    },
                    fruitReplenish = {
                        [gameObject.typeIndexMap.palmSeed] = 2,
                    },
                    gatherableTypes = {
                        gameObject.typeIndexMap.palmSeed,
                        gameObject.typeIndexMap.palmLeaf,
                    },
                },
                requiresAxeToChop = true,
                markerPositions = treeMarkerPositions,
                followCamOffset = treeFollowCamOffset,
                saplingClientModelFunction = getClientModelFunction("whDatePalm", "whDoumPalmSapling", false, false, true),
                fruitSeason = seasons.summer,
                seedResourceTypeIndex = resource.types.palmSeed.index,
                speciesSelectionGroupTypeIndex = doumPalmSelectionGroupTypeIndex,
                maturityDurationDays = 8,
                isPathFindingCollider = false,
                useCraftSimple = true,
                playBirdSounds = true,
            })
        end
        addVariations({"doumPalm1", "doumPalm2", "doumPalm3"})

        local treeFernSelectionGroupTypeIndex = selectionGroup:addGroup("allTreeFerns", locale:get("flora_treeFern"), locale:get("flora_treeFern_plural"), nil)
        for i = 1,4 do
            addFlora("treeFern" .. mj:tostring(i), {
                name = locale:get("flora_treeFern"),
                plural = locale:get("flora_treeFern_plural"),
                summary = locale:get("flora_treeFern_summary"),
                saplingName = locale:get("flora_treeFern_sapling"),
                saplingPlural = locale:get("flora_treeFern_sapling_plural"),
                modelName = "whTreeFern" .. mj:tostring(i),
                saplingModelName = "whTreeFernSapling",
                resourceGroup = {
                    baseInventory = {},
                    seasonalReplenish = {
                        [gameObject.typeIndexMap.palmLeaf] = 3,
                    },
                    fruitReplenish = {
                        [gameObject.typeIndexMap.treeFernSpores] = 2,
                    },
                    gatherableTypes = {
                        gameObject.typeIndexMap.treeFernSpores,
                        gameObject.typeIndexMap.palmLeaf,
                    },
                },
                requiresAxeToChop = true,
                markerPositions = treeMarkerPositions,
                followCamOffset = treeFollowCamOffset,
                saplingClientModelFunction = getClientModelFunction("whTreeFern", "whTreeFernSapling", false, false, true),
                fruitSeason = seasons.summer,
                seedResourceTypeIndex = resource.types.treeFernSpores.index,
                speciesSelectionGroupTypeIndex = treeFernSelectionGroupTypeIndex,
                maturityDurationDays = 12,
                isPathFindingCollider = true,
                useCraftSimple = true,
            })
        end
        addVariations({"treeFern1", "treeFern2", "treeFern3", "treeFern4"})

        local planeTreeInfo = {
            localeKey = "planeTree",
            woodKey = "plane",
            seedKey = "planeSeed",
            moundKey = "whPlaneTree",
            saplingModelName = "whPlaneTreeSapling",
            selectionGroupTypeIndex = selectionGroup:addGroup("allPlaneTrees", locale:get("flora_planeTree"), locale:get("flora_planeTree_plural"), nil),
            seasonal = true,
            fruitSeason = seasons.autumn,
        }
        addWildTree("planeTree1", "whPlaneTree1", planeTreeInfo, 6, 4)
        addWildTree("planeTree2", "whPlaneTree2", planeTreeInfo, 6, 4)
        addVariations({"planeTree1", "planeTree2"})

        addWildTree("baldCypress1", "whBaldCypress1", {
            localeKey = "baldCypress",
            woodKey = "baldCypress",
            seedKey = "baldCypressCone",
            moundKey = "whBaldCypress",
            saplingModelName = "whBaldCypressSapling",
            seasonal = true,
            fruitSeason = seasons.autumn,
        }, 6, 4)

        addWildTree("maritimePine1", "whMaritimePine1", {
            localeKey = "maritimePine",
            woodKey = "pine",
            seedKey = "pineCone",
            moundKey = "whMaritimePine",
            saplingModelName = "whMaritimePineSapling",
            snow = true,
        }, 4, 3)

        addWildTree("stonePine1", "whStonePine1", {
            localeKey = "stonePine",
            woodKey = "pine",
            seedKey = "stonePineCone",
            moundKey = "whStonePine",
            saplingModelName = "whStonePineSapling",
            snow = true,
            fruitCount = 4,
            fruitSeason = seasons.autumn,
            isFoodCrop = true,
            maturityDurationDays = 20,
        }, 5, 3)

        addWildTree("tamarisk1", "whTamarisk1", {
            localeKey = "tamarisk",
            woodKey = "tamarisk",
            seedKey = "tamariskSeed",
            moundKey = "whTamarisk",
            saplingModelName = "whTamariskSapling",
        }, 0, 3)

        addFlora("oleander1", {
            name = locale:get("flora_oleander"),
            plural = locale:get("flora_oleander_plural"),
            summary = locale:get("flora_oleander_summary"),
            saplingName = locale:get("flora_oleander_sapling"),
            saplingPlural = locale:get("flora_oleander_sapling_plural"),
            modelName = "whOleander1",
            saplingModelName = "whOleanderSapling",
            resourceGroup = {
                baseInventory = {},
                fruitReplenish = {
                    [gameObject.typeIndexMap.oleanderSeed] = 2,
                },
                gatherableTypes = {
                    gameObject.typeIndexMap.oleanderSeed,
                },
            },
            markerPositions = bushMarkerPositions,
            clientModelFunction = getClientModelFunction("whOleander", "whOleander1", true, false, false),
            saplingClientModelFunction = getClientModelFunction("whOleander", "whOleanderSapling", false, false, true),
            interactable = true,
            addToPhysics = true,
            fruitSeason = seasons.autumn,
            seedResourceTypeIndex = resource.types.oleanderSeed.index,
            useCraftSimple = true,
        })

        addFlora("cacaoTree", {
            name = locale:get("flora_cacaoTree"),
            plural = locale:get("flora_cacaoTree_plural"),
            summary = locale:get("flora_cacaoTree_summary"),
            saplingName = locale:get("flora_cacaoTree_sapling"),
            saplingPlural = locale:get("flora_cacaoTree_sapling_plural"),
            modelName = "whCacaoTree",
            saplingModelName = "whCacaoTreeSapling",
            resourceGroup = {
                baseInventory = {},
                fruitReplenish = {
                    [gameObject.typeIndexMap.cacaoPod] = 6,
                },
                gatherableTypes = {
                    gameObject.typeIndexMap.cacaoPod,
                },
            },
            requiresAxeToChop = true,
            markerPositions = treeMarkerPositions,
            followCamOffset = treeFollowCamOffset,
            saplingClientModelFunction = getClientModelFunction("whCacaoTree", "whCacaoTreeSapling", false, false, true),
            fruitSeason = seasons.autumn,
            seedResourceTypeIndex = resource.types.cacaoPod.index,
            isPathFindingCollider = true,
            useCraftSimple = true,
            isFoodCrop = true,
            playBirdSounds = true,
        })

        addFlora("papyrus", {
            name = locale:get("flora_papyrus"),
            plural = locale:get("flora_papyrus_plural"),
            summary = locale:get("flora_papyrus_summary"),
            saplingName = locale:get("flora_papyrusSapling"),
            saplingPlural = locale:get("flora_papyrusSapling_plural"),
            modelName = "whPapyrus",
            saplingModelName = "whPapyrusSapling",
            resourceGroup = {
                baseInventory = {
                    [gameObject.typeIndexMap.palmLeaf] = 2,
                    [gameObject.typeIndexMap.reedRhizome] = 1,
                },
                gatherableTypes = {
                    gameObject.typeIndexMap.palmLeaf,
                    gameObject.typeIndexMap.reedRhizome,
                },
                revertToSeedlingGatherResourceCounts = {
                    [gameObject.typeIndexMap.palmLeaf] = 1,
                },
            },
            markerPositions = tallPlantMarkerPositions,
            seedResourceTypeIndex = resource.types.reedRhizome.index,
            maturityDurationDays = 3,
            fruitImmediatelyWhenMature = true,
            interactable = true,
            useCraftSimple = true,
        })

        addFlora("giantReed", {
            name = locale:get("flora_giantReed"),
            plural = locale:get("flora_giantReed_plural"),
            summary = locale:get("flora_giantReed_summary"),
            saplingName = locale:get("flora_giantReedSapling"),
            saplingPlural = locale:get("flora_giantReedSapling_plural"),
            modelName = "whGiantReed",
            saplingModelName = "whGiantReedSapling",
            resourceGroup = {
                baseInventory = {
                    [gameObject.typeIndexMap.palmLeaf] = 2,
                    [gameObject.typeIndexMap.reedRhizome] = 1,
                },
                gatherableTypes = {
                    gameObject.typeIndexMap.palmLeaf,
                    gameObject.typeIndexMap.reedRhizome,
                },
                revertToSeedlingGatherResourceCounts = {
                    [gameObject.typeIndexMap.palmLeaf] = 1,
                },
            },
            markerPositions = tallPlantMarkerPositions,
            seedResourceTypeIndex = resource.types.reedRhizome.index,
            maturityDurationDays = 3,
            fruitImmediatelyWhenMature = true,
            interactable = true,
            useCraftSimple = true,
        })

        addFlora("bulrush", {
            name = locale:get("flora_bulrush"),
            plural = locale:get("flora_bulrush_plural"),
            summary = locale:get("flora_bulrush_summary"),
            saplingName = locale:get("flora_bulrushSapling"),
            saplingPlural = locale:get("flora_bulrushSapling_plural"),
            modelName = "whBulrush",
            saplingModelName = "whBulrushSapling",
            resourceGroup = {
                baseInventory = {
                    [gameObject.typeIndexMap.palmLeaf] = 2,
                    [gameObject.typeIndexMap.reedRhizome] = 1,
                },
                gatherableTypes = {
                    gameObject.typeIndexMap.palmLeaf,
                    gameObject.typeIndexMap.reedRhizome,
                },
                revertToSeedlingGatherResourceCounts = {
                    [gameObject.typeIndexMap.palmLeaf] = 1,
                },
            },
            markerPositions = tallPlantMarkerPositions,
            seedResourceTypeIndex = resource.types.reedRhizome.index,
            maturityDurationDays = 3,
            fruitImmediatelyWhenMature = true,
            interactable = true,
            useCraftSimple = true,
        })

        addFlora("cordgrass", {
            name = locale:get("flora_cordgrass"),
            plural = locale:get("flora_cordgrass_plural"),
            summary = locale:get("flora_cordgrass_summary"),
            saplingName = locale:get("flora_cordgrassSapling"),
            saplingPlural = locale:get("flora_cordgrassSapling_plural"),
            modelName = "whCordgrassCluster",
            saplingModelName = "whCordgrassSaplingCluster",
            resourceGroup = {
                baseInventory = {
                    [gameObject.typeIndexMap.palmLeaf] = 2,
                    [gameObject.typeIndexMap.reedRhizome] = 1,
                },
                gatherableTypes = {
                    gameObject.typeIndexMap.palmLeaf,
                    gameObject.typeIndexMap.reedRhizome,
                },
                revertToSeedlingGatherResourceCounts = {
                    [gameObject.typeIndexMap.palmLeaf] = 1,
                },
            },
            markerPositions = tinyPlantMarkerPositions,
            seedResourceTypeIndex = resource.types.reedRhizome.index,
            maturityDurationDays = 3,
            fruitImmediatelyWhenMature = true,
            interactable = true,
            useCraftSimple = true,
        })

        addFlora("cottonGrass", {
            name = locale:get("flora_cottonGrass"),
            plural = locale:get("flora_cottonGrass_plural"),
            summary = locale:get("flora_cottonGrass_summary"),
            saplingName = locale:get("flora_cottonGrassSapling"),
            saplingPlural = locale:get("flora_cottonGrassSapling_plural"),
            modelName = "whCottonGrassCluster",
            saplingModelName = "whCottonGrassSaplingCluster",
            resourceGroup = {
                baseInventory = {
                    [gameObject.typeIndexMap.palmLeaf] = 2,
                    [gameObject.typeIndexMap.reedRhizome] = 1,
                },
                gatherableTypes = {
                    gameObject.typeIndexMap.palmLeaf,
                    gameObject.typeIndexMap.reedRhizome,
                },
                revertToSeedlingGatherResourceCounts = {
                    [gameObject.typeIndexMap.palmLeaf] = 1,
                },
            },
            markerPositions = tinyPlantMarkerPositions,
            seedResourceTypeIndex = resource.types.reedRhizome.index,
            maturityDurationDays = 3,
            fruitImmediatelyWhenMature = true,
            interactable = true,
            useCraftSimple = true,
        })

        addFlora("commonReed", {
            name = locale:get("flora_commonReed"),
            plural = locale:get("flora_commonReed_plural"),
            summary = locale:get("flora_commonReed_summary"),
            saplingName = locale:get("flora_commonReedSapling"),
            saplingPlural = locale:get("flora_commonReedSapling_plural"),
            modelName = "whCommonReed",
            saplingModelName = "whCommonReedSapling",
            resourceGroup = {
                baseInventory = {
                    [gameObject.typeIndexMap.palmLeaf] = 2,
                    [gameObject.typeIndexMap.reedRhizome] = 1,
                },
                gatherableTypes = {
                    gameObject.typeIndexMap.palmLeaf,
                    gameObject.typeIndexMap.reedRhizome,
                },
                revertToSeedlingGatherResourceCounts = {
                    [gameObject.typeIndexMap.palmLeaf] = 1,
                },
            },
            markerPositions = tallPlantMarkerPositions,
            seedResourceTypeIndex = resource.types.reedRhizome.index,
            maturityDurationDays = 3,
            fruitImmediatelyWhenMature = true,
            interactable = true,
            useCraftSimple = true,
        })

        local groundFernSeasonalModelFunction = getClientModelFunction("whGroundFern", "whGroundFern", true, false, false)
        local groundFernTropicalByID = {}
        addFlora("groundFern", {
            name = locale:get("flora_groundFern"),
            plural = locale:get("flora_groundFern_plural"),
            summary = locale:get("flora_groundFern_summary"),
            saplingName = locale:get("flora_groundFernSapling"),
            saplingPlural = locale:get("flora_groundFernSapling_plural"),
            modelName = "whGroundFern",
            saplingModelName = "whGroundFernSapling",
            clientModelFunction = function(floraObject, level, modelFunctionContext, terrainVariations)
                local tropical = groundFernTropicalByID[floraObject.uniqueID]
                if tropical == nil then
                    tropical = terrain:getBiomeTagsForNormalizedPoint(mjm.normalize(floraObject.pos)).tropical or false
                    groundFernTropicalByID[floraObject.uniqueID] = tropical
                end
                if tropical then
                    return model:modelIndexForModelNameAndDetailLevel("whGroundFern", level)
                end
                return groundFernSeasonalModelFunction(floraObject, level, modelFunctionContext, terrainVariations)
            end,
            resourceGroup = {
                baseInventory = {
                    [gameObject.typeIndexMap.palmLeaf] = 1,
                    [gameObject.typeIndexMap.treeFernSpores] = 1,
                },
                gatherableTypes = {
                    gameObject.typeIndexMap.palmLeaf,
                    gameObject.typeIndexMap.treeFernSpores,
                },
                revertToSeedlingGatherResourceCounts = {
                    [gameObject.typeIndexMap.palmLeaf] = 1,
                },
            },
            markerPositions = tinyPlantMarkerPositions,
            seedResourceTypeIndex = resource.types.treeFernSpores.index,
            maturityDurationDays = 3,
            fruitImmediatelyWhenMature = true,
            interactable = true,
            useCraftSimple = true,
        })

        addFlora("yarrowPlant", {
            name = locale:get("flora_yarrowPlant"),
            plural = locale:get("flora_yarrowPlant_plural"),
            summary = locale:get("flora_yarrowPlant_summary"),
            saplingName = locale:get("flora_yarrowPlantSapling"),
            saplingPlural = locale:get("flora_yarrowPlantSapling_plural"),
            modelName = "whYarrowPlant",
            saplingModelName = "whYarrowPlantSapling",
            resourceGroup = {
                baseInventory = {
                    [gameObject.typeIndexMap.yarrowFlower] = 2,
                },
                gatherableTypes = {
                    gameObject.typeIndexMap.yarrowFlower,
                },
                revertToSeedlingGatherResourceCounts = {
                    [gameObject.typeIndexMap.yarrowFlower] = 1,
                },
            },
            markerPositions = tinyPlantMarkerPositions,
            seedResourceTypeIndex = resource.types.yarrowFlower.index,
            maturityDurationDays = 3,
            fruitImmediatelyWhenMature = true,
            interactable = true,
            useCraftSimple = true,
        })

        addFlora("gotuKolaPlant", {
            name = locale:get("flora_gotuKolaPlant"),
            plural = locale:get("flora_gotuKolaPlant_plural"),
            summary = locale:get("flora_gotuKolaPlant_summary"),
            saplingName = locale:get("flora_gotuKolaPlantSapling"),
            saplingPlural = locale:get("flora_gotuKolaPlantSapling_plural"),
            modelName = "whGotuKolaPlant",
            saplingModelName = "whGotuKolaPlantSapling",
            resourceGroup = {
                baseInventory = {
                    [gameObject.typeIndexMap.gotuKolaLeaf] = 2,
                },
                gatherableTypes = {
                    gameObject.typeIndexMap.gotuKolaLeaf,
                },
                revertToSeedlingGatherResourceCounts = {
                    [gameObject.typeIndexMap.gotuKolaLeaf] = 1,
                },
            },
            markerPositions = tinyPlantMarkerPositions,
            seedResourceTypeIndex = resource.types.gotuKolaLeaf.index,
            maturityDurationDays = 3,
            fruitImmediatelyWhenMature = true,
            interactable = true,
            useCraftSimple = true,
        })

        addFlora("plantainPlant", {
            name = locale:get("flora_plantainPlant"),
            plural = locale:get("flora_plantainPlant_plural"),
            summary = locale:get("flora_plantainPlant_summary"),
            saplingName = locale:get("flora_plantainPlantSapling"),
            saplingPlural = locale:get("flora_plantainPlantSapling_plural"),
            modelName = "whPlantainPlant",
            saplingModelName = "whPlantainPlantSapling",
            resourceGroup = {
                baseInventory = {
                    [gameObject.typeIndexMap.plantainLeaf] = 2,
                },
                gatherableTypes = {
                    gameObject.typeIndexMap.plantainLeaf,
                },
                revertToSeedlingGatherResourceCounts = {
                    [gameObject.typeIndexMap.plantainLeaf] = 1,
                },
            },
            markerPositions = tinyPlantMarkerPositions,
            seedResourceTypeIndex = resource.types.plantainLeaf.index,
            maturityDurationDays = 3,
            fruitImmediatelyWhenMature = true,
            interactable = true,
            useCraftSimple = true,
        })

        addFlora("peppermintPlant", {
            name = locale:get("flora_peppermintPlant"),
            plural = locale:get("flora_peppermintPlant_plural"),
            summary = locale:get("flora_peppermintPlant_summary"),
            saplingName = locale:get("flora_peppermintPlantSapling"),
            saplingPlural = locale:get("flora_peppermintPlantSapling_plural"),
            modelName = "whPeppermintPlant",
            saplingModelName = "whPeppermintPlantSapling",
            resourceGroup = {
                baseInventory = {
                    [gameObject.typeIndexMap.peppermintLeaf] = 2,
                },
                gatherableTypes = {
                    gameObject.typeIndexMap.peppermintLeaf,
                },
                revertToSeedlingGatherResourceCounts = {
                    [gameObject.typeIndexMap.peppermintLeaf] = 1,
                },
            },
            markerPositions = tinyPlantMarkerPositions,
            seedResourceTypeIndex = resource.types.peppermintLeaf.index,
            maturityDurationDays = 3,
            fruitImmediatelyWhenMature = true,
            interactable = true,
            useCraftSimple = true,
        })

        addFlora("lemongrassPlant", {
            name = locale:get("flora_lemongrassPlant"),
            plural = locale:get("flora_lemongrassPlant_plural"),
            summary = locale:get("flora_lemongrassPlant_summary"),
            saplingName = locale:get("flora_lemongrassPlantSapling"),
            saplingPlural = locale:get("flora_lemongrassPlantSapling_plural"),
            modelName = "whLemongrassPlant",
            saplingModelName = "whLemongrassPlantSapling",
            resourceGroup = {
                baseInventory = {
                    [gameObject.typeIndexMap.lemongrass] = 2,
                },
                gatherableTypes = {
                    gameObject.typeIndexMap.lemongrass,
                },
                revertToSeedlingGatherResourceCounts = {
                    [gameObject.typeIndexMap.lemongrass] = 1,
                },
            },
            markerPositions = tinyPlantMarkerPositions,
            seedResourceTypeIndex = resource.types.lemongrass.index,
            maturityDurationDays = 3,
            fruitImmediatelyWhenMature = true,
            interactable = true,
            useCraftSimple = true,
        })

        local cycadSelectionGroupTypeIndex = selectionGroup:addGroup("allCycads", locale:get("flora_cycad"), locale:get("flora_cycad_plural"), nil)
        for i = 1,4 do
            addFlora("cycad" .. mj:tostring(i), {
                name = locale:get("flora_cycad"),
                plural = locale:get("flora_cycad_plural"),
                summary = locale:get("flora_cycad_summary"),
                saplingName = locale:get("flora_cycad_sapling"),
                saplingPlural = locale:get("flora_cycad_sapling_plural"),
                modelName = "whCycad" .. mj:tostring(i),
                saplingModelName = "whCycadSapling",
                resourceGroup = {
                    baseInventory = {},
                    seasonalReplenish = {
                        [gameObject.typeIndexMap.palmLeaf] = 4,
                    },
                    fruitReplenish = {
                        [gameObject.typeIndexMap.cycadSeed] = 2,
                    },
                    gatherableTypes = {
                        gameObject.typeIndexMap.cycadSeed,
                        gameObject.typeIndexMap.palmLeaf,
                    },
                },
                requiresAxeToChop = true,
                markerPositions = treeMarkerPositions,
                followCamOffset = treeFollowCamOffset,
                saplingClientModelFunction = getClientModelFunction("whCycad", "whCycadSapling", false, false, true),
                fruitSeason = seasons.autumn,
                seedResourceTypeIndex = resource.types.cycadSeed.index,
                speciesSelectionGroupTypeIndex = cycadSelectionGroupTypeIndex,
                maturityDurationDays = 16,
                isPathFindingCollider = true,
                useCraftSimple = true,
            })
        end
        addVariations({"cycad1", "cycad2", "cycad3", "cycad4"})

        resource:setSeedResourceTypeIndexes(flora.seedResourceTypeIndexes)
    end
end

return mod
