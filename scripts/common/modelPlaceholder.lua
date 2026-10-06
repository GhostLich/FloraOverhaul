local resource = mjrequire "common/resource"

local mod = {
    loadOrder = 1,
}

function mod:onload(modelPlaceholder)
    local gameObject = nil

    local prevInit = modelPlaceholder.init
    modelPlaceholder.init = function(modelPlaceholder_, gameObject_)
        gameObject = gameObject_
        prevInit(modelPlaceholder_, gameObject_)
    end

    local prevInitRemaps = modelPlaceholder.initRemaps
    modelPlaceholder.initRemaps = function(modelPlaceholder_)
        prevInitRemaps(modelPlaceholder_)

        modelPlaceholder.burntFuelRemaps[gameObject.types.palmLeafDried.index] = modelPlaceholder:getRemaps("burntHay")
        modelPlaceholder.burntFuelRemaps[gameObject.types.reedStemDried.index] = modelPlaceholder:getRemaps("burntHay")
        modelPlaceholder.burntFuelRemaps[gameObject.types.frondDried.index] = modelPlaceholder:getRemaps("burntHay")
        for i,key in ipairs({"cypressCone", "alderCone", "baldCypressCone", "larchCone", "maritimePineCone"}) do
            modelPlaceholder.burntFuelRemaps[gameObject.types[key].index] = modelPlaceholder:getRemaps("pineConeBurnt")
        end
    end

    local prevAddModels = modelPlaceholder.addModels
    modelPlaceholder.addModels = function(modelPlaceholder_)
        prevAddModels(modelPlaceholder_)

        modelPlaceholder:addModel("whFigTree", {
            {
                multiKeyBase = "fig",
                multiCount = 6,
                defaultModelName = "whFigHangingFruit",
                resourceTypeIndex = resource.types.fig.index,
                scale = 1.0,
            },
        })

        for i,modelName in ipairs({"whOliveTree", "whOliveTree2"}) do
            modelPlaceholder:addModel(modelName, {
                {
                    multiKeyBase = "olive",
                    multiCount = 6,
                    defaultModelName = "whOliveHangingFruit",
                    resourceTypeIndex = resource.types.olive.index,
                    scale = 1.0,
                },
            })
        end

        modelPlaceholder:addModel("whFigTreeWinter", {
            {
                multiKeyBase = "fig",
                multiCount = 6,
                defaultModelName = "whFigHangingFruitWinter",
                resourceTypeIndex = resource.types.fig.index,
                scale = 1.0,
            },
        })

        for i = 1,3 do
            modelPlaceholder:addModel("whDatePalm" .. mj:tostring(i), {
                {
                    multiKeyBase = "date",
                    multiCount = 6,
                    defaultModelName = "whDateHangingFruit",
                    resourceTypeIndex = resource.types.date.index,
                    scale = 1.0,
                },
            })
        end

        modelPlaceholder:addModel("whBaobab1", {
            {
                multiKeyBase = "baobabFruit",
                multiCount = 6,
                defaultModelName = "whBaobabFruitHangingFruit",
                resourceTypeIndex = resource.types.baobabFruit.index,
                scale = 1.0,
            },
        })

        modelPlaceholder:addModel("whBaobab1Winter", {
            {
                multiKeyBase = "baobabFruit",
                multiCount = 6,
                defaultModelName = "whBaobabFruitHangingFruit",
                resourceTypeIndex = resource.types.baobabFruit.index,
                scale = 1.0,
            },
        })

        for i = 1,3 do
            modelPlaceholder:addModel("whCactus" .. mj:tostring(i), {
                {
                    multiKeyBase = "cactusFruit",
                    multiCount = 4,
                    defaultModelName = "whCactusFruitHangingFruit",
                    resourceTypeIndex = resource.types.cactusFruit.index,
                },
            })
        end

        for i,modelName in ipairs({"whJuniper1", "whJuniper1Snow", "whJuniper2", "whJuniper2Snow"}) do
            modelPlaceholder:addModel(modelName, {
                {
                    multiKeyBase = "juniperBerry",
                    multiCount = 6,
                    defaultModelName = "whJuniperBerryHangingFruit",
                    resourceTypeIndex = resource.types.juniperBerry.index,
                },
            })
        end

        modelPlaceholder:addModel("whCacaoTree", {
            {
                multiKeyBase = "cacaoPod",
                multiCount = 6,
                defaultModelName = "whCacaoPodHangingFruit",
                resourceTypeIndex = resource.types.cacaoPod.index,
            },
        })

        modelPlaceholder:addModel("whCarobTree", {
            {
                multiKeyBase = "carobPod",
                multiCount = 6,
                defaultModelName = "whCarobPodHangingFruit",
                resourceTypeIndex = resource.types.carobPod.index,
            },
        })

        modelPlaceholder:addModel("whMesquiteTree", {
            {
                multiKeyBase = "mesquitePod",
                multiCount = 6,
                defaultModelName = "whMesquitePodHangingFruit",
                resourceTypeIndex = resource.types.mesquitePod.index,
            },
        })

        modelPlaceholder:addModel("whLingonberryBush", {
            {
                multiKeyBase = "gooseberry",
                multiCount = 6,
                defaultModelName = "whLingonberryHangingFruit",
                resourceTypeIndex = resource.types.lingonberry.index,
            },
        })

        modelPlaceholder:addModel("whCloudberryBush", {
            {
                multiKeyBase = "raspberry",
                multiCount = 6,
                defaultModelName = "whCloudberryHangingFruit",
                resourceTypeIndex = resource.types.cloudberry.index,
            },
        })

        modelPlaceholder:addModel("whGrapevinePlant", {
            {
                multiKeyBase = "grape",
                multiCount = 6,
                defaultModelName = "whGrapeHangingFruit",
                resourceTypeIndex = resource.types.grape.index,
            },
        })

        modelPlaceholder:addModel("whWatermelonPlant", {
            {
                multiKeyBase = "pumpkin",
                multiCount = 1,
                defaultModelName = "whWatermelonHangingFruit",
                resourceTypeIndex = resource.types.watermelon.index,
            },
        })

        modelPlaceholder:addModel("whBarleyPlantCluster", {
            {
                multiKeyBase = "wheatPlant",
                multiCount = 10,
                defaultModelName = "whBarleyPlant",
                scale = 1.0,
                offsetToWalkableHeight = true,
            },
        })

        modelPlaceholder:addModel("whBarleyPlantSaplingCluster", {
            {
                multiKeyBase = "wheatPlant",
                multiCount = 10,
                defaultModelName = "whBarleyPlantSapling",
                scale = 1.0,
                offsetToWalkableHeight = true,
            },
            {
                key = "resource_store",
                offsetToStorageBoxWalkableHeight = true,
            },
            {
                key = "resource_1",
                offsetToStorageBoxWalkableHeight = true,
            },
            {
                key = "resource_2",
                offsetToStorageBoxWalkableHeight = true,
            },
            {
                key = "resource_3",
                offsetToStorageBoxWalkableHeight = true,
            },
            {
                key = "tool",
                offsetToStorageBoxWalkableHeight = true,
            },
        })

        modelPlaceholder:addModel("whCordgrassCluster", {
            {
                multiKeyBase = "wheatPlant",
                multiCount = 10,
                defaultModelName = "whCordgrassStalk",
                scale = 1.0,
                offsetToWalkableHeight = true,
            },
        })

        modelPlaceholder:addModel("whCordgrassSaplingCluster", {
            {
                multiKeyBase = "wheatPlant",
                multiCount = 10,
                defaultModelName = "whCordgrassStalkSapling",
                scale = 1.0,
                offsetToWalkableHeight = true,
            },
            {
                key = "resource_store",
                offsetToStorageBoxWalkableHeight = true,
            },
            {
                key = "resource_1",
                offsetToStorageBoxWalkableHeight = true,
            },
            {
                key = "resource_2",
                offsetToStorageBoxWalkableHeight = true,
            },
            {
                key = "resource_3",
                offsetToStorageBoxWalkableHeight = true,
            },
            {
                key = "tool",
                offsetToStorageBoxWalkableHeight = true,
            },
        })

        modelPlaceholder:addModel("whCottonGrassCluster", {
            {
                multiKeyBase = "wheatPlant",
                multiCount = 10,
                defaultModelName = "whCottonGrassStalk",
                scale = 1.0,
                offsetToWalkableHeight = true,
            },
        })

        modelPlaceholder:addModel("whCottonGrassSaplingCluster", {
            {
                multiKeyBase = "wheatPlant",
                multiCount = 10,
                defaultModelName = "whCottonGrassStalkSapling",
                scale = 1.0,
                offsetToWalkableHeight = true,
            },
            {
                key = "resource_store",
                offsetToStorageBoxWalkableHeight = true,
            },
            {
                key = "resource_1",
                offsetToStorageBoxWalkableHeight = true,
            },
            {
                key = "resource_2",
                offsetToStorageBoxWalkableHeight = true,
            },
            {
                key = "resource_3",
                offsetToStorageBoxWalkableHeight = true,
            },
            {
                key = "tool",
                offsetToStorageBoxWalkableHeight = true,
            },
        })
    end
end

return mod
