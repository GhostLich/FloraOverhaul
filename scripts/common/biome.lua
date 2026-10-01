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
    if biomeTags.temperate then
        if biomeTags.drySummer then
            if not biomeTags.coniferous then
                return "mediterranean"
            end
        elseif biomeTags.temperatureWinterModerate and (biomeTags.temperatureSummerHot or biomeTags.temperatureSummerVeryHot) then
            return "subtropical"
        elseif biomeTags.birch and not biomeTags.coniferous then
            return "oak"
        elseif biomeTags.birch and biomeTags.coniferous then
            return "mixed"
        end
        return nil
    end
    if biomeTags.tundra then
        return "forestTundra"
    end
    if biomeTags.steppe and not biomeTags.hot and not biomeTags.polar then
        if biomeTags.temperatureWinterVeryCold then
            return "aspenParkland"
        elseif biomeTags.temperatureWinterModerate then
            return "mediterraneanSteppe"
        end
        return "oakSavanna"
    end
    return nil
end

function mod:onload(biome)
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
