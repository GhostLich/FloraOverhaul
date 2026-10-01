local mjm = mjrequire "common/mjm"
local vec2 = mjm.vec2
local vec4 = mjm.vec4

local mod = {
    loadOrder = 1,
}

function mod:onload(edgeDecal)
    mj:insertIndexed(edgeDecal.groupTypes, {
        key = "juniper",
        textureLocations = {
            edgeDecal.textureLocations.pineA,
        },
        size = vec2(0.17, 0.18),
    })

    mj:insertIndexed(edgeDecal.groupTypes, {
        key = "oak",
        textureLocations = {
            edgeDecal.textureLocations.leavesNewA,
        },
        size = vec2(0.49, 0.25),
    })

    mj:insertIndexed(edgeDecal.groupTypes, {
        key = "banyanRoots",
        textureLocations = {
            vec4(0.5, 0.59375, 0.5625, 0.625),
        },
        size = vec2(0.4, 0.0),
    })
end

return mod
