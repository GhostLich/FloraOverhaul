local rng = mjrequire "common/randomNumberGenerator"
local terrain = mjrequire "server/serverTerrain"

local mod = {
    loadOrder = 1,
}

local forests = {
    savanna = {
        ["plant_acacia1"] = 1.0,
        ["plant_acacia2"] = 1.0,
        ["plant_acacia3"] = 1.0,
        ["plant_baobab1"] = 0.1,
        ["plant_banyan1"] = 0.05,
        ["plant_banyan2"] = 0.05,
    },
    rainforest = {
        ["plant_rubberTree1"] = 0.5,
        ["plant_rubberTree2"] = 0.5,
        ["plant_rubberTree3"] = 0.5,
        ["plant_rubberTree4"] = 0.5,
        ["plant_mahogany1"] = 0.5,
        ["plant_mahogany2"] = 0.5,
        ["plant_banyan1"] = 0.3,
        ["plant_banyan2"] = 0.3,
        ["plant_kapok1"] = 0.3,
        ["plant_kapok2"] = 0.3,
        ["plant_kapok3"] = 0.3,
    },
    mediterranean = {
        ["plant_oliveTree"] = 1.0,
        ["plant_oliveTree2"] = 1.0,
        ["plant_cypress1"] = 1.0,
        ["plant_stonePine1"] = 1.0,
        ["plant_carobTree"] = 0.5,
        ["plant_arganTree"] = 0.5,
    },
    subtropical = {
        ["plant_rubberTree1"] = 0.5,
        ["plant_rubberTree2"] = 0.5,
        ["plant_rubberTree3"] = 0.5,
        ["plant_rubberTree4"] = 0.5,
        ["plant_oak1"] = 0.5,
        ["plant_oak2"] = 0.5,
        ["plant_oak3"] = 0.5,
        ["plant_oak4"] = 0.5,
    },
    deciduous = {
        ["plant_oak1"] = 1.0,
        ["plant_oak2"] = 1.0,
        ["plant_oak3"] = 1.0,
        ["plant_oak4"] = 1.0,
        ["plant_maple1"] = 0.5,
        ["plant_maple2"] = 0.5,
        ["plant_maple3"] = 0.5,
        ["plant_maple4"] = 0.5,
        ["plant_birch1"] = 0.5,
        ["plant_birch2"] = 0.5,
        ["plant_birch3"] = 0.5,
        ["plant_birch4"] = 0.5,
        ["plant_aspen1"] = 0.5,
        ["plant_aspen2"] = 0.5,
        ["plant_aspen3"] = 0.5,
        ["plant_chestnut1"] = 0.5,
    },
    mixed = {
        ["plant_pine1"] = 1.0,
        ["plant_pine2"] = 1.0,
        ["plant_pine3"] = 1.0,
        ["plant_pine4"] = 1.0,
        ["plant_birch1"] = 1.0,
        ["plant_birch2"] = 1.0,
        ["plant_birch3"] = 1.0,
        ["plant_birch4"] = 1.0,
        ["plant_maple1"] = 0.5,
        ["plant_maple2"] = 0.5,
        ["plant_maple3"] = 0.5,
        ["plant_maple4"] = 0.5,
        ["plant_spruce1"] = 1.0,
        ["plant_larch1"] = 0.5,
    },
    coniferous = {
        ["plant_pine1"] = 1.0,
        ["plant_pine2"] = 1.0,
        ["plant_pine3"] = 1.0,
        ["plant_pine4"] = 1.0,
        ["plant_juniper1"] = 0.5,
        ["plant_juniper2"] = 0.5,
        ["plant_spruce1"] = 1.0,
        ["plant_larch1"] = 1.0,
    },
    tundra = {
        ["plant_pine1"] = 1.0,
        ["plant_pine2"] = 1.0,
        ["plant_pine3"] = 1.0,
        ["plant_pine4"] = 1.0,
        ["plant_juniper1"] = 1.0,
        ["plant_juniper2"] = 1.0,
        ["plant_dwarfBirch1"] = 1.0,
        ["plant_larch1"] = 1.0,
    },
    parkland = {
        ["plant_aspen1"] = 1.0,
        ["plant_aspen2"] = 1.0,
        ["plant_aspen3"] = 1.0,
        ["plant_birch1"] = 1.0,
        ["plant_birch2"] = 1.0,
        ["plant_birch3"] = 1.0,
        ["plant_birch4"] = 1.0,
        ["plant_juniper1"] = 0.5,
        ["plant_juniper2"] = 0.5,
    },
    oakSavanna = {
        ["plant_oak1"] = 1.0,
        ["plant_oak2"] = 1.0,
        ["plant_oak3"] = 1.0,
        ["plant_oak4"] = 1.0,
        ["plant_juniper1"] = 0.5,
        ["plant_juniper2"] = 0.5,
        ["plant_pine1"] = 0.5,
        ["plant_pine3"] = 0.5,
    },
    desert = {
        ["plant_acacia1"] = 1.0,
        ["plant_acacia2"] = 1.0,
        ["plant_acacia3"] = 1.0,
        ["plant_mesquiteTree"] = 1.0,
        ["plant_arganTree"] = 0.5,
    },
}

local gardens = {
    savanna = {"plant_bananaTree", "plant_coconutTree", "plant_datePalm1", "plant_watermelonPlant"},
    rainforest = {"plant_bananaTree", "plant_coconutTree", "plant_orangeTree", "plant_cacaoTree"},
    mediterranean = {"plant_oliveTree", "plant_figTree", "plant_grapevinePlant", "plant_orangeTree"},
    subtropical = {"plant_orangeTree", "plant_figTree", "plant_grapevinePlant", "plant_elderberryTree"},
    deciduous = {"plant_appleTree", "plant_peachTree", "plant_elderberryTree", "plant_raspberryBush", "plant_gooseberryBush", "plant_hazelBush", "plant_chestnut1"},
    mixed = {"plant_appleTree", "plant_peachTree", "plant_elderberryTree", "plant_raspberryBush", "plant_gooseberryBush", "plant_lingonberryBush", "plant_hazelBush"},
    coniferous = {"plant_appleTree", "plant_peachTree", "plant_elderberryTree", "plant_gooseberryBush", "plant_lingonberryBush"},
    tundra = {"plant_lingonberryBush", "plant_cloudberryBush", "plant_elderberryTree", "plant_raspberryBush"},
    parkland = {"plant_appleTree", "plant_lingonberryBush", "plant_raspberryBush", "plant_gooseberryBush"},
    oakSavanna = {"plant_appleTree", "plant_peachTree", "plant_elderberryTree", "plant_gooseberryBush"},
    desert = {"plant_datePalm1", "plant_figTree", "plant_watermelonPlant", "plant_orangeTree"},
}

local herbs = {
    turmeric = {"plant_turmericPlant", "turmericRoot"},
    marigold = {"plant_marigoldPlant", "marigoldFlower"},
    aloe = {"plant_aloePlant", "aloeLeaf"},
    garlic = {"plant_garlicPlant", "garlic"},
    yarrow = {"plant_yarrowPlant", "yarrowFlower"},
    plantain = {"plant_plantainPlant", "plantainLeaf"},
    gotuKola = {"plant_gotuKolaPlant", "gotuKolaLeaf"},
    lemongrass = {"plant_lemongrassPlant", "lemongrass"},
    thyme = {"plant_thymePlant", "thyme"},
}

local medicineSwaps = {
    savanna = {garlic = "lemongrass"},
    rainforest = {garlic = "lemongrass", marigold = "gotuKola"},
    mediterranean = {turmeric = "yarrow", marigold = "thyme"},
    subtropical = {turmeric = "yarrow", aloe = "plantain"},
    deciduous = {turmeric = "yarrow", aloe = "plantain"},
    mixed = {turmeric = "yarrow", aloe = "plantain"},
    coniferous = {turmeric = "yarrow", aloe = "plantain"},
    tundra = {marigold = "yarrow"},
    parkland = {turmeric = "yarrow", aloe = "plantain"},
    oakSavanna = {turmeric = "yarrow", aloe = "plantain"},
    desert = {},
}

local function getRegion(biomeTags)
    if biomeTags.tropical then
        if biomeTags.rainforest then
            return "rainforest"
        end
        return "savanna"
    end
    if biomeTags.temperate then
        if biomeTags.mediterraneanForest then
            return "mediterranean"
        elseif biomeTags.subtropicalForest then
            return "subtropical"
        elseif biomeTags.oakForest then
            return "deciduous"
        elseif biomeTags.mixedForest then
            return "mixed"
        elseif biomeTags.coniferous then
            return "coniferous"
        end
        return nil
    end
    if biomeTags.polar then
        return "tundra"
    end
    if biomeTags.hot then
        if biomeTags.desert then
            return "desert"
        end
        return "savanna"
    end
    if biomeTags.steppe or biomeTags.desert then
        if biomeTags.temperatureWinterVeryCold then
            return "parkland"
        elseif biomeTags.temperatureWinterModerate then
            return "mediterranean"
        end
        return "oakSavanna"
    end
    return nil
end

local function getSwaps(destinationState)
    local region = getRegion(terrain:getBiomeTagsForNormalizedPoint(destinationState.normalizedPos)) or getRegion(destinationState.biomeTags)
    if not region then
        return nil
    end

    local swaps = {
        forest = forests[region],
        garden = {},
        plants = {},
        objects = {},
    }

    local gardenKeys = mj:cloneTable(gardens[region])
    for i=1,3 do
        local index = rng:integerForUniqueID(destinationState.destinationID, 8231 + i, #gardenKeys) + 1
        swaps.garden[gardenKeys[index]] = 1.0
        table.remove(gardenKeys, index)
    end

    for fromHerb,toHerb in pairs(medicineSwaps[region]) do
        swaps.plants[herbs[fromHerb][1]] = herbs[toHerb][1]
        swaps.objects[herbs[fromHerb][2]] = herbs[toHerb][2]
    end

    return swaps
end

local copyNode = nil

local function copyNodes(nodes, swaps)
    local result = {}
    for i,node in ipairs(nodes) do
        result[i] = copyNode(node, swaps)
    end
    return result
end

copyNode = function(node, swaps)
    local result = {}
    for k,v in pairs(node) do
        result[k] = v
    end

    if node.subNode then
        result.subNode = copyNode(node.subNode, swaps)
    end
    if node.cellNode then
        result.cellNode = copyNode(node.cellNode, swaps)
    end
    if node.subNodes then
        result.subNodes = copyNodes(node.subNodes, swaps)
    end
    if node.nodes then
        result.nodes = copyNodes(node.nodes, swaps)
    end
    if node.completionNodes then
        result.completionNodes = copyNodes(node.completionNodes, swaps)
    end
    if node.randomChoices then
        result.randomChoices = {}
        for i,choice in ipairs(node.randomChoices) do
            result.randomChoices[i] = {
                weight = choice.weight,
                nodes = copyNodes(choice.nodes, swaps),
            }
        end
    end

    if node.type == "flora" then
        local weights = node.constructableTypeWeights
        local newWeights = nil
        if weights then
            if weights["plant_appleTree"] then
                newWeights = swaps.garden
            elseif weights["plant_pine1"] or weights["plant_birch1"] or weights["plant_aspen1"] then
                newWeights = swaps.forest
            end
        elseif swaps.plants[node.constructableType] then
            result.constructableType = swaps.plants[node.constructableType]
        end
        if newWeights then
            result.constructableTypeWeights = newWeights
            result.constructableTypeWeightSum = nil
            result.constructableTypeIndexWeightCount = nil
        end
    elseif node.type == "fillStorage" and swaps.objects[node.objectType] then
        result.objectType = swaps.objects[node.objectType]
    end

    return result
end

function mod:onload(serverDestinationBuilder)
    local prevLoadBlueprint = serverDestinationBuilder.loadBlueprint
    serverDestinationBuilder.loadBlueprint = function(serverDestinationBuilder_, destinationState, sapienIDs, blueprint, createdObjectIDsOrNil)
        local swaps = blueprint.nodes and getSwaps(destinationState)
        if swaps then
            blueprint = {
                nodes = copyNodes(blueprint.nodes, swaps),
            }
        end
        return prevLoadBlueprint(serverDestinationBuilder_, destinationState, sapienIDs, blueprint, createdObjectIDsOrNil)
    end
end

return mod
