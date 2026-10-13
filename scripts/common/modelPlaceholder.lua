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

        for i,modelName in ipairs({"appleTreeWinter", "elderberryTreeWinter", "peachTreeWinter"}) do
            modelPlaceholder:addModel(modelName, {})
        end

        modelPlaceholder:addModel("whFigTree", {
            {
                multiKeyBase = "fig",
                multiCount = 6,
                defaultModelName = "whFigHangingFruit",
                resourceTypeIndex = resource.types.fig.index,
                scale = 1.0,
            },
        })

        for i = 2,4 do
            modelPlaceholder:addModel("whAppleTree" .. mj:tostring(i), {
                {
                    multiKeyBase = "apple",
                    multiCount = 6,
                    defaultModelName = "appleHangingFruit",
                    resourceTypeIndex = resource.types.apple.index,
                    scale = 1.0,
                },
            })
        end

        for i = 2,4 do
            modelPlaceholder:addModel("whOrangeTree" .. mj:tostring(i), {
                {
                    multiKeyBase = "orange",
                    multiCount = (i == 3 and 5 or 10),
                    defaultModelName = "orangeHangingFruit",
                    resourceTypeIndex = resource.types.orange.index,
                    scale = 1.0,
                },
            })
        end

        for i = 2,4 do
            modelPlaceholder:addModel("whElderberryTree" .. mj:tostring(i), {
                {
                    multiKeyBase = "elderberry",
                    multiCount = 6,
                    defaultModelName = "elderberryHangingFruit",
                    resourceTypeIndex = resource.types.elderberry.index,
                    scale = 1.0,
                },
            })
        end

        for i = 2,4 do
            modelPlaceholder:addModel("whPeachTree" .. mj:tostring(i), {
                {
                    multiKeyBase = "peach",
                    multiCount = (i == 3 and 4 or 7),
                    defaultModelName = "peachHangingFruit",
                    resourceTypeIndex = resource.types.peach.index,
                    scale = 1.0,
                },
            })
        end

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

        for i,modelName in ipairs({"whCardon", "whCardon2", "whCardon3"}) do
            modelPlaceholder:addModel(modelName, {
                {
                    multiKeyBase = "cactusFruit",
                    multiCount = 4,
                    defaultModelName = "whCardonFruitHangingFruit",
                    resourceTypeIndex = resource.types.cactusFruit.index,
                },
            })
        end

        modelPlaceholder:addModel("whPricklyPear", {
            {
                multiKeyBase = "cactusFruit",
                multiCount = 4,
                defaultModelName = "whPricklyPearFruitHangingFruit",
                resourceTypeIndex = resource.types.cactusFruit.index,
            },
        })

        modelPlaceholder:addModel("whBarrelCactus", {
            {
                multiKeyBase = "cactusFruit",
                multiCount = 2,
                defaultModelName = "whBarrelCactusFruitHangingFruit",
                resourceTypeIndex = resource.types.cactusFruit.index,
            },
        })

        for i,modelName in ipairs({"whCholla", "whCholla2", "whCholla3"}) do
            modelPlaceholder:addModel(modelName, {
                {
                    multiKeyBase = "chollaBud",
                    multiCount = 4,
                    defaultModelName = "whChollaBudHangingFruit",
                    resourceTypeIndex = resource.types.chollaBud.index,
                },
            })
        end

        for i,modelName in ipairs({"whJuniper1", "whJuniper1Snow", "whJuniper2", "whJuniper2Snow", "whJuniper3", "whJuniper3Snow", "whJuniper4", "whJuniper4Snow"}) do
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

        for i,modelName in ipairs({"whMesquiteTree", "whMesquiteTree2", "whMesquiteTree3", "whMesquiteTree4"}) do
            modelPlaceholder:addModel(modelName, {
                {
                    multiKeyBase = "mesquitePod",
                    multiCount = 6,
                    defaultModelName = "whMesquitePodHangingFruit",
                    resourceTypeIndex = resource.types.mesquitePod.index,
                },
            })
        end

        for i,modelName in ipairs({"whHazelBush", "whHazelBush2", "whHazelBush3", "whHazelBush4"}) do
            modelPlaceholder:addModel(modelName, {
                {
                    multiKeyBase = "hazelnut",
                    multiCount = 6,
                    defaultModelName = "whHazelnutHangingFruit",
                    resourceTypeIndex = resource.types.hazelnut.index,
                },
            })
        end

        modelPlaceholder:addModel("whLingonberryBush", {
            {
                multiKeyBase = "lingonberry",
                multiCount = 6,
                defaultModelName = "whLingonberryHangingFruit",
                resourceTypeIndex = resource.types.lingonberry.index,
            },
        })

        for i = 1,4 do
            modelPlaceholder:addModel("whBlueberry" .. mj:tostring(i), {
                {
                    multiKeyBase = "blueberry",
                    multiCount = 6,
                    defaultModelName = "whBlueberryHangingFruit",
                    resourceTypeIndex = resource.types.blueberry.index,
                },
            })
        end

        modelPlaceholder:addModel("whCloudberryBush", {
            {
                multiKeyBase = "cloudberry",
                multiCount = 6,
                defaultModelName = "whCloudberryHangingFruit",
                resourceTypeIndex = resource.types.cloudberry.index,
            },
        })

        for i,modelName in ipairs({"whSeaBuckthornBush", "whSeaBuckthornBush2", "whSeaBuckthornBush3", "whSeaBuckthornBush4"}) do
            modelPlaceholder:addModel(modelName, {
                {
                    multiKeyBase = "seaBuckthorn",
                    multiCount = 6,
                    defaultModelName = "whSeaBuckthornHangingFruit",
                    resourceTypeIndex = resource.types.seaBuckthorn.index,
                },
            })
        end

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
                multiKeyBase = "watermelon",
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
                key = "wheatPlant_1",
                defaultModelName = "whCottonGrassStalk",
                scale = 1.0,
                offsetToWalkableHeight = true,
            },
            {
                key = "wheatPlant_3",
                defaultModelName = "whCottonGrassStalk",
                scale = 1.0,
                offsetToWalkableHeight = true,
            },
            {
                key = "wheatPlant_8",
                defaultModelName = "whCottonGrassStalk",
                scale = 1.0,
                offsetToWalkableHeight = true,
            },
            {
                key = "wheatPlant_10",
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
