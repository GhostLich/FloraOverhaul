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
    table.insert(flora.logTypeBaseKeys, "chestnut")
    table.insert(flora.logTypeBaseKeys, "beech")
    table.insert(flora.logTypeBaseKeys, "larch")
    table.insert(flora.logTypeBaseKeys, "maritimePine")
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
    table.insert(flora.branchTypeBaseKeys, "chestnut")
    table.insert(flora.branchTypeBaseKeys, "beech")
    table.insert(flora.branchTypeBaseKeys, "larch")
    table.insert(flora.branchTypeBaseKeys, "maritimePine")
    table.insert(flora.branchTypeBaseKeys, "saxaul")
    table.insert(flora.branchTypeBaseKeys, "hazel")
    table.insert(flora.branchTypeBaseKeys, "sagebrush")
    table.insert(flora.branchTypeBaseKeys, "cacao")

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
            mj:warn("Endemic Flora: flora functions not found")
            return
        end

        addFruit("fig", "whFig")
        addFruit("date", "whDate")
        addFruit("grape", "whGrape")
        addFruit("watermelon", "whWaterMelon")
        addFruit("baobabFruit", "whBaobabFruit")
        addFruit("cactusFruit", "whCactusFruit")
        addFruit("pricklyPearPad", "whPricklyPearPad")
        addFruit("chollaBud", "whChollaBud")
        addFruit("euphorbiaSeed", "whEuphorbiaSeed")
        addFruit("dragonTreeSeed", "whDragonTreeSeed")
        addFruit("giantGroundselSeed", "whGiantGroundselSeed")
        addFruit("cattailRoot", "whCattailRoot")
        addFruit("palmSeed", "whPalmSeed")
        addFruit("lingonberry", "whLingonberry")
        addFruit("blueberry", "whBlueberry")
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
        addFruit("sagebrushSeed", "whSagebrushSeed")
        addFruit("sagebrushLeaf", "whSagebrushLeaf")
        addFruit("chestnut", "whChestnut")
        addFruit("beechnut", "whBeechnut")
        addFruit("hazelnut", "whHazelnut")
        addFruit("thyme", "whThyme")
        addFruit("arcticWillowSeed", "whArcticWillowSeed")
        addFruit("seaBuckthorn", "whSeaBuckthorn")
        addFruit("stonePineCone", "whStonePineCone")
        addFruit("baldCypressCone", "whBaldCypressCone")
        addFruit("cacaoPod", "whCacaoPod")
        addFruit("reedRhizome", "whReedRhizome")
        addFruit("yarrowFlower", "whYarrowFlower")
        addFruit("gotuKolaLeaf", "whGotuKolaLeaf")
        addFruit("plantainLeaf", "whPlantainLeaf")
        addFruit("peppermintLeaf", "whPeppermintLeaf")
        addFruit("lemongrass", "whLemongrass")
        addFruit("doumFruit", "whDoumFruit")
        addFruit("saxaulSeed", "whSaxaulSeed")
        addFruit("groundFernSpores", "whGroundFernSpores")
        addFruit("featherGrassRhizome", "whFeatherGrassRhizome")
        addFruit("elephantGrassRhizome", "whElephantGrassRhizome")
        addFruit("cordgrassRhizome", "whCordgrassRhizome")
        addFruit("cottonGrassRhizome", "whCottonGrassRhizome")
        addFruit("larchCone", "whLarchCone")
        addFruit("maritimePineCone", "whMaritimePineCone")
        addFruit("papyrusRhizome", "whPapyrusRhizome")
        addFruit("giantReedRhizome", "whGiantReedRhizome")
        addFruit("tuleRhizome", "whTuleRhizome")
        addFruit("agaveHeart", "whAgaveHeart")
        addFruit("syrianRue", "whSyrianRue")
        addFruit("angelicaRoot", "whAngelicaRoot")
        addFruit("ephedra", "whEphedra")
        addFruit("hennaLeaf", "whHennaLeaf")
        addFruit("myrrh", "whMyrrh")
        addFruit("dragonsBlood", "whDragonsBlood")
        addFruit("ephedraSeed", "whEphedraSeed")
        addFruit("hennaSeed", "whHennaSeed")
        addFruit("myrrhSeed", "whMyrrhSeed")
        addFruit("dragonsBloodSeed", "whDragonsBloodSeed")

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
        addItem("acornCooked", "whAcornCooked", resource.types.acornCooked.index)
        addItem("reedStem", "whReedStem", resource.types.grass.index)
        addItem("reedStemDried", "whReedStemDried", resource.types.hay.index)
        addItem("frond", "whFrond", resource.types.grass.index)
        addItem("frondDried", "whFrondDried", resource.types.hay.index)
        addItem("agaveLeaf", "whAgaveLeaf", resource.types.agaveLeaf.index)
        addItem("agaveHeartCooked", "whAgaveHeartCooked", resource.types.agaveHeartCooked.index)
        addItem("rhizomeCooked", "whRhizomeCooked", resource.types.rhizomeCooked.index)
        addItem("kapokFibre", "whKapokFibre", resource.types.flaxDried.index)
        addItem("agaveFibre", "whAgaveFibre", resource.types.flaxDried.index)
        addItem("nettle", "whNettle", resource.types.nettle.index)
        addItem("nettleFibre", "whNettleFibre", resource.types.flaxDried.index)
        addItem("cardonFruit", "whCardonFruit", resource.types.cactusFruit.index)
        addItem("cardonFruitRotten", "whCardonFruitRotten", resource.types.cactusFruitRotten.index)
        addItem("pricklyPearFruit", "whPricklyPearFruit", resource.types.cactusFruit.index)
        addItem("pricklyPearFruitRotten", "whPricklyPearFruitRotten", resource.types.cactusFruitRotten.index)
        addItem("barrelCactusFruit", "whBarrelCactusFruit", resource.types.cactusFruit.index)
        addItem("barrelCactusFruitRotten", "whBarrelCactusFruitRotten", resource.types.cactusFruitRotten.index)

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

        gameObject.types.pumpkinPlant.clientModelFunction = getClientModelFunction("pumpkinPlant", "pumpkinPlant", true, false, false)
        gameObject.types.sapling_pumpkinPlant.clientModelFunction = getClientModelFunction("pumpkinPlant", "pumpkinPlantSapling", true, false, false)

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

        local blueberrySelectionGroupTypeIndex = selectionGroup:addGroup("allBlueberryBushes", locale:get("flora_blueberryBush"), locale:get("flora_blueberryBush_plural"), nil)
        for i = 1,4 do
            addFlora("blueberryBush" .. mj:tostring(i), {
                name = locale:get("flora_blueberryBush"),
                plural = locale:get("flora_blueberryBush_plural"),
                summary = locale:get("flora_blueberryBush_summary"),
                saplingName = locale:get("flora_blueberryBush_sapling"),
                saplingPlural = locale:get("flora_blueberryBush_sapling_plural"),
                modelName = "whBlueberry" .. mj:tostring(i),
                saplingModelName = "whBlueberryBushSapling",
                resourceGroup = {
                    baseInventory = {},
                    fruitReplenish = {
                        [gameObject.typeIndexMap.blueberry] = 6,
                    },
                    gatherableTypes = {
                        gameObject.typeIndexMap.blueberry,
                    },
                },
                markerPositions = bushMarkerPositions,
                clientModelFunction = getClientModelFunction("whBlueberry", "whBlueberry" .. mj:tostring(i), true, false, false),
                interactable = true,
                addToPhysics = true,
                fruitSeason = seasons.summer,
                seedResourceTypeIndex = resource.types.blueberry.index,
                speciesSelectionGroupTypeIndex = blueberrySelectionGroupTypeIndex,
                useCraftSimple = true,
                isFoodCrop = true,
            })
        end
        addVariations({"blueberryBush1", "blueberryBush2", "blueberryBush3", "blueberryBush4"})

        addFlora("seaBuckthornBush", {
            name = locale:get("flora_seaBuckthornBush"),
            plural = locale:get("flora_seaBuckthornBush_plural"),
            summary = locale:get("flora_seaBuckthornBush_summary"),
            saplingName = locale:get("flora_seaBuckthornBush_sapling"),
            saplingPlural = locale:get("flora_seaBuckthornBush_sapling_plural"),
            modelName = "whSeaBuckthornBush",
            saplingModelName = "whSeaBuckthornBushSapling",
            resourceGroup = {
                baseInventory = {},
                fruitReplenish = {
                    [gameObject.typeIndexMap.seaBuckthorn] = 6,
                },
                gatherableTypes = {
                    gameObject.typeIndexMap.seaBuckthorn,
                },
            },
            markerPositions = bushMarkerPositions,
            interactable = true,
            addToPhysics = true,
            fruitSeason = seasons.autumn,
            seedResourceTypeIndex = resource.types.seaBuckthorn.index,
            useCraftSimple = true,
            isFoodCrop = true,
        })
        local seaBuckthornSelectionGroupTypeIndex = selectionGroup:addGroup("allSeaBuckthornBushes", locale:get("flora_seaBuckthornBush"), locale:get("flora_seaBuckthornBush_plural"), nil)
        gameObject.types.seaBuckthornBush.baseSelectionGroupTypeIndex = seaBuckthornSelectionGroupTypeIndex
        selectionGroup:addObjectTypeToGroups(gameObject.types.seaBuckthornBush.index, {seaBuckthornSelectionGroupTypeIndex})
        for i = 2,4 do
            addFlora("seaBuckthornBush" .. mj:tostring(i), {
                name = locale:get("flora_seaBuckthornBush"),
                plural = locale:get("flora_seaBuckthornBush_plural"),
                summary = locale:get("flora_seaBuckthornBush_summary"),
                saplingName = locale:get("flora_seaBuckthornBush_sapling"),
                saplingPlural = locale:get("flora_seaBuckthornBush_sapling_plural"),
                modelName = "whSeaBuckthornBush" .. mj:tostring(i),
                saplingModelName = "whSeaBuckthornBushSapling",
                resourceGroup = flora.types.seaBuckthornBush.resourceGroup,
                markerPositions = bushMarkerPositions,
                interactable = true,
                addToPhysics = true,
                fruitSeason = seasons.autumn,
                seedResourceTypeIndex = resource.types.seaBuckthorn.index,
                speciesSelectionGroupTypeIndex = seaBuckthornSelectionGroupTypeIndex,
                useCraftSimple = true,
                isFoodCrop = true,
            })
        end
        addVariations({"seaBuckthornBush", "seaBuckthornBush2", "seaBuckthornBush3", "seaBuckthornBush4"})

        addFlora("ephedraBush", {
            name = locale:get("flora_ephedraBush"),
            plural = locale:get("flora_ephedraBush_plural"),
            summary = locale:get("flora_ephedraBush_summary"),
            saplingName = locale:get("flora_ephedraBush_sapling"),
            saplingPlural = locale:get("flora_ephedraBush_sapling_plural"),
            modelName = "whEphedraBush",
            saplingModelName = "whEphedraBushSapling",
            resourceGroup = {
                baseInventory = {
                    [gameObject.typeIndexMap.ephedra] = 4,
                },
                seasonalReplenish = {
                    [gameObject.typeIndexMap.ephedra] = 4,
                },
                fruitReplenish = {
                    [gameObject.typeIndexMap.ephedraSeed] = 2,
                },
                gatherableTypes = {
                    gameObject.typeIndexMap.ephedra,
                    gameObject.typeIndexMap.ephedraSeed,
                },
            },
            markerPositions = bushMarkerPositions,
            interactable = true,
            addToPhysics = true,
            fruitSeason = seasons.autumn,
            seedResourceTypeIndex = resource.types.ephedraSeed.index,
            useCraftSimple = true,
        })

        addFlora("hennaBush", {
            name = locale:get("flora_hennaBush"),
            plural = locale:get("flora_hennaBush_plural"),
            summary = locale:get("flora_hennaBush_summary"),
            saplingName = locale:get("flora_hennaBush_sapling"),
            saplingPlural = locale:get("flora_hennaBush_sapling_plural"),
            modelName = "whHennaBush",
            saplingModelName = "whHennaBushSapling",
            resourceGroup = {
                baseInventory = {
                    [gameObject.typeIndexMap.hennaLeaf] = 4,
                },
                seasonalReplenish = {
                    [gameObject.typeIndexMap.hennaLeaf] = 4,
                },
                fruitReplenish = {
                    [gameObject.typeIndexMap.hennaSeed] = 2,
                },
                gatherableTypes = {
                    gameObject.typeIndexMap.hennaLeaf,
                    gameObject.typeIndexMap.hennaSeed,
                },
            },
            markerPositions = bushMarkerPositions,
            interactable = true,
            addToPhysics = true,
            fruitSeason = seasons.autumn,
            seedResourceTypeIndex = resource.types.hennaSeed.index,
            useCraftSimple = true,
        })

        addFlora("myrrhBush", {
            name = locale:get("flora_myrrhBush"),
            plural = locale:get("flora_myrrhBush_plural"),
            summary = locale:get("flora_myrrhBush_summary"),
            saplingName = locale:get("flora_myrrhBush_sapling"),
            saplingPlural = locale:get("flora_myrrhBush_sapling_plural"),
            modelName = "whMyrrhBush",
            saplingModelName = "whMyrrhBushSapling",
            resourceGroup = {
                baseInventory = {
                    [gameObject.typeIndexMap.myrrh] = 3,
                },
                seasonalReplenish = {
                    [gameObject.typeIndexMap.myrrh] = 3,
                },
                fruitReplenish = {
                    [gameObject.typeIndexMap.myrrhSeed] = 2,
                },
                gatherableTypes = {
                    gameObject.typeIndexMap.myrrh,
                    gameObject.typeIndexMap.myrrhSeed,
                },
            },
            markerPositions = bushMarkerPositions,
            interactable = true,
            addToPhysics = true,
            fruitSeason = seasons.autumn,
            seedResourceTypeIndex = resource.types.myrrhSeed.index,
            useCraftSimple = true,
        })

        addFlora("dragonsBloodTree", {
            name = locale:get("flora_dragonsBloodTree"),
            plural = locale:get("flora_dragonsBloodTree_plural"),
            summary = locale:get("flora_dragonsBloodTree_summary"),
            saplingName = locale:get("flora_dragonsBloodTree_sapling"),
            saplingPlural = locale:get("flora_dragonsBloodTree_sapling_plural"),
            modelName = "whDragonsBloodTree",
            saplingModelName = "whDragonsBloodTreeSapling",
            resourceGroup = {
                baseInventory = {
                    [gameObject.typeIndexMap.dragonsBlood] = 3,
                },
                seasonalReplenish = {
                    [gameObject.typeIndexMap.dragonsBlood] = 3,
                },
                fruitReplenish = {
                    [gameObject.typeIndexMap.dragonsBloodSeed] = 2,
                },
                gatherableTypes = {
                    gameObject.typeIndexMap.dragonsBlood,
                    gameObject.typeIndexMap.dragonsBloodSeed,
                },
            },
            markerPositions = treeMarkerPositions,
            followCamOffset = treeFollowCamOffset,
            isPathFindingCollider = true,
            playBirdSounds = true,
            interactable = true,
            addToPhysics = true,
            fruitSeason = seasons.autumn,
            seedResourceTypeIndex = resource.types.dragonsBloodSeed.index,
            useCraftSimple = true,
        })
        local dragonsBloodSelectionGroupTypeIndex = selectionGroup:addGroup("allDragonsBloodTrees", locale:get("flora_dragonsBloodTree"), locale:get("flora_dragonsBloodTree_plural"), nil)
        gameObject.types.dragonsBloodTree.baseSelectionGroupTypeIndex = dragonsBloodSelectionGroupTypeIndex
        selectionGroup:addObjectTypeToGroups(gameObject.types.dragonsBloodTree.index, {dragonsBloodSelectionGroupTypeIndex})
        for i = 2,4 do
            addFlora("dragonsBloodTree" .. mj:tostring(i), {
                name = locale:get("flora_dragonsBloodTree"),
                plural = locale:get("flora_dragonsBloodTree_plural"),
                summary = locale:get("flora_dragonsBloodTree_summary"),
                saplingName = locale:get("flora_dragonsBloodTree_sapling"),
                saplingPlural = locale:get("flora_dragonsBloodTree_sapling_plural"),
                modelName = "whDragonsBloodTree" .. mj:tostring(i),
                saplingModelName = "whDragonsBloodTreeSapling",
                resourceGroup = flora.types.dragonsBloodTree.resourceGroup,
                markerPositions = treeMarkerPositions,
                followCamOffset = treeFollowCamOffset,
                isPathFindingCollider = true,
                playBirdSounds = true,
                interactable = true,
                addToPhysics = true,
                fruitSeason = seasons.autumn,
                seedResourceTypeIndex = resource.types.dragonsBloodSeed.index,
                speciesSelectionGroupTypeIndex = dragonsBloodSelectionGroupTypeIndex,
                useCraftSimple = true,
            })
        end
        addVariations({"dragonsBloodTree", "dragonsBloodTree2", "dragonsBloodTree3", "dragonsBloodTree4"})
        local dragonTreeSelectionGroupTypeIndex = selectionGroup:addGroup("allDragonTrees", locale:get("flora_dragonTree"), locale:get("flora_dragonTree_plural"), nil)
        addFlora("dragonTree", {
            name = locale:get("flora_dragonTree"),
            plural = locale:get("flora_dragonTree_plural"),
            summary = locale:get("flora_dragonTree_summary"),
            saplingName = locale:get("flora_dragonTree_sapling"),
            saplingPlural = locale:get("flora_dragonTree_sapling_plural"),
            modelName = "whDragonTree",
            saplingModelName = "whDragonTreeSapling",
            resourceGroup = {
                baseInventory = {
                    [gameObject.typeIndexMap.dragonsBlood] = 3,
                },
                seasonalReplenish = {
                    [gameObject.typeIndexMap.dragonsBlood] = 3,
                },
                fruitReplenish = {
                    [gameObject.typeIndexMap.dragonTreeSeed] = 2,
                },
                gatherableTypes = {
                    gameObject.typeIndexMap.dragonsBlood,
                    gameObject.typeIndexMap.dragonTreeSeed,
                },
            },
            markerPositions = treeMarkerPositions,
            followCamOffset = treeFollowCamOffset,
            isPathFindingCollider = true,
            playBirdSounds = true,
            interactable = true,
            addToPhysics = true,
            fruitSeason = seasons.autumn,
            seedResourceTypeIndex = resource.types.dragonTreeSeed.index,
            speciesSelectionGroupTypeIndex = dragonTreeSelectionGroupTypeIndex,
            useCraftSimple = true,
        })
        for i = 2,3 do
            addFlora("dragonTree" .. mj:tostring(i), {
                name = locale:get("flora_dragonTree"),
                plural = locale:get("flora_dragonTree_plural"),
                summary = locale:get("flora_dragonTree_summary"),
                saplingName = locale:get("flora_dragonTree_sapling"),
                saplingPlural = locale:get("flora_dragonTree_sapling_plural"),
                modelName = "whDragonTree" .. mj:tostring(i),
                saplingModelName = "whDragonTreeSapling",
                resourceGroup = flora.types.dragonTree.resourceGroup,
                markerPositions = treeMarkerPositions,
                followCamOffset = treeFollowCamOffset,
                isPathFindingCollider = true,
                playBirdSounds = true,
                interactable = true,
                addToPhysics = true,
                fruitSeason = seasons.autumn,
                seedResourceTypeIndex = resource.types.dragonTreeSeed.index,
                speciesSelectionGroupTypeIndex = dragonTreeSelectionGroupTypeIndex,
                useCraftSimple = true,
            })
        end
        addVariations({"dragonTree", "dragonTree2", "dragonTree3"})

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
        local mesquiteSelectionGroupTypeIndex = selectionGroup:addGroup("allMesquiteTrees", locale:get("flora_mesquiteTree"), locale:get("flora_mesquiteTree_plural"), nil)
        gameObject.types.mesquiteTree.baseSelectionGroupTypeIndex = mesquiteSelectionGroupTypeIndex
        selectionGroup:addObjectTypeToGroups(gameObject.types.mesquiteTree.index, {mesquiteSelectionGroupTypeIndex})
        for i = 2,4 do
            addFlora("mesquiteTree" .. mj:tostring(i), {
                name = locale:get("flora_mesquiteTree"),
                plural = locale:get("flora_mesquiteTree_plural"),
                summary = locale:get("flora_mesquiteTree_summary"),
                saplingName = locale:get("flora_mesquiteTree_sapling"),
                saplingPlural = locale:get("flora_mesquiteTree_sapling_plural"),
                modelName = "whMesquiteTree" .. mj:tostring(i),
                saplingModelName = "whMesquiteTreeSapling",
                requiresAxeToChop = true,
                resourceGroup = flora.types.mesquiteTree.resourceGroup,
                markerPositions = bushMarkerPositions,
                saplingClientModelFunction = getClientModelFunction("whMesquiteTree", "whMesquiteTreeSapling", false, false, true),
                interactable = true,
                addToPhysics = true,
                fruitSeason = seasons.summer,
                seedResourceTypeIndex = resource.types.mesquitePod.index,
                speciesSelectionGroupTypeIndex = mesquiteSelectionGroupTypeIndex,
                useCraftSimple = true,
                isFoodCrop = true,
            })
        end
        addVariations({"mesquiteTree", "mesquiteTree2", "mesquiteTree3", "mesquiteTree4"})

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
                name = locale:get("flora_saguaro"),
                plural = locale:get("flora_saguaro_plural"),
                summary = locale:get("flora_saguaro_summary"),
                saplingName = locale:get("flora_saguaro_sapling"),
                saplingPlural = locale:get("flora_saguaro_sapling_plural"),
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
                fruitSeason = seasons.summer,
                seedResourceTypeIndex = resource.types.cactusFruit.index,
                maturityDurationDays = 6,
                isPathFindingCollider = true,
                useCraftSimple = true,
                isFoodCrop = true,
            })
            requireSeedObject(key, "cactusFruit")
        end
        addVariations({"cactus1", "cactus2", "cactus3"})

        addFlora("cardon", {
            name = locale:get("flora_cardon"),
            plural = locale:get("flora_cardon_plural"),
            summary = locale:get("flora_cardon_summary"),
            saplingName = locale:get("flora_cardon_sapling"),
            saplingPlural = locale:get("flora_cardon_sapling_plural"),
            modelName = "whCardon",
            saplingModelName = "whCardonSapling",
            resourceGroup = {
                baseInventory = {},
                fruitReplenish = {
                    [gameObject.typeIndexMap.cardonFruit] = 4,
                },
                gatherableTypes = {
                    gameObject.typeIndexMap.cardonFruit,
                },
            },
            requiresAxeToChop = true,
            markerPositions = bushMarkerPositions,
            fruitSeason = seasons.summer,
            seedResourceTypeIndex = resource.types.cactusFruit.index,
            maturityDurationDays = 8,
            isPathFindingCollider = true,
            useCraftSimple = true,
            isFoodCrop = true,
        })
        requireSeedObject("cardon", "cardonFruit")
        local cardonSelectionGroupTypeIndex = selectionGroup:addGroup("allCardons", locale:get("flora_cardon"), locale:get("flora_cardon_plural"), nil)
        gameObject.types.cardon.baseSelectionGroupTypeIndex = cardonSelectionGroupTypeIndex
        selectionGroup:addObjectTypeToGroups(gameObject.types.cardon.index, {cardonSelectionGroupTypeIndex})
        for i = 2,3 do
            addFlora("cardon" .. mj:tostring(i), {
                name = locale:get("flora_cardon"),
                plural = locale:get("flora_cardon_plural"),
                summary = locale:get("flora_cardon_summary"),
                saplingName = locale:get("flora_cardon_sapling"),
                saplingPlural = locale:get("flora_cardon_sapling_plural"),
                modelName = "whCardon" .. mj:tostring(i),
                saplingModelName = "whCardonSapling",
                resourceGroup = flora.types.cardon.resourceGroup,
                requiresAxeToChop = true,
                markerPositions = bushMarkerPositions,
                fruitSeason = seasons.summer,
                seedResourceTypeIndex = resource.types.cactusFruit.index,
                speciesSelectionGroupTypeIndex = cardonSelectionGroupTypeIndex,
                maturityDurationDays = 8,
                isPathFindingCollider = true,
                useCraftSimple = true,
                isFoodCrop = true,
            })
            requireSeedObject("cardon" .. mj:tostring(i), "cardonFruit")
        end
        addVariations({"cardon", "cardon2", "cardon3"})

        addFlora("pricklyPear", {
            name = locale:get("flora_pricklyPear"),
            plural = locale:get("flora_pricklyPear_plural"),
            summary = locale:get("flora_pricklyPear_summary"),
            saplingName = locale:get("flora_pricklyPear_sapling"),
            saplingPlural = locale:get("flora_pricklyPear_sapling_plural"),
            modelName = "whPricklyPear",
            saplingModelName = "whPricklyPearSapling",
            resourceGroup = {
                baseInventory = {},
                seasonalReplenish = {
                    [gameObject.typeIndexMap.pricklyPearPad] = 2,
                },
                fruitReplenish = {
                    [gameObject.typeIndexMap.pricklyPearFruit] = 4,
                },
                gatherableTypes = {
                    gameObject.typeIndexMap.pricklyPearFruit,
                    gameObject.typeIndexMap.pricklyPearPad,
                },
            },
            markerPositions = bushMarkerPositions,
            interactable = true,
            addToPhysics = true,
            fruitSeason = seasons.autumn,
            seedResourceTypeIndex = resource.types.pricklyPearPad.index,
            maturityDurationDays = 4,
            useCraftSimple = true,
            isFoodCrop = true,
        })

        addFlora("barrelCactus", {
            name = locale:get("flora_barrelCactus"),
            plural = locale:get("flora_barrelCactus_plural"),
            summary = locale:get("flora_barrelCactus_summary"),
            saplingName = locale:get("flora_barrelCactus_sapling"),
            saplingPlural = locale:get("flora_barrelCactus_sapling_plural"),
            modelName = "whBarrelCactus",
            saplingModelName = "whBarrelCactusSapling",
            resourceGroup = {
                baseInventory = {},
                fruitReplenish = {
                    [gameObject.typeIndexMap.barrelCactusFruit] = 2,
                },
                gatherableTypes = {
                    gameObject.typeIndexMap.barrelCactusFruit,
                },
            },
            markerPositions = bushMarkerPositions,
            interactable = true,
            addToPhysics = true,
            fruitSeason = seasons.autumn,
            seedResourceTypeIndex = resource.types.cactusFruit.index,
            maturityDurationDays = 4,
            useCraftSimple = true,
            isFoodCrop = true,
        })
        requireSeedObject("barrelCactus", "barrelCactusFruit")

        addFlora("cholla", {
            name = locale:get("flora_cholla"),
            plural = locale:get("flora_cholla_plural"),
            summary = locale:get("flora_cholla_summary"),
            saplingName = locale:get("flora_cholla_sapling"),
            saplingPlural = locale:get("flora_cholla_sapling_plural"),
            modelName = "whCholla",
            saplingModelName = "whChollaSapling",
            resourceGroup = {
                baseInventory = {},
                fruitReplenish = {
                    [gameObject.typeIndexMap.chollaBud] = 4,
                },
                gatherableTypes = {
                    gameObject.typeIndexMap.chollaBud,
                },
            },
            requiresAxeToChop = true,
            markerPositions = bushMarkerPositions,
            fruitSeason = seasons.spring,
            seedResourceTypeIndex = resource.types.chollaBud.index,
            maturityDurationDays = 6,
            isPathFindingCollider = true,
            useCraftSimple = true,
            isFoodCrop = true,
        })
        local chollaSelectionGroupTypeIndex = selectionGroup:addGroup("allChollas", locale:get("flora_cholla"), locale:get("flora_cholla_plural"), nil)
        gameObject.types.cholla.baseSelectionGroupTypeIndex = chollaSelectionGroupTypeIndex
        selectionGroup:addObjectTypeToGroups(gameObject.types.cholla.index, {chollaSelectionGroupTypeIndex})
        for i = 2,3 do
            addFlora("cholla" .. mj:tostring(i), {
                name = locale:get("flora_cholla"),
                plural = locale:get("flora_cholla_plural"),
                summary = locale:get("flora_cholla_summary"),
                saplingName = locale:get("flora_cholla_sapling"),
                saplingPlural = locale:get("flora_cholla_sapling_plural"),
                modelName = "whCholla" .. mj:tostring(i),
                saplingModelName = "whChollaSapling",
                resourceGroup = flora.types.cholla.resourceGroup,
                requiresAxeToChop = true,
                markerPositions = bushMarkerPositions,
                fruitSeason = seasons.spring,
                seedResourceTypeIndex = resource.types.chollaBud.index,
                speciesSelectionGroupTypeIndex = chollaSelectionGroupTypeIndex,
                maturityDurationDays = 6,
                isPathFindingCollider = true,
                useCraftSimple = true,
                isFoodCrop = true,
            })
        end
        addVariations({"cholla", "cholla2", "cholla3"})

        addFlora("candelabraEuphorbia", {
            name = locale:get("flora_candelabraEuphorbia"),
            plural = locale:get("flora_candelabraEuphorbia_plural"),
            summary = locale:get("flora_candelabraEuphorbia_summary"),
            saplingName = locale:get("flora_candelabraEuphorbia_sapling"),
            saplingPlural = locale:get("flora_candelabraEuphorbia_sapling_plural"),
            modelName = "whCandelabraEuphorbia",
            saplingModelName = "whCandelabraEuphorbiaSapling",
            resourceGroup = {
                baseInventory = {},
                fruitReplenish = {
                    [gameObject.typeIndexMap.euphorbiaSeed] = 2,
                },
                gatherableTypes = {
                    gameObject.typeIndexMap.euphorbiaSeed,
                },
            },
            requiresAxeToChop = true,
            markerPositions = bushMarkerPositions,
            fruitSeason = seasons.summer,
            seedResourceTypeIndex = resource.types.euphorbiaSeed.index,
            maturityDurationDays = 8,
            isPathFindingCollider = true,
            useCraftSimple = true,
        })
        local euphorbiaSelectionGroupTypeIndex = selectionGroup:addGroup("allCandelabraEuphorbias", locale:get("flora_candelabraEuphorbia"), locale:get("flora_candelabraEuphorbia_plural"), nil)
        gameObject.types.candelabraEuphorbia.baseSelectionGroupTypeIndex = euphorbiaSelectionGroupTypeIndex
        selectionGroup:addObjectTypeToGroups(gameObject.types.candelabraEuphorbia.index, {euphorbiaSelectionGroupTypeIndex})
        for i = 2,3 do
            addFlora("candelabraEuphorbia" .. mj:tostring(i), {
                name = locale:get("flora_candelabraEuphorbia"),
                plural = locale:get("flora_candelabraEuphorbia_plural"),
                summary = locale:get("flora_candelabraEuphorbia_summary"),
                saplingName = locale:get("flora_candelabraEuphorbia_sapling"),
                saplingPlural = locale:get("flora_candelabraEuphorbia_sapling_plural"),
                modelName = "whCandelabraEuphorbia" .. mj:tostring(i),
                saplingModelName = "whCandelabraEuphorbiaSapling",
                resourceGroup = flora.types.candelabraEuphorbia.resourceGroup,
                requiresAxeToChop = true,
                markerPositions = bushMarkerPositions,
                fruitSeason = seasons.summer,
                seedResourceTypeIndex = resource.types.euphorbiaSeed.index,
                speciesSelectionGroupTypeIndex = euphorbiaSelectionGroupTypeIndex,
                maturityDurationDays = 8,
                isPathFindingCollider = true,
                useCraftSimple = true,
            })
        end
        addVariations({"candelabraEuphorbia", "candelabraEuphorbia2", "candelabraEuphorbia3"})

        local giantGroundselSelectionGroupTypeIndex = selectionGroup:addGroup("allGiantGroundsels", locale:get("flora_giantGroundsel"), locale:get("flora_giantGroundsel_plural"), nil)
        addFlora("giantGroundsel", {
            name = locale:get("flora_giantGroundsel"),
            plural = locale:get("flora_giantGroundsel_plural"),
            summary = locale:get("flora_giantGroundsel_summary"),
            saplingName = locale:get("flora_giantGroundsel_sapling"),
            saplingPlural = locale:get("flora_giantGroundsel_sapling_plural"),
            modelName = "whGiantGroundsel",
            saplingModelName = "whGiantGroundselSapling",
            resourceGroup = {
                baseInventory = {},
                fruitReplenish = {
                    [gameObject.typeIndexMap.giantGroundselSeed] = 2,
                },
                gatherableTypes = {
                    gameObject.typeIndexMap.giantGroundselSeed,
                },
            },
            requiresAxeToChop = true,
            markerPositions = bushMarkerPositions,
            fruitSeason = seasons.summer,
            seedResourceTypeIndex = resource.types.giantGroundselSeed.index,
            speciesSelectionGroupTypeIndex = giantGroundselSelectionGroupTypeIndex,
            maturityDurationDays = 8,
            isPathFindingCollider = true,
            useCraftSimple = true,
        })
        for i = 2,4 do
            addFlora("giantGroundsel" .. mj:tostring(i), {
                name = locale:get("flora_giantGroundsel"),
                plural = locale:get("flora_giantGroundsel_plural"),
                summary = locale:get("flora_giantGroundsel_summary"),
                saplingName = locale:get("flora_giantGroundsel_sapling"),
                saplingPlural = locale:get("flora_giantGroundsel_sapling_plural"),
                modelName = "whGiantGroundsel" .. mj:tostring(i),
                saplingModelName = "whGiantGroundselSapling",
                resourceGroup = flora.types.giantGroundsel.resourceGroup,
                requiresAxeToChop = true,
                markerPositions = bushMarkerPositions,
                fruitSeason = seasons.summer,
                seedResourceTypeIndex = resource.types.giantGroundselSeed.index,
                speciesSelectionGroupTypeIndex = giantGroundselSelectionGroupTypeIndex,
                maturityDurationDays = 8,
                isPathFindingCollider = true,
                useCraftSimple = true,
            })
        end
        addVariations({"giantGroundsel", "giantGroundsel2", "giantGroundsel3", "giantGroundsel4"})

        for i = 3,4 do
            addFlora("willow" .. mj:tostring(i), {
                name = locale:get("flora_willow"),
                plural = locale:get("flora_willow_plural"),
                summary = locale:get("flora_willow_summary"),
                saplingName = locale:get("flora_willow_sapling"),
                saplingPlural = locale:get("flora_willow_sapling_plural"),
                modelName = "whWillow" .. mj:tostring(i),
                saplingModelName = "willowSapling",
                resourceGroup = flora.types.willow1.resourceGroup,
                requiresAxeToChop = true,
                markerPositions = treeMarkerPositions,
                followCamOffset = treeFollowCamOffset,
                clientModelFunction = getClientModelFunction("willow", "whWillow" .. mj:tostring(i), true, false, false),
                saplingClientModelFunction = getClientModelFunction("willow", "willowSapling", true, false, true),
                fruitSeason = seasons.summer,
                seedResourceTypeIndex = resource.types.willowSeed.index,
                speciesSelectionGroupTypeIndex = selectionGroup.types.allWillowTrees.index,
                isPathFindingCollider = true,
                useCraftSimple = true,
                playBirdSounds = true,
            })
        end
        addVariations({"willow1", "willow2", "willow3", "willow4"})

        local appleSelectionGroupTypeIndex = selectionGroup:addGroup("allAppleTrees", locale:get("flora_appleTree"), locale:get("flora_appleTree_plural"), nil)
        gameObject.types.appleTree.baseSelectionGroupTypeIndex = appleSelectionGroupTypeIndex
        selectionGroup:addObjectTypeToGroups(gameObject.types.appleTree.index, {appleSelectionGroupTypeIndex})
        for i = 2,4 do
            addFlora("appleTree" .. mj:tostring(i), {
                name = locale:get("flora_appleTree"),
                plural = locale:get("flora_appleTree_plural"),
                summary = locale:get("flora_appleTree_summary"),
                saplingName = locale:get("flora_appleTree_sapling"),
                saplingPlural = locale:get("flora_appleTree_sapling_plural"),
                modelName = "whAppleTree" .. mj:tostring(i),
                saplingModelName = "appleTreeSapling",
                resourceGroup = flora.types.appleTree.resourceGroup,
                requiresAxeToChop = true,
                markerPositions = treeMarkerPositions,
                followCamOffset = treeFollowCamOffset,
                clientModelFunction = getClientModelFunction("appleTree", "whAppleTree" .. mj:tostring(i), true, false, false),
                saplingClientModelFunction = getClientModelFunction("appleTree", "appleTreeSapling", true, false, true),
                fruitSeason = seasons.summer,
                seedResourceTypeIndex = resource.types.apple.index,
                speciesSelectionGroupTypeIndex = appleSelectionGroupTypeIndex,
                isPathFindingCollider = false,
                useCraftSimple = true,
                isFoodCrop = true,
                playBirdSounds = true,
            })
        end
        addVariations({"appleTree", "appleTree2", "appleTree3", "appleTree4"})

        local orangeSelectionGroupTypeIndex = selectionGroup:addGroup("allOrangeTrees", locale:get("flora_orangeTree"), locale:get("flora_orangeTree_plural"), nil)
        gameObject.types.orangeTree.baseSelectionGroupTypeIndex = orangeSelectionGroupTypeIndex
        selectionGroup:addObjectTypeToGroups(gameObject.types.orangeTree.index, {orangeSelectionGroupTypeIndex})
        for i = 2,4 do
            addFlora("orangeTree" .. mj:tostring(i), {
                name = locale:get("flora_orangeTree"),
                plural = locale:get("flora_orangeTree_plural"),
                summary = locale:get("flora_orangeTree_summary"),
                saplingName = locale:get("flora_orangeTree_sapling"),
                saplingPlural = locale:get("flora_orangeTree_sapling_plural"),
                modelName = "whOrangeTree" .. mj:tostring(i),
                saplingModelName = "orangeTreeSapling",
                resourceGroup = flora.types.orangeTree.resourceGroup,
                requiresAxeToChop = true,
                markerPositions = treeMarkerPositions,
                followCamOffset = treeFollowCamOffset,
                saplingClientModelFunction = getClientModelFunction("orangeTree", "orangeTreeSapling", false, false, true),
                fruitSeason = seasons.winter,
                seedResourceTypeIndex = resource.types.orange.index,
                speciesSelectionGroupTypeIndex = orangeSelectionGroupTypeIndex,
                isPathFindingCollider = false,
                useCraftSimple = true,
                isFoodCrop = true,
                playBirdSounds = true,
            })
        end
        addVariations({"orangeTree", "orangeTree2", "orangeTree3", "orangeTree4"})

        local elderberrySelectionGroupTypeIndex = selectionGroup:addGroup("allElderberryTrees", locale:get("flora_elderberryTree"), locale:get("flora_elderberryTree_plural"), nil)
        gameObject.types.elderberryTree.baseSelectionGroupTypeIndex = elderberrySelectionGroupTypeIndex
        selectionGroup:addObjectTypeToGroups(gameObject.types.elderberryTree.index, {elderberrySelectionGroupTypeIndex})
        for i = 2,4 do
            addFlora("elderberryTree" .. mj:tostring(i), {
                name = locale:get("flora_elderberryTree"),
                plural = locale:get("flora_elderberryTree_plural"),
                summary = locale:get("flora_elderberryTree_summary"),
                saplingName = locale:get("flora_elderberryTree_sapling"),
                saplingPlural = locale:get("flora_elderberryTree_sapling_plural"),
                modelName = "whElderberryTree" .. mj:tostring(i),
                saplingModelName = "elderberryTreeSapling",
                resourceGroup = flora.types.elderberryTree.resourceGroup,
                requiresAxeToChop = true,
                markerPositions = treeMarkerPositions,
                followCamOffset = treeFollowCamOffset,
                clientModelFunction = getClientModelFunction("elderberryTree", "whElderberryTree" .. mj:tostring(i), true, false, false),
                saplingClientModelFunction = getClientModelFunction("elderberryTree", "elderberryTreeSapling", true, false, true),
                fruitSeason = seasons.autumn,
                seedResourceTypeIndex = resource.types.elderberry.index,
                speciesSelectionGroupTypeIndex = elderberrySelectionGroupTypeIndex,
                isPathFindingCollider = false,
                useCraftSimple = true,
                isFoodCrop = true,
                playBirdSounds = true,
            })
        end
        addVariations({"elderberryTree", "elderberryTree2", "elderberryTree3", "elderberryTree4"})

        local peachSelectionGroupTypeIndex = selectionGroup:addGroup("allPeachTrees", locale:get("flora_peachTree"), locale:get("flora_peachTree_plural"), nil)
        gameObject.types.peachTree.baseSelectionGroupTypeIndex = peachSelectionGroupTypeIndex
        selectionGroup:addObjectTypeToGroups(gameObject.types.peachTree.index, {peachSelectionGroupTypeIndex})
        for i = 2,4 do
            addFlora("peachTree" .. mj:tostring(i), {
                name = locale:get("flora_peachTree"),
                plural = locale:get("flora_peachTree_plural"),
                summary = locale:get("flora_peachTree_summary"),
                saplingName = locale:get("flora_peachTree_sapling"),
                saplingPlural = locale:get("flora_peachTree_sapling_plural"),
                modelName = "whPeachTree" .. mj:tostring(i),
                saplingModelName = "peachTreeSapling",
                resourceGroup = flora.types.peachTree.resourceGroup,
                requiresAxeToChop = true,
                markerPositions = treeMarkerPositions,
                followCamOffset = treeFollowCamOffset,
                clientModelFunction = getClientModelFunction("peachTree", "whPeachTree" .. mj:tostring(i), true, false, false),
                saplingClientModelFunction = getClientModelFunction("peachTree", "peachTreeSapling", true, false, true),
                fruitSeason = seasons.summer,
                seedResourceTypeIndex = resource.types.peach.index,
                speciesSelectionGroupTypeIndex = peachSelectionGroupTypeIndex,
                isPathFindingCollider = false,
                useCraftSimple = true,
                isFoodCrop = true,
                playBirdSounds = true,
            })
        end
        addVariations({"peachTree", "peachTree2", "peachTree3", "peachTree4"})

        local baobabSelectionGroupTypeIndex = selectionGroup:addGroup("allBaobabs", locale:get("flora_baobab"), locale:get("flora_baobab_plural"), nil)
        for i = 1,4 do
            local key = "baobab" .. mj:tostring(i)
            addFlora(key, {
                name = locale:get("flora_baobab"),
                plural = locale:get("flora_baobab_plural"),
                summary = locale:get("flora_baobab_summary"),
                saplingName = locale:get("flora_baobab_sapling"),
                saplingPlural = locale:get("flora_baobab_sapling_plural"),
                modelName = "whBaobab" .. mj:tostring(i),
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
                clientModelFunction = getClientModelFunction("whBaobab", "whBaobab" .. mj:tostring(i), true, false, false),
                saplingClientModelFunction = getClientModelFunction("whBaobab", "whBaobabSapling", false, false, true),
                fruitSeason = seasons.autumn,
                seedResourceTypeIndex = resource.types.baobabFruit.index,
                speciesSelectionGroupTypeIndex = baobabSelectionGroupTypeIndex,
                maturityDurationDays = 16,
                isPathFindingCollider = true,
                useCraftSimple = true,
                isFoodCrop = true,
                playBirdSounds = true,
            })
        end
        addVariations({"baobab1", "baobab2", "baobab3", "baobab4"})

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
        addWildTree("acacia4", "whAcacia4", acaciaInfo, 2, 2)
        addVariations({"acacia1", "acacia2", "acacia3", "acacia4"})

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

        for i,key in ipairs({"kapok1", "kapok2", "kapok3", "kapokBig1"}) do
            local kapokResourceGroup = flora.types[key].resourceGroup
            kapokResourceGroup.fruitReplenish[gameObject.typeIndexMap.kapokFibre] = 2
            table.insert(kapokResourceGroup.gatherableTypes, gameObject.typeIndexMap.kapokFibre)
        end

        local rubberTreeInfo = {
            localeKey = "rubberTree",
            woodKey = "rubber",
            seedKey = "rubberSeed",
            moundKey = "whRubberTree",
            saplingModelName = "whRubberTreeSapling",
            selectionGroupTypeIndex = selectionGroup:addGroup("allRubberTrees", locale:get("flora_rubberTree"), locale:get("flora_rubberTree_plural"), nil),
        }
        addWildTree("rubberTree1", "whRubberTree1", rubberTreeInfo, 5, 4)
        addWildTree("rubberTree2", "whRubberTree2", rubberTreeInfo, 4, 3)
        addWildTree("rubberTree3", "whRubberTree3", rubberTreeInfo, 7, 4)
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

        local cypressInfo = {
            localeKey = "cypress",
            woodKey = "cypress",
            seedKey = "cypressCone",
            moundKey = "whCypress",
            saplingModelName = "whCypressSapling",
            selectionGroupTypeIndex = selectionGroup:addGroup("allCypresses", locale:get("flora_cypress"), locale:get("flora_cypress_plural"), nil),
        }
        addWildTree("cypress1", "whCypress1", cypressInfo, 4, 3)
        addWildTree("cypress2", "whCypress2", cypressInfo, 4, 3)
        addWildTree("cypress3", "whCypress3", cypressInfo, 4, 3)
        addWildTree("cypress4", "whCypress4", cypressInfo, 4, 3)
        addVariations({"cypress1", "cypress2", "cypress3", "cypress4"})

        local brazilNutTreeInfo = {
            localeKey = "brazilNutTree",
            woodKey = "brazilNut",
            seedKey = "brazilNut",
            moundKey = "whBrazilNutTree",
            saplingModelName = "whBrazilNutTreeSapling",
            selectionGroupTypeIndex = selectionGroup:addGroup("allBrazilNutTrees", locale:get("flora_brazilNutTree"), locale:get("flora_brazilNutTree_plural"), nil),
            fruitCount = 6,
            fruitSeason = seasons.autumn,
            isFoodCrop = true,
            maturityDurationDays = 24,
        }
        addWildTree("brazilNutTree", "whBrazilNutTree", brazilNutTreeInfo, 24, 10)
        addWildTree("brazilNutTree2", "whBrazilNutTree2", brazilNutTreeInfo, 12, 6)
        addWildTree("brazilNutTree3", "whBrazilNutTree3", brazilNutTreeInfo, 12, 6)
        addWildTree("brazilNutTree4", "whBrazilNutTree4", brazilNutTreeInfo, 24, 10)
        addVariations({"brazilNutTree", "brazilNutTree2", "brazilNutTree3", "brazilNutTree4"})

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
        addWildTree("mahogany2", "whMahogany2", mahoganyInfo, 7, 4)
        addWildTree("mahogany3", "whMahogany3", mahoganyInfo, 20, 8)
        addWildTree("mahogany4", "whMahogany4", mahoganyInfo, 10, 6)
        addVariations({"mahogany1", "mahogany2", "mahogany3", "mahogany4"})

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
        addWildTree("banyan3", "whBanyan3", banyanInfo, 12, 8)
        addWildTree("banyan4", "whBanyan4", banyanInfo, 10, 8)
        addVariations({"banyan1", "banyan2", "banyan3", "banyan4"})

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
        addWildTree("juniper3", "whJuniper3", juniperInfo, 2, 3)
        addWildTree("juniper4", "whJuniper4", juniperInfo, 2, 3)
        addVariations({"juniper1", "juniper2", "juniper3", "juniper4"})

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
        addWildTree("alder3", "whAlder3", alderInfo, 4, 3)
        addWildTree("alder4", "whAlder4", alderInfo, 4, 3)
        addVariations({"alder1", "alder2", "alder3", "alder4"})

        local poplarInfo = {
            localeKey = "poplar",
            woodKey = "poplar",
            seedKey = "poplarSeed",
            moundKey = "whPoplar",
            saplingModelName = "whPoplarSapling",
            selectionGroupTypeIndex = selectionGroup:addGroup("allPoplars", locale:get("flora_poplar"), locale:get("flora_poplar_plural"), nil),
            seasonal = true,
            maturityDurationDays = 6,
        }
        addWildTree("poplar1", "whPoplar1", poplarInfo, 5, 3)
        addWildTree("poplar2", "whPoplar2", poplarInfo, 3, 3)
        addWildTree("poplar3", "whPoplar3", poplarInfo, 7, 3)
        addWildTree("poplar4", "whPoplar4", poplarInfo, 5, 3)
        addVariations({"poplar1", "poplar2", "poplar3", "poplar4"})

        local arganTreeInfo = {
            localeKey = "arganTree",
            woodKey = "argan",
            seedKey = "arganNut",
            moundKey = "whArganTree",
            saplingModelName = "whArganTreeSapling",
            selectionGroupTypeIndex = selectionGroup:addGroup("allArganTrees", locale:get("flora_arganTree"), locale:get("flora_arganTree_plural"), nil),
            fruitCount = 4,
            fruitSeason = seasons.summer,
        }
        addWildTree("arganTree", "whArganTree", arganTreeInfo, 4, 4)
        addWildTree("arganTree2", "whArganTree2", arganTreeInfo, 4, 4)
        addWildTree("arganTree3", "whArganTree3", arganTreeInfo, 4, 4)
        addWildTree("arganTree4", "whArganTree4", arganTreeInfo, 4, 4)
        addVariations({"arganTree", "arganTree2", "arganTree3", "arganTree4"})

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
        addWildTree("mangrove3", "whMangrove3", mangroveInfo, 0, 4)
        addWildTree("mangrove4", "whMangrove4", mangroveInfo, 0, 4)
        addVariations({"mangrove1", "mangrove2", "mangrove3", "mangrove4"})

        local carobTreeInfo = {
            localeKey = "carobTree",
            woodKey = "carob",
            seedKey = "carobPod",
            moundKey = "whCarobTree",
            saplingModelName = "whCarobTreeSapling",
            selectionGroupTypeIndex = selectionGroup:addGroup("allCarobTrees", locale:get("flora_carobTree"), locale:get("flora_carobTree_plural"), nil),
            fruitCount = 6,
            fruitSeason = seasons.autumn,
            isFoodCrop = true,
        }
        addWildTree("carobTree", "whCarobTree", carobTreeInfo, 4, 4)
        addWildTree("carobTree2", "whCarobTree2", carobTreeInfo, 4, 4)
        addWildTree("carobTree3", "whCarobTree3", carobTreeInfo, 4, 4)
        addWildTree("carobTree4", "whCarobTree4", carobTreeInfo, 4, 4)
        addVariations({"carobTree", "carobTree2", "carobTree3", "carobTree4"})

        local dwarfBirchSelectionGroupTypeIndex = selectionGroup:addGroup("allDwarfBirches", locale:get("flora_dwarfBirch"), locale:get("flora_dwarfBirch_plural"), nil)
        for i = 1,4 do
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
        addVariations({"dwarfBirch1", "dwarfBirch2", "dwarfBirch3", "dwarfBirch4"})

        addFlora("hazelBush", {
            name = locale:get("flora_hazelBush"),
            plural = locale:get("flora_hazelBush_plural"),
            summary = locale:get("flora_hazelBush_summary"),
            saplingName = locale:get("flora_hazelBush_sapling"),
            saplingPlural = locale:get("flora_hazelBush_sapling_plural"),
            modelName = "whHazelBush",
            saplingModelName = "whHazelBushSapling",
            resourceGroup = {
                baseInventory = {
                    [gameObject.typeIndexMap.hazelBranch] = 2,
                },
                seasonalReplenish = {
                    [gameObject.typeIndexMap.hazelBranch] = 2,
                },
                fruitReplenish = {
                    [gameObject.typeIndexMap.hazelnut] = 3,
                },
                gatherableTypes = {
                    gameObject.typeIndexMap.hazelnut,
                    gameObject.typeIndexMap.hazelBranch,
                },
            },
            markerPositions = bushMarkerPositions,
            clientModelFunction = getClientModelFunction("whHazelBush", "whHazelBush", true, false, false),
            saplingClientModelFunction = getClientModelFunction("whHazelBush", "whHazelBushSapling", false, false, true),
            interactable = true,
            addToPhysics = true,
            fruitSeason = seasons.autumn,
            seedResourceTypeIndex = resource.types.hazelnut.index,
            isFoodCrop = true,
            useCraftSimple = true,
        })
        local hazelSelectionGroupTypeIndex = selectionGroup:addGroup("allHazelBushes", locale:get("flora_hazelBush"), locale:get("flora_hazelBush_plural"), nil)
        gameObject.types.hazelBush.baseSelectionGroupTypeIndex = hazelSelectionGroupTypeIndex
        selectionGroup:addObjectTypeToGroups(gameObject.types.hazelBush.index, {hazelSelectionGroupTypeIndex})
        for i = 2,4 do
            addFlora("hazelBush" .. mj:tostring(i), {
                name = locale:get("flora_hazelBush"),
                plural = locale:get("flora_hazelBush_plural"),
                summary = locale:get("flora_hazelBush_summary"),
                saplingName = locale:get("flora_hazelBush_sapling"),
                saplingPlural = locale:get("flora_hazelBush_sapling_plural"),
                modelName = "whHazelBush" .. mj:tostring(i),
                saplingModelName = "whHazelBushSapling",
                resourceGroup = flora.types.hazelBush.resourceGroup,
                markerPositions = bushMarkerPositions,
                clientModelFunction = getClientModelFunction("whHazelBush", "whHazelBush" .. mj:tostring(i), true, false, false),
                saplingClientModelFunction = getClientModelFunction("whHazelBush", "whHazelBushSapling", false, false, true),
                interactable = true,
                addToPhysics = true,
                fruitSeason = seasons.autumn,
                seedResourceTypeIndex = resource.types.hazelnut.index,
                speciesSelectionGroupTypeIndex = hazelSelectionGroupTypeIndex,
                isFoodCrop = true,
                useCraftSimple = true,
            })
        end
        addVariations({"hazelBush", "hazelBush2", "hazelBush3", "hazelBush4"})

        addFlora("arcticWillow", {
            name = locale:get("flora_arcticWillow"),
            plural = locale:get("flora_arcticWillow_plural"),
            summary = locale:get("flora_arcticWillow_summary"),
            saplingName = locale:get("flora_arcticWillow_sapling"),
            saplingPlural = locale:get("flora_arcticWillow_sapling_plural"),
            modelName = "whArcticWillow",
            saplingModelName = "whArcticWillowSapling",
            resourceGroup = {
                baseInventory = {
                    [gameObject.typeIndexMap.willowBark] = 2,
                },
                seasonalReplenish = {
                    [gameObject.typeIndexMap.willowBark] = 2,
                },
                fruitReplenish = {
                    [gameObject.typeIndexMap.arcticWillowSeed] = 1,
                },
                gatherableTypes = {
                    gameObject.typeIndexMap.arcticWillowSeed,
                    gameObject.typeIndexMap.willowBark,
                },
            },
            markerPositions = bushMarkerPositions,
            clientModelFunction = getClientModelFunction("whArcticWillow", "whArcticWillow", true, false, false),
            saplingClientModelFunction = getClientModelFunction("whArcticWillow", "whArcticWillowSapling", false, false, true),
            interactable = true,
            addToPhysics = true,
            fruitSeason = seasons.summer,
            seedResourceTypeIndex = resource.types.arcticWillowSeed.index,
            useCraftSimple = true,
        })

        local sagebrushSelectionGroupTypeIndex = selectionGroup:addGroup("allSagebrush", locale:get("flora_sagebrush"), locale:get("flora_sagebrush_plural"), nil)
        for i = 1,3 do
            addFlora("sagebrush" .. mj:tostring(i), {
                name = locale:get("flora_sagebrush"),
                plural = locale:get("flora_sagebrush_plural"),
                summary = locale:get("flora_sagebrush_summary"),
                saplingName = locale:get("flora_sagebrush_sapling"),
                saplingPlural = locale:get("flora_sagebrush_sapling_plural"),
                modelName = "whSagebrush" .. mj:tostring(i),
                saplingModelName = "whSagebrushSapling",
                resourceGroup = {
                    baseInventory = {
                        [gameObject.typeIndexMap.sagebrushLeaf] = 2,
                        [gameObject.typeIndexMap.sagebrushBranch] = 1,
                    },
                    seasonalReplenish = {
                        [gameObject.typeIndexMap.sagebrushLeaf] = 2,
                        [gameObject.typeIndexMap.sagebrushBranch] = 1,
                    },
                    fruitReplenish = {
                        [gameObject.typeIndexMap.sagebrushSeed] = 2,
                    },
                    gatherableTypes = {
                        gameObject.typeIndexMap.sagebrushLeaf,
                        gameObject.typeIndexMap.sagebrushSeed,
                        gameObject.typeIndexMap.sagebrushBranch,
                    },
                },
                markerPositions = bushMarkerPositions,
                clientModelFunction = getClientModelFunction("whSagebrush", "whSagebrush" .. mj:tostring(i), false, false, false),
                saplingClientModelFunction = getClientModelFunction("whSagebrush", "whSagebrushSapling", false, false, true),
                interactable = true,
                addToPhysics = true,
                fruitSeason = seasons.autumn,
                seedResourceTypeIndex = resource.types.sagebrushSeed.index,
                speciesSelectionGroupTypeIndex = sagebrushSelectionGroupTypeIndex,
                useCraftSimple = true,
            })
        end
        addVariations({"sagebrush1", "sagebrush2", "sagebrush3"})

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
                        [gameObject.typeIndexMap.doumFruit] = 4,
                    },
                    gatherableTypes = {
                        gameObject.typeIndexMap.doumFruit,
                        gameObject.typeIndexMap.palmLeaf,
                    },
                },
                requiresAxeToChop = true,
                markerPositions = treeMarkerPositions,
                followCamOffset = treeFollowCamOffset,
                saplingClientModelFunction = getClientModelFunction("whDatePalm", "whDoumPalmSapling", false, false, true),
                fruitSeason = seasons.summer,
                seedResourceTypeIndex = resource.types.doumFruit.index,
                speciesSelectionGroupTypeIndex = doumPalmSelectionGroupTypeIndex,
                maturityDurationDays = 8,
                isPathFindingCollider = false,
                useCraftSimple = true,
                isFoodCrop = true,
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
                        [gameObject.typeIndexMap.frond] = 3,
                    },
                    fruitReplenish = {
                        [gameObject.typeIndexMap.treeFernSpores] = 2,
                    },
                    gatherableTypes = {
                        gameObject.typeIndexMap.treeFernSpores,
                        gameObject.typeIndexMap.frond,
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
        addWildTree("planeTree2", "whPlaneTree2", planeTreeInfo, 5, 3)
        addWildTree("planeTree3", "whPlaneTree3", planeTreeInfo, 5, 3)
        addWildTree("planeTree4", "whPlaneTree4", planeTreeInfo, 6, 4)
        addVariations({"planeTree1", "planeTree2", "planeTree3", "planeTree4"})

        local baldCypressInfo = {
            localeKey = "baldCypress",
            woodKey = "baldCypress",
            seedKey = "baldCypressCone",
            moundKey = "whBaldCypress",
            saplingModelName = "whBaldCypressSapling",
            selectionGroupTypeIndex = selectionGroup:addGroup("allBaldCypresses", locale:get("flora_baldCypress"), locale:get("flora_baldCypress_plural"), nil),
            seasonal = true,
            fruitSeason = seasons.autumn,
        }
        addWildTree("baldCypress1", "whBaldCypress1", baldCypressInfo, 6, 4)
        addWildTree("baldCypress2", "whBaldCypress2", baldCypressInfo, 6, 4)
        addWildTree("baldCypress3", "whBaldCypress3", baldCypressInfo, 6, 4)
        addWildTree("baldCypress4", "whBaldCypress4", baldCypressInfo, 6, 4)
        addVariations({"baldCypress1", "baldCypress2", "baldCypress3", "baldCypress4"})

        local maritimePineInfo = {
            localeKey = "maritimePine",
            woodKey = "maritimePine",
            seedKey = "maritimePineCone",
            moundKey = "whMaritimePine",
            saplingModelName = "whMaritimePineSapling",
            selectionGroupTypeIndex = selectionGroup:addGroup("allMaritimePines", locale:get("flora_maritimePine"), locale:get("flora_maritimePine_plural"), nil),
            snow = true,
        }
        addWildTree("maritimePine1", "whMaritimePine1", maritimePineInfo, 4, 3)
        addWildTree("maritimePine2", "whMaritimePine2", maritimePineInfo, 3, 3)
        addWildTree("maritimePine3", "whMaritimePine3", maritimePineInfo, 3, 3)
        addWildTree("maritimePine4", "whMaritimePine4", maritimePineInfo, 6, 3)
        addVariations({"maritimePine1", "maritimePine2", "maritimePine3", "maritimePine4"})

        local stonePineInfo = {
            localeKey = "stonePine",
            woodKey = "pine",
            seedKey = "stonePineCone",
            moundKey = "whStonePine",
            saplingModelName = "whStonePineSapling",
            selectionGroupTypeIndex = selectionGroup:addGroup("allStonePines", locale:get("flora_stonePine"), locale:get("flora_stonePine_plural"), nil),
            snow = true,
            fruitCount = 4,
            fruitSeason = seasons.autumn,
            isFoodCrop = true,
            maturityDurationDays = 20,
        }
        addWildTree("stonePine1", "whStonePine1", stonePineInfo, 5, 3)
        addWildTree("stonePine2", "whStonePine2", stonePineInfo, 3, 3)
        addWildTree("stonePine3", "whStonePine3", stonePineInfo, 6, 3)
        addWildTree("stonePine4", "whStonePine4", stonePineInfo, 4, 3)
        addVariations({"stonePine1", "stonePine2", "stonePine3", "stonePine4"})

        local chestnutInfo = {
            localeKey = "chestnut",
            woodKey = "chestnut",
            seedKey = "chestnut",
            moundKey = "whChestnut",
            saplingModelName = "whChestnutSapling",
            selectionGroupTypeIndex = selectionGroup:addGroup("allChestnuts", locale:get("flora_chestnut"), locale:get("flora_chestnut_plural"), nil),
            seasonal = true,
            fruitCount = 4,
            fruitSeason = seasons.autumn,
            isFoodCrop = true,
            maturityDurationDays = 20,
        }
        addWildTree("chestnut1", "whChestnut1", chestnutInfo, 6, 4)
        addWildTree("chestnut2", "whChestnut2", chestnutInfo, 8, 4)
        addWildTree("chestnut3", "whChestnut3", chestnutInfo, 5, 3)
        addWildTree("chestnut4", "whChestnut4", chestnutInfo, 5, 3)
        addVariations({"chestnut1", "chestnut2", "chestnut3", "chestnut4"})

        local beechInfo = {
            localeKey = "beech",
            woodKey = "beech",
            seedKey = "beechnut",
            moundKey = "whBeech",
            saplingModelName = "whBeechSapling",
            selectionGroupTypeIndex = selectionGroup:addGroup("allBeeches", locale:get("flora_beech"), locale:get("flora_beech_plural"), nil),
            seasonal = true,
            fruitCount = 4,
            fruitSeason = seasons.autumn,
            isFoodCrop = true,
            maturityDurationDays = 20,
        }
        addWildTree("beech1", "whBeech1", beechInfo, 6, 4)
        addWildTree("beech2", "whBeech2", beechInfo, 8, 4)
        addWildTree("beech3", "whBeech3", beechInfo, 5, 3)
        addWildTree("beech4", "whBeech4", beechInfo, 4, 3)
        addVariations({"beech1", "beech2", "beech3", "beech4"})

        addWildTree("saxaul1", "whSaxaul1", {
            localeKey = "saxaul",
            woodKey = "saxaul",
            seedKey = "saxaulSeed",
            moundKey = "whSaxaul",
            saplingModelName = "whSaxaulSapling",
        }, 0, 3)

        addWildTree("spruce1", "whSpruce1", {
            localeKey = "spruce",
            woodKey = "pine",
            seedKey = "pineCone",
            moundKey = "whSpruce",
            saplingModelName = "whSpruceSapling",
            snow = true,
        }, 5, 3)

        local larchInfo = {
            localeKey = "larch",
            woodKey = "larch",
            seedKey = "larchCone",
            moundKey = "whLarch",
            saplingModelName = "whLarchSapling",
            selectionGroupTypeIndex = selectionGroup:addGroup("allLarches", locale:get("flora_larch"), locale:get("flora_larch_plural"), nil),
            seasonal = true,
            fruitSeason = seasons.autumn,
        }
        addWildTree("larch1", "whLarch1", larchInfo, 4, 3)
        addWildTree("larch2", "whLarch2", larchInfo, 6, 3)
        addWildTree("larch3", "whLarch3", larchInfo, 5, 3)
        addWildTree("larch4", "whLarch4", larchInfo, 2, 3)
        addVariations({"larch1", "larch2", "larch3", "larch4"})

        local tamariskInfo = {
            localeKey = "tamarisk",
            woodKey = "tamarisk",
            seedKey = "tamariskSeed",
            moundKey = "whTamarisk",
            saplingModelName = "whTamariskSapling",
            selectionGroupTypeIndex = selectionGroup:addGroup("allTamarisks", locale:get("flora_tamarisk"), locale:get("flora_tamarisk_plural"), nil),
        }
        addWildTree("tamarisk1", "whTamarisk1", tamariskInfo, 0, 3)
        addWildTree("tamarisk2", "whTamarisk2", tamariskInfo, 0, 3)
        addWildTree("tamarisk3", "whTamarisk3", tamariskInfo, 0, 3)
        addWildTree("tamarisk4", "whTamarisk4", tamariskInfo, 0, 3)
        addVariations({"tamarisk1", "tamarisk2", "tamarisk3", "tamarisk4"})

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
                baseInventory = {
                    [gameObject.typeIndexMap.cacaoBranch] = 3,
                },
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
                    [gameObject.typeIndexMap.reedStem] = 2,
                    [gameObject.typeIndexMap.papyrusRhizome] = 1,
                },
                gatherableTypes = {
                    gameObject.typeIndexMap.reedStem,
                    gameObject.typeIndexMap.papyrusRhizome,
                },
                revertToSeedlingGatherResourceCounts = {
                    [gameObject.typeIndexMap.reedStem] = 1,
                    [gameObject.typeIndexMap.papyrusRhizome] = 1,
                },
            },
            markerPositions = tallPlantMarkerPositions,
            seedResourceTypeIndex = resource.types.papyrusRhizome.index,
            maturityDurationDays = 3,
            fruitImmediatelyWhenMature = true,
            interactable = true,
            useCraftSimple = true,
            isFoodCrop = true,
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
                    [gameObject.typeIndexMap.reedStem] = 2,
                    [gameObject.typeIndexMap.giantReedRhizome] = 1,
                },
                gatherableTypes = {
                    gameObject.typeIndexMap.reedStem,
                    gameObject.typeIndexMap.giantReedRhizome,
                },
                revertToSeedlingGatherResourceCounts = {
                    [gameObject.typeIndexMap.reedStem] = 1,
                    [gameObject.typeIndexMap.giantReedRhizome] = 1,
                },
            },
            markerPositions = tallPlantMarkerPositions,
            seedResourceTypeIndex = resource.types.giantReedRhizome.index,
            maturityDurationDays = 3,
            fruitImmediatelyWhenMature = true,
            interactable = true,
            useCraftSimple = true,
        })

        addFlora("tule", {
            name = locale:get("flora_tule"),
            plural = locale:get("flora_tule_plural"),
            summary = locale:get("flora_tule_summary"),
            saplingName = locale:get("flora_tuleSapling"),
            saplingPlural = locale:get("flora_tuleSapling_plural"),
            modelName = "whTule",
            saplingModelName = "whTuleSapling",
            resourceGroup = {
                baseInventory = {
                    [gameObject.typeIndexMap.reedStem] = 2,
                    [gameObject.typeIndexMap.tuleRhizome] = 1,
                },
                gatherableTypes = {
                    gameObject.typeIndexMap.reedStem,
                    gameObject.typeIndexMap.tuleRhizome,
                },
                revertToSeedlingGatherResourceCounts = {
                    [gameObject.typeIndexMap.reedStem] = 1,
                    [gameObject.typeIndexMap.tuleRhizome] = 1,
                },
            },
            markerPositions = tallPlantMarkerPositions,
            seedResourceTypeIndex = resource.types.tuleRhizome.index,
            maturityDurationDays = 3,
            fruitImmediatelyWhenMature = true,
            interactable = true,
            useCraftSimple = true,
            isFoodCrop = true,
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
                    [gameObject.typeIndexMap.grass] = 2,
                    [gameObject.typeIndexMap.cordgrassRhizome] = 1,
                },
                gatherableTypes = {
                    gameObject.typeIndexMap.grass,
                    gameObject.typeIndexMap.cordgrassRhizome,
                },
                revertToSeedlingGatherResourceCounts = {
                    [gameObject.typeIndexMap.grass] = 1,
                    [gameObject.typeIndexMap.cordgrassRhizome] = 1,
                },
            },
            markerPositions = tinyPlantMarkerPositions,
            seedResourceTypeIndex = resource.types.cordgrassRhizome.index,
            maturityDurationDays = 3,
            fruitImmediatelyWhenMature = true,
            interactable = true,
            useCraftSimple = true,
        })

        addFlora("elephantGrass", {
            name = locale:get("flora_elephantGrass"),
            plural = locale:get("flora_elephantGrass_plural"),
            summary = locale:get("flora_elephantGrass_summary"),
            saplingName = locale:get("flora_elephantGrassSapling"),
            saplingPlural = locale:get("flora_elephantGrassSapling_plural"),
            modelName = "whElephantGrass",
            saplingModelName = "whElephantGrassSapling",
            resourceGroup = {
                baseInventory = {
                    [gameObject.typeIndexMap.grass] = 2,
                    [gameObject.typeIndexMap.elephantGrassRhizome] = 1,
                },
                gatherableTypes = {
                    gameObject.typeIndexMap.grass,
                    gameObject.typeIndexMap.elephantGrassRhizome,
                },
                revertToSeedlingGatherResourceCounts = {
                    [gameObject.typeIndexMap.grass] = 1,
                    [gameObject.typeIndexMap.elephantGrassRhizome] = 1,
                },
            },
            markerPositions = tallPlantMarkerPositions,
            seedResourceTypeIndex = resource.types.elephantGrassRhizome.index,
            maturityDurationDays = 3,
            fruitImmediatelyWhenMature = true,
            interactable = true,
            useCraftSimple = true,
        })

        addFlora("featherGrass", {
            name = locale:get("flora_featherGrass"),
            plural = locale:get("flora_featherGrass_plural"),
            summary = locale:get("flora_featherGrass_summary"),
            saplingName = locale:get("flora_featherGrassSapling"),
            saplingPlural = locale:get("flora_featherGrassSapling_plural"),
            modelName = "whFeatherGrass",
            saplingModelName = "whFeatherGrassSapling",
            resourceGroup = {
                baseInventory = {
                    [gameObject.typeIndexMap.grass] = 2,
                    [gameObject.typeIndexMap.featherGrassRhizome] = 1,
                },
                gatherableTypes = {
                    gameObject.typeIndexMap.grass,
                    gameObject.typeIndexMap.featherGrassRhizome,
                },
                revertToSeedlingGatherResourceCounts = {
                    [gameObject.typeIndexMap.grass] = 1,
                    [gameObject.typeIndexMap.featherGrassRhizome] = 1,
                },
            },
            markerPositions = tinyPlantMarkerPositions,
            seedResourceTypeIndex = resource.types.featherGrassRhizome.index,
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
                    [gameObject.typeIndexMap.grass] = 2,
                    [gameObject.typeIndexMap.cottonGrassRhizome] = 1,
                },
                gatherableTypes = {
                    gameObject.typeIndexMap.grass,
                    gameObject.typeIndexMap.cottonGrassRhizome,
                },
                revertToSeedlingGatherResourceCounts = {
                    [gameObject.typeIndexMap.grass] = 1,
                    [gameObject.typeIndexMap.cottonGrassRhizome] = 1,
                },
            },
            markerPositions = tinyPlantMarkerPositions,
            seedResourceTypeIndex = resource.types.cottonGrassRhizome.index,
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
                    [gameObject.typeIndexMap.reedStem] = 2,
                    [gameObject.typeIndexMap.reedRhizome] = 1,
                },
                gatherableTypes = {
                    gameObject.typeIndexMap.reedStem,
                    gameObject.typeIndexMap.reedRhizome,
                },
                revertToSeedlingGatherResourceCounts = {
                    [gameObject.typeIndexMap.reedStem] = 1,
                    [gameObject.typeIndexMap.reedRhizome] = 1,
                },
            },
            markerPositions = tallPlantMarkerPositions,
            seedResourceTypeIndex = resource.types.reedRhizome.index,
            maturityDurationDays = 3,
            fruitImmediatelyWhenMature = true,
            interactable = true,
            useCraftSimple = true,
            isFoodCrop = true,
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
                    [gameObject.typeIndexMap.frond] = 1,
                    [gameObject.typeIndexMap.groundFernSpores] = 1,
                },
                gatherableTypes = {
                    gameObject.typeIndexMap.frond,
                    gameObject.typeIndexMap.groundFernSpores,
                },
                revertToSeedlingGatherResourceCounts = {
                    [gameObject.typeIndexMap.frond] = 1,
                    [gameObject.typeIndexMap.groundFernSpores] = 1,
                },
            },
            markerPositions = tinyPlantMarkerPositions,
            seedResourceTypeIndex = resource.types.groundFernSpores.index,
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

        addFlora("thymePlant", {
            name = locale:get("flora_thymePlant"),
            plural = locale:get("flora_thymePlant_plural"),
            summary = locale:get("flora_thymePlant_summary"),
            saplingName = locale:get("flora_thymePlantSapling"),
            saplingPlural = locale:get("flora_thymePlantSapling_plural"),
            modelName = "whThymePlant",
            saplingModelName = "whThymePlantSapling",
            resourceGroup = {
                baseInventory = {
                    [gameObject.typeIndexMap.thyme] = 2,
                },
                gatherableTypes = {
                    gameObject.typeIndexMap.thyme,
                },
                revertToSeedlingGatherResourceCounts = {
                    [gameObject.typeIndexMap.thyme] = 1,
                },
            },
            markerPositions = tinyPlantMarkerPositions,
            seedResourceTypeIndex = resource.types.thyme.index,
            maturityDurationDays = 3,
            fruitImmediatelyWhenMature = true,
            interactable = true,
            useCraftSimple = true,
        })

        addFlora("syrianRuePlant", {
            name = locale:get("flora_syrianRuePlant"),
            plural = locale:get("flora_syrianRuePlant_plural"),
            summary = locale:get("flora_syrianRuePlant_summary"),
            saplingName = locale:get("flora_syrianRuePlantSapling"),
            saplingPlural = locale:get("flora_syrianRuePlantSapling_plural"),
            modelName = "whSyrianRuePlant",
            saplingModelName = "whSyrianRuePlantSapling",
            resourceGroup = {
                baseInventory = {
                    [gameObject.typeIndexMap.syrianRue] = 2,
                },
                gatherableTypes = {
                    gameObject.typeIndexMap.syrianRue,
                },
                revertToSeedlingGatherResourceCounts = {
                    [gameObject.typeIndexMap.syrianRue] = 1,
                },
            },
            markerPositions = tinyPlantMarkerPositions,
            seedResourceTypeIndex = resource.types.syrianRue.index,
            maturityDurationDays = 3,
            fruitImmediatelyWhenMature = true,
            interactable = true,
            useCraftSimple = true,
        })

        addFlora("angelicaPlant", {
            name = locale:get("flora_angelicaPlant"),
            plural = locale:get("flora_angelicaPlant_plural"),
            summary = locale:get("flora_angelicaPlant_summary"),
            saplingName = locale:get("flora_angelicaPlantSapling"),
            saplingPlural = locale:get("flora_angelicaPlantSapling_plural"),
            modelName = "whAngelicaPlant",
            saplingModelName = "whAngelicaPlantSapling",
            resourceGroup = {
                baseInventory = {
                    [gameObject.typeIndexMap.angelicaRoot] = 2,
                },
                gatherableTypes = {
                    gameObject.typeIndexMap.angelicaRoot,
                },
                revertToSeedlingGatherResourceCounts = {
                    [gameObject.typeIndexMap.angelicaRoot] = 1,
                },
            },
            markerPositions = tallPlantMarkerPositions,
            seedResourceTypeIndex = resource.types.angelicaRoot.index,
            maturityDurationDays = 3,
            fruitImmediatelyWhenMature = true,
            interactable = true,
            useCraftSimple = true,
        })

        addFlora("agavePlant", {
            name = locale:get("flora_agavePlant"),
            plural = locale:get("flora_agavePlant_plural"),
            summary = locale:get("flora_agavePlant_summary"),
            saplingName = locale:get("flora_agavePlantSapling"),
            saplingPlural = locale:get("flora_agavePlantSapling_plural"),
            modelName = "whAgavePlant",
            saplingModelName = "whAgavePlantSapling",
            resourceGroup = {
                baseInventory = {
                    [gameObject.typeIndexMap.agaveLeaf] = 2,
                    [gameObject.typeIndexMap.agaveHeart] = 1,
                },
                gatherableTypes = {
                    gameObject.typeIndexMap.agaveLeaf,
                    gameObject.typeIndexMap.agaveHeart,
                },
                revertToSeedlingGatherResourceCounts = {
                    [gameObject.typeIndexMap.agaveLeaf] = 1,
                    [gameObject.typeIndexMap.agaveHeart] = 1,
                },
            },
            markerPositions = tallPlantMarkerPositions,
            seedResourceTypeIndex = resource.types.agaveLeaf.index,
            maturityDurationDays = 6,
            fruitImmediatelyWhenMature = true,
            interactable = true,
            useCraftSimple = true,
            isFoodCrop = true,
        })
        local agaveSelectionGroupTypeIndex = selectionGroup:addGroup("allAgaves", locale:get("flora_agavePlant"), locale:get("flora_agavePlant_plural"), nil)
        gameObject.types.agavePlant.baseSelectionGroupTypeIndex = agaveSelectionGroupTypeIndex
        selectionGroup:addObjectTypeToGroups(gameObject.types.agavePlant.index, {agaveSelectionGroupTypeIndex})
        for i = 2,4 do
            addFlora("agavePlant" .. mj:tostring(i), {
                name = locale:get("flora_agavePlant"),
                plural = locale:get("flora_agavePlant_plural"),
                summary = locale:get("flora_agavePlant_summary"),
                saplingName = locale:get("flora_agavePlantSapling"),
                saplingPlural = locale:get("flora_agavePlantSapling_plural"),
                modelName = "whAgavePlant" .. mj:tostring(i),
                saplingModelName = "whAgavePlantSapling",
                resourceGroup = flora.types.agavePlant.resourceGroup,
                markerPositions = tallPlantMarkerPositions,
                seedResourceTypeIndex = resource.types.agaveLeaf.index,
                speciesSelectionGroupTypeIndex = agaveSelectionGroupTypeIndex,
                maturityDurationDays = 6,
                fruitImmediatelyWhenMature = true,
                interactable = true,
                useCraftSimple = true,
                isFoodCrop = true,
            })
        end
        addVariations({"agavePlant", "agavePlant2", "agavePlant3", "agavePlant4"})

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

        addFlora("nettlePlant", {
            name = locale:get("flora_nettlePlant"),
            plural = locale:get("flora_nettlePlant_plural"),
            summary = locale:get("flora_nettlePlant_summary"),
            saplingName = locale:get("flora_nettlePlantSapling"),
            saplingPlural = locale:get("flora_nettlePlantSapling_plural"),
            modelName = "whNettlePlant",
            saplingModelName = "whNettlePlantSapling",
            resourceGroup = {
                baseInventory = {
                    [gameObject.typeIndexMap.nettle] = 2,
                },
                gatherableTypes = {
                    gameObject.typeIndexMap.nettle,
                },
                revertToSeedlingGatherResourceCounts = {
                    [gameObject.typeIndexMap.nettle] = 1,
                },
            },
            markerPositions = tallPlantMarkerPositions,
            seedResourceTypeIndex = resource.types.nettle.index,
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
                        [gameObject.typeIndexMap.frond] = 4,
                    },
                    fruitReplenish = {
                        [gameObject.typeIndexMap.cycadSeed] = 2,
                    },
                    gatherableTypes = {
                        gameObject.typeIndexMap.cycadSeed,
                        gameObject.typeIndexMap.frond,
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
