local mjm = mjrequire "common/mjm"
local vec2 = mjm.vec2

local mod = {
    loadOrder = 1,
}

local windStrengths = {
    whWillow3 = vec2(0.993, 0.8),
    whWillow3Spring = vec2(0.993, 0.8),
    whWillow3Autumn = vec2(0.993, 0.8),
    whWillow3Winter = vec2(0.999, 0.8),
    whWillow4 = vec2(0.993, 0.8),
    whWillow4Spring = vec2(0.993, 0.8),
    whWillow4Autumn = vec2(0.993, 0.8),
    whWillow4Winter = vec2(0.999, 0.8),
    whPeachTree2 = vec2(0.98, 0.8),
    whPeachTree2Spring = vec2(0.98, 0.8),
    whPeachTree2Autumn = vec2(0.98, 0.8),
    whPeachTree2Winter = vec2(0.998, 0.8),
    whPeachTree3 = vec2(0.98, 0.8),
    whPeachTree3Spring = vec2(0.98, 0.8),
    whPeachTree3Autumn = vec2(0.98, 0.8),
    whPeachTree3Winter = vec2(0.998, 0.8),
    whPeachTree4 = vec2(0.98, 0.8),
    whPeachTree4Spring = vec2(0.98, 0.8),
    whPeachTree4Autumn = vec2(0.98, 0.8),
    whPeachTree4Winter = vec2(0.998, 0.8),
    whElderberryTree2 = vec2(0.98, 0.8),
    whElderberryTree2Spring = vec2(0.98, 0.8),
    whElderberryTree2Autumn = vec2(0.98, 0.8),
    whElderberryTree2Winter = vec2(0.998, 0.8),
    whElderberryTree3 = vec2(0.98, 0.8),
    whElderberryTree3Spring = vec2(0.98, 0.8),
    whElderberryTree3Autumn = vec2(0.98, 0.8),
    whElderberryTree3Winter = vec2(0.998, 0.8),
    whElderberryTree4 = vec2(0.98, 0.8),
    whElderberryTree4Spring = vec2(0.98, 0.8),
    whElderberryTree4Autumn = vec2(0.98, 0.8),
    whElderberryTree4Winter = vec2(0.998, 0.8),
    whOrangeTree2 = vec2(0.98, 0.8),
    whOrangeTree3 = vec2(0.98, 0.8),
    whOrangeTree4 = vec2(0.98, 0.8),
    whAppleTree2 = vec2(0.98, 0.8),
    whAppleTree2Spring = vec2(0.98, 0.8),
    whAppleTree2Autumn = vec2(0.98, 0.8),
    whAppleTree2Winter = vec2(0.998, 0.8),
    whAppleTree3 = vec2(0.98, 0.8),
    whAppleTree3Spring = vec2(0.98, 0.8),
    whAppleTree3Autumn = vec2(0.98, 0.8),
    whAppleTree3Winter = vec2(0.998, 0.8),
    whAppleTree4 = vec2(0.98, 0.8),
    whAppleTree4Spring = vec2(0.98, 0.8),
    whAppleTree4Autumn = vec2(0.98, 0.8),
    whAppleTree4Winter = vec2(0.998, 0.8),
    whFigTree = vec2(0.98, 0.8),
    whFigTreeSpring = vec2(0.98, 0.8),
    whFigTreeAutumn = vec2(0.98, 0.8),
    whFigTreeWinter = vec2(0.998, 0.8),
    whFigTreeSapling = vec2(0.95, 0.8),
    whFigTreeSaplingSpring = vec2(0.95, 0.8),
    whFigTreeSaplingAutumn = vec2(0.95, 0.8),
    whFigTreeSaplingWinter = vec2(0.99, 0.8),
    whFigHangingFruit = vec2(0.98, 0.8),
    whFigHangingFruitWinter = vec2(0.998, 0.8),
    whDatePalm1 = vec2(0.997, 0.8),
    whDatePalm2 = vec2(0.997, 0.8),
    whDatePalm3 = vec2(0.997, 0.8),
    whDatePalmSapling = vec2(0.9, 0.8),
    whDateHangingFruit = vec2(0.997, 0.8),
    whGrapevinePlant = vec2(0.9, 0.8),
    whGrapevinePlantSapling = vec2(0.7, 0.6),
    whGrapeHangingFruit = vec2(0.9, 0.8),
    whBarleyPlant = vec2(0.9, 0.6),
    whBarleyPlantSapling = vec2(0.6, 0.6),
    whWatermelonPlant = vec2(0.7, 0.6),
    whWatermelonPlantSapling = vec2(0.7, 0.6),
    whCattail = vec2(0.9, 0.6),
    whCattailSapling = vec2(0.6, 0.6),
    whBaobab1 = vec2(1.0, 1.0),
    whBaobab1Spring = vec2(1.0, 1.0),
    whBaobab1Autumn = vec2(1.0, 1.0),
    whBaobab1Winter = vec2(1.0, 1.0),
    whBaobab2 = vec2(1.0, 1.0),
    whBaobab2Spring = vec2(1.0, 1.0),
    whBaobab2Autumn = vec2(1.0, 1.0),
    whBaobab2Winter = vec2(1.0, 1.0),
    whBaobab3 = vec2(1.0, 1.0),
    whBaobab3Spring = vec2(1.0, 1.0),
    whBaobab3Autumn = vec2(1.0, 1.0),
    whBaobab3Winter = vec2(1.0, 1.0),
    whBaobab4 = vec2(1.0, 1.0),
    whBaobab4Spring = vec2(1.0, 1.0),
    whBaobab4Autumn = vec2(1.0, 1.0),
    whBaobab4Winter = vec2(1.0, 1.0),
    whBaobabSapling = vec2(0.95, 0.8),
    whWildPalm1 = vec2(0.997, 0.8),
    whWildPalm2 = vec2(0.997, 0.8),
    whWildPalm3 = vec2(0.995, 0.8),
    whLingonberryBush = vec2(0.9, 0.8),
    whLingonberryBushSapling = vec2(0.7, 0.6),
    whLingonberryHangingFruit = vec2(0.9, 0.8),
    whBlueberry1 = vec2(0.95, 0.8),
    whBlueberry1Spring = vec2(0.95, 0.8),
    whBlueberry1Autumn = vec2(0.95, 0.8),
    whBlueberry1Winter = vec2(0.95, 0.8),
    whBlueberry2 = vec2(0.95, 0.8),
    whBlueberry2Spring = vec2(0.95, 0.8),
    whBlueberry2Autumn = vec2(0.95, 0.8),
    whBlueberry2Winter = vec2(0.95, 0.8),
    whBlueberry3 = vec2(0.95, 0.8),
    whBlueberry3Spring = vec2(0.95, 0.8),
    whBlueberry3Autumn = vec2(0.95, 0.8),
    whBlueberry3Winter = vec2(0.95, 0.8),
    whBlueberry4 = vec2(0.95, 0.8),
    whBlueberry4Spring = vec2(0.95, 0.8),
    whBlueberry4Autumn = vec2(0.95, 0.8),
    whBlueberry4Winter = vec2(0.95, 0.8),
    whBlueberryBushSapling = vec2(0.7, 0.6),
    whBlueberryHangingFruit = vec2(0.95, 0.8),
    whCloudberryBush = vec2(0.9, 0.8),
    whCloudberryBushSapling = vec2(0.7, 0.6),
    whCloudberryHangingFruit = vec2(0.9, 0.8),
    whMesquiteTree = vec2(0.98, 0.8),
    whMesquiteTree2 = vec2(0.98, 0.8),
    whMesquiteTree3 = vec2(0.98, 0.8),
    whMesquiteTree4 = vec2(0.98, 0.8),
    whMesquiteTreeSapling = vec2(0.95, 0.8),
    whMesquitePodHangingFruit = vec2(0.98, 0.8),
    whAcacia1 = vec2(0.993, 0.8),
    whAcacia2 = vec2(0.99, 0.8),
    whAcacia3 = vec2(0.993, 0.8),
    whAcacia4 = vec2(0.99, 0.8),
    whAcaciaSapling = vec2(0.95, 0.8),
    whKapokBig1 = vec2(0.9995, 0.9),
    whKapok1 = vec2(0.999, 0.9),
    whKapok2 = vec2(0.999, 0.9),
    whKapok3 = vec2(0.999, 0.9),
    whKapokSapling = vec2(0.95, 0.8),
    whRubberTree1 = vec2(0.998, 0.8),
    whRubberTree2 = vec2(0.998, 0.8),
    whRubberTree3 = vec2(0.998, 0.8),
    whRubberTree4 = vec2(0.998, 0.8),
    whRubberTreeSapling = vec2(0.95, 0.8),
    whOak1 = vec2(0.998, 0.8),
    whOak1Spring = vec2(0.998, 0.8),
    whOak1Autumn = vec2(0.998, 0.8),
    whOak1Winter = vec2(0.999, 0.8),
    whOak2 = vec2(0.998, 0.8),
    whOak2Spring = vec2(0.998, 0.8),
    whOak2Autumn = vec2(0.998, 0.8),
    whOak2Winter = vec2(0.999, 0.8),
    whOak3 = vec2(0.998, 0.8),
    whOak3Spring = vec2(0.998, 0.8),
    whOak3Autumn = vec2(0.998, 0.8),
    whOak3Winter = vec2(0.999, 0.8),
    whOak4 = vec2(0.998, 0.8),
    whOak4Spring = vec2(0.998, 0.8),
    whOak4Autumn = vec2(0.998, 0.8),
    whOak4Winter = vec2(0.999, 0.8),
    whOakSapling = vec2(0.95, 0.8),
    whOliveTree = vec2(0.98, 0.8),
    whOliveTree2 = vec2(0.98, 0.8),
    whOliveTreeSapling = vec2(0.95, 0.8),
    whOliveHangingFruit = vec2(0.98, 0.8),
    whCypress1 = vec2(0.997, 0.8),
    whCypress2 = vec2(0.997, 0.8),
    whCypress3 = vec2(0.997, 0.8),
    whCypress4 = vec2(0.997, 0.8),
    whCypressSapling = vec2(0.95, 0.8),
    whBrazilNutTree = vec2(0.9995, 0.9),
    whBrazilNutTree2 = vec2(0.999, 0.9),
    whBrazilNutTree3 = vec2(0.999, 0.9),
    whBrazilNutTree4 = vec2(0.9995, 0.9),
    whBrazilNutTreeSapling = vec2(0.95, 0.8),
    whMahogany1 = vec2(0.999, 0.9),
    whMahogany2 = vec2(0.999, 0.9),
    whMahogany3 = vec2(0.999, 0.9),
    whMahogany4 = vec2(0.999, 0.9),
    whMahoganySapling = vec2(0.95, 0.8),
    whBanyan1 = vec2(0.998, 0.9),
    whBanyan2 = vec2(0.998, 0.9),
    whBanyan3 = vec2(0.998, 0.9),
    whBanyan4 = vec2(0.998, 0.9),
    whBanyanSapling = vec2(0.95, 0.8),
    whCycad1 = vec2(0.99, 0.8),
    whCycad2 = vec2(0.99, 0.8),
    whCycad3 = vec2(0.99, 0.8),
    whCycad4 = vec2(0.99, 0.8),
    whCycadSapling = vec2(0.9, 0.8),
    whJuniper1 = vec2(0.99, 0.8),
    whJuniper1Snow = vec2(0.99, 0.8),
    whJuniper2 = vec2(0.99, 0.8),
    whJuniper2Snow = vec2(0.99, 0.8),
    whJuniper3 = vec2(0.99, 0.8),
    whJuniper3Snow = vec2(0.99, 0.8),
    whJuniper4 = vec2(0.99, 0.8),
    whJuniper4Snow = vec2(0.99, 0.8),
    whJuniperBerryHangingFruit = vec2(0.99, 0.8),
    whJuniperSapling = vec2(0.95, 0.8),
    whMaple1 = vec2(0.998, 0.8),
    whMaple1Spring = vec2(0.998, 0.8),
    whMaple1Autumn = vec2(0.998, 0.8),
    whMaple1Winter = vec2(0.999, 0.8),
    whTreeFern1 = vec2(0.99, 0.8),
    whMaple2 = vec2(0.998, 0.8),
    whMaple2Spring = vec2(0.998, 0.8),
    whMaple2Autumn = vec2(0.998, 0.8),
    whMaple2Winter = vec2(0.999, 0.8),
    whTreeFern2 = vec2(0.99, 0.8),
    whMaple3 = vec2(0.998, 0.8),
    whMaple3Spring = vec2(0.998, 0.8),
    whMaple3Autumn = vec2(0.998, 0.8),
    whMaple3Winter = vec2(0.999, 0.8),
    whTreeFern3 = vec2(0.99, 0.8),
    whMaple4 = vec2(0.998, 0.8),
    whMaple4Spring = vec2(0.998, 0.8),
    whMaple4Autumn = vec2(0.998, 0.8),
    whMaple4Winter = vec2(0.999, 0.8),
    whTreeFern4 = vec2(0.99, 0.8),
    whAlder1 = vec2(0.998, 0.8),
    whAlder1Spring = vec2(0.998, 0.8),
    whAlder1Autumn = vec2(0.998, 0.8),
    whAlder1Winter = vec2(0.999, 0.8),
    whAlder2 = vec2(0.998, 0.8),
    whAlder2Spring = vec2(0.998, 0.8),
    whAlder2Autumn = vec2(0.998, 0.8),
    whAlder2Winter = vec2(0.999, 0.8),
    whAlder3 = vec2(0.998, 0.8),
    whAlder3Spring = vec2(0.998, 0.8),
    whAlder3Autumn = vec2(0.998, 0.8),
    whAlder3Winter = vec2(0.999, 0.8),
    whAlder4 = vec2(0.998, 0.8),
    whAlder4Spring = vec2(0.998, 0.8),
    whAlder4Autumn = vec2(0.998, 0.8),
    whAlder4Winter = vec2(0.999, 0.8),
    whPoplar1 = vec2(0.999, 0.8),
    whPoplar1Spring = vec2(0.999, 0.8),
    whPoplar1Autumn = vec2(0.999, 0.8),
    whPoplar1Winter = vec2(0.999, 0.8),
    whPoplar2 = vec2(0.999, 0.8),
    whPoplar2Spring = vec2(0.999, 0.8),
    whPoplar2Autumn = vec2(0.999, 0.8),
    whPoplar2Winter = vec2(0.999, 0.8),
    whPoplar3 = vec2(0.999, 0.8),
    whPoplar3Spring = vec2(0.999, 0.8),
    whPoplar3Autumn = vec2(0.999, 0.8),
    whPoplar3Winter = vec2(0.999, 0.8),
    whPoplar4 = vec2(0.999, 0.8),
    whPoplar4Spring = vec2(0.999, 0.8),
    whPoplar4Autumn = vec2(0.999, 0.8),
    whPoplar4Winter = vec2(0.999, 0.8),
    whDwarfBirch1 = vec2(0.95, 0.8),
    whDwarfBirch1Spring = vec2(0.95, 0.8),
    whDwarfBirch1Autumn = vec2(0.95, 0.8),
    whDwarfBirch1Winter = vec2(0.98, 0.8),
    whDwarfBirch2 = vec2(0.95, 0.8),
    whDwarfBirch2Spring = vec2(0.95, 0.8),
    whDwarfBirch2Autumn = vec2(0.95, 0.8),
    whDwarfBirch2Winter = vec2(0.98, 0.8),
    whDwarfBirch3 = vec2(0.95, 0.8),
    whDwarfBirch3Spring = vec2(0.95, 0.8),
    whDwarfBirch3Autumn = vec2(0.95, 0.8),
    whDwarfBirch3Winter = vec2(0.98, 0.8),
    whDwarfBirch4 = vec2(0.95, 0.8),
    whDwarfBirch4Spring = vec2(0.95, 0.8),
    whDwarfBirch4Autumn = vec2(0.95, 0.8),
    whDwarfBirch4Winter = vec2(0.98, 0.8),
    whArganTree = vec2(0.98, 0.8),
    whArganTree2 = vec2(0.98, 0.8),
    whArganTree3 = vec2(0.98, 0.8),
    whArganTree4 = vec2(0.98, 0.8),
    whCarobTree = vec2(0.98, 0.8),
    whCarobTree2 = vec2(0.98, 0.8),
    whCarobTree3 = vec2(0.98, 0.8),
    whCarobTree4 = vec2(0.98, 0.8),
    whCarobPodHangingFruit = vec2(0.98, 0.8),
    whMangrove1 = vec2(0.997, 0.9),
    whMangrove2 = vec2(0.997, 0.9),
    whMangrove3 = vec2(0.997, 0.9),
    whMangrove4 = vec2(0.997, 0.9),
    whDoumPalm1 = vec2(0.997, 0.8),
    whDoumPalm2 = vec2(0.997, 0.8),
    whDoumPalm3 = vec2(0.997, 0.8),
    whDoumPalmSapling = vec2(0.9, 0.8),
    whMapleSapling = vec2(0.95, 0.8),
    whAlderSapling = vec2(0.95, 0.8),
    whPoplarSapling = vec2(0.95, 0.8),
    whDwarfBirchSapling = vec2(0.95, 0.8),
    whSagebrush1 = vec2(0.95, 0.8),
    whSagebrush2 = vec2(0.95, 0.8),
    whSagebrush3 = vec2(0.95, 0.8),
    whSagebrushSapling = vec2(0.95, 0.8),
    whArganTreeSapling = vec2(0.95, 0.8),
    whCarobTreeSapling = vec2(0.95, 0.8),
    whMangroveSapling = vec2(0.95, 0.8),
    whPlaneTree1 = vec2(0.998, 0.8),
    whPlaneTree1Spring = vec2(0.998, 0.8),
    whPlaneTree1Autumn = vec2(0.998, 0.8),
    whPlaneTree1Winter = vec2(0.999, 0.8),
    whPlaneTree2 = vec2(0.998, 0.8),
    whPlaneTree2Spring = vec2(0.998, 0.8),
    whPlaneTree2Autumn = vec2(0.998, 0.8),
    whPlaneTree2Winter = vec2(0.999, 0.8),
    whPlaneTree3 = vec2(0.998, 0.8),
    whPlaneTree3Spring = vec2(0.998, 0.8),
    whPlaneTree3Autumn = vec2(0.998, 0.8),
    whPlaneTree3Winter = vec2(0.999, 0.8),
    whPlaneTree4 = vec2(0.998, 0.8),
    whPlaneTree4Spring = vec2(0.998, 0.8),
    whPlaneTree4Autumn = vec2(0.998, 0.8),
    whPlaneTree4Winter = vec2(0.999, 0.8),
    whBaldCypress1 = vec2(0.998, 0.8),
    whBaldCypress1Spring = vec2(0.998, 0.8),
    whBaldCypress1Autumn = vec2(0.998, 0.8),
    whBaldCypress1Winter = vec2(0.999, 0.8),
    whBaldCypress2 = vec2(0.998, 0.8),
    whBaldCypress2Spring = vec2(0.998, 0.8),
    whBaldCypress2Autumn = vec2(0.998, 0.8),
    whBaldCypress2Winter = vec2(0.999, 0.8),
    whBaldCypress3 = vec2(0.998, 0.8),
    whBaldCypress3Spring = vec2(0.998, 0.8),
    whBaldCypress3Autumn = vec2(0.998, 0.8),
    whBaldCypress3Winter = vec2(0.999, 0.8),
    whBaldCypress4 = vec2(0.998, 0.8),
    whBaldCypress4Spring = vec2(0.998, 0.8),
    whBaldCypress4Autumn = vec2(0.998, 0.8),
    whBaldCypress4Winter = vec2(0.999, 0.8),
    whOleander1 = vec2(0.95, 0.8),
    whOleander1Spring = vec2(0.95, 0.8),
    whOleander1Autumn = vec2(0.95, 0.8),
    whOleander1Winter = vec2(0.95, 0.8),
    whTamarisk1 = vec2(0.99, 0.8),
    whTamarisk2 = vec2(0.99, 0.8),
    whTamarisk3 = vec2(0.99, 0.8),
    whTamarisk4 = vec2(0.99, 0.8),
    whMaritimePine1 = vec2(0.997, 0.9),
    whMaritimePine1Snow = vec2(0.997, 0.9),
    whMaritimePine2 = vec2(0.997, 0.9),
    whMaritimePine2Snow = vec2(0.997, 0.9),
    whMaritimePine3 = vec2(0.997, 0.9),
    whMaritimePine3Snow = vec2(0.997, 0.9),
    whMaritimePine4 = vec2(0.997, 0.9),
    whMaritimePine4Snow = vec2(0.997, 0.9),
    whStonePine1 = vec2(0.997, 0.9),
    whStonePine1Snow = vec2(0.997, 0.9),
    whStonePine2 = vec2(0.997, 0.9),
    whStonePine2Snow = vec2(0.997, 0.9),
    whStonePine3 = vec2(0.997, 0.9),
    whStonePine3Snow = vec2(0.997, 0.9),
    whStonePine4 = vec2(0.997, 0.9),
    whStonePine4Snow = vec2(0.997, 0.9),
    whChestnut1 = vec2(0.998, 0.8),
    whChestnut1Spring = vec2(0.998, 0.8),
    whChestnut1Autumn = vec2(0.998, 0.8),
    whChestnut1Winter = vec2(0.999, 0.8),
    whChestnut2 = vec2(0.998, 0.8),
    whChestnut2Spring = vec2(0.998, 0.8),
    whChestnut2Autumn = vec2(0.998, 0.8),
    whChestnut2Winter = vec2(0.999, 0.8),
    whChestnut3 = vec2(0.998, 0.8),
    whChestnut3Spring = vec2(0.998, 0.8),
    whChestnut3Autumn = vec2(0.998, 0.8),
    whChestnut3Winter = vec2(0.999, 0.8),
    whChestnut4 = vec2(0.998, 0.8),
    whChestnut4Spring = vec2(0.998, 0.8),
    whChestnut4Autumn = vec2(0.998, 0.8),
    whChestnut4Winter = vec2(0.999, 0.8),
    whBeech1 = vec2(0.998, 0.8),
    whBeech1Spring = vec2(0.998, 0.8),
    whBeech1Autumn = vec2(0.998, 0.8),
    whBeech1Winter = vec2(0.999, 0.8),
    whBeech2 = vec2(0.998, 0.8),
    whBeech2Spring = vec2(0.998, 0.8),
    whBeech2Autumn = vec2(0.998, 0.8),
    whBeech2Winter = vec2(0.999, 0.8),
    whBeech3 = vec2(0.998, 0.8),
    whBeech3Spring = vec2(0.998, 0.8),
    whBeech3Autumn = vec2(0.998, 0.8),
    whBeech3Winter = vec2(0.999, 0.8),
    whBeech4 = vec2(0.998, 0.8),
    whBeech4Spring = vec2(0.998, 0.8),
    whBeech4Autumn = vec2(0.998, 0.8),
    whBeech4Winter = vec2(0.999, 0.8),
    whHazelBush = vec2(0.95, 0.8),
    whHazelBushSpring = vec2(0.95, 0.8),
    whHazelBushAutumn = vec2(0.95, 0.8),
    whHazelBushWinter = vec2(0.95, 0.8),
    whHazelBush2 = vec2(0.95, 0.8),
    whHazelBush2Spring = vec2(0.95, 0.8),
    whHazelBush2Autumn = vec2(0.95, 0.8),
    whHazelBush2Winter = vec2(0.95, 0.8),
    whHazelBush3 = vec2(0.95, 0.8),
    whHazelBush3Spring = vec2(0.95, 0.8),
    whHazelBush3Autumn = vec2(0.95, 0.8),
    whHazelBush3Winter = vec2(0.95, 0.8),
    whHazelBush4 = vec2(0.95, 0.8),
    whHazelBush4Spring = vec2(0.95, 0.8),
    whHazelBush4Autumn = vec2(0.95, 0.8),
    whHazelBush4Winter = vec2(0.95, 0.8),
    whHazelnutHangingFruit = vec2(0.95, 0.8),
    whArcticWillow = vec2(0.95, 0.8),
    whArcticWillowSpring = vec2(0.95, 0.8),
    whArcticWillowAutumn = vec2(0.95, 0.8),
    whArcticWillowWinter = vec2(0.95, 0.8),
    whSaxaul1 = vec2(0.99, 0.8),
    whElephantGrass = vec2(0.85, 0.6),
    whFeatherGrass = vec2(0.85, 0.6),
    whSeaBuckthornBush = vec2(0.95, 0.8),
    whSeaBuckthornBush2 = vec2(0.95, 0.8),
    whSeaBuckthornBush3 = vec2(0.95, 0.8),
    whSeaBuckthornBush4 = vec2(0.95, 0.8),
    whSeaBuckthornHangingFruit = vec2(0.9, 0.8),
    whThymePlant = vec2(0.8, 0.6),
    whSyrianRuePlant = vec2(0.8, 0.6),
    whAngelicaPlant = vec2(0.8, 0.6),
    whEphedraBush = vec2(0.95, 0.8),
    whHennaBush = vec2(0.95, 0.8),
    whMyrrhBush = vec2(0.98, 0.8),
    whDragonsBloodTree = vec2(0.998, 0.8),
    whDragonsBloodTree2 = vec2(0.99, 0.8),
    whDragonsBloodTree3 = vec2(0.998, 0.8),
    whDragonsBloodTree4 = vec2(0.998, 0.8),
    whDragonTree = vec2(0.99, 0.8),
    whDragonTree2 = vec2(0.99, 0.8),
    whDragonTree3 = vec2(0.99, 0.8),
    whSpruce1 = vec2(0.997, 0.9),
    whSpruce1Snow = vec2(0.997, 0.9),
    whLarch1 = vec2(0.997, 0.9),
    whLarch1Spring = vec2(0.997, 0.9),
    whLarch1Autumn = vec2(0.997, 0.9),
    whLarch1Winter = vec2(0.999, 0.8),
    whLarch2 = vec2(0.997, 0.9),
    whLarch2Spring = vec2(0.997, 0.9),
    whLarch2Autumn = vec2(0.997, 0.9),
    whLarch2Winter = vec2(0.999, 0.8),
    whLarch3 = vec2(0.997, 0.9),
    whLarch3Spring = vec2(0.997, 0.9),
    whLarch3Autumn = vec2(0.997, 0.9),
    whLarch3Winter = vec2(0.999, 0.8),
    whLarch4 = vec2(0.997, 0.9),
    whLarch4Spring = vec2(0.997, 0.9),
    whLarch4Autumn = vec2(0.997, 0.9),
    whLarch4Winter = vec2(0.999, 0.8),
    whCacaoTree = vec2(0.98, 0.8),
    whCacaoPodHangingFruit = vec2(0.98, 0.8),
    whPapyrus = vec2(0.97, 0.8),
    whGiantReed = vec2(0.97, 0.8),
    whCommonReed = vec2(0.94, 0.6),
    whTule = vec2(0.9, 0.6),
    whCordgrassStalk = vec2(0.92, 0.68),
    whCordgrassStalkSapling = vec2(0.6, 0.6),
    whCottonGrassStalk = vec2(0.92, 0.68),
    whCottonGrassStalkSapling = vec2(0.6, 0.6),
    whGroundFern = vec2(0.8, 0.6),
    whGroundFernSpring = vec2(0.8, 0.6),
    whGroundFernAutumn = vec2(0.8, 0.6),
    whGroundFernWinter = vec2(0.8, 0.6),
    whYarrowPlant = vec2(0.8, 0.6),
    whGotuKolaPlant = vec2(0.8, 0.6),
    whPlantainPlant = vec2(0.8, 0.6),
    whPeppermintPlant = vec2(0.8, 0.6),
    whNettlePlant = vec2(0.85, 0.6),
    whLemongrassPlant = vec2(0.85, 0.6),
    whOleanderSapling = vec2(0.9, 0.8),
    whPlaneTreeSapling = vec2(0.95, 0.8),
    whBaldCypressSapling = vec2(0.95, 0.8),
    whTamariskSapling = vec2(0.95, 0.8),
    whMaritimePineSapling = vec2(0.95, 0.8),
    whStonePineSapling = vec2(0.95, 0.8),
    whSpruceSapling = vec2(0.95, 0.8),
    whChestnutSapling = vec2(0.95, 0.8),
    whBeechSapling = vec2(0.95, 0.8),
    whHazelBushSapling = vec2(0.95, 0.8),
    whArcticWillowSapling = vec2(0.95, 0.8),
    whSaxaulSapling = vec2(0.95, 0.8),
    whSeaBuckthornBushSapling = vec2(0.9, 0.8),
    whLarchSapling = vec2(0.95, 0.8),
    whCacaoTreeSapling = vec2(0.95, 0.8),
    whEphedraBushSapling = vec2(0.9, 0.8),
    whHennaBushSapling = vec2(0.9, 0.8),
    whMyrrhBushSapling = vec2(0.95, 0.8),
    whDragonsBloodTreeSapling = vec2(0.95, 0.8),
    whTreeFernSapling = vec2(0.9, 0.8),
}

local woodKeys = {
    "fig",
    "datePalm",
    "baobab",
    "mesquite",
    "acacia",
    "kapok",
    "rubber",
    "oak",
    "olive",
    "cypress",
    "brazilNut",
    "mahogany",
    "banyan",
    "juniper",
    "maple",
    "argan",
    "alder",
    "poplar",
    "carob",
    "mangrove",
    "plane",
    "baldCypress",
    "tamarisk",
    "chestnut",
    "beech",
    "larch",
    "maritimePine",
    "saxaul",
    "hazel",
    "sagebrush",
    "cacao",
}

local moundBases = {
    appleTreeMound = {"whAcacia", "whArganTree", "whCacaoTree", "whFigTree", "whMahogany", "whOliveTree"},
    birchMound = {"whAlder", "whArcticWillow", "whBaldCypress", "whBeech", "whChestnut", "whCypress", "whDwarfBirch", "whHazelBush", "whMaple", "whOak", "whPlaneTree", "whPoplar", "whRubberTree", "whSagebrush"},
    willowMound = {"whBanyan", "whMangrove"},
    aspenMound = {"whBaobab", "whBrazilNutTree", "whKapok"},
    coconutTreeMound = {"whCycad", "whDatePalm", "whTreeFern"},
    pineMound = {"whJuniper", "whLarch", "whMaritimePine", "whSaxaul", "whSpruce", "whStonePine", "whTamarisk"},
}

local willowBases = {
    willowBranch = "%sBranch",
    willowBranchLong = "%sBranchLong",
    willowBranchHalf = "%sBranchHalf",

    woodenPole_willow = "woodenPole_%s",
    woodenPoleShort_willow = "woodenPoleShort_%s",
    woodenPoleLong_willow = "woodenPoleLong_%s",

    willowLog = "%sLog",
    willowLogShort = "%sLogShort",
    willowLog4 = "%sLog4",
    willowLog3 = "%sLog3",
    willowLogHalf = "%sLogHalf",

    willowSplitLog = "%sSplitLog",
    willowSplitLogLong = "%sSplitLogLong",
    willowSplitLog3 = "%sSplitLog3",
    willowSplitLogLongAngleCut = "%sSplitLogLongAngleCut",
    willowSplitLog075 = "%sSplitLog075",
    willowSplitLog075AngleCut = "%sSplitLog075AngleCut",
    willowSplitLog2x1Grad = "%sSplitLog2x1Grad",
    willowSplitLog2x1GradAngleCut = "%sSplitLog2x1GradAngleCut",
    willowSplitLog2x2Grad = "%sSplitLog2x2Grad",
    willowSplitLog2x2GradAngleCut = "%sSplitLog2x2GradAngleCut",
    willowSplitLog05 = "%sSplitLog05",
    willowSplitLog05AngleCut = "%sSplitLog05AngleCut",

    willowSplitLogSingleAngleCutLeft1 = "%sSplitLogSingleAngleCutLeft1",
    willowSplitLogSingleAngleCutRight1 = "%sSplitLogSingleAngleCutRight1",
    willowSplitLogSingleAngleCutLeft2 = "%sSplitLogSingleAngleCutLeft2",
    willowSplitLogSingleAngleCutRight2 = "%sSplitLogSingleAngleCutRight2",
    willowSplitLogSingleAngleCutLeft3 = "%sSplitLogSingleAngleCutLeft3",
    willowSplitLogSingleAngleCutRight3 = "%sSplitLogSingleAngleCutRight3",
    willowSplitLogSingleAngleCutLeft4 = "%sSplitLogSingleAngleCutLeft4",
    willowSplitLogSingleAngleCutRight4 = "%sSplitLogSingleAngleCutRight4",
    willowSplitLogSingleAngleCutLeft5 = "%sSplitLogSingleAngleCutLeft5",
    willowSplitLogSingleAngleCutRight5 = "%sSplitLogSingleAngleCutRight5",
    willowSplitLogSingleAngleCutLeftSmallShelf = "%sSplitLogSingleAngleCutLeftSmallShelf",

    willowSplitLogTriFloorSection1 = "%sSplitLogTriFloorSection1",
    willowSplitLogTriFloorSection2 = "%sSplitLogTriFloorSection2",
}

local storageStatusSideAndEnd = {
    allowAll = { "wood", "trunk" },
    removeAll = { "warning", "warning" },
    destroyAll = { "red", "red" },
    allowNone = { "whiteTrunk", "whiteTrunk" },
    allowTakeOnly = { "wood", "whiteTrunk" },
    allowGiveOnly = { "whiteTrunk", "trunk" },
}

local function addRemap(remapModels, base, name, remap)
    if not remapModels[base] then
        remapModels[base] = {}
    end
    remapModels[base][name] = remap
end

local function addWoodRemaps(remapModels, k)
    local bark = k .. "Bark"
    local wood = k .. "Wood"

    for base,addKeyFormat in pairs(willowBases) do
        addRemap(remapModels, base, string.format(addKeyFormat, k), {
            darkBark = bark,
            willowWood = wood,
        })
    end

    addRemap(remapModels, "balafon_birch", "balafon_" .. k, {
        whiteTrunk = bark,
        lightWood = wood,
    })
    addRemap(remapModels, "logDrum_pine", "logDrum_" .. k, {
        trunk = bark,
        wood = wood,
    })

    local v = {
        trunk = bark,
        wood = wood,
    }

    addRemap(remapModels, "splitLogFloor4x4FullLow", "splitLogFloor4x4FullLow_" .. k, v)
    addRemap(remapModels, "splitLogFloor2x2FullLow", "splitLogFloor2x2FullLow_" .. k, v)
    addRemap(remapModels, "splitLogFloor1x1FullLow", "splitLogFloor1x1FullLow_" .. k, v)
    addRemap(remapModels, "splitLogFloorTri2LowContent", k .. "SplitLogFloorTri2LowContent", v)

    addRemap(remapModels, "splitLogRoofSmallCornerLeftLowContent", k .. "SplitLogRoofSmallCornerLeftLowContent", v)
    addRemap(remapModels, "splitLogRoofSmallCornerRightLowContent", k .. "SplitLogRoofSmallCornerRightLowContent", v)
    addRemap(remapModels, "splitLogRoofLowContent", k .. "SplitLogRoofLowContent", v)
    addRemap(remapModels, "splitLogRoofEndLowContent", k .. "SplitLogRoofEndLowContent", v)
    addRemap(remapModels, "splitLogRoofSlopeLowContent", k .. "SplitLogRoofSlopeLowContent", v)
    addRemap(remapModels, "splitLogRoofTriangleLowContent", k .. "SplitLogRoofTriangleLowContent", v)

    addRemap(remapModels, "canoe", "canoe_" .. k, v)

    addRemap(remapModels, "woodenPole_pine_low", "woodenPole_" .. k .. "_low", v)
    addRemap(remapModels, "woodenPoleShort_pine_low", "woodenPoleShort_" .. k .. "_low", v)
    addRemap(remapModels, "woodenPoleLong_pine_low", "woodenPoleLong_" .. k .. "_low", v)

    addRemap(remapModels, "pineSplitLogNotchedRack", k .. "SplitLogNotchedRack", v)

    local function addStorageStatusRemaps(baseModelKey, remapModelKey)
        for status,colors in pairs(storageStatusSideAndEnd) do
            addRemap(remapModels, baseModelKey, remapModelKey .. "_" .. status, {
                trunk = bark,
                wood = wood,
                sideStatus = colors[1],
                endStatus = colors[2],
            })
        end
    end

    addStorageStatusRemaps("pineSplitLogNotchedRack", k .. "SplitLogNotchedRack")
    addStorageStatusRemaps("pineSplitLogSingleAngleCutLeftSmallShelf", k .. "SplitLogSingleAngleCutLeftSmallShelf")
    addStorageStatusRemaps("canoe_" .. k, "canoe_" .. k)
end

function mod:onload(model)
    local prevSetup = model.setup
    model.setup = function(model_)
        local windStrengthsBase = nil
        local func = prevSetup
        while func and not windStrengthsBase do
            local nextFunc = nil
            local i = 1
            while true do
                local name, value = debug.getupvalue(func, i)
                if not name then
                    break
                end
                if name == "windStrengthsBase" then
                    windStrengthsBase = value
                elseif name == "prevSetup" then
                    nextFunc = value
                end
                i = i + 1
            end
            func = nextFunc
        end

        if windStrengthsBase then
            for k,v in pairs(windStrengths) do
                windStrengthsBase[k] = v
            end
        else
            mj:warn("Endemic Flora: windStrengthsBase not found")
        end
        prevSetup(model_)
    end

    local prevLoadRemaps = model.loadRemaps
    model.loadRemaps = function(model_)
        local remapModels = model.remapModels

        for i,k in ipairs(woodKeys) do
            addWoodRemaps(remapModels, k)
        end

        remapModels.whFigTree = {
            whFigTreeSpring = {
                leafyBushA = "leafyBushASpring",
                figLeafLow = "figLeafSpringLow",
            },
            whFigTreeAutumn = {
                leafyBushA = "autumn1Leaf",
                figLeafLow = "autumn1",
            },
        }
        remapModels.whFigTreeSapling = {
            whFigTreeSaplingSpring = {},
            whFigTreeSaplingAutumn = {},
            whFigTreeSaplingWinter = {},
        }
        remapModels.whFig = {
            whFigHangingFruit = {},
            whFigHangingFruitWinter = {},
        }
        remapModels.whGrape = {
            whGrapeHangingFruit = {},
            whDate = {
                grape = "date",
            },
            whDateHangingFruit = {
                grape = "date",
            },
            whSeaBuckthorn = {
                grape = "seaBuckthorn",
            },
            whSeaBuckthornHangingFruit = {
                grape = "seaBuckthorn",
            },
            whBlueberry = {
                grape = "blueberry",
            },
            whBlueberryHangingFruit = {
                grape = "blueberry",
            },
        }
        remapModels.whGrapeRotten = {
            whDateRotten = {
                grapeRotten = "dateRotten",
            },
            whSeaBuckthornRotten = {
                grapeRotten = "seaBuckthornRotten",
            },
            whBlueberryRotten = {
                grapeRotten = "blueberryRotten",
            },
        }
        remapModels.pumpkinPlant = {
            pumpkinPlantSpring = {},
            pumpkinPlantAutumn = {
                pumpkinLeaf = "pumpkinLeafAutumn",
            },
            pumpkinPlantWinter = {
                pumpkinLeaf = "pumpkinLeafAutumn",
            },
        }
        remapModels.pumpkinPlantSapling = {
            pumpkinPlantSaplingSpring = {},
            pumpkinPlantSaplingAutumn = {
                pumpkinLeaf = "pumpkinLeafAutumn",
            },
            pumpkinPlantSaplingWinter = {
                pumpkinLeaf = "pumpkinLeafAutumn",
            },
        }
        remapModels.whWaterMelon = {
            whWatermelonHangingFruit = {},
        }
        remapModels.whCactusFruit = {
            whCactusFruitHangingFruit = {},
        }
        remapModels.whCardonFruit = {
            whCardonFruitHangingFruit = {},
        }
        remapModels.whPricklyPearFruit = {
            whPricklyPearFruitHangingFruit = {},
        }
        remapModels.whBarrelCactusFruit = {
            whBarrelCactusFruitHangingFruit = {},
        }
        remapModels.whChollaBud = {
            whChollaBudHangingFruit = {},
        }
        remapModels.whLingonberryBushSapling = {
            whBlueberryBushSapling = {
                lingonberryLeaf = "blueberryLeaf",
                lingonberryLeafLow = "blueberryLeafLow",
            },
        }
        remapModels.whLingonberry = {
            whLingonberryHangingFruit = {},
            whJuniperBerry = {
                lingonberry = "juniperBerry",
            },
            whJuniperBerryHangingFruit = {
                lingonberry = "juniperBerry",
            },
        }
        remapModels.whLingonberryRotten = {
            whJuniperBerryRotten = {
                lingonberryRotten = "juniperBerryRotten",
            },
        }
        remapModels.whCloudberry = {
            whCloudberryHangingFruit = {},
        }
        remapModels.whBaobab1 = {
            whBaobab1Spring = {
                baobabFoliage = "baobabFoliageSpring",
                baobabFoliageLow = "baobabFoliageSpringLow",
            },
            whBaobab1Autumn = {
                baobabFoliage = "baobabFoliageAutumn",
                baobabFoliageLow = "baobabFoliageAutumnLow",
            },
        }
        remapModels.whBaobab2 = {
            whBaobab2Spring = {
                baobabFoliage = "baobabFoliageSpring",
                baobabFoliageLow = "baobabFoliageSpringLow",
            },
            whBaobab2Autumn = {
                baobabFoliage = "baobabFoliageAutumn",
                baobabFoliageLow = "baobabFoliageAutumnLow",
            },
        }
        remapModels.whBaobab3 = {
            whBaobab3Spring = {
                baobabFoliage = "baobabFoliageSpring",
                baobabFoliageLow = "baobabFoliageSpringLow",
            },
            whBaobab3Autumn = {
                baobabFoliage = "baobabFoliageAutumn",
                baobabFoliageLow = "baobabFoliageAutumnLow",
            },
        }
        remapModels.whBaobab4 = {
            whBaobab4Spring = {
                baobabFoliage = "baobabFoliageSpring",
                baobabFoliageLow = "baobabFoliageSpringLow",
            },
            whBaobab4Autumn = {
                baobabFoliage = "baobabFoliageAutumn",
                baobabFoliageLow = "baobabFoliageAutumnLow",
            },
        }
        remapModels.whMesquitePod = {
            whMesquitePodHangingFruit = {},
            whCarobPod = {
                mesquitePod = "carobPod",
            },
            whCarobPodHangingFruit = {
                mesquitePod = "carobPod",
            },
        }
        remapModels.whMesquitePodRotten = {
            whCarobPodRotten = {
                mesquitePodRotten = "carobPodRotten",
            },
        }
        remapModels.whMesquiteTreeMound = {
            whCarobTreeMound = {},
        }
        remapModels.appleTree.appleTreeSpring.appleLeaf = "appleLeafSpring"
        remapModels.appleTree.appleTreeSpring.appleLeafLow = "appleLeafSpringLow"
        remapModels.appleTree.appleTreeAutumn.appleLeaf = "autumn1Small"
        remapModels.appleTree.appleTreeAutumn.appleLeafLow = "autumn1"
        for i = 2,4 do
            local name = "whAppleTree" .. mj:tostring(i)
            remapModels[name] = {
                [name .. "Spring"] = {
                    appleLeaf = "appleLeafSpring",
                    appleLeafLow = "appleLeafSpringLow",
                },
                [name .. "Autumn"] = {
                    appleLeaf = "autumn1Small",
                    appleLeafLow = "autumn1",
                },
            }
        end
        for i = 2,4 do
            local name = "whElderberryTree" .. mj:tostring(i)
            remapModels[name] = {
                [name .. "Spring"] = {
                    leafyBushElderberry = "leafyBushElderberrySpring",
                    bushElderberry = "bushElderberrySpring",
                },
                [name .. "Autumn"] = {
                    leafyBushElderberry = "autumn16Leaf",
                    bushElderberry = "autumn16",
                },
            }
        end
        for i = 2,4 do
            local name = "whPeachTree" .. mj:tostring(i)
            remapModels[name] = {
                [name .. "Spring"] = {
                    leafyBushMid = "leafyBushMidSmallSpring",
                    bushMid = "bushMidSpring",
                },
                [name .. "Autumn"] = {
                    leafyBushMid = "autumn4Small",
                    bushMid = "autumn4",
                },
            }
        end
        remapModels.peachTree.peachTreeSpring.leafyBushMid = "leafyBushMidSmallSpring"
        remapModels.peachTree.peachTreeAutumn.leafyBushMid = "autumn4Small"
        remapModels.whWillow3 = {
            whWillow3Spring = {
                leafyBushC = "leafyBushCSpring",
                bushC = "bushCSpring",
            },
            whWillow3Autumn = {
                leafyBushC = "autumn2LeafWillow",
                bushC = "autumn2Willow",
            },
        }
        remapModels.whWillow4 = {
            whWillow4Spring = {
                leafyBushC = "leafyBushCSpring",
                bushC = "bushCSpring",
            },
            whWillow4Autumn = {
                leafyBushC = "autumn3LeafWillow",
                bushC = "autumn3Willow",
            },
        }
        remapModels.whOak1 = {
            whOak1Spring = {
                oakLeaf = "oakLeafSpring",
                oakLeafLow = "oakLeafSpringLow",
            },
            whOak1Autumn = {
                oakLeaf = "oakLeafAutumn",
                oakLeafLow = "oakLeafAutumnLow",
            },
        }
        remapModels.whOak2 = {
            whOak2Spring = {
                oakLeaf = "oakLeafSpring",
                oakLeafLow = "oakLeafSpringLow",
            },
            whOak2Autumn = {
                oakLeaf = "oakLeafAutumn",
                oakLeafLow = "oakLeafAutumnLow",
            },
        }
        remapModels.whOak3 = {
            whOak3Spring = {
                oakLeaf = "oakLeafSpring",
                oakLeafLow = "oakLeafSpringLow",
            },
            whOak3Autumn = {
                oakLeaf = "oakLeafAutumn",
                oakLeafLow = "oakLeafAutumnLow",
            },
        }
        remapModels.whOak4 = {
            whOak4Spring = {
                oakLeaf = "oakLeafSpring",
                oakLeafLow = "oakLeafSpringLow",
            },
            whOak4Autumn = {
                oakLeaf = "oakLeafAutumn",
                oakLeafLow = "oakLeafAutumnLow",
            },
        }
        remapModels.whOlive = {
            whOliveHangingFruit = {},
        }
        remapModels.whMaple1 = {
            whMaple1Spring = {
                mapleLeaf = "mapleLeafSpring",
                mapleLeafLow = "mapleLeafSpringLow",
            },
            whMaple1Autumn = {
                mapleLeaf = "mapleLeafAutumn",
                mapleLeafLow = "mapleLeafAutumnLow",
            },
        }
        remapModels.whMaple2 = {
            whMaple2Spring = {
                mapleLeaf = "mapleLeafSpring",
                mapleLeafLow = "mapleLeafSpringLow",
            },
            whMaple2Autumn = {
                mapleLeaf = "mapleLeafAutumn",
                mapleLeafLow = "mapleLeafAutumnLow",
            },
        }
        remapModels.whMaple3 = {
            whMaple3Spring = {
                mapleLeaf = "mapleLeafSpring",
                mapleLeafLow = "mapleLeafSpringLow",
            },
            whMaple3Autumn = {
                mapleLeaf = "mapleLeafAutumn",
                mapleLeafLow = "mapleLeafAutumnLow",
            },
        }
        remapModels.whMaple4 = {
            whMaple4Spring = {
                mapleLeaf = "mapleLeafSpring",
                mapleLeafLow = "mapleLeafSpringLow",
            },
            whMaple4Autumn = {
                mapleLeaf = "mapleLeafAutumn",
                mapleLeafLow = "mapleLeafAutumnLow",
            },
        }
        remapModels.whAlder1 = {
            whAlder1Spring = {
                alderLeaf = "alderLeafSpring",
                alderLeafLow = "alderLeafSpringLow",
            },
            whAlder1Autumn = {
                alderLeaf = "alderLeafAutumn",
                alderLeafLow = "alderLeafAutumnLow",
            },
        }
        remapModels.whPoplar1 = {
            whPoplar1Spring = {
                poplarLeaf = "poplarLeafSpring",
                poplarLeafLow = "poplarLeafSpringLow",
            },
            whPoplar1Autumn = {
                poplarLeaf = "poplarLeafAutumn",
                poplarLeafLow = "poplarLeafAutumnLow",
            },
        }
        remapModels.whPoplar2 = {
            whPoplar2Spring = {
                poplarLeaf = "poplarLeafSpring",
                poplarLeafLow = "poplarLeafSpringLow",
            },
            whPoplar2Autumn = {
                poplarLeaf = "poplarLeafAutumn",
                poplarLeafLow = "poplarLeafAutumnLow",
            },
        }
        remapModels.whPoplar3 = {
            whPoplar3Spring = {
                poplarLeaf = "poplarLeafSpring",
                poplarLeafLow = "poplarLeafSpringLow",
            },
            whPoplar3Autumn = {
                poplarLeaf = "poplarLeafAutumn",
                poplarLeafLow = "poplarLeafAutumnLow",
            },
        }
        remapModels.whPoplar4 = {
            whPoplar4Spring = {
                poplarLeaf = "poplarLeafSpring",
                poplarLeafLow = "poplarLeafSpringLow",
            },
            whPoplar4Autumn = {
                poplarLeaf = "poplarLeafAutumn",
                poplarLeafLow = "poplarLeafAutumnLow",
            },
        }
        remapModels.whAlder2 = {
            whAlder2Spring = {
                alderLeaf = "alderLeafSpring",
                alderLeafLow = "alderLeafSpringLow",
            },
            whAlder2Autumn = {
                alderLeaf = "alderLeafAutumn",
                alderLeafLow = "alderLeafAutumnLow",
            },
        }
        remapModels.whAlder3 = {
            whAlder3Spring = {
                alderLeaf = "alderLeafSpring",
                alderLeafLow = "alderLeafSpringLow",
            },
            whAlder3Autumn = {
                alderLeaf = "alderLeafAutumn",
                alderLeafLow = "alderLeafAutumnLow",
            },
        }
        remapModels.whAlder4 = {
            whAlder4Spring = {
                alderLeaf = "alderLeafSpring",
                alderLeafLow = "alderLeafSpringLow",
            },
            whAlder4Autumn = {
                alderLeaf = "alderLeafAutumn",
                alderLeafLow = "alderLeafAutumnLow",
            },
        }
        remapModels.whDwarfBirch1 = {
            whDwarfBirch1Spring = {
                dwarfBirchLeaf = "dwarfBirchLeafSpring",
                dwarfBirchLeafLow = "dwarfBirchLeafSpringLow",
            },
            whDwarfBirch1Autumn = {
                dwarfBirchLeaf = "dwarfBirchLeafAutumn",
                dwarfBirchLeafLow = "dwarfBirchLeafAutumnLow",
            },
        }
        remapModels.whDwarfBirch2 = {
            whDwarfBirch2Spring = {
                dwarfBirchLeaf = "dwarfBirchLeafSpring",
                dwarfBirchLeafLow = "dwarfBirchLeafSpringLow",
            },
            whDwarfBirch2Autumn = {
                dwarfBirchLeaf = "dwarfBirchLeafAutumn",
                dwarfBirchLeafLow = "dwarfBirchLeafAutumnLow",
            },
        }
        remapModels.whDwarfBirch4 = {
            whDwarfBirch4Spring = {
                dwarfBirchLeaf = "dwarfBirchLeafSpring",
                dwarfBirchLeafLow = "dwarfBirchLeafSpringLow",
            },
            whDwarfBirch4Autumn = {
                dwarfBirchLeaf = "dwarfBirchLeafAutumn",
                dwarfBirchLeafLow = "dwarfBirchLeafAutumnLow",
            },
        }
        remapModels.whDwarfBirch3 = {
            whDwarfBirch3Spring = {
                dwarfBirchLeaf = "dwarfBirchLeafSpring",
                dwarfBirchLeafLow = "dwarfBirchLeafSpringLow",
            },
            whDwarfBirch3Autumn = {
                dwarfBirchLeaf = "dwarfBirchLeafAutumn",
                dwarfBirchLeafLow = "dwarfBirchLeafAutumnLow",
            },
        }
        remapModels.whPlaneTree1 = {
            whPlaneTree1Spring = {
                planeLeaf = "planeLeafSpring",
                planeLeafLow = "planeLeafLowSpring",
            },
            whPlaneTree1Autumn = {
                planeLeaf = "planeLeafAutumn",
                planeLeafLow = "planeLeafLowAutumn",
            },
        }
        remapModels.whPlaneTree2 = {
            whPlaneTree2Spring = {
                planeLeaf = "planeLeafSpring",
                planeLeafLow = "planeLeafLowSpring",
            },
            whPlaneTree2Autumn = {
                planeLeaf = "planeLeafAutumn",
                planeLeafLow = "planeLeafLowAutumn",
            },
        }
        remapModels.whPlaneTree3 = {
            whPlaneTree3Spring = {
                planeLeaf = "planeLeafSpring",
                planeLeafLow = "planeLeafLowSpring",
            },
            whPlaneTree3Autumn = {
                planeLeaf = "planeLeafAutumn",
                planeLeafLow = "planeLeafLowAutumn",
            },
        }
        remapModels.whPlaneTree4 = {
            whPlaneTree4Spring = {
                planeLeaf = "planeLeafSpring",
                planeLeafLow = "planeLeafLowSpring",
            },
            whPlaneTree4Autumn = {
                planeLeaf = "planeLeafAutumn",
                planeLeafLow = "planeLeafLowAutumn",
            },
        }
        for i = 1,4 do
            local name = "whBeech" .. mj:tostring(i)
            remapModels[name] = {
                [name .. "Spring"] = {
                    beechLeaf = "beechLeafSpring",
                    beechLeafLow = "beechLeafSpringLow",
                },
                [name .. "Autumn"] = {
                    beechLeaf = "beechLeafAutumn",
                    beechLeafLow = "beechLeafAutumnLow",
                },
            }
        end
        remapModels.whChestnut = {
            whBeechnut = {
                chestnut = "beechnut",
                chestnut2 = "beechnut2",
            },
        }
        remapModels.whChestnutRotten = {
            whBeechnutRotten = {
                chestnutRotten = "beechnutRotten",
                chestnut2Rotten = "beechnut2Rotten",
            },
        }
        remapModels.whChestnutSapling = {
            whBeechSapling = {
                chestnutLeafSmall = "beechLeafSmall",
                chestnutBark = "beechBark",
            },
        }
        for i = 2,4 do
            local name = "whChestnut" .. mj:tostring(i)
            remapModels[name] = {
                [name .. "Spring"] = {
                    chestnutLeaf = "chestnutLeafSpring",
                    chestnutLeafLow = "chestnutLeafSpringLow",
                },
                [name .. "Autumn"] = {
                    chestnutLeaf = "chestnutLeafAutumn",
                    chestnutLeafLow = "chestnutLeafAutumnLow",
                },
            }
        end
        remapModels.whChestnut1 = {
            whChestnut1Spring = {
                chestnutLeaf = "chestnutLeafSpring",
                chestnutLeafLow = "chestnutLeafSpringLow",
            },
            whChestnut1Autumn = {
                chestnutLeaf = "chestnutLeafAutumn",
                chestnutLeafLow = "chestnutLeafAutumnLow",
            },
        }
        remapModels.whHazelBush_distant = {}
        for i,modelName in ipairs({"whHazelBush", "whHazelBush2", "whHazelBush3", "whHazelBush4"}) do
            remapModels[modelName] = {
                [modelName .. "Spring"] = {
                    hazelLeaf = "hazelLeafSpring",
                    hazelLeafLow = "hazelLeafSpringLow",
                },
                [modelName .. "Autumn"] = {
                    hazelLeaf = "hazelLeafAutumn",
                    hazelLeafLow = "hazelLeafAutumnLow",
                },
                [modelName .. "Winter"] = {
                    hazelLeaf = "hazelLeafWinter",
                    hazelLeafLow = "hazelLeafWinterLow",
                },
            }
            if i > 1 then
                remapModels.whHazelBush_distant[modelName .. "_distant"] = {}
                remapModels.whHazelBush_distant[modelName .. "Spring_distant"] = remapModels[modelName][modelName .. "Spring"]
                remapModels.whHazelBush_distant[modelName .. "Autumn_distant"] = remapModels[modelName][modelName .. "Autumn"]
                remapModels.whHazelBush_distant[modelName .. "Winter_distant"] = remapModels[modelName][modelName .. "Winter"]
            end
        end
        remapModels.whArcticWillow = {
            whArcticWillowSpring = {
                arcticWillowLeaf = "arcticWillowLeafSpring",
                arcticWillowLeafLow = "arcticWillowLeafSpringLow",
            },
            whArcticWillowAutumn = {
                arcticWillowLeaf = "arcticWillowLeafAutumn",
                arcticWillowLeafLow = "arcticWillowLeafAutumnLow",
            },
        }
        remapModels.whLarch1 = {
            whLarch1Spring = {
                larchLeaf = "larchLeafSpring",
                larchLeafLow = "larchLeafLowSpring",
            },
            whLarch1Autumn = {
                larchLeaf = "larchLeafAutumn",
                larchLeafLow = "larchLeafLowAutumn",
            },
        }
        remapModels.whLarch2 = {
            whLarch2Spring = {
                larchLeaf = "larchLeafSpring",
                larchLeafLow = "larchLeafLowSpring",
            },
            whLarch2Autumn = {
                larchLeaf = "larchLeafAutumn",
                larchLeafLow = "larchLeafLowAutumn",
            },
        }
        remapModels.whLarch3 = {
            whLarch3Spring = {
                larchLeaf = "larchLeafSpring",
                larchLeafLow = "larchLeafLowSpring",
            },
            whLarch3Autumn = {
                larchLeaf = "larchLeafAutumn",
                larchLeafLow = "larchLeafLowAutumn",
            },
        }
        remapModels.whLarch4 = {
            whLarch4Spring = {
                larchLeaf = "larchLeafSpring",
                larchLeafLow = "larchLeafLowSpring",
            },
            whLarch4Autumn = {
                larchLeaf = "larchLeafAutumn",
                larchLeafLow = "larchLeafLowAutumn",
            },
        }
        for i = 2,4 do
            local name = "whBaldCypress" .. mj:tostring(i)
            remapModels[name] = {
                [name .. "Spring"] = {
                    baldCypressLeaf = "baldCypressLeafSpring",
                    baldCypressLeafLow = "baldCypressLeafSpringLow",
                },
                [name .. "Autumn"] = {
                    baldCypressLeaf = "baldCypressLeafAutumn",
                    baldCypressLeafLow = "baldCypressLeafAutumnLow",
                },
            }
        end
        remapModels.whBaldCypress1 = {
            whBaldCypress1Spring = {
                baldCypressLeaf = "baldCypressLeafSpring",
                baldCypressLeafLow = "baldCypressLeafSpringLow",
            },
            whBaldCypress1Autumn = {
                baldCypressLeaf = "baldCypressLeafAutumn",
                baldCypressLeafLow = "baldCypressLeafAutumnLow",
            },
        }
        remapModels.whBlueberry1 = {
            whBlueberry1Spring = {},
            whBlueberry1Autumn = {
                blueberryLeaf = "blueberryLeafAutumn",
                blueberryLeafLow = "blueberryLeafAutumnLow",
            },
            whBlueberry1Winter = {
                blueberryLeaf = "blueberryLeafWinter",
                blueberryLeafLow = "blueberryLeafWinterLow",
            },
        }
        remapModels.whBlueberry2 = {
            whBlueberry2Spring = {},
            whBlueberry2Autumn = {
                blueberryLeaf = "blueberryLeafAutumn",
                blueberryLeafLow = "blueberryLeafAutumnLow",
            },
            whBlueberry2Winter = {
                blueberryLeaf = "blueberryLeafWinter",
                blueberryLeafLow = "blueberryLeafWinterLow",
            },
        }
        remapModels.whBlueberry3 = {
            whBlueberry3Spring = {},
            whBlueberry3Autumn = {
                blueberryLeaf = "blueberryLeafAutumn",
                blueberryLeafLow = "blueberryLeafAutumnLow",
            },
            whBlueberry3Winter = {
                blueberryLeaf = "blueberryLeafWinter",
                blueberryLeafLow = "blueberryLeafWinterLow",
            },
        }
        remapModels.whBlueberry4 = {
            whBlueberry4Spring = {},
            whBlueberry4Autumn = {
                blueberryLeaf = "blueberryLeafAutumn",
                blueberryLeafLow = "blueberryLeafAutumnLow",
            },
            whBlueberry4Winter = {
                blueberryLeaf = "blueberryLeafWinter",
                blueberryLeafLow = "blueberryLeafWinterLow",
            },
        }
        remapModels.whGroundFern = {
            whGroundFernSpring = {
                groundFernLeaf = "groundFernLeafSpring",
            },
            whGroundFernAutumn = {
                groundFernLeaf = "groundFernLeafAutumn",
            },
            whGroundFernWinter = {
                groundFernLeaf = "groundFernLeafWinter",
            },
        }
        remapModels.whOleander1 = {
            whOleander1Spring = {
                oleanderLeaf = "oleanderLeafSpring",
                oleanderLeafLow = "oleanderLeafLowSpring",
            },
            whOleander1Autumn = {
                oleanderLeaf = "oleanderLeafPlain",
                oleanderLeafLow = "oleanderLeafLowPlain",
            },
            whOleander1Winter = {
                oleanderLeaf = "oleanderLeafPlain",
                oleanderLeafLow = "oleanderLeafLowPlain",
            },
        }
        remapModels.whPlantainLeaf = {
            whSagebrushLeaf = {
                plantainLeaf = "sagebrushLeafLow",
                plantainLeafLow = "sagebrushLeafLow",
            },
        }
        remapModels.whPlantainLeafRotten = {
            whSagebrushLeafRotten = {},
            whHennaLeafRotten = {},
        }
        remapModels.whThymeRotten = {
            whSyrianRueRotten = {},
        }
        remapModels.whLemongrassRotten = {
            whEphedraRotten = {},
        }
        remapModels.whAgavePlantSapling = {
            whGiantGroundselSapling = {
                agaveLeaf = "giantGroundselLeaf",
                agaveLeafLow = "giantGroundselLeafLow",
            },
            whDragonTreeSapling = {
                agaveLeaf = "dragonTreeLeaf",
                agaveLeafLow = "dragonTreeLeafLow",
            },
        }
        remapModels.whTamariskSeed = {
            whSagebrushSeed = {
                tamariskSeed = "sagebrushSeed",
            },
            whSaxaulSeed = {},
            whEuphorbiaSeed = {},
            whGiantGroundselSeed = {},
            whDragonTreeSeed = {},
            whEphedraSeed = {},
            whHennaSeed = {},
            whMyrrhSeed = {},
            whDragonsBloodSeed = {},
            whArcticWillowSeed = {
                tamariskSeed = "arcticWillowSeed",
            },
            whBanyanSeed = {
                tamariskSeed = "banyanSeed",
            },
            whMahoganySeed = {
                tamariskSeed = "mahoganySeed",
            },
            whOleanderSeed = {
                tamariskSeed = "oleanderSeed",
            },
            whRubberSeed = {
                tamariskSeed = "rubberSeed",
            },
        }
        remapModels.whTamariskSeedRotten = {
            whSagebrushSeedRotten = {
                tamariskSeedRotten = "sagebrushSeedRotten",
            },
            whSaxaulSeedRotten = {},
            whEuphorbiaSeedRotten = {},
            whGiantGroundselSeedRotten = {},
            whDragonTreeSeedRotten = {},
            whEphedraSeedRotten = {},
            whHennaSeedRotten = {},
            whMyrrhSeedRotten = {},
            whDragonsBloodSeedRotten = {},
            whArcticWillowSeedRotten = {
                tamariskSeedRotten = "arcticWillowSeedRotten",
            },
            whBanyanSeedRotten = {
                tamariskSeedRotten = "banyanSeedRotten",
            },
            whMahoganySeedRotten = {
                tamariskSeedRotten = "mahoganySeedRotten",
            },
            whOleanderSeedRotten = {
                tamariskSeedRotten = "oleanderSeedRotten",
            },
            whRubberSeedRotten = {
                tamariskSeedRotten = "rubberSeedRotten",
            },
            whMyrrhRotten = {},
            whDragonsBloodRotten = {},
        }
        remapModels.whCacaoPod = {
            whCacaoPodHangingFruit = {},
        }
        remapModels.whCattailRoot = {
            whAgaveHeart = {
                cattailRoot = "agaveHeart",
            },
        }
        remapModels.whCattailRootRotten = {
            whAgaveHeartRotten = {},
            whAngelicaRootRotten = {},
        }
        remapModels.whCattailRootCooked = {
            whAgaveHeartCooked = {},
            whRhizomeCooked = {},
        }
        remapModels.whBaldCypressCone = {
            whCypressCone = {
                baldCypressCone = "cypressCone",
            },
        }
        remapModels.whBaldCypressConeRotten = {
            whCypressConeRotten = {
                baldCypressConeRotten = "cypressConeRotten",
            },
        }
        remapModels.whSpruceSapling = {
            whJuniperSapling = {
                spruceBark = "juniperBark",
                spruceLeafSmall = "juniperLeafSmall",
            },
            whLarchSapling = {
                spruceBark = "larchBark",
                spruceLeafSmall = "larchLeafSmall",
            },
            whMaritimePineSapling = {
                spruceBark = "maritimePineBark",
                spruceLeafSmall = "maritimePineLeafSmall",
            },
            whStonePineSapling = {
                spruceBark = "stonePineBark",
                spruceLeafSmall = "stonePineLeafSmall",
            },
        }
        for base,keys in pairs(moundBases) do
            for i,key in ipairs(keys) do
                addRemap(remapModels, base, key .. "Mound", {})
            end
        end
        remapModels.whPalmSeed = {
            whDoumFruit = {
                palmSeed = "doumFruit",
            },
        }
        remapModels.whPalmSeedRotten = {
            whDoumFruitRotten = {},
        }
        remapModels.whTreeFernSpores = {
            whGroundFernSpores = {},
        }
        remapModels.whTreeFernSporesRotten = {
            whGroundFernSporesRotten = {},
        }
        remapModels.whReedRhizome = {
            whFeatherGrassRhizome = {},
            whElephantGrassRhizome = {},
            whCordgrassRhizome = {},
            whCottonGrassRhizome = {},
            whPapyrusRhizome = {},
            whGiantReedRhizome = {},
            whTuleRhizome = {},
        }
        remapModels.whReedRhizomeRotten = {
            whFeatherGrassRhizomeRotten = {},
            whElephantGrassRhizomeRotten = {},
            whCordgrassRhizomeRotten = {},
            whCottonGrassRhizomeRotten = {},
            whPapyrusRhizomeRotten = {},
            whGiantReedRhizomeRotten = {},
            whTuleRhizomeRotten = {},
        }
        remapModels.whAcorn = {
            whHazelnut = {
                acorn = "hazelnut",
                acorn2 = "hazelnut2",
            },
            whHazelnutHangingFruit = {
                acorn = "hazelnut",
                acorn2 = "hazelnut2",
            },
            whAcornCooked = {
                acorn = "acornCooked",
                acorn2 = "acorn2Cooked",
            },
        }
        remapModels.whAcornRotten = {
            whHazelnutRotten = {
                acornRotten = "hazelnutRotten",
                acorn2Rotten = "hazelnut2Rotten",
            },
        }
        remapModels.whPalmLeaf = {
            whFrond = {
                palm_leaf = "treeFernLeaf",
            },
        }
        remapModels.whPalmLeafDried = {
            whFrondDried = {},
        }
        addRemap(remapModels, "greenHay", "whReedStem", {
            greenHay = "reedStem",
        })
        addRemap(remapModels, "hay", "whReedStemDried", {})
        addRemap(remapModels, "flaxDried", "whKapokFibre", {
            flaxLeafDry = "kapokFibre",
            flaxFlowerDry = "kapokFibre",
        })
        addRemap(remapModels, "flaxDried", "whAgaveFibre", {
            flaxLeafDry = "agaveFibre",
            flaxFlowerDry = "agaveFibre",
        })
        addRemap(remapModels, "flaxDried", "whNettleFibre", {
            flaxLeafDry = "nettleFibre",
            flaxFlowerDry = "nettleFibre",
        })
        addRemap(remapModels, "pineCone", "whLarchCone", {})
        addRemap(remapModels, "pineCone", "whMaritimePineCone", {})
        addRemap(remapModels, "pineConeRotten", "whLarchConeRotten", {})
        addRemap(remapModels, "pineConeRotten", "whMaritimePineConeRotten", {})

        prevLoadRemaps(model_)
    end
end

return mod
