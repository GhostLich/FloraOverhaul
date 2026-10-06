local constructable = mjrequire "common/constructable"

local mod = {
    loadOrder = 1,
}

function mod:onload(plantUI)

    local function insertAfter(addType, afterType, list)
        local afterFoundIndex = nil
        for i,otherType in ipairs(list) do
            if otherType == afterType then
                afterFoundIndex = i
                break
            end
        end
        table.insert(list, afterFoundIndex and (afterFoundIndex + 1) or (#list + 1), addType)
    end

    local itemList = plantUI.itemList
    insertAfter(constructable.types.plant_grapevinePlant.index, constructable.types.plant_gooseberryBush.index, itemList)
    insertAfter(constructable.types.plant_barleyPlant.index, constructable.types.plant_wheatPlant.index, itemList)
    insertAfter(constructable.types.plant_watermelonPlant.index, constructable.types.plant_pumpkinPlant.index, itemList)
    insertAfter(constructable.types.plant_figTree.index, constructable.types.plant_peachTree.index, itemList)
    insertAfter(constructable.types.plant_cattail.index, constructable.types.plant_flaxPlant.index, itemList)
    insertAfter(constructable.types.plant_cactus1.index, constructable.types.plant_aloePlant.index, itemList)
    insertAfter(constructable.types.plant_mesquiteTree.index, constructable.types.plant_cactus1.index, itemList)
    insertAfter(constructable.types.plant_datePalm1.index, constructable.types.plant_coconutTree.index, itemList)
    insertAfter(constructable.types.plant_baobab1.index, constructable.types.plant_datePalm1.index, itemList)
    insertAfter(constructable.types.plant_acacia1.index, constructable.types.plant_baobab1.index, itemList)
    insertAfter(constructable.types.plant_kapok1.index, constructable.types.plant_acacia1.index, itemList)
    insertAfter(constructable.types.plant_kapokBig1.index, constructable.types.plant_kapok1.index, itemList)
    insertAfter(constructable.types.plant_rubberTree1.index, constructable.types.plant_kapokBig1.index, itemList)
    insertAfter(constructable.types.plant_brazilNutTree.index, constructable.types.plant_kapokBig1.index, itemList)
    insertAfter(constructable.types.plant_mahogany1.index, constructable.types.plant_brazilNutTree.index, itemList)
    insertAfter(constructable.types.plant_banyan1.index, constructable.types.plant_mahogany1.index, itemList)
    insertAfter(constructable.types.plant_oak1.index, constructable.types.plant_rubberTree1.index, itemList)
    insertAfter(constructable.types.plant_oliveTree.index, constructable.types.plant_figTree.index, itemList)
    insertAfter(constructable.types.plant_cypress1.index, constructable.types.plant_oak1.index, itemList)
    insertAfter(constructable.types.plant_juniper1.index, constructable.types.plant_cypress1.index, itemList)
    insertAfter(constructable.types.plant_maple1.index, constructable.types.plant_oak1.index, itemList)
    insertAfter(constructable.types.plant_chestnut1.index, constructable.types.plant_oak1.index, itemList)
    insertAfter(constructable.types.plant_alder1.index, constructable.types.plant_maple1.index, itemList)
    insertAfter(constructable.types.plant_poplar1.index, constructable.types.plant_alder1.index, itemList)
    insertAfter(constructable.types.plant_dwarfBirch1.index, constructable.types.plant_poplar1.index, itemList)
    insertAfter(constructable.types.plant_sagebrush1.index, constructable.types.plant_dwarfBirch1.index, itemList)
    insertAfter(constructable.types.plant_hazelBush.index, constructable.types.plant_sagebrush1.index, itemList)
    insertAfter(constructable.types.plant_arcticWillow.index, constructable.types.plant_hazelBush.index, itemList)
    insertAfter(constructable.types.plant_arganTree.index, constructable.types.plant_oliveTree.index, itemList)
    insertAfter(constructable.types.plant_carobTree.index, constructable.types.plant_mesquiteTree.index, itemList)
    insertAfter(constructable.types.plant_doumPalm1.index, constructable.types.plant_wildPalm1.index, itemList)
    insertAfter(constructable.types.plant_mangrove1.index, constructable.types.plant_doumPalm1.index, itemList)
    insertAfter(constructable.types.plant_treeFern1.index, constructable.types.plant_cycad1.index, itemList)
    insertAfter(constructable.types.plant_planeTree1.index, constructable.types.plant_poplar1.index, itemList)
    insertAfter(constructable.types.plant_baldCypress1.index, constructable.types.plant_cypress1.index, itemList)
    insertAfter(constructable.types.plant_maritimePine1.index, constructable.types.plant_juniper1.index, itemList)
    insertAfter(constructable.types.plant_stonePine1.index, constructable.types.plant_maritimePine1.index, itemList)
    insertAfter(constructable.types.plant_spruce1.index, constructable.types.plant_stonePine1.index, itemList)
    insertAfter(constructable.types.plant_larch1.index, constructable.types.plant_spruce1.index, itemList)
    insertAfter(constructable.types.plant_tamarisk1.index, constructable.types.plant_carobTree.index, itemList)
    insertAfter(constructable.types.plant_oleander1.index, constructable.types.plant_tamarisk1.index, itemList)
    insertAfter(constructable.types.plant_saxaul1.index, constructable.types.plant_tamarisk1.index, itemList)
    insertAfter(constructable.types.plant_cacaoTree.index, constructable.types.plant_mangrove1.index, itemList)
    insertAfter(constructable.types.plant_papyrus.index, constructable.types.plant_cattail.index, itemList)
    insertAfter(constructable.types.plant_giantReed.index, constructable.types.plant_papyrus.index, itemList)
    insertAfter(constructable.types.plant_commonReed.index, constructable.types.plant_giantReed.index, itemList)
    insertAfter(constructable.types.plant_bulrush.index, constructable.types.plant_commonReed.index, itemList)
    insertAfter(constructable.types.plant_cordgrass.index, constructable.types.plant_bulrush.index, itemList)
    insertAfter(constructable.types.plant_cottonGrass.index, constructable.types.plant_cordgrass.index, itemList)
    insertAfter(constructable.types.plant_elephantGrass.index, constructable.types.plant_cottonGrass.index, itemList)
    insertAfter(constructable.types.plant_groundFern.index, constructable.types.plant_treeFern1.index, itemList)
    insertAfter(constructable.types.plant_yarrowPlant.index, constructable.types.plant_marigoldPlant.index, itemList)
    insertAfter(constructable.types.plant_gotuKolaPlant.index, constructable.types.plant_yarrowPlant.index, itemList)
    insertAfter(constructable.types.plant_thymePlant.index, constructable.types.plant_gotuKolaPlant.index, itemList)
    insertAfter(constructable.types.plant_plantainPlant.index, constructable.types.plant_aloePlant.index, itemList)
    insertAfter(constructable.types.plant_peppermintPlant.index, constructable.types.plant_gingerPlant.index, itemList)
    insertAfter(constructable.types.plant_lemongrassPlant.index, constructable.types.plant_turmericPlant.index, itemList)
    insertAfter(constructable.types.plant_wildPalm1.index, constructable.types.plant_datePalm1.index, itemList)
    insertAfter(constructable.types.plant_cycad1.index, constructable.types.plant_wildPalm1.index, itemList)
    insertAfter(constructable.types.plant_cloudberryBush.index, constructable.types.plant_gooseberryBush.index, itemList)
    insertAfter(constructable.types.plant_lingonberryBush.index, constructable.types.plant_gooseberryBush.index, itemList)
end

return mod
