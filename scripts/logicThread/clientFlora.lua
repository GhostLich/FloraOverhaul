local model = mjrequire "common/model"
local modelPlaceholder = mjrequire "common/modelPlaceholder"

local mod = {
    loadOrder = 1,
}

function mod:onload(clientFlora)
    local clientGOM = nil

    local prevInit = clientFlora.init
    clientFlora.init = function(self, clientGOM_)
        clientGOM = clientGOM_
        prevInit(self, clientGOM_)
    end

    local prevUpdateSubModels = clientFlora.updateTreeOrBushSubModels
    clientFlora.updateTreeOrBushSubModels = function(self, object)
        if object.sharedState then
            prevUpdateSubModels(self, object)
            return
        end

        clientGOM:setTransparentBuildObject(object.uniqueID, false)

        local placeholderKeys = modelPlaceholder:placeholderKeysForModelIndex(object.modelIndex)
        if placeholderKeys then
            local modelLevel = model:modelLevelForSubdivLevel(object.subdivLevel)
            for i,key in pairs(placeholderKeys) do
                local placeholderInfo = modelPlaceholder:placeholderInfoForModelAndPlaceholderKey(object.modelIndex, key)
                if placeholderInfo.defaultModelIndex then
                    local subModelTransform = clientGOM:getSubModelTransform(object, key)
                    clientGOM:setSubModelForKey(object.uniqueID,
                        key,
                        nil,
                        model:modelIndexForDetailedModelIndexAndDetailLevel(placeholderInfo.defaultModelIndex, modelLevel),
                        placeholderInfo.scale or 1.0,
                        RENDER_TYPE_STATIC,
                        subModelTransform.offsetMeters,
                        subModelTransform.rotation,
                        false,
                        nil
                        )
                end
            end
        end
    end
end

return mod
