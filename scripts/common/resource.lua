local typeMaps = mjrequire "common/typeMaps"
local locale = mjrequire "common/locale"

local mod = {
    loadOrder = 1,
}

function mod:onload(resource)

    local gameObjectTypeIndexMap = typeMaps.types.gameObject

    typeMaps:insert("resource", resource.types, {
        key = "fig",
        name = locale:get("fruit_fig"),
        plural = locale:get("fruit_fig_plural"),
        foodValue = 0.4,
        displayGameObjectTypeIndex = gameObjectTypeIndexMap.fig,
        tradeBatchSize = 20,
        tradeValue = 5,
    })
    typeMaps:insert("resource", resource.types, {
        key = "figRotten",
        name = locale:get("fruit_fig_rotten"),
        plural = locale:get("fruit_fig_rotten_plural"),
        compostValue = 2,
        displayGameObjectTypeIndex = gameObjectTypeIndexMap.figRotten,
        disallowsDecorationPlacing = true,
        tradeBatchSize = 20,
        tradeValue = 1,
    })

    typeMaps:insert("resource", resource.types, {
        key = "date",
        name = locale:get("fruit_date"),
        plural = locale:get("fruit_date_plural"),
        foodValue = 0.3,
        displayGameObjectTypeIndex = gameObjectTypeIndexMap.date,
        tradeBatchSize = 20,
        tradeValue = 6,
    })
    typeMaps:insert("resource", resource.types, {
        key = "dateRotten",
        name = locale:get("fruit_date_rotten"),
        plural = locale:get("fruit_date_rotten_plural"),
        compostValue = 2,
        displayGameObjectTypeIndex = gameObjectTypeIndexMap.dateRotten,
        disallowsDecorationPlacing = true,
        tradeBatchSize = 20,
        tradeValue = 1,
    })

    typeMaps:insert("resource", resource.types, {
        key = "grape",
        name = locale:get("fruit_grape"),
        plural = locale:get("fruit_grape_plural"),
        foodValue = 0.3,
        displayGameObjectTypeIndex = gameObjectTypeIndexMap.grape,
        tradeBatchSize = 20,
        tradeValue = 5,
    })
    typeMaps:insert("resource", resource.types, {
        key = "grapeRotten",
        name = locale:get("fruit_grape_rotten"),
        plural = locale:get("fruit_grape_rotten_plural"),
        compostValue = 2,
        displayGameObjectTypeIndex = gameObjectTypeIndexMap.grapeRotten,
        disallowsDecorationPlacing = true,
        tradeBatchSize = 20,
        tradeValue = 1,
    })

    typeMaps:insert("resource", resource.types, {
        key = "watermelon",
        name = locale:get("fruit_watermelon"),
        plural = locale:get("fruit_watermelon_plural"),
        foodValue = 0.5,
        displayGameObjectTypeIndex = gameObjectTypeIndexMap.watermelon,
        impactCausesMajorInjury = true,
        tradeBatchSize = 10,
        tradeValue = 6,
    })
    typeMaps:insert("resource", resource.types, {
        key = "watermelonRotten",
        name = locale:get("fruit_watermelon_rotten"),
        plural = locale:get("fruit_watermelon_rotten_plural"),
        compostValue = 4,
        displayGameObjectTypeIndex = gameObjectTypeIndexMap.watermelonRotten,
        disallowsDecorationPlacing = true,
        tradeBatchSize = 10,
        tradeValue = 1,
    })

    typeMaps:insert("resource", resource.types, {
        key = "cattailRoot",
        name = locale:get("fruit_cattailRoot"),
        plural = locale:get("fruit_cattailRoot_plural"),
        displayGameObjectTypeIndex = gameObjectTypeIndexMap.cattailRoot,
        tradeBatchSize = 20,
        tradeValue = 4,
    })
    typeMaps:insert("resource", resource.types, {
        key = "cattailRootRotten",
        name = locale:get("fruit_cattailRoot_rotten"),
        plural = locale:get("fruit_cattailRoot_rotten_plural"),
        compostValue = 2,
        displayGameObjectTypeIndex = gameObjectTypeIndexMap.cattailRootRotten,
        disallowsDecorationPlacing = true,
        tradeBatchSize = 20,
        tradeValue = 1,
    })
    typeMaps:insert("resource", resource.types, {
        key = "cattailRootCooked",
        name = locale:get("resource_cattailRootCooked"),
        plural = locale:get("resource_cattailRootCooked_plural"),
        foodValue = 0.5,
        displayGameObjectTypeIndex = gameObjectTypeIndexMap.cattailRootCooked,
        tradeBatchSize = 20,
        tradeValue = 6,
    })

    typeMaps:insert("resource", resource.types, {
        key = "palmSeed",
        name = locale:get("fruit_palmSeed"),
        plural = locale:get("fruit_palmSeed_plural"),
        displayGameObjectTypeIndex = gameObjectTypeIndexMap.palmSeed,
        tradeBatchSize = 20,
        tradeValue = 3,
    })
    typeMaps:insert("resource", resource.types, {
        key = "palmSeedRotten",
        name = locale:get("fruit_palmSeed_rotten"),
        plural = locale:get("fruit_palmSeed_rotten_plural"),
        compostValue = 1,
        displayGameObjectTypeIndex = gameObjectTypeIndexMap.palmSeedRotten,
        disallowsDecorationPlacing = true,
        tradeBatchSize = 20,
        tradeValue = 1,
    })

    typeMaps:insert("resource", resource.types, {
        key = "acaciaSeed",
        name = locale:get("fruit_acaciaSeed"),
        plural = locale:get("fruit_acaciaSeed_plural"),
        displayGameObjectTypeIndex = gameObjectTypeIndexMap.acaciaSeed,
        tradeBatchSize = 20,
        tradeValue = 3,
    })
    typeMaps:insert("resource", resource.types, {
        key = "acaciaSeedRotten",
        name = locale:get("fruit_acaciaSeed_rotten"),
        plural = locale:get("fruit_acaciaSeed_rotten_plural"),
        compostValue = 1,
        displayGameObjectTypeIndex = gameObjectTypeIndexMap.acaciaSeedRotten,
        disallowsDecorationPlacing = true,
        tradeBatchSize = 20,
        tradeValue = 1,
    })

    typeMaps:insert("resource", resource.types, {
        key = "kapokSeed",
        name = locale:get("fruit_kapokSeed"),
        plural = locale:get("fruit_kapokSeed_plural"),
        displayGameObjectTypeIndex = gameObjectTypeIndexMap.kapokSeed,
        tradeBatchSize = 20,
        tradeValue = 3,
    })
    typeMaps:insert("resource", resource.types, {
        key = "kapokSeedRotten",
        name = locale:get("fruit_kapokSeed_rotten"),
        plural = locale:get("fruit_kapokSeed_rotten_plural"),
        compostValue = 1,
        displayGameObjectTypeIndex = gameObjectTypeIndexMap.kapokSeedRotten,
        disallowsDecorationPlacing = true,
        tradeBatchSize = 20,
        tradeValue = 1,
    })

    typeMaps:insert("resource", resource.types, {
        key = "rubberSeed",
        name = locale:get("fruit_rubberSeed"),
        plural = locale:get("fruit_rubberSeed_plural"),
        displayGameObjectTypeIndex = gameObjectTypeIndexMap.rubberSeed,
        tradeBatchSize = 20,
        tradeValue = 3,
    })
    typeMaps:insert("resource", resource.types, {
        key = "rubberSeedRotten",
        name = locale:get("fruit_rubberSeed_rotten"),
        plural = locale:get("fruit_rubberSeed_rotten_plural"),
        compostValue = 1,
        displayGameObjectTypeIndex = gameObjectTypeIndexMap.rubberSeedRotten,
        disallowsDecorationPlacing = true,
        tradeBatchSize = 20,
        tradeValue = 1,
    })

    typeMaps:insert("resource", resource.types, {
        key = "acorn",
        name = locale:get("fruit_acorn"),
        plural = locale:get("fruit_acorn_plural"),
        displayGameObjectTypeIndex = gameObjectTypeIndexMap.acorn,
        tradeBatchSize = 20,
        tradeValue = 3,
    })
    typeMaps:insert("resource", resource.types, {
        key = "acornRotten",
        name = locale:get("fruit_acorn_rotten"),
        plural = locale:get("fruit_acorn_rotten_plural"),
        compostValue = 1,
        displayGameObjectTypeIndex = gameObjectTypeIndexMap.acornRotten,
        disallowsDecorationPlacing = true,
        tradeBatchSize = 20,
        tradeValue = 1,
    })

    typeMaps:insert("resource", resource.types, {
        key = "olive",
        name = locale:get("fruit_olive"),
        plural = locale:get("fruit_olive_plural"),
        foodValue = 0.3,
        displayGameObjectTypeIndex = gameObjectTypeIndexMap.olive,
        tradeBatchSize = 20,
        tradeValue = 4,
    })
    typeMaps:insert("resource", resource.types, {
        key = "oliveRotten",
        name = locale:get("fruit_olive_rotten"),
        plural = locale:get("fruit_olive_rotten_plural"),
        compostValue = 2,
        displayGameObjectTypeIndex = gameObjectTypeIndexMap.oliveRotten,
        disallowsDecorationPlacing = true,
        tradeBatchSize = 20,
        tradeValue = 1,
    })

    typeMaps:insert("resource", resource.types, {
        key = "cypressCone",
        name = locale:get("fruit_cypressCone"),
        plural = locale:get("fruit_cypressCone_plural"),
        displayGameObjectTypeIndex = gameObjectTypeIndexMap.cypressCone,
        tradeBatchSize = 20,
        tradeValue = 3,
    })
    typeMaps:insert("resource", resource.types, {
        key = "cypressConeRotten",
        name = locale:get("fruit_cypressCone_rotten"),
        plural = locale:get("fruit_cypressCone_rotten_plural"),
        compostValue = 1,
        displayGameObjectTypeIndex = gameObjectTypeIndexMap.cypressConeRotten,
        disallowsDecorationPlacing = true,
        tradeBatchSize = 20,
        tradeValue = 1,
    })

    typeMaps:insert("resource", resource.types, {
        key = "brazilNut",
        name = locale:get("fruit_brazilNut"),
        plural = locale:get("fruit_brazilNut_plural"),
        foodValue = 0.5,
        displayGameObjectTypeIndex = gameObjectTypeIndexMap.brazilNut,
        tradeBatchSize = 20,
        tradeValue = 6,
    })
    typeMaps:insert("resource", resource.types, {
        key = "brazilNutRotten",
        name = locale:get("fruit_brazilNut_rotten"),
        plural = locale:get("fruit_brazilNut_rotten_plural"),
        compostValue = 2,
        displayGameObjectTypeIndex = gameObjectTypeIndexMap.brazilNutRotten,
        disallowsDecorationPlacing = true,
        tradeBatchSize = 20,
        tradeValue = 1,
    })

    typeMaps:insert("resource", resource.types, {
        key = "mahoganySeed",
        name = locale:get("fruit_mahoganySeed"),
        plural = locale:get("fruit_mahoganySeed_plural"),
        displayGameObjectTypeIndex = gameObjectTypeIndexMap.mahoganySeed,
        tradeBatchSize = 20,
        tradeValue = 3,
    })
    typeMaps:insert("resource", resource.types, {
        key = "mahoganySeedRotten",
        name = locale:get("fruit_mahoganySeed_rotten"),
        plural = locale:get("fruit_mahoganySeed_rotten_plural"),
        compostValue = 1,
        displayGameObjectTypeIndex = gameObjectTypeIndexMap.mahoganySeedRotten,
        disallowsDecorationPlacing = true,
        tradeBatchSize = 20,
        tradeValue = 1,
    })

    typeMaps:insert("resource", resource.types, {
        key = "cycadSeed",
        name = locale:get("fruit_cycadSeed"),
        plural = locale:get("fruit_cycadSeed_plural"),
        displayGameObjectTypeIndex = gameObjectTypeIndexMap.cycadSeed,
        tradeBatchSize = 20,
        tradeValue = 3,
    })
    typeMaps:insert("resource", resource.types, {
        key = "cycadSeedRotten",
        name = locale:get("fruit_cycadSeed_rotten"),
        plural = locale:get("fruit_cycadSeed_rotten_plural"),
        compostValue = 1,
        displayGameObjectTypeIndex = gameObjectTypeIndexMap.cycadSeedRotten,
        disallowsDecorationPlacing = true,
        tradeBatchSize = 20,
        tradeValue = 1,
    })

    typeMaps:insert("resource", resource.types, {
        key = "juniperBerry",
        name = locale:get("fruit_juniperBerry"),
        plural = locale:get("fruit_juniperBerry_plural"),
        displayGameObjectTypeIndex = gameObjectTypeIndexMap.juniperBerry,
        tradeBatchSize = 20,
        tradeValue = 3,
    })
    typeMaps:insert("resource", resource.types, {
        key = "juniperBerryRotten",
        name = locale:get("fruit_juniperBerry_rotten"),
        plural = locale:get("fruit_juniperBerry_rotten_plural"),
        compostValue = 1,
        displayGameObjectTypeIndex = gameObjectTypeIndexMap.juniperBerryRotten,
        disallowsDecorationPlacing = true,
        tradeBatchSize = 20,
        tradeValue = 1,
    })

    typeMaps:insert("resource", resource.types, {
        key = "treeFernSpores",
        name = locale:get("fruit_treeFernSpores"),
        plural = locale:get("fruit_treeFernSpores_plural"),
        displayGameObjectTypeIndex = gameObjectTypeIndexMap.treeFernSpores,
        tradeBatchSize = 20,
        tradeValue = 3,
    })
    typeMaps:insert("resource", resource.types, {
        key = "treeFernSporesRotten",
        name = locale:get("fruit_treeFernSpores_rotten"),
        plural = locale:get("fruit_treeFernSpores_rotten_plural"),
        compostValue = 1,
        displayGameObjectTypeIndex = gameObjectTypeIndexMap.treeFernSporesRotten,
        disallowsDecorationPlacing = true,
        tradeBatchSize = 20,
        tradeValue = 1,
    })

    typeMaps:insert("resource", resource.types, {
        key = "mapleSeed",
        name = locale:get("fruit_mapleSeed"),
        plural = locale:get("fruit_mapleSeed_plural"),
        displayGameObjectTypeIndex = gameObjectTypeIndexMap.mapleSeed,
        tradeBatchSize = 20,
        tradeValue = 3,
    })
    typeMaps:insert("resource", resource.types, {
        key = "mapleSeedRotten",
        name = locale:get("fruit_mapleSeed_rotten"),
        plural = locale:get("fruit_mapleSeed_rotten_plural"),
        compostValue = 1,
        displayGameObjectTypeIndex = gameObjectTypeIndexMap.mapleSeedRotten,
        disallowsDecorationPlacing = true,
        tradeBatchSize = 20,
        tradeValue = 1,
    })

    typeMaps:insert("resource", resource.types, {
        key = "arganNut",
        name = locale:get("fruit_arganNut"),
        plural = locale:get("fruit_arganNut_plural"),
        foodValue = 0.2,
        displayGameObjectTypeIndex = gameObjectTypeIndexMap.arganNut,
        tradeBatchSize = 20,
        tradeValue = 4,
    })
    typeMaps:insert("resource", resource.types, {
        key = "arganNutRotten",
        name = locale:get("fruit_arganNut_rotten"),
        plural = locale:get("fruit_arganNut_rotten_plural"),
        compostValue = 2,
        displayGameObjectTypeIndex = gameObjectTypeIndexMap.arganNutRotten,
        disallowsDecorationPlacing = true,
        tradeBatchSize = 20,
        tradeValue = 1,
    })

    typeMaps:insert("resource", resource.types, {
        key = "carobPod",
        name = locale:get("fruit_carobPod"),
        plural = locale:get("fruit_carobPod_plural"),
        foodValue = 0.4,
        displayGameObjectTypeIndex = gameObjectTypeIndexMap.carobPod,
        tradeBatchSize = 20,
        tradeValue = 5,
    })
    typeMaps:insert("resource", resource.types, {
        key = "carobPodRotten",
        name = locale:get("fruit_carobPod_rotten"),
        plural = locale:get("fruit_carobPod_rotten_plural"),
        compostValue = 2,
        displayGameObjectTypeIndex = gameObjectTypeIndexMap.carobPodRotten,
        disallowsDecorationPlacing = true,
        tradeBatchSize = 20,
        tradeValue = 1,
    })

    typeMaps:insert("resource", resource.types, {
        key = "alderCone",
        name = locale:get("fruit_alderCone"),
        plural = locale:get("fruit_alderCone_plural"),
        displayGameObjectTypeIndex = gameObjectTypeIndexMap.alderCone,
        tradeBatchSize = 20,
        tradeValue = 3,
    })
    typeMaps:insert("resource", resource.types, {
        key = "alderConeRotten",
        name = locale:get("fruit_alderCone_rotten"),
        plural = locale:get("fruit_alderCone_rotten_plural"),
        compostValue = 1,
        displayGameObjectTypeIndex = gameObjectTypeIndexMap.alderConeRotten,
        disallowsDecorationPlacing = true,
        tradeBatchSize = 20,
        tradeValue = 1,
    })

    typeMaps:insert("resource", resource.types, {
        key = "stonePineCone",
        name = locale:get("fruit_stonePineCone"),
        plural = locale:get("fruit_stonePineCone_plural"),
        foodValue = 0.4,
        displayGameObjectTypeIndex = gameObjectTypeIndexMap.stonePineCone,
        tradeBatchSize = 20,
        tradeValue = 5,
    })
    typeMaps:insert("resource", resource.types, {
        key = "stonePineConeRotten",
        name = locale:get("fruit_stonePineCone_rotten"),
        plural = locale:get("fruit_stonePineCone_rotten_plural"),
        compostValue = 1,
        displayGameObjectTypeIndex = gameObjectTypeIndexMap.stonePineConeRotten,
        disallowsDecorationPlacing = true,
        tradeBatchSize = 20,
        tradeValue = 1,
    })

    typeMaps:insert("resource", resource.types, {
        key = "poplarSeed",
        name = locale:get("fruit_poplarSeed"),
        plural = locale:get("fruit_poplarSeed_plural"),
        displayGameObjectTypeIndex = gameObjectTypeIndexMap.poplarSeed,
        tradeBatchSize = 20,
        tradeValue = 3,
    })
    typeMaps:insert("resource", resource.types, {
        key = "poplarSeedRotten",
        name = locale:get("fruit_poplarSeed_rotten"),
        plural = locale:get("fruit_poplarSeed_rotten_plural"),
        compostValue = 1,
        displayGameObjectTypeIndex = gameObjectTypeIndexMap.poplarSeedRotten,
        disallowsDecorationPlacing = true,
        tradeBatchSize = 20,
        tradeValue = 1,
    })

    typeMaps:insert("resource", resource.types, {
        key = "mangroveSeed",
        name = locale:get("fruit_mangroveSeed"),
        plural = locale:get("fruit_mangroveSeed_plural"),
        displayGameObjectTypeIndex = gameObjectTypeIndexMap.mangroveSeed,
        tradeBatchSize = 20,
        tradeValue = 3,
    })
    typeMaps:insert("resource", resource.types, {
        key = "mangroveSeedRotten",
        name = locale:get("fruit_mangroveSeed_rotten"),
        plural = locale:get("fruit_mangroveSeed_rotten_plural"),
        compostValue = 1,
        displayGameObjectTypeIndex = gameObjectTypeIndexMap.mangroveSeedRotten,
        disallowsDecorationPlacing = true,
        tradeBatchSize = 20,
        tradeValue = 1,
    })

    typeMaps:insert("resource", resource.types, {
        key = "oleanderSeed",
        name = locale:get("fruit_oleanderSeed"),
        plural = locale:get("fruit_oleanderSeed_plural"),
        displayGameObjectTypeIndex = gameObjectTypeIndexMap.oleanderSeed,
        tradeBatchSize = 20,
        tradeValue = 3,
    })
    typeMaps:insert("resource", resource.types, {
        key = "oleanderSeedRotten",
        name = locale:get("fruit_oleanderSeed_rotten"),
        plural = locale:get("fruit_oleanderSeed_rotten_plural"),
        compostValue = 1,
        displayGameObjectTypeIndex = gameObjectTypeIndexMap.oleanderSeedRotten,
        disallowsDecorationPlacing = true,
        tradeBatchSize = 20,
        tradeValue = 1,
    })

    typeMaps:insert("resource", resource.types, {
        key = "planeSeed",
        name = locale:get("fruit_planeSeed"),
        plural = locale:get("fruit_planeSeed_plural"),
        displayGameObjectTypeIndex = gameObjectTypeIndexMap.planeSeed,
        tradeBatchSize = 20,
        tradeValue = 3,
    })
    typeMaps:insert("resource", resource.types, {
        key = "planeSeedRotten",
        name = locale:get("fruit_planeSeed_rotten"),
        plural = locale:get("fruit_planeSeed_rotten_plural"),
        compostValue = 1,
        displayGameObjectTypeIndex = gameObjectTypeIndexMap.planeSeedRotten,
        disallowsDecorationPlacing = true,
        tradeBatchSize = 20,
        tradeValue = 1,
    })

    typeMaps:insert("resource", resource.types, {
        key = "tamariskSeed",
        name = locale:get("fruit_tamariskSeed"),
        plural = locale:get("fruit_tamariskSeed_plural"),
        displayGameObjectTypeIndex = gameObjectTypeIndexMap.tamariskSeed,
        tradeBatchSize = 20,
        tradeValue = 3,
    })
    typeMaps:insert("resource", resource.types, {
        key = "tamariskSeedRotten",
        name = locale:get("fruit_tamariskSeed_rotten"),
        plural = locale:get("fruit_tamariskSeed_rotten_plural"),
        compostValue = 1,
        displayGameObjectTypeIndex = gameObjectTypeIndexMap.tamariskSeedRotten,
        disallowsDecorationPlacing = true,
        tradeBatchSize = 20,
        tradeValue = 1,
    })

    typeMaps:insert("resource", resource.types, {
        key = "baldCypressCone",
        name = locale:get("fruit_baldCypressCone"),
        plural = locale:get("fruit_baldCypressCone_plural"),
        displayGameObjectTypeIndex = gameObjectTypeIndexMap.baldCypressCone,
        tradeBatchSize = 20,
        tradeValue = 3,
    })
    typeMaps:insert("resource", resource.types, {
        key = "baldCypressConeRotten",
        name = locale:get("fruit_baldCypressCone_rotten"),
        plural = locale:get("fruit_baldCypressCone_rotten_plural"),
        compostValue = 1,
        displayGameObjectTypeIndex = gameObjectTypeIndexMap.baldCypressConeRotten,
        disallowsDecorationPlacing = true,
        tradeBatchSize = 20,
        tradeValue = 1,
    })

    typeMaps:insert("resource", resource.types, {
        key = "reedRhizome",
        name = locale:get("fruit_reedRhizome"),
        plural = locale:get("fruit_reedRhizome_plural"),
        displayGameObjectTypeIndex = gameObjectTypeIndexMap.reedRhizome,
        tradeBatchSize = 20,
        tradeValue = 3,
    })
    typeMaps:insert("resource", resource.types, {
        key = "reedRhizomeRotten",
        name = locale:get("fruit_reedRhizome_rotten"),
        plural = locale:get("fruit_reedRhizome_rotten_plural"),
        compostValue = 1,
        displayGameObjectTypeIndex = gameObjectTypeIndexMap.reedRhizomeRotten,
        disallowsDecorationPlacing = true,
        tradeBatchSize = 20,
        tradeValue = 1,
    })

    typeMaps:insert("resource", resource.types, {
        key = "cacaoPod",
        name = locale:get("fruit_cacaoPod"),
        plural = locale:get("fruit_cacaoPod_plural"),
        foodValue = 0.3,
        displayGameObjectTypeIndex = gameObjectTypeIndexMap.cacaoPod,
        tradeBatchSize = 20,
        tradeValue = 5,
    })
    typeMaps:insert("resource", resource.types, {
        key = "cacaoPodRotten",
        name = locale:get("fruit_cacaoPod_rotten"),
        plural = locale:get("fruit_cacaoPod_rotten_plural"),
        compostValue = 2,
        displayGameObjectTypeIndex = gameObjectTypeIndexMap.cacaoPodRotten,
        disallowsDecorationPlacing = true,
        tradeBatchSize = 20,
        tradeValue = 1,
    })

    typeMaps:insert("resource", resource.types, {
        key = "yarrowFlower",
        name = locale:get("fruit_yarrowFlower"),
        plural = locale:get("fruit_yarrowFlower_plural"),
        displayGameObjectTypeIndex = gameObjectTypeIndexMap.yarrowFlower,
        tradeBatchSize = 20,
        tradeValue = 5,
    })
    typeMaps:insert("resource", resource.types, {
        key = "yarrowFlowerRotten",
        name = locale:get("fruit_yarrowFlower_rotten"),
        plural = locale:get("fruit_yarrowFlower_rotten_plural"),
        compostValue = 1,
        displayGameObjectTypeIndex = gameObjectTypeIndexMap.yarrowFlowerRotten,
        disallowsDecorationPlacing = true,
        tradeBatchSize = 20,
        tradeValue = 1,
    })

    typeMaps:insert("resource", resource.types, {
        key = "gotuKolaLeaf",
        name = locale:get("fruit_gotuKolaLeaf"),
        plural = locale:get("fruit_gotuKolaLeaf_plural"),
        displayGameObjectTypeIndex = gameObjectTypeIndexMap.gotuKolaLeaf,
        tradeBatchSize = 20,
        tradeValue = 5,
    })
    typeMaps:insert("resource", resource.types, {
        key = "gotuKolaLeafRotten",
        name = locale:get("fruit_gotuKolaLeaf_rotten"),
        plural = locale:get("fruit_gotuKolaLeaf_rotten_plural"),
        compostValue = 1,
        displayGameObjectTypeIndex = gameObjectTypeIndexMap.gotuKolaLeafRotten,
        disallowsDecorationPlacing = true,
        tradeBatchSize = 20,
        tradeValue = 1,
    })

    typeMaps:insert("resource", resource.types, {
        key = "plantainLeaf",
        name = locale:get("fruit_plantainLeaf"),
        plural = locale:get("fruit_plantainLeaf_plural"),
        displayGameObjectTypeIndex = gameObjectTypeIndexMap.plantainLeaf,
        tradeBatchSize = 20,
        tradeValue = 5,
    })
    typeMaps:insert("resource", resource.types, {
        key = "plantainLeafRotten",
        name = locale:get("fruit_plantainLeaf_rotten"),
        plural = locale:get("fruit_plantainLeaf_rotten_plural"),
        compostValue = 1,
        displayGameObjectTypeIndex = gameObjectTypeIndexMap.plantainLeafRotten,
        disallowsDecorationPlacing = true,
        tradeBatchSize = 20,
        tradeValue = 1,
    })

    typeMaps:insert("resource", resource.types, {
        key = "peppermintLeaf",
        name = locale:get("fruit_peppermintLeaf"),
        plural = locale:get("fruit_peppermintLeaf_plural"),
        displayGameObjectTypeIndex = gameObjectTypeIndexMap.peppermintLeaf,
        tradeBatchSize = 20,
        tradeValue = 5,
    })
    typeMaps:insert("resource", resource.types, {
        key = "peppermintLeafRotten",
        name = locale:get("fruit_peppermintLeaf_rotten"),
        plural = locale:get("fruit_peppermintLeaf_rotten_plural"),
        compostValue = 1,
        displayGameObjectTypeIndex = gameObjectTypeIndexMap.peppermintLeafRotten,
        disallowsDecorationPlacing = true,
        tradeBatchSize = 20,
        tradeValue = 1,
    })

    typeMaps:insert("resource", resource.types, {
        key = "lemongrass",
        name = locale:get("fruit_lemongrass"),
        plural = locale:get("fruit_lemongrass_plural"),
        displayGameObjectTypeIndex = gameObjectTypeIndexMap.lemongrass,
        tradeBatchSize = 20,
        tradeValue = 5,
    })
    typeMaps:insert("resource", resource.types, {
        key = "lemongrassRotten",
        name = locale:get("fruit_lemongrass_rotten"),
        plural = locale:get("fruit_lemongrass_rotten_plural"),
        compostValue = 1,
        displayGameObjectTypeIndex = gameObjectTypeIndexMap.lemongrassRotten,
        disallowsDecorationPlacing = true,
        tradeBatchSize = 20,
        tradeValue = 1,
    })

    typeMaps:insert("resource", resource.types, {
        key = "willowBark",
        name = locale:get("resource_willowBark"),
        plural = locale:get("resource_willowBark_plural"),
        displayGameObjectTypeIndex = gameObjectTypeIndexMap.willowBark,
        tradeBatchSize = 20,
        tradeValue = 3,
    })

    typeMaps:insert("resource", resource.types, {
        key = "lingonberry",
        name = locale:get("fruit_lingonberry"),
        plural = locale:get("fruit_lingonberry_plural"),
        foodValue = 0.3,
        displayGameObjectTypeIndex = gameObjectTypeIndexMap.lingonberry,
        tradeBatchSize = 20,
        tradeValue = 5,
    })
    typeMaps:insert("resource", resource.types, {
        key = "lingonberryRotten",
        name = locale:get("fruit_lingonberry_rotten"),
        plural = locale:get("fruit_lingonberry_rotten_plural"),
        compostValue = 2,
        displayGameObjectTypeIndex = gameObjectTypeIndexMap.lingonberryRotten,
        disallowsDecorationPlacing = true,
        tradeBatchSize = 20,
        tradeValue = 1,
    })

    typeMaps:insert("resource", resource.types, {
        key = "cloudberry",
        name = locale:get("fruit_cloudberry"),
        plural = locale:get("fruit_cloudberry_plural"),
        foodValue = 0.3,
        displayGameObjectTypeIndex = gameObjectTypeIndexMap.cloudberry,
        tradeBatchSize = 20,
        tradeValue = 5,
    })
    typeMaps:insert("resource", resource.types, {
        key = "cloudberryRotten",
        name = locale:get("fruit_cloudberry_rotten"),
        plural = locale:get("fruit_cloudberry_rotten_plural"),
        compostValue = 2,
        displayGameObjectTypeIndex = gameObjectTypeIndexMap.cloudberryRotten,
        disallowsDecorationPlacing = true,
        tradeBatchSize = 20,
        tradeValue = 1,
    })

    typeMaps:insert("resource", resource.types, {
        key = "baobabFruit",
        name = locale:get("fruit_baobabFruit"),
        plural = locale:get("fruit_baobabFruit_plural"),
        foodValue = 0.5,
        displayGameObjectTypeIndex = gameObjectTypeIndexMap.baobabFruit,
        impactCausesInjury = true,
        tradeBatchSize = 20,
        tradeValue = 6,
    })
    typeMaps:insert("resource", resource.types, {
        key = "baobabFruitRotten",
        name = locale:get("fruit_baobabFruit_rotten"),
        plural = locale:get("fruit_baobabFruit_rotten_plural"),
        compostValue = 2,
        displayGameObjectTypeIndex = gameObjectTypeIndexMap.baobabFruitRotten,
        disallowsDecorationPlacing = true,
        tradeBatchSize = 20,
        tradeValue = 1,
    })

    typeMaps:insert("resource", resource.types, {
        key = "cactusFruit",
        name = locale:get("fruit_cactusFruit"),
        plural = locale:get("fruit_cactusFruit_plural"),
        foodValue = 0.4,
        displayGameObjectTypeIndex = gameObjectTypeIndexMap.cactusFruit,
        tradeBatchSize = 20,
        tradeValue = 5,
    })
    typeMaps:insert("resource", resource.types, {
        key = "cactusFruitRotten",
        name = locale:get("fruit_cactusFruit_rotten"),
        plural = locale:get("fruit_cactusFruit_rotten_plural"),
        compostValue = 2,
        displayGameObjectTypeIndex = gameObjectTypeIndexMap.cactusFruitRotten,
        disallowsDecorationPlacing = true,
        tradeBatchSize = 20,
        tradeValue = 1,
    })

    typeMaps:insert("resource", resource.types, {
        key = "mesquitePod",
        name = locale:get("fruit_mesquitePod"),
        plural = locale:get("fruit_mesquitePod_plural"),
        foodValue = 0.3,
        displayGameObjectTypeIndex = gameObjectTypeIndexMap.mesquitePod,
        tradeBatchSize = 20,
        tradeValue = 4,
    })
    typeMaps:insert("resource", resource.types, {
        key = "mesquitePodRotten",
        name = locale:get("fruit_mesquitePod_rotten"),
        plural = locale:get("fruit_mesquitePod_rotten_plural"),
        compostValue = 2,
        displayGameObjectTypeIndex = gameObjectTypeIndexMap.mesquitePodRotten,
        disallowsDecorationPlacing = true,
        tradeBatchSize = 20,
        tradeValue = 1,
    })

    local function addMedicineGroup(key, resourceKeys)
        local resourceTypes = {}
        for i,resourceKey in ipairs(resourceKeys) do
            table.insert(resourceTypes, resource.types[resourceKey].index)
        end
        typeMaps:insert("resourceGroup", resource.groups, {
            key = key,
            name = locale:get("resource_group_" .. key),
            plural = locale:get("resource_group_" .. key .. "_plural"),
            resourceTypes = resourceTypes,
            displayGameObjectTypeIndex = resource.types[resourceKeys[1]].displayGameObjectTypeIndex,
        })
    end

    addMedicineGroup("medicinePoppy", {"poppyFlower", "willowBark"})
    addMedicineGroup("medicineGinger", {"gingerRoot", "juniperBerry", "mesquitePod", "peppermintLeaf"})
    addMedicineGroup("medicineEchinacea", {"echinaceaFlower", "cloudberry", "lingonberry", "mesquitePod", "lemongrass"})
    addMedicineGroup("medicineElderberry", {"elderberry", "date"})
    addMedicineGroup("medicineMarigold", {"marigoldFlower", "yarrowFlower", "gotuKolaLeaf"})
    addMedicineGroup("medicineTurmeric", {"turmericRoot", "yarrowFlower", "plantainLeaf"})
    addMedicineGroup("medicineAloe", {"aloeLeaf", "plantainLeaf"})
    addMedicineGroup("medicineGarlic", {"garlic", "lemongrass"})

end

return mod
