local mjm = mjrequire "common/mjm"
local vec2 = mjm.vec2

local mod = {
    loadOrder = 1,
}

local windStrengths = {
    whFigTree = vec2(0.98, 0.8),
    whFigTreeSpring = vec2(0.98, 0.8),
    whFigTreeAutumn = vec2(0.98, 0.8),
    whFigTreeWinter = vec2(0.998, 0.8),
    whFigTreeSapling = vec2(0.95, 0.8),
    whFigTreeSaplingSpring = vec2(0.95, 0.8),
    whFigTreeSaplingAutumn = vec2(0.95, 0.8),
    whFigTreeSaplingWinter = vec2(0.99, 0.8),
    whFigHangingFruit = vec2(0.98, 0.8),
    whFigHangingFruitWinter = vec2(0.998, 0.8),
    whDatePalm1 = vec2(0.997, 0.8),
    whDatePalm2 = vec2(0.997, 0.8),
    whDatePalm3 = vec2(0.997, 0.8),
    whDatePalmSapling = vec2(0.9, 0.8),
    whDateHangingFruit = vec2(0.997, 0.8),
    whGrapevinePlant = vec2(0.9, 0.8),
    whGrapevinePlantSapling = vec2(0.7, 0.6),
    whGrapeHangingFruit = vec2(0.9, 0.8),
    whBarleyPlant = vec2(0.9, 0.6),
    whBarleyPlantSapling = vec2(0.6, 0.6),
    whWatermelonPlant = vec2(0.7, 0.6),
    whWatermelonPlantSapling = vec2(0.7, 0.6),
    whCattail = vec2(0.9, 0.6),
    whCattailSapling = vec2(0.6, 0.6),
    whBaobab1 = vec2(1.0, 1.0),
    whBaobab1Spring = vec2(1.0, 1.0),
    whBaobab1Autumn = vec2(1.0, 1.0),
    whBaobab1Winter = vec2(1.0, 1.0),
    whBaobabSapling = vec2(0.95, 0.8),
    whBaobabFruitHangingFruit = vec2(1.0, 1.0),
    whWildPalm1 = vec2(0.997, 0.8),
    whWildPalm2 = vec2(0.997, 0.8),
    whWildPalm3 = vec2(0.995, 0.8),
    whLingonberryBush = vec2(0.9, 0.8),
    whLingonberryBushSapling = vec2(0.7, 0.6),
    whLingonberryHangingFruit = vec2(0.9, 0.8),
    whCloudberryBush = vec2(0.9, 0.8),
    whCloudberryBushSapling = vec2(0.7, 0.6),
    whCloudberryHangingFruit = vec2(0.9, 0.8),
    whMesquiteTree = vec2(0.98, 0.8),
    whMesquiteTreeSapling = vec2(0.95, 0.8),
    whMesquitePodHangingFruit = vec2(0.98, 0.8),
    whAcacia1 = vec2(0.993, 0.8),
    whAcacia2 = vec2(0.99, 0.8),
    whAcacia3 = vec2(0.993, 0.8),
    whAcaciaSapling = vec2(0.95, 0.8),
    whKapokBig1 = vec2(0.9995, 0.9),
    whKapok1 = vec2(0.999, 0.9),
    whKapok2 = vec2(0.999, 0.9),
    whKapok3 = vec2(0.999, 0.9),
    whKapokSapling = vec2(0.95, 0.8),
    whRubberTree1 = vec2(0.998, 0.8),
    whRubberTree2 = vec2(0.998, 0.8),
    whRubberTree3 = vec2(0.998, 0.8),
    whRubberTree4 = vec2(0.998, 0.8),
    whRubberTreeSapling = vec2(0.95, 0.8),
    whOak1 = vec2(0.998, 0.8),
    whOak1Spring = vec2(0.998, 0.8),
    whOak1Autumn = vec2(0.998, 0.8),
    whOak1Winter = vec2(0.999, 0.8),
    whOak2 = vec2(0.998, 0.8),
    whOak2Spring = vec2(0.998, 0.8),
    whOak2Autumn = vec2(0.998, 0.8),
    whOak2Winter = vec2(0.999, 0.8),
    whOak3 = vec2(0.998, 0.8),
    whOak3Spring = vec2(0.998, 0.8),
    whOak3Autumn = vec2(0.998, 0.8),
    whOak3Winter = vec2(0.999, 0.8),
    whOak4 = vec2(0.998, 0.8),
    whOak4Spring = vec2(0.998, 0.8),
    whOak4Autumn = vec2(0.998, 0.8),
    whOak4Winter = vec2(0.999, 0.8),
    whOakSapling = vec2(0.95, 0.8),
    whOliveTree = vec2(0.98, 0.8),
    whOliveTree2 = vec2(0.98, 0.8),
    whOliveTreeSapling = vec2(0.95, 0.8),
    whOliveHangingFruit = vec2(0.98, 0.8),
    whCypress1 = vec2(0.997, 0.8),
    whCypressSapling = vec2(0.95, 0.8),
    whBrazilNutTree = vec2(0.9995, 0.9),
    whBrazilNutTreeSapling = vec2(0.95, 0.8),
    whMahogany1 = vec2(0.999, 0.9),
    whMahogany2 = vec2(0.999, 0.9),
    whMahoganySapling = vec2(0.95, 0.8),
    whBanyan1 = vec2(0.998, 0.9),
    whBanyan2 = vec2(0.998, 0.9),
    whBanyanSapling = vec2(0.95, 0.8),
    whCycad1 = vec2(0.99, 0.8),
    whCycad2 = vec2(0.99, 0.8),
    whCycad3 = vec2(0.99, 0.8),
    whCycad4 = vec2(0.99, 0.8),
    whCycadSapling = vec2(0.9, 0.8),
    whJuniper1 = vec2(0.99, 0.8),
    whJuniper1Snow = vec2(0.99, 0.8),
    whJuniper2 = vec2(0.99, 0.8),
    whJuniper2Snow = vec2(0.99, 0.8),
    whJuniperBerryHangingFruit = vec2(0.99, 0.8),
    whJuniperSapling = vec2(0.95, 0.8),
    whMaple1 = vec2(0.998, 0.8),
    whMaple1Spring = vec2(0.998, 0.8),
    whMaple1Autumn = vec2(0.998, 0.8),
    whMaple1Winter = vec2(0.999, 0.8),
    whTreeFern1 = vec2(0.99, 0.8),
    whMaple2 = vec2(0.998, 0.8),
    whMaple2Spring = vec2(0.998, 0.8),
    whMaple2Autumn = vec2(0.998, 0.8),
    whMaple2Winter = vec2(0.999, 0.8),
    whTreeFern2 = vec2(0.99, 0.8),
    whMaple3 = vec2(0.998, 0.8),
    whMaple3Spring = vec2(0.998, 0.8),
    whMaple3Autumn = vec2(0.998, 0.8),
    whMaple3Winter = vec2(0.999, 0.8),
    whTreeFern3 = vec2(0.99, 0.8),
    whMaple4 = vec2(0.998, 0.8),
    whMaple4Spring = vec2(0.998, 0.8),
    whMaple4Autumn = vec2(0.998, 0.8),
    whMaple4Winter = vec2(0.999, 0.8),
    whTreeFern4 = vec2(0.99, 0.8),
    whAlder1 = vec2(0.998, 0.8),
    whAlder1Spring = vec2(0.998, 0.8),
    whAlder1Autumn = vec2(0.998, 0.8),
    whAlder1Winter = vec2(0.999, 0.8),
    whAlder2 = vec2(0.998, 0.8),
    whAlder2Spring = vec2(0.998, 0.8),
    whAlder2Autumn = vec2(0.998, 0.8),
    whAlder2Winter = vec2(0.999, 0.8),
    whPoplar1 = vec2(0.999, 0.8),
    whPoplar1Spring = vec2(0.999, 0.8),
    whPoplar1Autumn = vec2(0.999, 0.8),
    whPoplar1Winter = vec2(0.999, 0.8),
    whDwarfBirch1 = vec2(0.95, 0.8),
    whDwarfBirch1Spring = vec2(0.95, 0.8),
    whDwarfBirch1Autumn = vec2(0.95, 0.8),
    whDwarfBirch1Winter = vec2(0.98, 0.8),
    whDwarfBirch2 = vec2(0.95, 0.8),
    whDwarfBirch2Spring = vec2(0.95, 0.8),
    whDwarfBirch2Autumn = vec2(0.95, 0.8),
    whDwarfBirch2Winter = vec2(0.98, 0.8),
    whDwarfBirch3 = vec2(0.95, 0.8),
    whDwarfBirch3Spring = vec2(0.95, 0.8),
    whDwarfBirch3Autumn = vec2(0.95, 0.8),
    whDwarfBirch3Winter = vec2(0.98, 0.8),
    whArganTree = vec2(0.98, 0.8),
    whCarobTree = vec2(0.98, 0.8),
    whCarobPodHangingFruit = vec2(0.98, 0.8),
    whMangrove1 = vec2(0.997, 0.9),
    whMangrove2 = vec2(0.997, 0.9),
    whDoumPalm1 = vec2(0.997, 0.8),
    whDoumPalm2 = vec2(0.997, 0.8),
    whDoumPalm3 = vec2(0.997, 0.8),
    whDoumPalmSapling = vec2(0.9, 0.8),
    whMapleSapling = vec2(0.95, 0.8),
    whAlderSapling = vec2(0.95, 0.8),
    whPoplarSapling = vec2(0.95, 0.8),
    whDwarfBirchSapling = vec2(0.95, 0.8),
    whSagebrush1 = vec2(0.95, 0.8),
    whSagebrush2 = vec2(0.95, 0.8),
    whSagebrush3 = vec2(0.95, 0.8),
    whSagebrushSapling = vec2(0.95, 0.8),
    whArganTreeSapling = vec2(0.95, 0.8),
    whCarobTreeSapling = vec2(0.95, 0.8),
    whMangroveSapling = vec2(0.95, 0.8),
    whPlaneTree1 = vec2(0.998, 0.8),
    whPlaneTree1Spring = vec2(0.998, 0.8),
    whPlaneTree1Autumn = vec2(0.998, 0.8),
    whPlaneTree1Winter = vec2(0.999, 0.8),
    whPlaneTree2 = vec2(0.998, 0.8),
    whPlaneTree2Spring = vec2(0.998, 0.8),
    whPlaneTree2Autumn = vec2(0.998, 0.8),
    whPlaneTree2Winter = vec2(0.999, 0.8),
    whBaldCypress1 = vec2(0.998, 0.8),
    whBaldCypress1Spring = vec2(0.998, 0.8),
    whBaldCypress1Autumn = vec2(0.998, 0.8),
    whBaldCypress1Winter = vec2(0.999, 0.8),
    whOleander1 = vec2(0.95, 0.8),
    whOleander1Spring = vec2(0.95, 0.8),
    whOleander1Autumn = vec2(0.95, 0.8),
    whOleander1Winter = vec2(0.95, 0.8),
    whTamarisk1 = vec2(0.99, 0.8),
    whMaritimePine1 = vec2(0.997, 0.9),
    whMaritimePine1Snow = vec2(0.997, 0.9),
    whStonePine1 = vec2(0.997, 0.9),
    whStonePine1Snow = vec2(0.997, 0.9),
    whChestnut1 = vec2(0.998, 0.8),
    whChestnut1Spring = vec2(0.998, 0.8),
    whChestnut1Autumn = vec2(0.998, 0.8),
    whChestnut1Winter = vec2(0.999, 0.8),
    whHazelBush = vec2(0.95, 0.8),
    whHazelBushSpring = vec2(0.95, 0.8),
    whHazelBushAutumn = vec2(0.95, 0.8),
    whHazelBushWinter = vec2(0.95, 0.8),
    whHazelnutHangingFruit = vec2(0.95, 0.8),
    whArcticWillow = vec2(0.95, 0.8),
    whArcticWillowSpring = vec2(0.95, 0.8),
    whArcticWillowAutumn = vec2(0.95, 0.8),
    whArcticWillowWinter = vec2(0.95, 0.8),
    whSaxaul1 = vec2(0.99, 0.8),
    whElephantGrass = vec2(0.85, 0.6),
    whFeatherGrass = vec2(0.85, 0.6),
    whSeaBuckthornBush = vec2(0.95, 0.8),
    whSeaBuckthornHangingFruit = vec2(0.9, 0.8),
    whThymePlant = vec2(0.8, 0.6),
    whSyrianRuePlant = vec2(0.8, 0.6),
    whAngelicaPlant = vec2(0.8, 0.6),
    whEphedraBush = vec2(0.95, 0.8),
    whHennaBush = vec2(0.95, 0.8),
    whMyrrhBush = vec2(0.98, 0.8),
    whDragonsBloodTree = vec2(0.98, 0.8),
    whSpruce1 = vec2(0.997, 0.9),
    whSpruce1Snow = vec2(0.997, 0.9),
    whLarch1 = vec2(0.997, 0.9),
    whLarch1Spring = vec2(0.997, 0.9),
    whLarch1Autumn = vec2(0.997, 0.9),
    whLarch1Winter = vec2(0.999, 0.8),
    whCacaoTree = vec2(0.98, 0.8),
    whCacaoPodHangingFruit = vec2(0.98, 0.8),
    whPapyrus = vec2(0.9, 0.6),
    whGiantReed = vec2(0.97, 0.8),
    whCommonReed = vec2(0.9, 0.6),
    whBulrush = vec2(0.9, 0.6),
    whCordgrassStalk = vec2(0.9, 0.6),
    whCordgrassStalkSapling = vec2(0.6, 0.6),
    whCottonGrassStalk = vec2(0.9, 0.6),
    whCottonGrassStalkSapling = vec2(0.6, 0.6),
    whGroundFern = vec2(0.8, 0.6),
    whGroundFernSpring = vec2(0.8, 0.6),
    whGroundFernAutumn = vec2(0.8, 0.6),
    whGroundFernWinter = vec2(0.8, 0.6),
    whYarrowPlant = vec2(0.8, 0.6),
    whGotuKolaPlant = vec2(0.8, 0.6),
    whPlantainPlant = vec2(0.8, 0.6),
    whPeppermintPlant = vec2(0.8, 0.6),
    whLemongrassPlant = vec2(0.85, 0.6),
    whOleanderSapling = vec2(0.9, 0.8),
    whPlaneTreeSapling = vec2(0.95, 0.8),
    whBaldCypressSapling = vec2(0.95, 0.8),
    whTamariskSapling = vec2(0.95, 0.8),
    whMaritimePineSapling = vec2(0.95, 0.8),
    whStonePineSapling = vec2(0.95, 0.8),
    whSpruceSapling = vec2(0.95, 0.8),
    whChestnutSapling = vec2(0.95, 0.8),
    whHazelBushSapling = vec2(0.95, 0.8),
    whArcticWillowSapling = vec2(0.95, 0.8),
    whSaxaulSapling = vec2(0.95, 0.8),
    whSeaBuckthornBushSapling = vec2(0.9, 0.8),
    whLarchSapling = vec2(0.95, 0.8),
    whCacaoTreeSapling = vec2(0.95, 0.8),
    whEphedraBushSapling = vec2(0.9, 0.8),
    whHennaBushSapling = vec2(0.9, 0.8),
    whMyrrhBushSapling = vec2(0.95, 0.8),
    whDragonsBloodTreeSapling = vec2(0.95, 0.8),
    whTreeFernSapling = vec2(0.9, 0.8),
}

local woodKeys = {
    "fig",
    "datePalm",
    "baobab",
    "mesquite",
    "acacia",
    "kapok",
    "rubber",
    "oak",
    "olive",
    "cypress",
    "brazilNut",
    "mahogany",
    "banyan",
    "juniper",
    "maple",
    "argan",
    "alder",
    "poplar",
    "carob",
    "mangrove",
    "plane",
    "baldCypress",
    "tamarisk",
    "chestnut",
    "larch",
    "maritimePine",
    "saxaul",
    "hazel",
    "sagebrush",
    "cacao",
}

local moundBases = {
    appleTreeMound = {"whAcacia", "whArganTree", "whCacaoTree", "whFigTree", "whMahogany", "whOliveTree"},
    birchMound = {"whAlder", "whArcticWillow", "whBaldCypress", "whChestnut", "whCypress", "whDwarfBirch", "whHazelBush", "whMaple", "whOak", "whPlaneTree", "whPoplar", "whRubberTree", "whSagebrush"},
    willowMound = {"whBanyan", "whMangrove"},
    aspenMound = {"whBaobab", "whBrazilNutTree", "whKapok"},
    coconutTreeMound = {"whCycad", "whDatePalm", "whTreeFern"},
    pineMound = {"whJuniper", "whLarch", "whMaritimePine", "whSaxaul", "whSpruce", "whStonePine", "whTamarisk"},
}

local willowBases = {
    willowBranch = "%sBranch",
    willowBranchLong = "%sBranchLong",
    willowBranchHalf = "%sBranchHalf",

    woodenPole_willow = "woodenPole_%s",
    woodenPoleShort_willow = "woodenPoleShort_%s",
    woodenPoleLong_willow = "woodenPoleLong_%s",

    willowLog = "%sLog",
    willowLogShort = "%sLogShort",
    willowLog4 = "%sLog4",
    willowLog3 = "%sLog3",
    willowLogHalf = "%sLogHalf",

    willowSplitLog = "%sSplitLog",
    willowSplitLogLong = "%sSplitLogLong",
    willowSplitLog3 = "%sSplitLog3",
    willowSplitLogLongAngleCut = "%sSplitLogLongAngleCut",
    willowSplitLog075 = "%sSplitLog075",
    willowSplitLog075AngleCut = "%sSplitLog075AngleCut",
    willowSplitLog2x1Grad = "%sSplitLog2x1Grad",
    willowSplitLog2x1GradAngleCut = "%sSplitLog2x1GradAngleCut",
    willowSplitLog2x2Grad = "%sSplitLog2x2Grad",
    willowSplitLog2x2GradAngleCut = "%sSplitLog2x2GradAngleCut",
    willowSplitLog05 = "%sSplitLog05",
    willowSplitLog05AngleCut = "%sSplitLog05AngleCut",

    willowSplitLogSingleAngleCutLeft1 = "%sSplitLogSingleAngleCutLeft1",
    willowSplitLogSingleAngleCutRight1 = "%sSplitLogSingleAngleCutRight1",
    willowSplitLogSingleAngleCutLeft2 = "%sSplitLogSingleAngleCutLeft2",
    willowSplitLogSingleAngleCutRight2 = "%sSplitLogSingleAngleCutRight2",
    willowSplitLogSingleAngleCutLeft3 = "%sSplitLogSingleAngleCutLeft3",
    willowSplitLogSingleAngleCutRight3 = "%sSplitLogSingleAngleCutRight3",
    willowSplitLogSingleAngleCutLeft4 = "%sSplitLogSingleAngleCutLeft4",
    willowSplitLogSingleAngleCutRight4 = "%sSplitLogSingleAngleCutRight4",
    willowSplitLogSingleAngleCutLeft5 = "%sSplitLogSingleAngleCutLeft5",
    willowSplitLogSingleAngleCutRight5 = "%sSplitLogSingleAngleCutRight5",
    willowSplitLogSingleAngleCutLeftSmallShelf = "%sSplitLogSingleAngleCutLeftSmallShelf",

    willowSplitLogTriFloorSection1 = "%sSplitLogTriFloorSection1",
    willowSplitLogTriFloorSection2 = "%sSplitLogTriFloorSection2",
}

local storageStatusSideAndEnd = {
    allowAll = { "wood", "trunk" },
    removeAll = { "warning", "warning" },
    destroyAll = { "red", "red" },
    allowNone = { "whiteTrunk", "whiteTrunk" },
    allowTakeOnly = { "wood", "whiteTrunk" },
    allowGiveOnly = { "whiteTrunk", "trunk" },
}

local function addRemap(remapModels, base, name, remap)
    if not remapModels[base] then
        remapModels[base] = {}
    end
    remapModels[base][name] = remap
end

local function addWoodRemaps(remapModels, k)
    local bark = k .. "Bark"
    local wood = k .. "Wood"

    for base,addKeyFormat in pairs(willowBases) do
        addRemap(remapModels, base, string.format(addKeyFormat, k), {
            darkBark = bark,
            willowWood = wood,
        })
    end

    addRemap(remapModels, "balafon_birch", "balafon_" .. k, {
        whiteTrunk = bark,
        lightWood = wood,
    })
    addRemap(remapModels, "logDrum_pine", "logDrum_" .. k, {
        trunk = bark,
        wood = wood,
    })

    local v = {
        trunk = bark,
        wood = wood,
    }

    addRemap(remapModels, "splitLogFloor4x4FullLow", "splitLogFloor4x4FullLow_" .. k, v)
    addRemap(remapModels, "splitLogFloor2x2FullLow", "splitLogFloor2x2FullLow_" .. k, v)
    addRemap(remapModels, "splitLogFloor1x1FullLow", "splitLogFloor1x1FullLow_" .. k, v)
    addRemap(remapModels, "splitLogFloorTri2LowContent", k .. "SplitLogFloorTri2LowContent", v)

    addRemap(remapModels, "splitLogRoofSmallCornerLeftLowContent", k .. "SplitLogRoofSmallCornerLeftLowContent", v)
    addRemap(remapModels, "splitLogRoofSmallCornerRightLowContent", k .. "SplitLogRoofSmallCornerRightLowContent", v)
    addRemap(remapModels, "splitLogRoofLowContent", k .. "SplitLogRoofLowContent", v)
    addRemap(remapModels, "splitLogRoofEndLowContent", k .. "SplitLogRoofEndLowContent", v)
    addRemap(remapModels, "splitLogRoofSlopeLowContent", k .. "SplitLogRoofSlopeLowContent", v)
    addRemap(remapModels, "splitLogRoofTriangleLowContent", k .. "SplitLogRoofTriangleLowContent", v)

    addRemap(remapModels, "canoe", "canoe_" .. k, v)

    addRemap(remapModels, "woodenPole_pine_low", "woodenPole_" .. k .. "_low", v)
    addRemap(remapModels, "woodenPoleShort_pine_low", "woodenPoleShort_" .. k .. "_low", v)
    addRemap(remapModels, "woodenPoleLong_pine_low", "woodenPoleLong_" .. k .. "_low", v)

    addRemap(remapModels, "pineSplitLogNotchedRack", k .. "SplitLogNotchedRack", v)

    local function addStorageStatusRemaps(baseModelKey, remapModelKey)
        for status,colors in pairs(storageStatusSideAndEnd) do
            addRemap(remapModels, baseModelKey, remapModelKey .. "_" .. status, {
                trunk = bark,
                wood = wood,
                sideStatus = colors[1],
                endStatus = colors[2],
            })
        end
    end

    addStorageStatusRemaps("pineSplitLogNotchedRack", k .. "SplitLogNotchedRack")
    addStorageStatusRemaps("pineSplitLogSingleAngleCutLeftSmallShelf", k .. "SplitLogSingleAngleCutLeftSmallShelf")
    addStorageStatusRemaps("canoe_" .. k, "canoe_" .. k)
end

function mod:onload(model)
    local prevSetup = model.setup
    model.setup = function(model_)
        local windStrengthsBase = nil
        local func = prevSetup
        while func and not windStrengthsBase do
            local nextFunc = nil
            local i = 1
            while true do
                local name, value = debug.getupvalue(func, i)
                if not name then
                    break
                end
                if name == "windStrengthsBase" then
                    windStrengthsBase = value
                elseif name == "prevSetup" then
                    nextFunc = value
                end
                i = i + 1
            end
            func = nextFunc
        end

        if windStrengthsBase then
            for k,v in pairs(windStrengths) do
                windStrengthsBase[k] = v
            end
        else
            mj:warn("Endemic Flora: windStrengthsBase not found")
        end
        prevSetup(model_)
    end

    local prevLoadRemaps = model.loadRemaps
    model.loadRemaps = function(model_)
        local remapModels = model.remapModels

        for i,k in ipairs(woodKeys) do
            addWoodRemaps(remapModels, k)
        end

        remapModels.whFigTree = {
            whFigTreeSpring = {
                leafyBushA = "leafyBushASpring",
            },
            whFigTreeAutumn = {
                leafyBushA = "autumn1Leaf",
            },
        }
        remapModels.whFigTreeSapling = {
            whFigTreeSaplingSpring = {},
            whFigTreeSaplingAutumn = {},
            whFigTreeSaplingWinter = {},
        }
        remapModels.whFig = {
            whFigHangingFruit = {},
            whFigHangingFruitWinter = {},
        }
        remapModels.whGrape = {
            whGrapeHangingFruit = {},
            whDate = {
                grape = "date",
            },
            whDateHangingFruit = {
                grape = "date",
            },
            whSeaBuckthorn = {
                grape = "seaBuckthorn",
            },
            whSeaBuckthornHangingFruit = {
                grape = "seaBuckthorn",
            },
        }
        remapModels.whGrapeRotten = {
            whDateRotten = {
                grapeRotten = "dateRotten",
            },
            whSeaBuckthornRotten = {
                grapeRotten = "seaBuckthornRotten",
            },
        }
        remapModels.pumpkinPlant = {
            pumpkinPlantSpring = {},
            pumpkinPlantAutumn = {
                pumpkinLeaf = "pumpkinLeafAutumn",
            },
            pumpkinPlantWinter = {
                pumpkinLeaf = "pumpkinLeafAutumn",
            },
        }
        remapModels.pumpkinPlantSapling = {
            pumpkinPlantSaplingSpring = {},
            pumpkinPlantSaplingAutumn = {
                pumpkinLeaf = "pumpkinLeafAutumn",
            },
            pumpkinPlantSaplingWinter = {
                pumpkinLeaf = "pumpkinLeafAutumn",
            },
        }
        remapModels.whWaterMelon = {
            whWatermelonHangingFruit = {},
        }
        remapModels.whCactusFruit = {
            whCactusFruitHangingFruit = {},
        }
        remapModels.whLingonberry = {
            whLingonberryHangingFruit = {},
            whJuniperBerry = {
                lingonberry = "juniperBerry",
            },
            whJuniperBerryHangingFruit = {
                lingonberry = "juniperBerry",
            },
        }
        remapModels.whLingonberryRotten = {
            whJuniperBerryRotten = {
                lingonberryRotten = "juniperBerryRotten",
            },
        }
        remapModels.whCloudberry = {
            whCloudberryHangingFruit = {},
        }
        remapModels.whBaobab1 = {
            whBaobab1Spring = {
                baobabFoliage = "baobabFoliageSpring",
            },
            whBaobab1Autumn = {
                baobabFoliage = "baobabFoliageAutumn",
            },
        }
        remapModels.whBaobabFruit = {
            whBaobabFruitHangingFruit = {},
        }
        remapModels.whMesquitePod = {
            whMesquitePodHangingFruit = {},
            whCarobPod = {
                mesquitePod = "carobPod",
            },
            whCarobPodHangingFruit = {
                mesquitePod = "carobPod",
            },
        }
        remapModels.whMesquitePodRotten = {
            whCarobPodRotten = {
                mesquitePodRotten = "carobPodRotten",
            },
        }
        remapModels.whMesquiteTreeMound = {
            whCarobTreeMound = {},
        }
        remapModels.whOak1 = {
            whOak1Spring = {
                oakLeaf = "oakLeafSpring",
                oakLeafLow = "oakLeafSpringLow",
            },
            whOak1Autumn = {
                oakLeaf = "oakLeafAutumn",
                oakLeafLow = "oakLeafAutumnLow",
            },
        }
        remapModels.whOak2 = {
            whOak2Spring = {
                oakLeaf = "oakLeafSpring",
                oakLeafLow = "oakLeafSpringLow",
            },
            whOak2Autumn = {
                oakLeaf = "oakLeafAutumn",
                oakLeafLow = "oakLeafAutumnLow",
            },
        }
        remapModels.whOak3 = {
            whOak3Spring = {
                oakLeaf = "oakLeafSpring",
                oakLeafLow = "oakLeafSpringLow",
            },
            whOak3Autumn = {
                oakLeaf = "oakLeafAutumn",
                oakLeafLow = "oakLeafAutumnLow",
            },
        }
        remapModels.whOak4 = {
            whOak4Spring = {
                oakLeaf = "oakLeafSpring",
                oakLeafLow = "oakLeafSpringLow",
            },
            whOak4Autumn = {
                oakLeaf = "oakLeafAutumn",
                oakLeafLow = "oakLeafAutumnLow",
            },
        }
        remapModels.whOlive = {
            whOliveHangingFruit = {},
        }
        remapModels.whMaple1 = {
            whMaple1Spring = {
                mapleLeaf = "mapleLeafSpring",
                mapleLeafLow = "mapleLeafSpringLow",
            },
            whMaple1Autumn = {
                mapleLeaf = "mapleLeafAutumn",
                mapleLeafLow = "mapleLeafAutumnLow",
            },
        }
        remapModels.whMaple2 = {
            whMaple2Spring = {
                mapleLeaf = "mapleLeafSpring",
                mapleLeafLow = "mapleLeafSpringLow",
            },
            whMaple2Autumn = {
                mapleLeaf = "mapleLeafAutumn",
                mapleLeafLow = "mapleLeafAutumnLow",
            },
        }
        remapModels.whMaple3 = {
            whMaple3Spring = {
                mapleLeaf = "mapleLeafSpring",
                mapleLeafLow = "mapleLeafSpringLow",
            },
            whMaple3Autumn = {
                mapleLeaf = "mapleLeafAutumn",
                mapleLeafLow = "mapleLeafAutumnLow",
            },
        }
        remapModels.whMaple4 = {
            whMaple4Spring = {
                mapleLeaf = "mapleLeafSpring",
                mapleLeafLow = "mapleLeafSpringLow",
            },
            whMaple4Autumn = {
                mapleLeaf = "mapleLeafAutumn",
                mapleLeafLow = "mapleLeafAutumnLow",
            },
        }
        remapModels.whAlder1 = {
            whAlder1Spring = {
                alderLeaf = "alderLeafSpring",
                alderLeafLow = "alderLeafSpringLow",
            },
            whAlder1Autumn = {
                alderLeaf = "alderLeafAutumn",
                alderLeafLow = "alderLeafAutumnLow",
            },
        }
        remapModels.whPoplar1 = {
            whPoplar1Spring = {
                poplarLeaf = "poplarLeafSpring",
                poplarLeafLow = "poplarLeafSpringLow",
            },
            whPoplar1Autumn = {
                poplarLeaf = "poplarLeafAutumn",
                poplarLeafLow = "poplarLeafAutumnLow",
            },
        }
        remapModels.whAlder2 = {
            whAlder2Spring = {
                alderLeaf = "alderLeafSpring",
                alderLeafLow = "alderLeafSpringLow",
            },
            whAlder2Autumn = {
                alderLeaf = "alderLeafAutumn",
                alderLeafLow = "alderLeafAutumnLow",
            },
        }
        remapModels.whDwarfBirch1 = {
            whDwarfBirch1Spring = {
                dwarfBirchLeaf = "dwarfBirchLeafSpring",
                dwarfBirchLeafLow = "dwarfBirchLeafSpringLow",
            },
            whDwarfBirch1Autumn = {
                dwarfBirchLeaf = "dwarfBirchLeafAutumn",
                dwarfBirchLeafLow = "dwarfBirchLeafAutumnLow",
            },
        }
        remapModels.whDwarfBirch2 = {
            whDwarfBirch2Spring = {
                dwarfBirchLeaf = "dwarfBirchLeafSpring",
                dwarfBirchLeafLow = "dwarfBirchLeafSpringLow",
            },
            whDwarfBirch2Autumn = {
                dwarfBirchLeaf = "dwarfBirchLeafAutumn",
                dwarfBirchLeafLow = "dwarfBirchLeafAutumnLow",
            },
        }
        remapModels.whDwarfBirch3 = {
            whDwarfBirch3Spring = {
                dwarfBirchLeaf = "dwarfBirchLeafSpring",
                dwarfBirchLeafLow = "dwarfBirchLeafSpringLow",
            },
            whDwarfBirch3Autumn = {
                dwarfBirchLeaf = "dwarfBirchLeafAutumn",
                dwarfBirchLeafLow = "dwarfBirchLeafAutumnLow",
            },
        }
        remapModels.whPlaneTree1 = {
            whPlaneTree1Spring = {
                planeLeaf = "planeLeafSpring",
                planeLeafLow = "planeLeafLowSpring",
            },
            whPlaneTree1Autumn = {
                planeLeaf = "planeLeafAutumn",
                planeLeafLow = "planeLeafLowAutumn",
            },
        }
        remapModels.whPlaneTree2 = {
            whPlaneTree2Spring = {
                planeLeaf = "planeLeafSpring",
                planeLeafLow = "planeLeafLowSpring",
            },
            whPlaneTree2Autumn = {
                planeLeaf = "planeLeafAutumn",
                planeLeafLow = "planeLeafLowAutumn",
            },
        }
        remapModels.whChestnut1 = {
            whChestnut1Spring = {
                chestnutLeaf = "chestnutLeafSpring",
                chestnutLeafLow = "chestnutLeafSpringLow",
            },
            whChestnut1Autumn = {
                chestnutLeaf = "chestnutLeafAutumn",
                chestnutLeafLow = "chestnutLeafAutumnLow",
            },
        }
        remapModels.whHazelBush = {
            whHazelBushSpring = {
                hazelLeaf = "hazelLeafSpring",
                hazelLeafLow = "hazelLeafSpringLow",
            },
            whHazelBushAutumn = {
                hazelLeaf = "hazelLeafAutumn",
                hazelLeafLow = "hazelLeafAutumnLow",
            },
        }
        remapModels.whSagebrush2 = {
            whArcticWillow = {
                sagebrushLeaf = "arcticWillowLeaf",
                sagebrushLeafLow = "arcticWillowLeafLow",
                sagebrushBark = "arcticWillowBark",
            },
            whArcticWillowSpring = {
                sagebrushLeaf = "arcticWillowLeafSpring",
                sagebrushLeafLow = "arcticWillowLeafSpringLow",
                sagebrushBark = "arcticWillowBark",
            },
            whArcticWillowAutumn = {
                sagebrushLeaf = "arcticWillowLeafAutumn",
                sagebrushLeafLow = "arcticWillowLeafAutumnLow",
                sagebrushBark = "arcticWillowBark",
            },
        }
        remapModels.whSagebrushSapling = {
            whArcticWillowSapling = {
                sagebrushLeafSmall = "arcticWillowLeafSmall",
                sagebrushBark = "arcticWillowBark",
            },
        }
        remapModels.whLarch1 = {
            whLarch1Spring = {
                larchLeaf = "larchLeafSpring",
                larchLeafLow = "larchLeafLowSpring",
            },
            whLarch1Autumn = {
                larchLeaf = "larchLeafAutumn",
                larchLeafLow = "larchLeafLowAutumn",
            },
        }
        remapModels.whBaldCypress1 = {
            whBaldCypress1Spring = {
                baldCypressLeaf = "baldCypressLeafSpring",
            },
            whBaldCypress1Autumn = {
                baldCypressLeaf = "baldCypressLeafAutumn",
            },
        }
        remapModels.whGroundFern = {
            whGroundFernSpring = {
                groundFernLeaf = "groundFernLeafSpring",
            },
            whGroundFernAutumn = {
                groundFernLeaf = "groundFernLeafAutumn",
            },
            whGroundFernWinter = {
                groundFernLeaf = "groundFernLeafWinter",
            },
        }
        remapModels.whOleander1 = {
            whOleander1Spring = {
                oleanderLeaf = "oleanderLeafSpring",
                oleanderLeafLow = "oleanderLeafLowSpring",
            },
            whOleander1Autumn = {
                oleanderLeaf = "oleanderLeafPlain",
                oleanderLeafLow = "oleanderLeafLowPlain",
            },
            whOleander1Winter = {
                oleanderLeaf = "oleanderLeafPlain",
                oleanderLeafLow = "oleanderLeafLowPlain",
            },
        }
        remapModels.whPlantainLeaf = {
            whSagebrushLeaf = {
                plantainLeaf = "sagebrushLeafLow",
                plantainLeafLow = "sagebrushLeafLow",
            },
        }
        remapModels.whPlantainLeafRotten = {
            whSagebrushLeafRotten = {},
            whHennaLeafRotten = {},
        }
        remapModels.whThymeRotten = {
            whSyrianRueRotten = {},
        }
        remapModels.whLemongrassRotten = {
            whEphedraRotten = {},
        }
        remapModels.whTamariskSeed = {
            whSagebrushSeed = {
                tamariskSeed = "sagebrushSeed",
            },
            whSaxaulSeed = {},
            whEphedraSeed = {},
            whHennaSeed = {},
            whMyrrhSeed = {},
            whDragonsBloodSeed = {},
            whArcticWillowSeed = {
                tamariskSeed = "arcticWillowSeed",
            },
            whBanyanSeed = {
                tamariskSeed = "banyanSeed",
            },
            whMahoganySeed = {
                tamariskSeed = "mahoganySeed",
            },
            whOleanderSeed = {
                tamariskSeed = "oleanderSeed",
            },
            whRubberSeed = {
                tamariskSeed = "rubberSeed",
            },
        }
        remapModels.whTamariskSeedRotten = {
            whSagebrushSeedRotten = {
                tamariskSeedRotten = "sagebrushSeedRotten",
            },
            whSaxaulSeedRotten = {},
            whEphedraSeedRotten = {},
            whHennaSeedRotten = {},
            whMyrrhSeedRotten = {},
            whDragonsBloodSeedRotten = {},
            whArcticWillowSeedRotten = {
                tamariskSeedRotten = "arcticWillowSeedRotten",
            },
            whBanyanSeedRotten = {
                tamariskSeedRotten = "banyanSeedRotten",
            },
            whMahoganySeedRotten = {
                tamariskSeedRotten = "mahoganySeedRotten",
            },
            whOleanderSeedRotten = {
                tamariskSeedRotten = "oleanderSeedRotten",
            },
            whRubberSeedRotten = {
                tamariskSeedRotten = "rubberSeedRotten",
            },
            whMyrrhRotten = {},
            whDragonsBloodRotten = {},
        }
        remapModels.whCacaoPod = {
            whCacaoPodHangingFruit = {},
        }
        remapModels.whCattailRoot = {
            whAgaveHeart = {
                cattailRoot = "agaveHeart",
            },
        }
        remapModels.whCattailRootRotten = {
            whAgaveHeartRotten = {},
            whAngelicaRootRotten = {},
        }
        remapModels.whCattailRootCooked = {
            whAgaveHeartCooked = {},
            whRhizomeCooked = {},
        }
        remapModels.whBaldCypressCone = {
            whCypressCone = {
                baldCypressCone = "cypressCone",
            },
        }
        remapModels.whBaldCypressConeRotten = {
            whCypressConeRotten = {
                baldCypressConeRotten = "cypressConeRotten",
            },
        }
        remapModels.whSpruceSapling = {
            whJuniperSapling = {
                spruceBark = "juniperBark",
                spruceLeafSmall = "juniperLeafSmall",
            },
            whLarchSapling = {
                spruceBark = "larchBark",
                spruceLeafSmall = "larchLeafSmall",
            },
            whMaritimePineSapling = {
                spruceBark = "maritimePineBark",
                spruceLeafSmall = "maritimePineLeafSmall",
            },
            whStonePineSapling = {
                spruceBark = "stonePineBark",
                spruceLeafSmall = "stonePineLeafSmall",
            },
        }
        for base,keys in pairs(moundBases) do
            for i,key in ipairs(keys) do
                addRemap(remapModels, base, key .. "Mound", {})
            end
        end
        remapModels.whPalmSeed = {
            whDoumFruit = {
                palmSeed = "doumFruit",
            },
        }
        remapModels.whPalmSeedRotten = {
            whDoumFruitRotten = {},
        }
        remapModels.whTreeFernSpores = {
            whGroundFernSpores = {},
        }
        remapModels.whTreeFernSporesRotten = {
            whGroundFernSporesRotten = {},
        }
        remapModels.whReedRhizome = {
            whFeatherGrassRhizome = {},
            whElephantGrassRhizome = {},
            whCordgrassRhizome = {},
            whCottonGrassRhizome = {},
            whPapyrusRhizome = {},
            whGiantReedRhizome = {},
            whBulrushRhizome = {},
        }
        remapModels.whReedRhizomeRotten = {
            whFeatherGrassRhizomeRotten = {},
            whElephantGrassRhizomeRotten = {},
            whCordgrassRhizomeRotten = {},
            whCottonGrassRhizomeRotten = {},
            whPapyrusRhizomeRotten = {},
            whGiantReedRhizomeRotten = {},
            whBulrushRhizomeRotten = {},
        }
        remapModels.whAcorn = {
            whHazelnut = {
                acorn = "hazelnut",
                acorn2 = "hazelnut2",
            },
            whHazelnutHangingFruit = {
                acorn = "hazelnut",
                acorn2 = "hazelnut2",
            },
            whAcornCooked = {
                acorn = "acornCooked",
                acorn2 = "acorn2Cooked",
            },
        }
        remapModels.whAcornRotten = {
            whHazelnutRotten = {
                acornRotten = "hazelnutRotten",
                acorn2Rotten = "hazelnut2Rotten",
            },
        }
        remapModels.whPalmLeaf = {
            whFrond = {
                palm_leaf = "treeFernLeaf",
            },
        }
        remapModels.whPalmLeafDried = {
            whFrondDried = {},
        }
        addRemap(remapModels, "greenHay", "whReedStem", {
            greenHay = "reedStem",
        })
        addRemap(remapModels, "hay", "whReedStemDried", {})
        addRemap(remapModels, "aloeLeaf", "whAgaveLeaf", {
            aloeLeaf = "agaveLeafLow",
        })
        addRemap(remapModels, "flaxDried", "whKapokFibre", {
            flaxLeafDry = "kapokFibre",
            flaxFlowerDry = "kapokFibre",
        })
        addRemap(remapModels, "flaxDried", "whAgaveFibre", {
            flaxLeafDry = "agaveFibre",
            flaxFlowerDry = "agaveFibre",
        })
        addRemap(remapModels, "pineCone", "whLarchCone", {})
        addRemap(remapModels, "pineCone", "whMaritimePineCone", {})
        addRemap(remapModels, "pineConeRotten", "whLarchConeRotten", {})
        addRemap(remapModels, "pineConeRotten", "whMaritimePineConeRotten", {})

        prevLoadRemaps(model_)
    end
end

return mod
