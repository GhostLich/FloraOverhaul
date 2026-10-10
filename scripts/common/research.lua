local resource = mjrequire "common/resource"

local mod = {
    loadOrder = 1,
}

function mod:onload(research)
    local prevLoad = research.load
    research.load = function(research_, gameObject, constructable, flora)
        prevLoad(research_, gameObject, constructable, flora)

        local function addCookingResearch(resourceTypeIndex)
            if not research.researchTypesByResourceType[resourceTypeIndex] then
                research.researchTypesByResourceType[resourceTypeIndex] = {}
            end
            table.insert(research.researchTypesByResourceType[resourceTypeIndex], research.types.campfireCooking)
        end

        research.types.campfireCooking.constructableTypeIndexesByBaseResourceTypeIndex[resource.types.cattailRoot.index] = constructable.types.campfireRoastedCattailRoot.index
        table.insert(research.types.campfireCooking.resourceTypeIndexes, resource.types.cattailRoot.index)
        addCookingResearch(resource.types.cattailRoot.index)

        research.types.campfireCooking.constructableTypeIndexesByBaseResourceTypeIndex[resource.types.acorn.index] = constructable.types.campfireRoastedAcorn.index
        table.insert(research.types.campfireCooking.resourceTypeIndexes, resource.types.acorn.index)
        addCookingResearch(resource.types.acorn.index)

        research.types.campfireCooking.constructableTypeIndexesByBaseResourceTypeIndex[resource.types.agaveHeart.index] = constructable.types.campfireRoastedAgaveHeart.index
        table.insert(research.types.campfireCooking.resourceTypeIndexes, resource.types.agaveHeart.index)
        addCookingResearch(resource.types.agaveHeart.index)

        for i,key in ipairs({"reedRhizome", "papyrusRhizome", "bulrushRhizome"}) do
            research.types.campfireCooking.constructableTypeIndexesByBaseResourceTypeIndex[resource.types[key].index] = constructable.types.campfireRoastedRhizome.index
            table.insert(research.types.campfireCooking.resourceTypeIndexes, resource.types[key].index)
            addCookingResearch(resource.types[key].index)
        end

        local medicineResearch = research.types.medicine
        local function addMedicineStandIn(resourceKey, constructableKeys)
            local resourceTypeIndex = resource.types[resourceKey].index
            local constructableTypeIndexes = {}
            for i,constructableKey in ipairs(constructableKeys) do
                table.insert(constructableTypeIndexes, constructable.types[constructableKey].index)
            end
            medicineResearch.constructableTypeIndexArraysByBaseResourceTypeIndex[resourceTypeIndex] = constructableTypeIndexes
            table.insert(medicineResearch.resourceTypeIndexes, resourceTypeIndex)
            if not research.researchTypesByResourceType[resourceTypeIndex] then
                research.researchTypesByResourceType[resourceTypeIndex] = {}
            end
            table.insert(research.researchTypesByResourceType[resourceTypeIndex], medicineResearch)
        end

        addMedicineStandIn("willowBark", {"injuryMedicine"})
        addMedicineStandIn("juniperBerry", {"foodPoisoningMedicine"})
        addMedicineStandIn("mesquitePod", {"foodPoisoningMedicine", "virusMedicine"})
        addMedicineStandIn("cloudberry", {"virusMedicine"})
        addMedicineStandIn("lingonberry", {"virusMedicine"})
        addMedicineStandIn("date", {"burnMedicine"})
        addMedicineStandIn("yarrowFlower", {"injuryMedicine", "foodPoisoningMedicine"})
        addMedicineStandIn("gotuKolaLeaf", {"injuryMedicine", "burnMedicine"})
        addMedicineStandIn("plantainLeaf", {"burnMedicine", "foodPoisoningMedicine"})
        addMedicineStandIn("peppermintLeaf", {"foodPoisoningMedicine"})
        addMedicineStandIn("lemongrass", {"foodPoisoningMedicine", "virusMedicine"})
        addMedicineStandIn("sagebrushLeaf", {"burnMedicine", "foodPoisoningMedicine"})
        addMedicineStandIn("thyme", {"injuryMedicine"})
        addMedicineStandIn("seaBuckthorn", {"burnMedicine", "virusMedicine"})
        addMedicineStandIn("carobPod", {"foodPoisoningMedicine"})
        addMedicineStandIn("baobabFruit", {"virusMedicine"})
        addMedicineStandIn("agaveLeaf", {"burnMedicine"})
        addMedicineStandIn("nettle", {"burnMedicine", "virusMedicine"})
        addMedicineStandIn("cactusFruit", {"virusMedicine"})
        addMedicineStandIn("myrrh", {"injuryMedicine", "foodPoisoningMedicine"})
        addMedicineStandIn("syrianRue", {"injuryMedicine", "foodPoisoningMedicine"})
        addMedicineStandIn("dragonsBlood", {"injuryMedicine", "burnMedicine"})
        addMedicineStandIn("hennaLeaf", {"injuryMedicine", "burnMedicine"})
        addMedicineStandIn("ephedra", {"injuryMedicine", "virusMedicine"})
        addMedicineStandIn("angelicaRoot", {"foodPoisoningMedicine", "virusMedicine"})
    end
end

return mod
