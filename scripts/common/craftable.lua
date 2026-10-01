local mjm = mjrequire "common/mjm"
local vec3 = mjm.vec3
local vec3xMat3 = mjm.vec3xMat3
local mat3Identity = mjm.mat3Identity
local mat3Rotate = mjm.mat3Rotate

local constructable = mjrequire "common/constructable"
local locale = mjrequire "common/locale"
local resource = mjrequire "common/resource"
local actionSequence = mjrequire "common/actionSequence"
local skill = mjrequire "common/skill"
local craftAreaGroup = mjrequire "common/craftAreaGroup"

local mod = {
    loadOrder = 1,
}

function mod:onload(craftable)
    local prevLoad = craftable.load
    craftable.load = function(craftable_, gameObject, flora)
        prevLoad(craftable_, gameObject, flora)

        local medicineGroupsByResourceType = {
            [resource.types.poppyFlower.index] = resource.groups.medicinePoppy.index,
            [resource.types.gingerRoot.index] = resource.groups.medicineGinger.index,
            [resource.types.echinaceaFlower.index] = resource.groups.medicineEchinacea.index,
            [resource.types.elderberry.index] = resource.groups.medicineElderberry.index,
            [resource.types.marigoldFlower.index] = resource.groups.medicineMarigold.index,
            [resource.types.turmericRoot.index] = resource.groups.medicineTurmeric.index,
            [resource.types.aloeLeaf.index] = resource.groups.medicineAloe.index,
            [resource.types.garlic.index] = resource.groups.medicineGarlic.index,
        }
        for i,key in ipairs({"injuryMedicine", "burnMedicine", "foodPoisoningMedicine", "virusMedicine"}) do
            for j,requiredResource in ipairs(constructable.types[key].requiredResources) do
                local groupTypeIndex = requiredResource.type and medicineGroupsByResourceType[requiredResource.type]
                if groupTypeIndex then
                    requiredResource.type = nil
                    requiredResource.group = groupTypeIndex
                end
            end
        end

        constructable.types.mudBrickWet.outputObjectInfo.outputArraysByResourceObjectType[gameObject.types.palmLeafDried.index] = {
            gameObject.typeIndexMap.mudBrickWet_hay,
            gameObject.typeIndexMap.mudBrickWet_hay,
        }

        craftable:addCraftable("campfireRoastedCattailRoot", {
            name = locale:get("craftable_campfireRoastedCattailRoot"),
            plural = locale:get("craftable_campfireRoastedCattailRoot_plural"),
            summary = locale:get("craftable_campfireRoastedCattailRoot_summary"),
            iconGameObjectType = gameObject.typeIndexMap.cattailRootCooked,
            classification = constructable.classifications.craft.index,
            isFoodPreperation = true,

            outputObjectInfo = {
                objectTypesArray = {
                    gameObject.typeIndexMap.cattailRootCooked,
                }
            },

            buildSequence = craftable:createStandardBuildSequence(actionSequence.types.fireStickCook.index, nil),
            inProgressBuildModel = "craftSimple",

            skills = {
                required = skill.types.campfireCooking.index,
            },

            requiredResources = {
                {
                    type = resource.types.cattailRoot.index,
                    count = 1,
                },
            },

            requiredCraftAreaGroups = {
                craftAreaGroup.types.campfire.index,
            },

            attachResourceToHandIndex = 1,
            attachResourceOffset = vec3xMat3(vec3(-0.7,0.1,0.02), craftable.cookingStickRotationOffset),
            attachResourceRotation = mat3Rotate(mat3Identity, math.pi * 0.5, vec3(0.0,0.0,1.0)),

            temporaryToolObjectType = gameObject.typeIndexMap.stick,
            temporaryToolOffset = vec3xMat3(vec3(-0.35,0.0,0.0), craftable.cookingStickRotationOffset),
            temporaryToolRotation = craftable.cookingStickRotation,
        })
    end
end

return mod
