local locale = mjrequire "common/locale"

local mod = {
    loadOrder = 1,
}

local function getForestKey(biomeTags)
    if biomeTags.tropical then
        if biomeTags.savanna then
            return "acacia"
        elseif biomeTags.rainforest then
            return "kapok"
        end
        return nil
    end
    if biomeTags.mediterraneanForest then
        return "mediterranean"
    elseif biomeTags.subtropicalForest then
        return "subtropical"
    elseif biomeTags.oakForest then
        return "oak"
    elseif biomeTags.mixedForest then
        return "mixed"
    elseif biomeTags.tundra then
        return "forestTundra"
    elseif biomeTags.aspenParkland then
        return "aspenParkland"
    elseif biomeTags.mediterraneanSteppe then
        return "mediterraneanSteppe"
    elseif biomeTags.oakSavanna then
        return "oakSavanna"
    end
    return nil
end

function mod:onload(biome)
    local prevGetWoodDifficultyLevel = biome.getWoodDifficultyLevel
    biome.getWoodDifficultyLevel = function(biome_, biomeTags)
        if biomeTags.tropical and (biomeTags.savanna or biomeTags.rainforest) then
            if biomeTags.mediumForest then
                return biome.difficulties.easy
            elseif biomeTags.denseForest then
                return biome.difficulties.veryEasy
            elseif biomeTags.sparseForest then
                return biome.difficulties.normal
            elseif biomeTags.verySparseForest then
                return biome.difficulties.hard
            end
            return biome.difficulties.veryHard
        end
        return prevGetWoodDifficultyLevel(biome_, biomeTags)
    end

    local prevGetDescriptionFromTags = biome.getDescriptionFromTags
    biome.getDescriptionFromTags = function(biome_, biomeTags)
        if biomeTags then
            local density = nil
            if biomeTags.denseForest then
                density = "dense"
            elseif biomeTags.mediumForest then
                density = "medium"
            elseif biomeTags.sparseForest then
                density = "sparse"
            elseif biomeTags.verySparseForest then
                density = "verySparse"
            end

            local forestDescription = nil
            local forestKey = getForestKey(biomeTags)
            if (not density) and biomeTags.steppe and forestKey then
                density = "verySparse"
            end
            if density and forestKey then
                forestDescription = locale:get("biome_forest_" .. forestKey .. "_" .. density)
            elseif (not density) and biomeTags.steppe and biomeTags.hot then
                forestDescription = locale:get("biome_forest_hotSteppe")
            end

            if forestDescription then
                return locale:getBiomeMainDescription(biomeTags) .. " " .. forestDescription .. " " .. locale:getBiomeTemperatureDescription(biomeTags)
            end
        end
        return prevGetDescriptionFromTags(biome_, biomeTags)
    end
end

return mod
