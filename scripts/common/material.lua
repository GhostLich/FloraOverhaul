local mjm = mjrequire "common/mjm"
local vec3 = mjm.vec3

local edgeDecal = mjrequire "common/edgeDecal"

local mod = {
    loadOrder = 1,
}

function mod:onload(material)
    local mat = material.mat

    local function matWithB(key, color, roughness, colorB, roughnessB)
        local m = mat(key, color, roughness)
        m.colorB = colorB
        m.roughnessB = roughnessB
        m.metalB = 0.0
        return m
    end

    local function bushMat(key, color, roughness)
        return matWithB(key, color, roughness, color * 1.05, roughness * 0.95)
    end

    mj:insertIndexed(material.types, mat("fig", vec3(0.22, 0.1, 0.18), 0.4))
    mj:insertIndexed(material.types, matWithB("figTrunk", vec3(0.2, 0.18, 0.15), 1.0, vec3(0.3, 0.28, 0.24), 1.0))

    mj:insertIndexed(material.types, mat("date", vec3(0.35, 0.17, 0.05), 0.3))
    mj:insertIndexed(material.types, mat("dateRotten", vec3(0.12, 0.06, 0.03), 0.8))
    mj:insertIndexed(material.types, mat("palm_date", vec3(0.5, 0.25, 0.05), 0.4))
    mj:insertIndexed(material.types, matWithB("palm_leaf", vec3(0.25, 0.39, 0.15) * 0.5, 0.75, vec3(0.25, 0.39, 0.15) * 1.5, 0.4))
    mj:insertIndexed(material.types, matWithB("palm_trunk", vec3(0.25, 0.2, 0.15), 1.0, vec3(0.4, 0.33, 0.25), 1.0))

    mj:insertIndexed(material.types, mat("grape", vec3(0.08, 0.0, 0.08), 0.55))
    mj:insertIndexed(material.types, mat("grapeRotten", vec3(0.05, 0.02, 0.04), 0.8))
    mj:insertIndexed(material.types, bushMat("grapeLeaf", vec3(0.12, 0.22, 0.07), 1.0))
    mj:insertIndexed(material.types, matWithB("grapeTrunk", vec3(0.2, 0.15, 0.1), 1.0, vec3(0.3, 0.24, 0.17), 1.0))

    mj:insertIndexed(material.types, mat("barleyRotten", vec3(0.134, 0.112, 0.066), 0.48))
    mj:insertIndexed(material.types, bushMat("barleyFlower", vec3(0.52, 0.3, 0.17), 0.48))
    mj:insertIndexed(material.types, mat("barleyLeaf", vec3(0.44, 0.34, 0.2), 0.48))
    mj:insertIndexed(material.types, mat("barleyLeafSapling", vec3(0.09, 0.16, 0.05) * 1.25, 0.6))

    mj:insertIndexed(material.types, matWithB("watermelon", vec3(0.08, 0.2, 0.05), 0.3, vec3(0.25, 0.4, 0.15), 0.3))
    mj:insertIndexed(material.types, mat("watermelonRotten", vec3(0.04, 0.05, 0.02), 0.8))
    mj:insertIndexed(material.types, bushMat("watermelonLeaf", vec3(0.1, 0.2, 0.05), 0.6))

    mj:insertIndexed(material.types, mat("figRotten", vec3(0.22, 0.1, 0.18) * 0.3, 0.8))
    mj:insertIndexed(material.types, matWithB("figBark", vec3(0.2, 0.18, 0.15), 1.0, vec3(0.3, 0.28, 0.24), 1.0))
    mj:insertIndexed(material.types, matWithB("figWood", vec3(0.5, 0.43, 0.3), 0.5, vec3(0.42, 0.36, 0.25), 0.9))

    mj:insertIndexed(material.types, matWithB("datePalmBark", vec3(0.25, 0.2, 0.15), 1.0, vec3(0.4, 0.33, 0.25), 1.0))
    mj:insertIndexed(material.types, matWithB("datePalmWood", vec3(0.45, 0.35, 0.22), 0.5, vec3(0.36, 0.27, 0.17), 0.9))

    mj:insertIndexed(material.types, matWithB("baobabBark", vec3(0.45, 0.38, 0.33), 1.0, vec3(0.36, 0.31, 0.28), 1.0))
    mj:insertIndexed(material.types, matWithB("baobabWood", vec3(0.6, 0.52, 0.38), 0.5, vec3(0.5, 0.43, 0.3), 0.9))
    mj:insertIndexed(material.types, matWithB("baobabFoliage", vec3(0.14, 0.24, 0.08), 1.0, vec3(0.2, 0.3, 0.1), 1.0))
    mj:insertIndexed(material.types, matWithB("baobabFoliageSpring", vec3(0.2, 0.32, 0.1), 1.0, vec3(0.26, 0.38, 0.12), 1.0))
    mj:insertIndexed(material.types, matWithB("baobabFoliageAutumn", vec3(0.32, 0.31, 0.12), 1.0, vec3(0.4, 0.36, 0.15), 1.0))
    mj:insertIndexed(material.types, matWithB("baobabFruit", vec3(0.3, 0.28, 0.18), 0.9, vec3(0.45, 0.42, 0.3), 0.9))
    mj:insertIndexed(material.types, mat("baobabFruitRotten", vec3(0.1, 0.08, 0.05), 1.0))

    mj:insertIndexed(material.types, mat("palmSeed", vec3(0.28, 0.18, 0.08), 0.8))
    mj:insertIndexed(material.types, mat("palmSeedRotten", vec3(0.1, 0.08, 0.06), 0.9))

    mj:insertIndexed(material.types, mat("lingonberry", vec3(0.45, 0.02, 0.05), 0.3))
    mj:insertIndexed(material.types, mat("lingonberryRotten", vec3(0.12, 0.02, 0.03), 0.8))
    mj:insertIndexed(material.types, bushMat("lingonberryLeaf", vec3(0.04, 0.12, 0.05), 1.0))
    mj:insertIndexed(material.types, bushMat("lingonberryLeafLow", vec3(0.04, 0.12, 0.05), 1.0))

    mj:insertIndexed(material.types, mat("cloudberry", vec3(0.6, 0.35, 0.08), 0.5))
    mj:insertIndexed(material.types, mat("cloudberryRotten", vec3(0.18, 0.1, 0.03), 0.8))
    mj:insertIndexed(material.types, bushMat("cloudberryLeaf", vec3(0.12, 0.24, 0.08), 1.0))
    mj:insertIndexed(material.types, bushMat("cloudberryLeafLow", vec3(0.12, 0.24, 0.08), 1.0))

    mj:insertIndexed(material.types, bushMat("desertScrubLeaf", vec3(0.22, 0.24, 0.16), 1.0))
    mj:insertIndexed(material.types, matWithB("mesquiteBark", vec3(0.2, 0.16, 0.13), 1.0, vec3(0.3, 0.25, 0.2), 1.0))
    mj:insertIndexed(material.types, matWithB("mesquiteWood", vec3(0.45, 0.25, 0.15), 0.5, vec3(0.38, 0.2, 0.12), 0.9))
    mj:insertIndexed(material.types, mat("mesquitePod", vec3(0.5, 0.4, 0.27), 0.7))
    mj:insertIndexed(material.types, mat("mesquitePodRotten", vec3(0.16, 0.12, 0.07), 0.9))

    mj:insertIndexed(material.types, mat("cactusFruit", vec3(0.45, 0.05, 0.15), 0.6))
    mj:insertIndexed(material.types, mat("cactusFruitRotten", vec3(0.12, 0.03, 0.05), 0.8))

    mj:insertIndexed(material.types, mat("palmLeafDried", vec3(0.42, 0.36, 0.24), 0.9))

    mj:insertIndexed(material.types, matWithB("acaciaLeaf", vec3(0.2, 0.24, 0.12), 1.0, vec3(0.3, 0.32, 0.18), 1.0))
    mj:insertIndexed(material.types, matWithB("acaciaBark", vec3(0.18, 0.15, 0.12), 1.0, vec3(0.28, 0.23, 0.18), 1.0))
    mj:insertIndexed(material.types, matWithB("acaciaWood", vec3(0.5, 0.3, 0.18), 0.5, vec3(0.42, 0.25, 0.15), 0.9))
    mj:insertIndexed(material.types, mat("acaciaSeed", vec3(0.25, 0.15, 0.08), 0.8))
    mj:insertIndexed(material.types, mat("acaciaSeedRotten", vec3(0.1, 0.07, 0.05), 0.9))

    mj:insertIndexed(material.types, bushMat("kapokLeaf", vec3(0.08, 0.2, 0.06), 1.0))
    mj:insertIndexed(material.types, bushMat("kapokLeafLow", vec3(0.08, 0.2, 0.06), 1.0))
    mj:insertIndexed(material.types, matWithB("kapokBark", vec3(0.55, 0.36, 0.24), 1.0, vec3(0.32, 0.2, 0.13), 1.0))
    mj:insertIndexed(material.types, matWithB("kapokWood", vec3(0.62, 0.57, 0.45), 0.5, vec3(0.55, 0.5, 0.4), 0.9))
    mj:insertIndexed(material.types, mat("kapokSeed", vec3(0.2, 0.16, 0.12), 0.8))
    mj:insertIndexed(material.types, mat("kapokSeedRotten", vec3(0.08, 0.07, 0.05), 0.9))

    mj:insertIndexed(material.types, bushMat("rubberLeaf", vec3(0.05, 0.14, 0.04), 0.9))
    mj:insertIndexed(material.types, bushMat("rubberLeafLow", vec3(0.05, 0.14, 0.04), 0.9))
    mj:insertIndexed(material.types, matWithB("rubberBark", vec3(0.33, 0.28, 0.23), 0.9, vec3(0.27, 0.23, 0.19), 1.0))
    mj:insertIndexed(material.types, matWithB("rubberWood", vec3(0.66, 0.62, 0.5), 0.5, vec3(0.58, 0.54, 0.43), 0.9))
    mj:insertIndexed(material.types, mat("rubberSeed", vec3(0.22, 0.2, 0.12), 0.8))
    mj:insertIndexed(material.types, mat("rubberSeedRotten", vec3(0.08, 0.08, 0.05), 0.9))

    mj:insertIndexed(material.types, bushMat("oakLeaf", vec3(0.1, 0.2, 0.06), 1.0))
    mj:insertIndexed(material.types, bushMat("oakLeafLow", vec3(0.1, 0.2, 0.06), 1.0))
    mj:insertIndexed(material.types, bushMat("oakLeafSpring", vec3(0.2, 0.32, 0.08), 1.0))
    mj:insertIndexed(material.types, bushMat("oakLeafSpringLow", vec3(0.2, 0.32, 0.08), 1.0))
    mj:insertIndexed(material.types, bushMat("oakLeafAutumn", vec3(0.4, 0.22, 0.06), 1.0))
    mj:insertIndexed(material.types, bushMat("oakLeafAutumnLow", vec3(0.4, 0.22, 0.06), 1.0))
    mj:insertIndexed(material.types, matWithB("oakBark", vec3(0.22, 0.2, 0.17), 1.0, vec3(0.14, 0.13, 0.11), 1.0))
    mj:insertIndexed(material.types, matWithB("oakWood", vec3(0.55, 0.42, 0.28), 0.5, vec3(0.47, 0.35, 0.23), 0.9))
    mj:insertIndexed(material.types, mat("acorn", vec3(0.3, 0.2, 0.08), 0.6))
    mj:insertIndexed(material.types, mat("acornRotten", vec3(0.1, 0.07, 0.04), 0.9))
    mj:insertIndexed(material.types, mat("acorn2", vec3(0.45, 0.32, 0.15), 0.6))
    mj:insertIndexed(material.types, mat("acorn2Rotten", vec3(0.13, 0.1, 0.05), 0.9))

    mj:insertIndexed(material.types, matWithB("oliveLeaf", vec3(0.3, 0.34, 0.28), 1.0, vec3(0.42, 0.46, 0.4), 0.95))
    mj:insertIndexed(material.types, matWithB("oliveBark", vec3(0.38, 0.36, 0.32), 1.0, vec3(0.26, 0.25, 0.22), 1.0))
    mj:insertIndexed(material.types, matWithB("oliveWood", vec3(0.6, 0.48, 0.3), 0.5, vec3(0.45, 0.33, 0.2), 0.9))
    mj:insertIndexed(material.types, mat("olive", vec3(0.1, 0.12, 0.04), 0.4))
    mj:insertIndexed(material.types, mat("oliveRotten", vec3(0.05, 0.04, 0.03), 0.8))

    mj:insertIndexed(material.types, matWithB("cypressLeaf", vec3(0.04, 0.11, 0.08), 1.0, vec3(0.08, 0.18, 0.13), 0.95))
    mj:insertIndexed(material.types, matWithB("cypressLeafLow", vec3(0.04, 0.11, 0.08), 1.0, vec3(0.08, 0.18, 0.13), 0.95))
    mj:insertIndexed(material.types, matWithB("cypressLeafSmall", vec3(0.04, 0.11, 0.08), 1.0, vec3(0.08, 0.18, 0.13), 0.95))
    mj:insertIndexed(material.types, matWithB("cypressBark", vec3(0.3, 0.22, 0.16), 1.0, vec3(0.22, 0.16, 0.12), 1.0))
    mj:insertIndexed(material.types, matWithB("cypressWood", vec3(0.62, 0.5, 0.34), 0.5, vec3(0.52, 0.41, 0.27), 0.9))
    mj:insertIndexed(material.types, mat("cypressCone", vec3(0.25, 0.22, 0.14), 0.8))
    mj:insertIndexed(material.types, mat("cypressConeRotten", vec3(0.09, 0.08, 0.05), 0.9))

    mj:insertIndexed(material.types, bushMat("brazilNutLeaf", vec3(0.07, 0.17, 0.05), 1.0))
    mj:insertIndexed(material.types, bushMat("brazilNutLeafLow", vec3(0.07, 0.17, 0.05), 1.0))
    mj:insertIndexed(material.types, matWithB("brazilNutBark", vec3(0.4, 0.38, 0.34), 1.0, vec3(0.28, 0.26, 0.23), 1.0))
    mj:insertIndexed(material.types, matWithB("brazilNutWood", vec3(0.55, 0.38, 0.25), 0.5, vec3(0.46, 0.31, 0.2), 0.9))
    mj:insertIndexed(material.types, mat("brazilNut", vec3(0.25, 0.15, 0.08), 0.7))
    mj:insertIndexed(material.types, mat("brazilNutRotten", vec3(0.09, 0.06, 0.04), 0.9))

    mj:insertIndexed(material.types, bushMat("mahoganyLeaf", vec3(0.06, 0.16, 0.05), 0.9))
    mj:insertIndexed(material.types, bushMat("mahoganyLeafLow", vec3(0.06, 0.16, 0.05), 0.9))
    mj:insertIndexed(material.types, matWithB("mahoganyBark", vec3(0.3, 0.2, 0.16), 1.0, vec3(0.2, 0.13, 0.1), 1.0))
    mj:insertIndexed(material.types, matWithB("mahoganyWood", vec3(0.45, 0.16, 0.1), 0.5, vec3(0.36, 0.12, 0.08), 0.9))
    mj:insertIndexed(material.types, mat("mahoganySeed", vec3(0.3, 0.18, 0.1), 0.8))
    mj:insertIndexed(material.types, mat("mahoganySeedRotten", vec3(0.1, 0.07, 0.05), 0.9))

    mj:insertIndexed(material.types, bushMat("banyanLeaf", vec3(0.1, 0.2, 0.13), 1.0))
    mj:insertIndexed(material.types, bushMat("banyanLeafLow", vec3(0.1, 0.2, 0.13), 1.0))
    mj:insertIndexed(material.types, bushMat("banyanLeafSmall", vec3(0.1, 0.2, 0.13), 1.0))
    mj:insertIndexed(material.types, matWithB("banyanBark", vec3(0.07, 0.065, 0.06), 1.0, vec3(0.42, 0.4, 0.36), 1.0))
    mj:insertIndexed(material.types, matWithB("banyanRoots", vec3(0.07, 0.065, 0.06), 1.0, vec3(0.42, 0.4, 0.36), 1.0))
    mj:insertIndexed(material.types, matWithB("banyanWood", vec3(0.62, 0.55, 0.42), 0.5, vec3(0.54, 0.47, 0.35), 0.9))

    mj:insertIndexed(material.types, matWithB("cycad_leaf", vec3(0.06, 0.16, 0.05), 0.6, vec3(0.1, 0.24, 0.08), 0.5))
    mj:insertIndexed(material.types, matWithB("cycad_trunk", vec3(0.3, 0.26, 0.2), 1.0, vec3(0.2, 0.17, 0.13), 1.0))
    mj:insertIndexed(material.types, mat("cycadSeed", vec3(0.6, 0.22, 0.04), 0.6))
    mj:insertIndexed(material.types, mat("cycadSeedRotten", vec3(0.14, 0.07, 0.03), 0.9))

    mj:insertIndexed(material.types, matWithB("juniperLeaf", vec3(0.05, 0.1, 0.1), 1.0, vec3(0.1, 0.2, 0.2), 1.0))
    mj:insertIndexed(material.types, matWithB("juniperLeafLow", vec3(0.05, 0.1, 0.1), 1.0, vec3(0.1, 0.2, 0.2), 1.0))
    mj:insertIndexed(material.types, matWithB("juniperLeafSmall", vec3(0.05, 0.1, 0.1), 1.0, vec3(0.1, 0.2, 0.2), 1.0))
    mj:insertIndexed(material.types, matWithB("juniperBark", vec3(0.3, 0.2, 0.15), 1.0, vec3(0.2, 0.14, 0.11), 1.0))
    mj:insertIndexed(material.types, matWithB("juniperWood", vec3(0.6, 0.38, 0.28), 0.5, vec3(0.5, 0.3, 0.22), 0.9))
    mj:insertIndexed(material.types, mat("juniperBerry", vec3(0.12, 0.16, 0.28), 0.7))
    mj:insertIndexed(material.types, mat("juniperBerryRotten", vec3(0.05, 0.05, 0.07), 0.9))

    mj:insertIndexed(material.types, matWithB("treeFernLeaf", vec3(0.08, 0.22, 0.07), 1.0, vec3(0.16, 0.3, 0.1), 1.0))
    mj:insertIndexed(material.types, matWithB("treeFernTrunk", vec3(0.15, 0.1, 0.07), 1.0, vec3(0.1, 0.07, 0.05), 1.0))
    mj:insertIndexed(material.types, mat("treeFernSpores", vec3(0.35, 0.25, 0.12), 0.7))
    mj:insertIndexed(material.types, mat("treeFernSporesRotten", vec3(0.1, 0.08, 0.05), 0.9))
    mj:insertIndexed(material.types, matWithB("doumPalmLeaf", vec3(0.2, 0.28, 0.16), 0.8, vec3(0.3, 0.38, 0.24), 0.6))
    mj:insertIndexed(material.types, matWithB("doumPalmTrunk", vec3(0.35, 0.3, 0.24), 1.0, vec3(0.25, 0.21, 0.17), 1.0))
    mj:insertIndexed(material.types, bushMat("dwarfBirchLeaf", vec3(0.14, 0.24, 0.08), 1.0))
    mj:insertIndexed(material.types, bushMat("dwarfBirchLeafLow", vec3(0.14, 0.24, 0.08), 1.0))
    mj:insertIndexed(material.types, bushMat("dwarfBirchLeafSmall", vec3(0.14, 0.24, 0.08), 1.0))
    mj:insertIndexed(material.types, bushMat("dwarfBirchLeafSpring", vec3(0.2, 0.32, 0.1), 1.0))
    mj:insertIndexed(material.types, bushMat("dwarfBirchLeafSpringLow", vec3(0.2, 0.32, 0.1), 1.0))
    mj:insertIndexed(material.types, bushMat("dwarfBirchLeafAutumn", vec3(0.5, 0.18, 0.06), 1.0))
    mj:insertIndexed(material.types, bushMat("dwarfBirchLeafAutumnLow", vec3(0.5, 0.18, 0.06), 1.0))
    mj:insertIndexed(material.types, matWithB("dwarfBirchBark", vec3(0.32, 0.2, 0.16), 1.0, vec3(0.22, 0.14, 0.11), 1.0))
    mj:insertIndexed(material.types, bushMat("mapleLeaf", vec3(0.1, 0.22, 0.06), 1.0))
    mj:insertIndexed(material.types, bushMat("mapleLeafLow", vec3(0.1, 0.22, 0.06), 1.0))
    mj:insertIndexed(material.types, bushMat("mapleLeafSpring", vec3(0.22, 0.34, 0.08), 1.0))
    mj:insertIndexed(material.types, bushMat("mapleLeafSpringLow", vec3(0.22, 0.34, 0.08), 1.0))
    mj:insertIndexed(material.types, bushMat("mapleLeafAutumn", vec3(0.6, 0.12, 0.04), 1.0))
    mj:insertIndexed(material.types, bushMat("mapleLeafAutumnLow", vec3(0.6, 0.12, 0.04), 1.0))
    mj:insertIndexed(material.types, matWithB("mapleBark", vec3(0.3, 0.29, 0.26), 1.0, vec3(0.2, 0.19, 0.17), 1.0))
    mj:insertIndexed(material.types, matWithB("mapleWood", vec3(0.7, 0.6, 0.45), 0.5, vec3(0.62, 0.52, 0.38), 0.9))
    mj:insertIndexed(material.types, mat("mapleSeed", vec3(0.45, 0.35, 0.2), 0.7))
    mj:insertIndexed(material.types, mat("mapleSeedRotten", vec3(0.12, 0.09, 0.06), 0.9))
    mj:insertIndexed(material.types, matWithB("arganLeaf", vec3(0.1, 0.17, 0.09), 1.0, vec3(0.16, 0.24, 0.12), 1.0))
    mj:insertIndexed(material.types, matWithB("arganBark", vec3(0.32, 0.28, 0.24), 1.0, vec3(0.22, 0.19, 0.16), 1.0))
    mj:insertIndexed(material.types, matWithB("arganWood", vec3(0.55, 0.4, 0.28), 0.5, vec3(0.46, 0.33, 0.22), 0.9))
    mj:insertIndexed(material.types, mat("arganNut", vec3(0.4, 0.3, 0.12), 0.7))
    mj:insertIndexed(material.types, mat("arganNutRotten", vec3(0.12, 0.09, 0.05), 0.9))
    mj:insertIndexed(material.types, bushMat("carobLeaf", vec3(0.08, 0.18, 0.06), 1.0))
    mj:insertIndexed(material.types, matWithB("carobBark", vec3(0.3, 0.25, 0.2), 1.0, vec3(0.2, 0.16, 0.13), 1.0))
    mj:insertIndexed(material.types, matWithB("carobWood", vec3(0.5, 0.3, 0.2), 0.5, vec3(0.42, 0.24, 0.16), 0.9))
    mj:insertIndexed(material.types, mat("carobPod", vec3(0.18, 0.1, 0.06), 0.7))
    mj:insertIndexed(material.types, mat("carobPodRotten", vec3(0.07, 0.05, 0.03), 0.9))
    mj:insertIndexed(material.types, bushMat("alderLeaf", vec3(0.08, 0.18, 0.06), 1.0))
    mj:insertIndexed(material.types, bushMat("alderLeafLow", vec3(0.08, 0.18, 0.06), 1.0))
    mj:insertIndexed(material.types, bushMat("alderLeafSmall", vec3(0.08, 0.18, 0.06), 1.0))
    mj:insertIndexed(material.types, bushMat("alderLeafSpring", vec3(0.16, 0.28, 0.08), 1.0))
    mj:insertIndexed(material.types, bushMat("alderLeafSpringLow", vec3(0.16, 0.28, 0.08), 1.0))
    mj:insertIndexed(material.types, bushMat("alderLeafAutumn", vec3(0.25, 0.22, 0.08), 1.0))
    mj:insertIndexed(material.types, bushMat("alderLeafAutumnLow", vec3(0.25, 0.22, 0.08), 1.0))
    mj:insertIndexed(material.types, matWithB("alderBark", vec3(0.2, 0.19, 0.18), 1.0, vec3(0.13, 0.12, 0.12), 1.0))
    mj:insertIndexed(material.types, matWithB("alderWood", vec3(0.62, 0.42, 0.28), 0.5, vec3(0.54, 0.35, 0.22), 0.9))
    mj:insertIndexed(material.types, mat("alderCone", vec3(0.2, 0.13, 0.08), 0.7))
    mj:insertIndexed(material.types, mat("alderConeRotten", vec3(0.08, 0.06, 0.04), 0.9))
    mj:insertIndexed(material.types, bushMat("poplarLeaf", vec3(0.14, 0.26, 0.08), 1.0))
    mj:insertIndexed(material.types, bushMat("poplarLeafLow", vec3(0.14, 0.26, 0.08), 1.0))
    mj:insertIndexed(material.types, bushMat("poplarLeafSmall", vec3(0.14, 0.26, 0.08), 1.0))
    mj:insertIndexed(material.types, bushMat("poplarLeafSpring", vec3(0.24, 0.36, 0.1), 1.0))
    mj:insertIndexed(material.types, bushMat("poplarLeafSpringLow", vec3(0.24, 0.36, 0.1), 1.0))
    mj:insertIndexed(material.types, bushMat("poplarLeafAutumn", vec3(0.6, 0.5, 0.1), 1.0))
    mj:insertIndexed(material.types, bushMat("poplarLeafAutumnLow", vec3(0.6, 0.5, 0.1), 1.0))
    mj:insertIndexed(material.types, matWithB("poplarBark", vec3(0.45, 0.45, 0.4), 1.0, vec3(0.33, 0.33, 0.29), 1.0))
    mj:insertIndexed(material.types, matWithB("poplarWood", vec3(0.72, 0.68, 0.55), 0.5, vec3(0.64, 0.6, 0.47), 0.9))
    mj:insertIndexed(material.types, mat("poplarSeed", vec3(0.6, 0.58, 0.52), 0.7))
    mj:insertIndexed(material.types, mat("poplarSeedRotten", vec3(0.15, 0.14, 0.12), 0.9))
    mj:insertIndexed(material.types, bushMat("mangroveLeaf", vec3(0.07, 0.18, 0.06), 1.0))
    mj:insertIndexed(material.types, bushMat("mangroveLeafLow", vec3(0.07, 0.18, 0.06), 1.0))
    mj:insertIndexed(material.types, bushMat("mangroveLeafSmall", vec3(0.07, 0.18, 0.06), 1.0))
    mj:insertIndexed(material.types, matWithB("mangroveBark", vec3(0.32, 0.26, 0.22), 1.0, vec3(0.22, 0.17, 0.14), 1.0))
    mj:insertIndexed(material.types, matWithB("mangroveWood", vec3(0.5, 0.28, 0.2), 0.5, vec3(0.42, 0.22, 0.15), 0.9))
    mj:insertIndexed(material.types, mat("mangroveSeed", vec3(0.2, 0.3, 0.1), 0.7))
    mj:insertIndexed(material.types, mat("mangroveSeedRotten", vec3(0.08, 0.09, 0.04), 0.9))

    mj:insertIndexed(material.types, matWithB("oleanderLeaf", vec3(0.1, 0.22, 0.08), 1.0, vec3(0.6, 0.2, 0.35), 1.0))
    mj:insertIndexed(material.types, matWithB("oleanderLeafSpring", vec3(0.12, 0.24, 0.09), 1.0, vec3(0.35, 0.25, 0.22), 1.0))
    mj:insertIndexed(material.types, matWithB("oleanderLeafPlain", vec3(0.1, 0.22, 0.08), 1.0, vec3(0.14, 0.28, 0.1), 1.0))
    mj:insertIndexed(material.types, matWithB("oleanderLeafLow", vec3(0.1, 0.22, 0.08), 1.0, vec3(0.6, 0.2, 0.35), 1.0))
    mj:insertIndexed(material.types, matWithB("oleanderLeafLowSpring", vec3(0.12, 0.24, 0.09), 1.0, vec3(0.35, 0.25, 0.22), 1.0))
    mj:insertIndexed(material.types, matWithB("oleanderLeafLowPlain", vec3(0.1, 0.22, 0.08), 1.0, vec3(0.14, 0.28, 0.1), 1.0))
    mj:insertIndexed(material.types, bushMat("oleanderLeafSmall", vec3(0.1, 0.22, 0.08), 1.0))
    mj:insertIndexed(material.types, mat("oleanderSeed", vec3(0.35, 0.28, 0.18), 0.8))
    mj:insertIndexed(material.types, mat("oleanderSeedRotten", vec3(0.1, 0.08, 0.06), 0.9))
    mj:insertIndexed(material.types, bushMat("planeLeaf", vec3(0.12, 0.24, 0.07), 1.0))
    mj:insertIndexed(material.types, bushMat("planeLeafSpring", vec3(0.22, 0.34, 0.09), 1.0))
    mj:insertIndexed(material.types, bushMat("planeLeafAutumn", vec3(0.45, 0.35, 0.1), 1.0))
    mj:insertIndexed(material.types, bushMat("planeLeafLow", vec3(0.12, 0.24, 0.07), 1.0))
    mj:insertIndexed(material.types, bushMat("planeLeafLowSpring", vec3(0.22, 0.34, 0.09), 1.0))
    mj:insertIndexed(material.types, bushMat("planeLeafLowAutumn", vec3(0.45, 0.35, 0.1), 1.0))
    mj:insertIndexed(material.types, matWithB("planeBark", vec3(0.55, 0.52, 0.4), 1.0, vec3(0.3, 0.32, 0.24), 1.0))
    mj:insertIndexed(material.types, matWithB("planeWood", vec3(0.65, 0.52, 0.38), 0.5, vec3(0.56, 0.44, 0.3), 0.9))
    mj:insertIndexed(material.types, mat("planeSeed", vec3(0.4, 0.3, 0.15), 0.8))
    mj:insertIndexed(material.types, mat("planeSeedRotten", vec3(0.12, 0.09, 0.05), 0.9))
    mj:insertIndexed(material.types, matWithB("tamariskLeaf", vec3(0.18, 0.24, 0.18), 1.0, vec3(0.28, 0.34, 0.26), 1.0))
    mj:insertIndexed(material.types, matWithB("tamariskLeafLow", vec3(0.18, 0.24, 0.18), 1.0, vec3(0.28, 0.34, 0.26), 1.0))
    mj:insertIndexed(material.types, matWithB("tamariskLeafSmall", vec3(0.18, 0.24, 0.18), 1.0, vec3(0.28, 0.34, 0.26), 1.0))
    mj:insertIndexed(material.types, matWithB("tamariskBark", vec3(0.3, 0.2, 0.16), 1.0, vec3(0.2, 0.13, 0.1), 1.0))
    mj:insertIndexed(material.types, matWithB("tamariskWood", vec3(0.55, 0.4, 0.3), 0.5, vec3(0.46, 0.33, 0.24), 0.9))
    mj:insertIndexed(material.types, mat("tamariskSeed", vec3(0.4, 0.35, 0.3), 0.8))
    mj:insertIndexed(material.types, mat("tamariskSeedRotten", vec3(0.12, 0.1, 0.08), 0.9))
    mj:insertIndexed(material.types, matWithB("baldCypressLeaf", vec3(0.12, 0.25, 0.08), 1.0, vec3(0.2, 0.33, 0.12), 1.0))
    mj:insertIndexed(material.types, bushMat("baldCypressLeafSpring", vec3(0.2, 0.32, 0.1), 1.0))
    mj:insertIndexed(material.types, bushMat("baldCypressLeafAutumn", vec3(0.5, 0.25, 0.08), 1.0))
    mj:insertIndexed(material.types, matWithB("baldCypressLeafSmall", vec3(0.12, 0.25, 0.08), 1.0, vec3(0.2, 0.33, 0.12), 1.0))
    mj:insertIndexed(material.types, matWithB("baldCypressBark", vec3(0.4, 0.3, 0.24), 1.0, vec3(0.28, 0.2, 0.16), 1.0))
    mj:insertIndexed(material.types, matWithB("baldCypressWood", vec3(0.62, 0.45, 0.3), 0.5, vec3(0.54, 0.38, 0.24), 0.9))
    mj:insertIndexed(material.types, mat("baldCypressCone", vec3(0.3, 0.26, 0.16), 0.8))
    mj:insertIndexed(material.types, mat("baldCypressConeRotten", vec3(0.1, 0.08, 0.05), 0.9))
    mj:insertIndexed(material.types, matWithB("maritimePineLeaf", vec3(0.05, 0.12, 0.06), 1.0, vec3(0.15, 0.3, 0.14), 1.0))
    mj:insertIndexed(material.types, matWithB("maritimePineLeafLow", vec3(0.05, 0.12, 0.06), 1.0, vec3(0.15, 0.3, 0.14), 1.0))
    mj:insertIndexed(material.types, matWithB("maritimePineLeafSmall", vec3(0.05, 0.12, 0.06), 1.0, vec3(0.15, 0.3, 0.14), 1.0))
    mj:insertIndexed(material.types, matWithB("maritimePineBark", vec3(0.35, 0.22, 0.15), 1.0, vec3(0.22, 0.14, 0.1), 1.0))
    mj:insertIndexed(material.types, matWithB("stonePineLeaf", vec3(0.07, 0.15, 0.06), 1.0, vec3(0.16, 0.28, 0.12), 1.0))
    mj:insertIndexed(material.types, matWithB("stonePineLeafLow", vec3(0.07, 0.15, 0.06), 1.0, vec3(0.16, 0.28, 0.12), 1.0))
    mj:insertIndexed(material.types, matWithB("stonePineLeafSmall", vec3(0.07, 0.15, 0.06), 1.0, vec3(0.16, 0.28, 0.12), 1.0))
    mj:insertIndexed(material.types, matWithB("stonePineBark", vec3(0.4, 0.26, 0.18), 1.0, vec3(0.3, 0.3, 0.28), 1.0))
    mj:insertIndexed(material.types, mat("stonePineCone", vec3(0.36, 0.22, 0.12), 0.6))
    mj:insertIndexed(material.types, mat("stonePineConeRotten", vec3(0.1, 0.07, 0.05), 0.9))
    mj:insertIndexed(material.types, bushMat("cacaoLeaf", vec3(0.07, 0.18, 0.05), 0.9))
    mj:insertIndexed(material.types, bushMat("cacaoLeafLow", vec3(0.07, 0.18, 0.05), 0.9))
    mj:insertIndexed(material.types, matWithB("cacaoBark", vec3(0.35, 0.3, 0.25), 1.0, vec3(0.24, 0.2, 0.16), 1.0))
    mj:insertIndexed(material.types, mat("cacaoPod", vec3(0.55, 0.35, 0.08), 0.6))
    mj:insertIndexed(material.types, mat("cacaoPodRotten", vec3(0.15, 0.1, 0.04), 0.9))
    mj:insertIndexed(material.types, bushMat("papyrusLeaf", vec3(0.14, 0.28, 0.08), 1.0))
    mj:insertIndexed(material.types, bushMat("papyrusHead", vec3(0.22, 0.32, 0.1), 1.0))
    mj:insertIndexed(material.types, bushMat("giantReedLeaf", vec3(0.2, 0.3, 0.14), 1.0))
    mj:insertIndexed(material.types, bushMat("giantReedFlower", vec3(0.4, 0.34, 0.26), 1.0))
    mj:insertIndexed(material.types, bushMat("commonReedLeaf", vec3(0.22, 0.28, 0.18), 1.0))
    mj:insertIndexed(material.types, bushMat("commonReedPlume", vec3(0.36, 0.26, 0.26), 1.0))
    mj:insertIndexed(material.types, bushMat("bulrushLeaf", vec3(0.1, 0.2, 0.08), 1.0))
    mj:insertIndexed(material.types, bushMat("bulrushHead", vec3(0.2, 0.13, 0.08), 1.0))
    mj:insertIndexed(material.types, bushMat("cordgrassLeaf", vec3(0.32, 0.36, 0.16), 0.9))
    mj:insertIndexed(material.types, mat("cordgrassLeafSapling", vec3(0.12, 0.2, 0.07), 0.6))
    mj:insertIndexed(material.types, bushMat("cordgrassHead", vec3(0.45, 0.38, 0.24), 0.9))
    mj:insertIndexed(material.types, bushMat("cottonGrassLeaf", vec3(0.2, 0.24, 0.1), 0.9))
    mj:insertIndexed(material.types, mat("cottonGrassLeafSapling", vec3(0.12, 0.2, 0.07), 0.6))
    mj:insertIndexed(material.types, bushMat("cottonGrassHead", vec3(0.85, 0.84, 0.8), 1.0))
    mj:insertIndexed(material.types, mat("reedRhizome", vec3(0.4, 0.3, 0.2), 1.0))
    mj:insertIndexed(material.types, mat("reedRhizomeRotten", vec3(0.15, 0.11, 0.07), 1.0))
    mj:insertIndexed(material.types, matWithB("groundFernLeaf", vec3(0.12, 0.26, 0.06), 1.0, vec3(0.22, 0.36, 0.08), 1.0))
    mj:insertIndexed(material.types, matWithB("groundFernLeafSpring", vec3(0.16, 0.32, 0.07), 1.0, vec3(0.28, 0.42, 0.1), 1.0))
    mj:insertIndexed(material.types, matWithB("groundFernLeafAutumn", vec3(0.38, 0.18, 0.06), 1.0, vec3(0.55, 0.32, 0.1), 1.0))
    mj:insertIndexed(material.types, matWithB("groundFernLeafWinter", vec3(0.2, 0.13, 0.08), 1.0, vec3(0.3, 0.21, 0.13), 1.0))
    mj:insertIndexed(material.types, mat("groundFernStem", vec3(0.2, 0.15, 0.1), 1.0))
    mj:insertIndexed(material.types, mat("yarrowPetals", vec3(0.75, 0.73, 0.65), 0.9))
    mj:insertIndexed(material.types, mat("yarrowCenter", vec3(0.6, 0.55, 0.4), 0.9))
    mj:insertIndexed(material.types, mat("yarrowCenterRotten", vec3(0.2, 0.18, 0.12), 0.9))
    mj:insertIndexed(material.types, bushMat("yarrowLeaf", vec3(0.14, 0.26, 0.1), 1.0))
    mj:insertIndexed(material.types, bushMat("yarrowLow", vec3(0.45, 0.47, 0.38), 1.0))
    mj:insertIndexed(material.types, mat("gotuKolaPetals", vec3(0.12, 0.3, 0.08), 0.7))
    mj:insertIndexed(material.types, mat("gotuKolaCenter", vec3(0.1, 0.25, 0.07), 0.7))
    mj:insertIndexed(material.types, mat("gotuKolaCenterRotten", vec3(0.07, 0.08, 0.04), 0.9))
    mj:insertIndexed(material.types, bushMat("gotuKolaLeaf", vec3(0.1, 0.26, 0.07), 1.0))
    mj:insertIndexed(material.types, bushMat("gotuKolaLow", vec3(0.11, 0.28, 0.07), 1.0))
    mj:insertIndexed(material.types, bushMat("plantainLeaf", vec3(0.12, 0.26, 0.08), 1.0))
    mj:insertIndexed(material.types, bushMat("plantainLeafLow", vec3(0.12, 0.26, 0.08), 1.0))
    mj:insertIndexed(material.types, mat("plantainLeafRotten", vec3(0.08, 0.08, 0.04), 0.9))
    mj:insertIndexed(material.types, bushMat("peppermintLeaf", vec3(0.1, 0.3, 0.1), 1.0))
    mj:insertIndexed(material.types, bushMat("peppermintLeafLow", vec3(0.1, 0.3, 0.1), 1.0))
    mj:insertIndexed(material.types, mat("peppermintFlower", vec3(0.4, 0.3, 0.5), 0.8))
    mj:insertIndexed(material.types, mat("peppermintLeafRotten", vec3(0.07, 0.09, 0.05), 0.9))
    mj:insertIndexed(material.types, bushMat("lemongrassLeaf", vec3(0.28, 0.36, 0.14), 1.0))
    mj:insertIndexed(material.types, bushMat("lemongrassTop", vec3(0.4, 0.42, 0.2), 1.0))
    mj:insertIndexed(material.types, mat("lemongrassRotten", vec3(0.14, 0.13, 0.07), 0.9))

    mj:insertIndexed(material.types, mat("cattailRoot", vec3(0.52, 0.45, 0.34), 1.0))
    mj:insertIndexed(material.types, mat("cattailRootCooked", vec3(0.3, 0.18, 0.08), 0.8))
    mj:insertIndexed(material.types, matWithB("cattailRootRotten", vec3(0.2, 0.17, 0.12), 1.0, vec3(0.3, 0.26, 0.18), 1.0))
    mj:insertIndexed(material.types, bushMat("reedLeaf", vec3(0.2, 0.25, 0.1), 0.8))
    mj:insertIndexed(material.types, bushMat("reedFlower", vec3(0.25, 0.17, 0.1), 0.9))

    material.types.grapeLeaf.edgeDecal = edgeDecal.groupTypes.leavesA
    material.types.barleyFlower.edgeDecal = edgeDecal.groupTypes.wheatFlower
    material.types.baobabFoliage.edgeDecal = edgeDecal.groupTypes.leavesBigger
    material.types.baobabFoliageSpring.edgeDecal = edgeDecal.groupTypes.leavesBigger
    material.types.baobabFoliageAutumn.edgeDecal = edgeDecal.groupTypes.leavesBigger
    material.types.lingonberryLeaf.edgeDecal = edgeDecal.groupTypes.leavesSmaller
    material.types.cloudberryLeaf.edgeDecal = edgeDecal.groupTypes.leavesSmaller
    material.types.desertScrubLeaf.edgeDecal = edgeDecal.groupTypes.leavesSmaller
    material.types.acaciaLeaf.edgeDecal = edgeDecal.groupTypes.willowLeaf
    material.types.kapokLeaf.edgeDecal = edgeDecal.groupTypes.leavesBigger
    material.types.rubberLeaf.edgeDecal = edgeDecal.groupTypes.leavesBigger
    material.types.oakLeaf.edgeDecal = edgeDecal.groupTypes.oak
    material.types.oakLeafSpring.edgeDecal = edgeDecal.groupTypes.oak
    material.types.oakLeafAutumn.edgeDecal = edgeDecal.groupTypes.oak
    material.types.oliveLeaf.edgeDecal = edgeDecal.groupTypes.leavesSmaller
    material.types.cypressLeaf.edgeDecal = edgeDecal.groupTypes.pine
    material.types.cypressLeafSmall.edgeDecal = edgeDecal.groupTypes.pineSmall
    material.types.brazilNutLeaf.edgeDecal = edgeDecal.groupTypes.leavesBigger
    material.types.mahoganyLeaf.edgeDecal = edgeDecal.groupTypes.leavesA
    material.types.banyanLeaf.edgeDecal = edgeDecal.groupTypes.oak
    material.types.banyanRoots.edgeDecal = edgeDecal.groupTypes.banyanRoots
    material.types.banyanLeafSmall.edgeDecal = edgeDecal.groupTypes.leavesSmaller
    material.types.juniperLeaf.edgeDecal = edgeDecal.groupTypes.juniper
    material.types.juniperLeafSmall.edgeDecal = edgeDecal.groupTypes.pineSmall
    material.types.dwarfBirchLeaf.edgeDecal = edgeDecal.groupTypes.leavesSmaller
    material.types.dwarfBirchLeafSmall.edgeDecal = edgeDecal.groupTypes.leavesSmaller
    material.types.dwarfBirchLeafSpring.edgeDecal = edgeDecal.groupTypes.leavesSmaller
    material.types.dwarfBirchLeafAutumn.edgeDecal = edgeDecal.groupTypes.leavesSmaller
    material.types.mapleLeaf.edgeDecal = edgeDecal.groupTypes.leavesA
    material.types.mapleLeafSpring.edgeDecal = edgeDecal.groupTypes.leavesA
    material.types.mapleLeafAutumn.edgeDecal = edgeDecal.groupTypes.leavesA
    material.types.arganLeaf.edgeDecal = edgeDecal.groupTypes.willowLeaf
    material.types.carobLeaf.edgeDecal = edgeDecal.groupTypes.willowLeaf
    material.types.alderLeaf.edgeDecal = edgeDecal.groupTypes.leavesBigger
    material.types.alderLeafSmall.edgeDecal = edgeDecal.groupTypes.leavesSmaller
    material.types.alderLeafSpring.edgeDecal = edgeDecal.groupTypes.leavesBigger
    material.types.alderLeafAutumn.edgeDecal = edgeDecal.groupTypes.leavesBigger
    material.types.poplarLeaf.edgeDecal = edgeDecal.groupTypes.leavesBigger
    material.types.poplarLeafSmall.edgeDecal = edgeDecal.groupTypes.leavesSmaller
    material.types.poplarLeafSpring.edgeDecal = edgeDecal.groupTypes.leavesBigger
    material.types.poplarLeafAutumn.edgeDecal = edgeDecal.groupTypes.leavesBigger
    material.types.mangroveLeaf.edgeDecal = edgeDecal.groupTypes.leavesA
    material.types.mangroveLeafSmall.edgeDecal = edgeDecal.groupTypes.leavesSmaller
    material.types.oleanderLeaf.edgeDecal = edgeDecal.groupTypes.leavesSmaller
    material.types.oleanderLeafSpring.edgeDecal = edgeDecal.groupTypes.leavesSmaller
    material.types.oleanderLeafPlain.edgeDecal = edgeDecal.groupTypes.leavesSmaller
    material.types.oleanderLeafSmall.edgeDecal = edgeDecal.groupTypes.leavesSmaller
    material.types.planeLeaf.edgeDecal = edgeDecal.groupTypes.leavesA
    material.types.planeLeafSpring.edgeDecal = edgeDecal.groupTypes.leavesA
    material.types.planeLeafAutumn.edgeDecal = edgeDecal.groupTypes.leavesA
    material.types.tamariskLeaf.edgeDecal = edgeDecal.groupTypes.juniper
    material.types.tamariskLeafSmall.edgeDecal = edgeDecal.groupTypes.pineSmall
    material.types.baldCypressLeaf.edgeDecal = edgeDecal.groupTypes.pine
    material.types.baldCypressLeafSpring.edgeDecal = edgeDecal.groupTypes.pine
    material.types.baldCypressLeafAutumn.edgeDecal = edgeDecal.groupTypes.pine
    material.types.baldCypressLeafSmall.edgeDecal = edgeDecal.groupTypes.pineSmall
    material.types.maritimePineLeaf.edgeDecal = edgeDecal.groupTypes.pine
    material.types.maritimePineLeafSmall.edgeDecal = edgeDecal.groupTypes.pineSmall
    material.types.stonePineLeaf.edgeDecal = edgeDecal.groupTypes.pine
    material.types.stonePineLeafSmall.edgeDecal = edgeDecal.groupTypes.pineSmall
    material.types.cacaoLeaf.edgeDecal = edgeDecal.groupTypes.leavesA
    material.types.cordgrassHead.edgeDecal = edgeDecal.groupTypes.wheatFlower
    material.types.cottonGrassHead.edgeDecal = edgeDecal.groupTypes.wheatFlower
end

return mod
