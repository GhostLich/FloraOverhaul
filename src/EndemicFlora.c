#include "SPBiome.h"

static uint16_t biomeTag_tropical;
static uint16_t biomeTag_savanna;
static uint16_t biomeTag_rainforest;
static uint16_t biomeTag_cliff;
static uint16_t biomeTag_river;
static uint16_t biomeTag_denseForest;
static uint16_t biomeTag_mediumForest;
static uint16_t biomeTag_sparseForest;
static uint16_t biomeTag_verySparseForest;
static uint16_t biomeTag_temperate;
static uint16_t biomeTag_polar;
static uint16_t biomeTag_steppe;
static uint16_t biomeTag_tundra;
static uint16_t biomeTag_hot;
static uint16_t biomeTag_coniferous;
static uint16_t biomeTag_birch;
static uint16_t biomeTag_temperatureWinterModerate;
static uint16_t biomeTag_temperatureWinterCold;
static uint16_t biomeTag_temperatureWinterVeryCold;
static uint16_t biomeTag_temperatureSummerHot;
static uint16_t biomeTag_temperatureSummerCold;
static uint16_t biomeTag_temperatureSummerVeryCold;
static uint16_t biomeTag_temperatureSummerVeryHot;
static uint16_t biomeTag_heavySnowSummer;
static uint16_t biomeTag_drySummer;
static uint16_t biomeTag_dryWinter;
static uint16_t biomeTag_desert;
static uint16_t biomeTag_icecap;
static uint16_t biomeTag_dry;
static uint16_t biomeTag_mediterraneanForest;
static uint16_t biomeTag_subtropicalForest;
static uint16_t biomeTag_oakForest;
static uint16_t biomeTag_mixedForest;
static uint16_t biomeTag_cloudForest;
static uint16_t biomeTag_aspenParkland;
static uint16_t biomeTag_mediterraneanSteppe;
static uint16_t biomeTag_oakSavanna;
static uint16_t biomeTag_aridDesert;
static uint16_t biomeTag_lushSavanna;
static uint16_t biomeTag_alpineTundra;
static uint16_t biomeTag_subarctic;
static uint16_t biomeTag_temperatureWinterHot;
static uint16_t biomeTag_temperatureWinterVeryHot;
static uint16_t biomeTag_winterCool;
static uint16_t biomeTag_dryRiver;

#define BROADLEAF_TYPE_COUNT 7
static uint32_t gameObjectType_broadleafTypes[BROADLEAF_TYPE_COUNT];

#define PINE_TYPE_COUNT 5
static uint32_t gameObjectType_pineTypes[PINE_TYPE_COUNT];
static uint32_t gameObjectType_pineBranch;

#define WILLOW_TYPE_COUNT 2
static uint32_t gameObjectType_willowTypes[WILLOW_TYPE_COUNT];
static uint32_t gameObjectType_willowBranch;
static uint32_t gameObjectType_aspenBig;

#define ACACIA_TYPE_COUNT 2
static uint32_t gameObjectType_acaciaTypes[ACACIA_TYPE_COUNT];
static uint32_t gameObjectType_acacia2;
static uint32_t gameObjectType_baobab;
static uint32_t gameObjectType_acaciaBranch;

#define KAPOK_TYPE_COUNT 3
static uint32_t gameObjectType_kapokTypes[KAPOK_TYPE_COUNT];
static uint32_t gameObjectType_kapokBig;
static uint32_t gameObjectType_kapokBranch;
static uint32_t gameObjectType_brazilNutTree;
#define MAHOGANY_TYPE_COUNT 2
static uint32_t gameObjectType_mahoganyTypes[MAHOGANY_TYPE_COUNT];

#define BANYAN_TYPE_COUNT 2
static uint32_t gameObjectType_banyanTypes[BANYAN_TYPE_COUNT];

#define RUBBER_TREE_TYPE_COUNT 4
static uint32_t gameObjectType_rubberTreeTypes[RUBBER_TREE_TYPE_COUNT];

#define OAK_TYPE_COUNT 4
static uint32_t gameObjectType_oakTypes[OAK_TYPE_COUNT];

#define OLIVE_TREE_TYPE_COUNT 2
static uint32_t gameObjectType_oliveTreeTypes[OLIVE_TREE_TYPE_COUNT];
static uint32_t gameObjectType_figTree;
static uint32_t gameObjectType_cypress;
#define JUNIPER_TYPE_COUNT 2
static uint32_t gameObjectType_juniperTypes[JUNIPER_TYPE_COUNT];

static uint32_t gameObjectType_bananaTree;
static uint32_t gameObjectType_orangeTree;
static uint32_t gameObjectType_peachTree;
static uint32_t gameObjectType_elderberryTree;
static uint32_t gameObjectType_appleTree;
static uint32_t gameObjectType_coconutTree;
static uint32_t gameObjectType_bamboo;
static uint32_t gameObjectType_smallBamboo;
static uint32_t gameObjectType_bambooBranch;

#define TEMPERATE_PLANT_TYPE_COUNT 4
static uint32_t gameObjectType_temperatePlantTypes[TEMPERATE_PLANT_TYPE_COUNT];
static uint32_t gameObjectType_gingerPlant;
static uint32_t gameObjectType_turmericPlant;
static uint32_t gameObjectType_aloePlant;
static uint32_t gameObjectType_garlicPlant;
static uint32_t gameObjectType_echinaceaPlant;
static uint32_t gameObjectType_marigoldPlant;
#define CROP_TYPE_COUNT 10
static uint32_t gameObjectType_cropTypes[CROP_TYPE_COUNT];

#define CYCAD_TYPE_COUNT 4
static uint32_t gameObjectType_cycadTypes[CYCAD_TYPE_COUNT];

#define WILD_PALM_TYPE_COUNT 3
static uint32_t gameObjectType_wildPalmTypes[WILD_PALM_TYPE_COUNT];

#define DATE_PALM_TYPE_COUNT 3
static uint32_t gameObjectType_datePalmTypes[DATE_PALM_TYPE_COUNT];

#define TREE_FERN_TYPE_COUNT 4
static uint32_t gameObjectType_treeFernTypes[TREE_FERN_TYPE_COUNT];

#define MAPLE_TYPE_COUNT 4
static uint32_t gameObjectType_mapleTypes[MAPLE_TYPE_COUNT];

#define DOUM_PALM_TYPE_COUNT 3
static uint32_t gameObjectType_doumPalmTypes[DOUM_PALM_TYPE_COUNT];
#define DWARF_BIRCH_TYPE_COUNT 3
static uint32_t gameObjectType_dwarfBirchTypes[DWARF_BIRCH_TYPE_COUNT];
#define SAGEBRUSH_TYPE_COUNT 3
static uint32_t gameObjectType_sagebrushTypes[SAGEBRUSH_TYPE_COUNT];
static uint32_t gameObjectType_argan;
static uint32_t gameObjectType_carob;
#define ALDER_TYPE_COUNT 2
static uint32_t gameObjectType_alderTypes[ALDER_TYPE_COUNT];
static uint32_t gameObjectType_poplar;
#define MANGROVE_TYPE_COUNT 2
static uint32_t gameObjectType_mangroveTypes[MANGROVE_TYPE_COUNT];
static uint32_t gameObjectType_oleander;
#define PLANE_TREE_TYPE_COUNT 2
static uint32_t gameObjectType_planeTreeTypes[PLANE_TREE_TYPE_COUNT];
static uint32_t gameObjectType_baldCypress;
static uint32_t gameObjectType_tamarisk;
static uint32_t gameObjectType_maritimePine;
static uint32_t gameObjectType_stonePine;
static uint32_t gameObjectType_spruce;
static uint32_t gameObjectType_chestnut;
static uint32_t gameObjectType_hazelBush;
static uint32_t gameObjectType_arcticWillow;
static uint32_t gameObjectType_saxaul;
static uint32_t gameObjectType_elephantGrass;
static uint32_t gameObjectType_thyme;
static uint32_t gameObjectType_agave;
static uint32_t gameObjectType_featherGrass;
static uint32_t gameObjectType_seaBuckthorn;
static uint32_t gameObjectType_syrianRue;
static uint32_t gameObjectType_angelica;
static uint32_t gameObjectType_ephedra;
static uint32_t gameObjectType_henna;
static uint32_t gameObjectType_myrrh;
static uint32_t gameObjectType_dragonsBlood;
static uint32_t gameObjectType_larch;
static uint32_t gameObjectType_cacao;
static uint32_t gameObjectType_papyrus;
static uint32_t gameObjectType_giantReed;
static uint32_t gameObjectType_groundFern;
static uint32_t gameObjectType_yarrow;
static uint32_t gameObjectType_gotuKola;
static uint32_t gameObjectType_plantain;
static uint32_t gameObjectType_peppermint;
static uint32_t gameObjectType_nettle;
static uint32_t gameObjectType_lemongrass;
static uint32_t gameObjectType_figTreeWild;
static uint32_t gameObjectType_lingonberryBush;
static uint32_t gameObjectType_cloudberryBush;
static uint32_t gameObjectType_mesquiteTree;
static uint32_t gameObjectType_grapevine;
static uint32_t gameObjectType_barley;
static uint32_t gameObjectType_watermelon;
static uint32_t gameObjectType_cattail;
static uint32_t gameObjectType_commonReed;
static uint32_t gameObjectType_bulrush;
static uint32_t gameObjectType_cordgrass;
static uint32_t gameObjectType_cottonGrass;

#define CACTUS_TYPE_COUNT 3
static uint32_t gameObjectType_cactusTypes[CACTUS_TYPE_COUNT];

static bool hasTypes = false;

void spBiomeInit(SPBiomeThreadState* threadState)
{
	biomeTag_tropical = threadState->getBiomeTag(threadState, "tropical");
	biomeTag_savanna = threadState->getBiomeTag(threadState, "savanna");
	biomeTag_rainforest = threadState->getBiomeTag(threadState, "rainforest");
	biomeTag_cliff = threadState->getBiomeTag(threadState, "cliff");
	biomeTag_river = threadState->getBiomeTag(threadState, "river");
	biomeTag_denseForest = threadState->getBiomeTag(threadState, "denseForest");
	biomeTag_mediumForest = threadState->getBiomeTag(threadState, "mediumForest");
	biomeTag_sparseForest = threadState->getBiomeTag(threadState, "sparseForest");
	biomeTag_verySparseForest = threadState->getBiomeTag(threadState, "verySparseForest");
	biomeTag_temperate = threadState->getBiomeTag(threadState, "temperate");
	biomeTag_polar = threadState->getBiomeTag(threadState, "polar");
	biomeTag_steppe = threadState->getBiomeTag(threadState, "steppe");
	biomeTag_tundra = threadState->getBiomeTag(threadState, "tundra");
	biomeTag_hot = threadState->getBiomeTag(threadState, "hot");
	biomeTag_coniferous = threadState->getBiomeTag(threadState, "coniferous");
	biomeTag_birch = threadState->getBiomeTag(threadState, "birch");
	biomeTag_temperatureWinterModerate = threadState->getBiomeTag(threadState, "temperatureWinterModerate");
	biomeTag_temperatureWinterCold = threadState->getBiomeTag(threadState, "temperatureWinterCold");
	biomeTag_temperatureWinterVeryCold = threadState->getBiomeTag(threadState, "temperatureWinterVeryCold");
	biomeTag_temperatureSummerHot = threadState->getBiomeTag(threadState, "temperatureSummerHot");
	biomeTag_temperatureSummerCold = threadState->getBiomeTag(threadState, "temperatureSummerCold");
	biomeTag_temperatureSummerVeryCold = threadState->getBiomeTag(threadState, "temperatureSummerVeryCold");
	biomeTag_temperatureSummerVeryHot = threadState->getBiomeTag(threadState, "temperatureSummerVeryHot");
	biomeTag_heavySnowSummer = threadState->getBiomeTag(threadState, "heavySnowSummer");
	biomeTag_drySummer = threadState->getBiomeTag(threadState, "drySummer");
	biomeTag_dryWinter = threadState->getBiomeTag(threadState, "dryWinter");
	biomeTag_desert = threadState->getBiomeTag(threadState, "desert");
	biomeTag_icecap = threadState->getBiomeTag(threadState, "icecap");
	biomeTag_dry = threadState->getBiomeTag(threadState, "dry");
	biomeTag_mediterraneanForest = threadState->getBiomeTag(threadState, "mediterraneanForest");
	biomeTag_subtropicalForest = threadState->getBiomeTag(threadState, "subtropicalForest");
	biomeTag_oakForest = threadState->getBiomeTag(threadState, "oakForest");
	biomeTag_mixedForest = threadState->getBiomeTag(threadState, "mixedForest");
	biomeTag_cloudForest = threadState->getBiomeTag(threadState, "cloudForest");
	biomeTag_aspenParkland = threadState->getBiomeTag(threadState, "aspenParkland");
	biomeTag_mediterraneanSteppe = threadState->getBiomeTag(threadState, "mediterraneanSteppe");
	biomeTag_oakSavanna = threadState->getBiomeTag(threadState, "oakSavanna");
	biomeTag_aridDesert = threadState->getBiomeTag(threadState, "aridDesert");
	biomeTag_lushSavanna = threadState->getBiomeTag(threadState, "lushSavanna");
	biomeTag_alpineTundra = threadState->getBiomeTag(threadState, "alpineTundra");
	biomeTag_subarctic = threadState->getBiomeTag(threadState, "subarctic");
	biomeTag_temperatureWinterHot = threadState->getBiomeTag(threadState, "temperatureWinterHot");
	biomeTag_temperatureWinterVeryHot = threadState->getBiomeTag(threadState, "temperatureWinterVeryHot");
	biomeTag_winterCool = threadState->getBiomeTag(threadState, "winterCool");
	biomeTag_dryRiver = threadState->getBiomeTag(threadState, "dryRiver");

	if(threadState->getGameObjectTypeIndex)
	{
		gameObjectType_pineTypes[0] = threadState->getGameObjectTypeIndex(threadState, "pine1");
		gameObjectType_pineTypes[1] = threadState->getGameObjectTypeIndex(threadState, "pine2");
		gameObjectType_pineTypes[2] = threadState->getGameObjectTypeIndex(threadState, "pine3");
		gameObjectType_pineTypes[3] = threadState->getGameObjectTypeIndex(threadState, "pine4");
		gameObjectType_pineTypes[4] = threadState->getGameObjectTypeIndex(threadState, "pineBig1");
		gameObjectType_pineBranch = threadState->getGameObjectTypeIndex(threadState, "pineBranch");

		gameObjectType_willowTypes[0] = threadState->getGameObjectTypeIndex(threadState, "willow1");
		gameObjectType_willowTypes[1] = threadState->getGameObjectTypeIndex(threadState, "willow2");
		gameObjectType_willowBranch = threadState->getGameObjectTypeIndex(threadState, "willowBranch");

		gameObjectType_broadleafTypes[0] = threadState->getGameObjectTypeIndex(threadState, "birch1");
		gameObjectType_broadleafTypes[1] = threadState->getGameObjectTypeIndex(threadState, "birch2");
		gameObjectType_broadleafTypes[2] = threadState->getGameObjectTypeIndex(threadState, "birch3");
		gameObjectType_broadleafTypes[3] = threadState->getGameObjectTypeIndex(threadState, "birch4");
		gameObjectType_broadleafTypes[4] = threadState->getGameObjectTypeIndex(threadState, "aspen1");
		gameObjectType_broadleafTypes[5] = threadState->getGameObjectTypeIndex(threadState, "aspen2");
		gameObjectType_broadleafTypes[6] = threadState->getGameObjectTypeIndex(threadState, "aspen3");
		gameObjectType_aspenBig = threadState->getGameObjectTypeIndex(threadState, "aspenBig1");

		gameObjectType_acaciaTypes[0] = threadState->getGameObjectTypeIndex(threadState, "acacia1");
		gameObjectType_acaciaTypes[1] = threadState->getGameObjectTypeIndex(threadState, "acacia3");
		gameObjectType_acacia2 = threadState->getGameObjectTypeIndex(threadState, "acacia2");
		gameObjectType_baobab = threadState->getGameObjectTypeIndex(threadState, "baobab1");
		gameObjectType_acaciaBranch = threadState->getGameObjectTypeIndex(threadState, "acaciaBranch");

		gameObjectType_kapokTypes[0] = threadState->getGameObjectTypeIndex(threadState, "kapok1");
		gameObjectType_kapokTypes[1] = threadState->getGameObjectTypeIndex(threadState, "kapok2");
		gameObjectType_kapokTypes[2] = threadState->getGameObjectTypeIndex(threadState, "kapok3");
		gameObjectType_kapokBig = threadState->getGameObjectTypeIndex(threadState, "kapokBig1");
		gameObjectType_kapokBranch = threadState->getGameObjectTypeIndex(threadState, "kapokBranch");
		gameObjectType_brazilNutTree = threadState->getGameObjectTypeIndex(threadState, "brazilNutTree");
		gameObjectType_mahoganyTypes[0] = threadState->getGameObjectTypeIndex(threadState, "mahogany1");
		gameObjectType_mahoganyTypes[1] = threadState->getGameObjectTypeIndex(threadState, "mahogany2");
		gameObjectType_banyanTypes[0] = threadState->getGameObjectTypeIndex(threadState, "banyan1");
		gameObjectType_banyanTypes[1] = threadState->getGameObjectTypeIndex(threadState, "banyan2");

		gameObjectType_rubberTreeTypes[0] = threadState->getGameObjectTypeIndex(threadState, "rubberTree1");
		gameObjectType_rubberTreeTypes[1] = threadState->getGameObjectTypeIndex(threadState, "rubberTree2");
		gameObjectType_rubberTreeTypes[2] = threadState->getGameObjectTypeIndex(threadState, "rubberTree3");
		gameObjectType_rubberTreeTypes[3] = threadState->getGameObjectTypeIndex(threadState, "rubberTree4");

		gameObjectType_oakTypes[0] = threadState->getGameObjectTypeIndex(threadState, "oak1");
		gameObjectType_oakTypes[1] = threadState->getGameObjectTypeIndex(threadState, "oak2");
		gameObjectType_oakTypes[2] = threadState->getGameObjectTypeIndex(threadState, "oak3");
		gameObjectType_oakTypes[3] = threadState->getGameObjectTypeIndex(threadState, "oak4");

		gameObjectType_oliveTreeTypes[0] = threadState->getGameObjectTypeIndex(threadState, "oliveTree");
		gameObjectType_oliveTreeTypes[1] = threadState->getGameObjectTypeIndex(threadState, "oliveTree2");
		gameObjectType_figTree = threadState->getGameObjectTypeIndex(threadState, "figTree");
		gameObjectType_cypress = threadState->getGameObjectTypeIndex(threadState, "cypress1");
		gameObjectType_juniperTypes[0] = threadState->getGameObjectTypeIndex(threadState, "juniper1");
		gameObjectType_juniperTypes[1] = threadState->getGameObjectTypeIndex(threadState, "juniper2");

		gameObjectType_bananaTree = threadState->getGameObjectTypeIndex(threadState, "bananaTree");
		gameObjectType_orangeTree = threadState->getGameObjectTypeIndex(threadState, "orangeTree");
		gameObjectType_peachTree = threadState->getGameObjectTypeIndex(threadState, "peachTree");
		gameObjectType_elderberryTree = threadState->getGameObjectTypeIndex(threadState, "elderberryTree");
		gameObjectType_appleTree = threadState->getGameObjectTypeIndex(threadState, "appleTree");
		gameObjectType_coconutTree = threadState->getGameObjectTypeIndex(threadState, "coconutTree");
		gameObjectType_bamboo = threadState->getGameObjectTypeIndex(threadState, "bamboo1");
		gameObjectType_smallBamboo = threadState->getGameObjectTypeIndex(threadState, "bamboo2");
		gameObjectType_bambooBranch = threadState->getGameObjectTypeIndex(threadState, "bambooBranch");

		gameObjectType_temperatePlantTypes[0] = threadState->getGameObjectTypeIndex(threadState, "raspberryBush");
		gameObjectType_temperatePlantTypes[1] = threadState->getGameObjectTypeIndex(threadState, "gooseberryBush");
		gameObjectType_temperatePlantTypes[2] = threadState->getGameObjectTypeIndex(threadState, "sunflower");
		gameObjectType_temperatePlantTypes[3] = threadState->getGameObjectTypeIndex(threadState, "beetrootPlant");
		gameObjectType_gingerPlant = threadState->getGameObjectTypeIndex(threadState, "gingerPlant");
		gameObjectType_turmericPlant = threadState->getGameObjectTypeIndex(threadState, "turmericPlant");
		gameObjectType_aloePlant = threadState->getGameObjectTypeIndex(threadState, "aloePlant");
		gameObjectType_garlicPlant = threadState->getGameObjectTypeIndex(threadState, "garlicPlant");
		gameObjectType_echinaceaPlant = threadState->getGameObjectTypeIndex(threadState, "echinaceaPlant");
		gameObjectType_marigoldPlant = threadState->getGameObjectTypeIndex(threadState, "marigoldPlant");
		gameObjectType_cropTypes[0] = threadState->getGameObjectTypeIndex(threadState, "wheatPlant");
		gameObjectType_cropTypes[1] = threadState->getGameObjectTypeIndex(threadState, "flaxPlant");
		gameObjectType_cropTypes[2] = threadState->getGameObjectTypeIndex(threadState, "pumpkinPlant");
		gameObjectType_cropTypes[3] = threadState->getGameObjectTypeIndex(threadState, "poppyPlant");
		gameObjectType_cropTypes[4] = gameObjectType_gingerPlant;
		gameObjectType_cropTypes[5] = gameObjectType_turmericPlant;
		gameObjectType_cropTypes[6] = gameObjectType_aloePlant;
		gameObjectType_cropTypes[7] = gameObjectType_garlicPlant;
		gameObjectType_cropTypes[8] = gameObjectType_echinaceaPlant;
		gameObjectType_cropTypes[9] = gameObjectType_marigoldPlant;

		gameObjectType_cycadTypes[0] = threadState->getGameObjectTypeIndex(threadState, "cycad1");
		gameObjectType_cycadTypes[1] = threadState->getGameObjectTypeIndex(threadState, "cycad2");
		gameObjectType_cycadTypes[2] = threadState->getGameObjectTypeIndex(threadState, "cycad3");
		gameObjectType_cycadTypes[3] = threadState->getGameObjectTypeIndex(threadState, "cycad4");

		gameObjectType_wildPalmTypes[0] = threadState->getGameObjectTypeIndex(threadState, "wildPalm1");
		gameObjectType_wildPalmTypes[1] = threadState->getGameObjectTypeIndex(threadState, "wildPalm2");
		gameObjectType_wildPalmTypes[2] = threadState->getGameObjectTypeIndex(threadState, "wildPalm3");

		gameObjectType_datePalmTypes[0] = threadState->getGameObjectTypeIndex(threadState, "datePalm1");
		gameObjectType_datePalmTypes[1] = threadState->getGameObjectTypeIndex(threadState, "datePalm2");
		gameObjectType_datePalmTypes[2] = threadState->getGameObjectTypeIndex(threadState, "datePalm3");

		gameObjectType_treeFernTypes[0] = threadState->getGameObjectTypeIndex(threadState, "treeFern1");
		gameObjectType_treeFernTypes[1] = threadState->getGameObjectTypeIndex(threadState, "treeFern2");
		gameObjectType_treeFernTypes[2] = threadState->getGameObjectTypeIndex(threadState, "treeFern3");
		gameObjectType_treeFernTypes[3] = threadState->getGameObjectTypeIndex(threadState, "treeFern4");

		gameObjectType_mapleTypes[0] = threadState->getGameObjectTypeIndex(threadState, "maple1");
		gameObjectType_mapleTypes[1] = threadState->getGameObjectTypeIndex(threadState, "maple2");
		gameObjectType_mapleTypes[2] = threadState->getGameObjectTypeIndex(threadState, "maple3");
		gameObjectType_mapleTypes[3] = threadState->getGameObjectTypeIndex(threadState, "maple4");

		gameObjectType_doumPalmTypes[0] = threadState->getGameObjectTypeIndex(threadState, "doumPalm1");
		gameObjectType_doumPalmTypes[1] = threadState->getGameObjectTypeIndex(threadState, "doumPalm2");
		gameObjectType_doumPalmTypes[2] = threadState->getGameObjectTypeIndex(threadState, "doumPalm3");
		gameObjectType_dwarfBirchTypes[0] = threadState->getGameObjectTypeIndex(threadState, "dwarfBirch1");
		gameObjectType_dwarfBirchTypes[1] = threadState->getGameObjectTypeIndex(threadState, "dwarfBirch2");
		gameObjectType_dwarfBirchTypes[2] = threadState->getGameObjectTypeIndex(threadState, "dwarfBirch3");
		gameObjectType_sagebrushTypes[0] = threadState->getGameObjectTypeIndex(threadState, "sagebrush1");
		gameObjectType_sagebrushTypes[1] = threadState->getGameObjectTypeIndex(threadState, "sagebrush2");
		gameObjectType_sagebrushTypes[2] = threadState->getGameObjectTypeIndex(threadState, "sagebrush3");
		gameObjectType_argan = threadState->getGameObjectTypeIndex(threadState, "arganTree");
		gameObjectType_carob = threadState->getGameObjectTypeIndex(threadState, "carobTree");
		gameObjectType_alderTypes[0] = threadState->getGameObjectTypeIndex(threadState, "alder1");
		gameObjectType_alderTypes[1] = threadState->getGameObjectTypeIndex(threadState, "alder2");
		gameObjectType_poplar = threadState->getGameObjectTypeIndex(threadState, "poplar1");
		gameObjectType_mangroveTypes[0] = threadState->getGameObjectTypeIndex(threadState, "mangrove1");
		gameObjectType_mangroveTypes[1] = threadState->getGameObjectTypeIndex(threadState, "mangrove2");
		gameObjectType_oleander = threadState->getGameObjectTypeIndex(threadState, "oleander1");
		gameObjectType_planeTreeTypes[0] = threadState->getGameObjectTypeIndex(threadState, "planeTree1");
		gameObjectType_planeTreeTypes[1] = threadState->getGameObjectTypeIndex(threadState, "planeTree2");
		gameObjectType_baldCypress = threadState->getGameObjectTypeIndex(threadState, "baldCypress1");
		gameObjectType_tamarisk = threadState->getGameObjectTypeIndex(threadState, "tamarisk1");
		gameObjectType_maritimePine = threadState->getGameObjectTypeIndex(threadState, "maritimePine1");
		gameObjectType_stonePine = threadState->getGameObjectTypeIndex(threadState, "stonePine1");
		gameObjectType_spruce = threadState->getGameObjectTypeIndex(threadState, "spruce1");
		gameObjectType_chestnut = threadState->getGameObjectTypeIndex(threadState, "chestnut1");
		gameObjectType_hazelBush = threadState->getGameObjectTypeIndex(threadState, "hazelBush");
		gameObjectType_arcticWillow = threadState->getGameObjectTypeIndex(threadState, "arcticWillow");
		gameObjectType_saxaul = threadState->getGameObjectTypeIndex(threadState, "saxaul1");
		gameObjectType_elephantGrass = threadState->getGameObjectTypeIndex(threadState, "elephantGrass");
		gameObjectType_thyme = threadState->getGameObjectTypeIndex(threadState, "thymePlant");
		gameObjectType_agave = threadState->getGameObjectTypeIndex(threadState, "agavePlant");
		gameObjectType_featherGrass = threadState->getGameObjectTypeIndex(threadState, "featherGrass");
		gameObjectType_seaBuckthorn = threadState->getGameObjectTypeIndex(threadState, "seaBuckthornBush");
		gameObjectType_syrianRue = threadState->getGameObjectTypeIndex(threadState, "syrianRuePlant");
		gameObjectType_angelica = threadState->getGameObjectTypeIndex(threadState, "angelicaPlant");
		gameObjectType_ephedra = threadState->getGameObjectTypeIndex(threadState, "ephedraBush");
		gameObjectType_henna = threadState->getGameObjectTypeIndex(threadState, "hennaBush");
		gameObjectType_myrrh = threadState->getGameObjectTypeIndex(threadState, "myrrhBush");
		gameObjectType_dragonsBlood = threadState->getGameObjectTypeIndex(threadState, "dragonsBloodTree");
		gameObjectType_larch = threadState->getGameObjectTypeIndex(threadState, "larch1");
		gameObjectType_cacao = threadState->getGameObjectTypeIndex(threadState, "cacaoTree");
		gameObjectType_papyrus = threadState->getGameObjectTypeIndex(threadState, "papyrus");
		gameObjectType_giantReed = threadState->getGameObjectTypeIndex(threadState, "giantReed");
		gameObjectType_groundFern = threadState->getGameObjectTypeIndex(threadState, "groundFern");
		gameObjectType_yarrow = threadState->getGameObjectTypeIndex(threadState, "yarrowPlant");
		gameObjectType_gotuKola = threadState->getGameObjectTypeIndex(threadState, "gotuKolaPlant");
		gameObjectType_plantain = threadState->getGameObjectTypeIndex(threadState, "plantainPlant");
		gameObjectType_peppermint = threadState->getGameObjectTypeIndex(threadState, "peppermintPlant");
		gameObjectType_nettle = threadState->getGameObjectTypeIndex(threadState, "nettlePlant");
		gameObjectType_lemongrass = threadState->getGameObjectTypeIndex(threadState, "lemongrassPlant");
		gameObjectType_figTreeWild = threadState->getGameObjectTypeIndex(threadState, "figTree");
		gameObjectType_lingonberryBush = threadState->getGameObjectTypeIndex(threadState, "lingonberryBush");
		gameObjectType_cloudberryBush = threadState->getGameObjectTypeIndex(threadState, "cloudberryBush");
		gameObjectType_mesquiteTree = threadState->getGameObjectTypeIndex(threadState, "mesquiteTree");
		gameObjectType_grapevine = threadState->getGameObjectTypeIndex(threadState, "grapevinePlant");
		gameObjectType_barley = threadState->getGameObjectTypeIndex(threadState, "barleyPlant");
		gameObjectType_watermelon = threadState->getGameObjectTypeIndex(threadState, "watermelonPlant");
		gameObjectType_cattail = threadState->getGameObjectTypeIndex(threadState, "cattail");
		gameObjectType_commonReed = threadState->getGameObjectTypeIndex(threadState, "commonReed");
		gameObjectType_bulrush = threadState->getGameObjectTypeIndex(threadState, "bulrush");
		gameObjectType_cordgrass = threadState->getGameObjectTypeIndex(threadState, "cordgrass");
		gameObjectType_cottonGrass = threadState->getGameObjectTypeIndex(threadState, "cottonGrass");
		gameObjectType_cactusTypes[0] = threadState->getGameObjectTypeIndex(threadState, "cactus1");
		gameObjectType_cactusTypes[1] = threadState->getGameObjectTypeIndex(threadState, "cactus2");
		gameObjectType_cactusTypes[2] = threadState->getGameObjectTypeIndex(threadState, "cactus3");

		hasTypes = true;
	}
}

static uint32_t randomInt(uint64_t faceUniqueID, uint32_t seed, uint32_t max)
{
	uint64_t x = faceUniqueID ^ ((uint64_t)seed * 0x9E3779B97F4A7C15ULL);
	x ^= x >> 33;
	x *= 0xFF51AFD7ED558CCDULL;
	x ^= x >> 33;
	x *= 0xC4CEB9FE1A85EC53ULL;
	x ^= x >> 33;
	return (uint32_t)(x % max);
}

static bool isInList(uint32_t type, uint32_t* list, int count)
{
	for(int i = 0; i < count; i++)
	{
		if(type == list[i])
		{
			return true;
		}
	}
	return false;
}

typedef struct BiomeInfo {
	bool tropical;
	bool savanna;
	bool rainforest;
	bool river;
	bool cliff;
	bool temperate;
	bool polar;
	bool steppe;
	bool tundra;
	bool hot;
	bool coniferous;
	bool birch;
	bool winterModerate;
	bool winterCold;
	bool winterVeryCold;
	bool winterCool;
	bool winterHot;
	bool summerHot;
	bool summerVeryHot;
	bool summerCold;
	bool summerVeryCold;
	bool heavySnowSummer;
	bool drySummer;
	bool dryWinter;
	bool desert;
	bool aridDesert;
	bool lushSavanna;
	bool icecap;
	bool dry;
	bool dryRiver;
	int forestDensity;
	double altitudeMeters;
	double riverDistance;
	double steepness;
	bool nearRiver;
	bool tropicalLatitude;
	bool beach;
	bool seaside;
	bool tidal;
	bool marsh;
	bool bambooGrove;
	double grove;
	int groveScale;
	int canopy;
	int shadePercent;
	int sunPercent;
	uint64_t standID;
	bool tropicalForest;
	bool mediterranean;
	bool subtropical;
	bool deciduous;
	bool coolSteppe;
	bool aspenParkland;
	bool mediterraneanSteppe;
	bool oakSavanna;
	bool mixedForest;
	bool cloudForest;
	bool subarctic;
} BiomeInfo;

static void getBiomeInfo(uint16_t* biomeTags, int tagCount, BiomeInfo* info)
{
	for(int i = 0; i < tagCount; i++)
	{
		uint16_t tag = biomeTags[i];
		if(tag == biomeTag_tropical) info->tropical = true;
		else if(tag == biomeTag_savanna) info->savanna = true;
		else if(tag == biomeTag_rainforest) info->rainforest = true;
		else if(tag == biomeTag_river) info->river = true;
		else if(tag == biomeTag_cliff) info->cliff = true;
		else if(tag == biomeTag_temperate) info->temperate = true;
		else if(tag == biomeTag_polar) info->polar = true;
		else if(tag == biomeTag_steppe) info->steppe = true;
		else if(tag == biomeTag_tundra) info->tundra = true;
		else if(tag == biomeTag_hot) info->hot = true;
		else if(tag == biomeTag_coniferous) info->coniferous = true;
		else if(tag == biomeTag_birch) info->birch = true;
		else if(tag == biomeTag_temperatureWinterModerate) info->winterModerate = true;
		else if(tag == biomeTag_temperatureWinterCold) info->winterCold = true;
		else if(tag == biomeTag_temperatureWinterVeryCold) info->winterVeryCold = true;
		else if(tag == biomeTag_temperatureSummerHot) info->summerHot = true;
		else if(tag == biomeTag_temperatureSummerVeryHot)
		{
			info->summerHot = true;
			info->summerVeryHot = true;
		}
		else if(tag == biomeTag_temperatureSummerCold) info->summerCold = true;
		else if(tag == biomeTag_temperatureSummerVeryCold) info->summerVeryCold = true;
		else if(tag == biomeTag_heavySnowSummer) info->heavySnowSummer = true;
		else if(tag == biomeTag_drySummer) info->drySummer = true;
		else if(tag == biomeTag_dryWinter) info->dryWinter = true;
		else if(tag == biomeTag_desert) info->desert = true;
		else if(tag == biomeTag_aridDesert) info->aridDesert = true;
		else if(tag == biomeTag_lushSavanna) info->lushSavanna = true;
		else if(tag == biomeTag_icecap) info->icecap = true;
		else if(tag == biomeTag_dry) info->dry = true;
		else if(tag == biomeTag_subarctic) info->subarctic = true;
		else if(tag == biomeTag_temperatureWinterHot || tag == biomeTag_temperatureWinterVeryHot) info->winterHot = true;
		else if(tag == biomeTag_winterCool) info->winterCool = true;
		else if(tag == biomeTag_dryRiver) info->dryRiver = true;
		else if(tag == biomeTag_denseForest) info->forestDensity = 4;
		else if(tag == biomeTag_mediumForest) info->forestDensity = 3;
		else if(tag == biomeTag_sparseForest) info->forestDensity = 2;
		else if(tag == biomeTag_verySparseForest) info->forestDensity = 1;
	}
}

static void setForestTypes(BiomeInfo* info)
{
	if(info->temperate && info->drySummer && info->winterVeryCold && info->forestDensity > 0)
	{
		info->coniferous = true;
	}
	info->tropicalForest = info->tropical && (info->savanna || info->rainforest);
	info->mediterranean = info->temperate && info->drySummer && !info->coniferous && !info->winterVeryCold;
	info->subtropical = info->temperate && info->winterModerate && info->summerHot && !info->drySummer;
	info->deciduous = info->temperate && info->birch && !info->coniferous && !info->drySummer;
	info->coolSteppe = info->steppe && !info->hot && !info->polar;
	info->aspenParkland = info->coolSteppe && info->winterVeryCold;
	info->mediterraneanSteppe = info->coolSteppe && info->winterModerate;
	info->oakSavanna = info->coolSteppe && !info->winterVeryCold && !info->winterModerate;
	info->mixedForest = info->temperate && info->birch && info->coniferous && !info->drySummer;
	info->cloudForest = info->tropicalLatitude && !info->tropical && info->temperate && !info->drySummer && !info->winterVeryCold && info->altitudeMeters > 1500.0;
}

void spBiomeGetTagsForPoint(SPBiomeThreadState* threadState,
	uint16_t* tagsOut,
	int* tagCountOut,
	SPVec3 pointNormal,
	SPVec3 noiseLoc,
	double altitude,
	double steepness,
	double riverDistance,
	double temperatureSummer,
	double temperatureWinter,
	double rainfallSummer,
	double rainfallWinter)
{
	int tagCount = *tagCountOut;

	BiomeInfo info = {0};
	getBiomeInfo(tagsOut, tagCount, &info);
	info.altitudeMeters = SP_PRERENDER_TO_METERS(altitude);
	info.tropicalLatitude = fabs(pointNormal.y) < 0.4;
	bool hadConiferous = info.coniferous;
	setForestTypes(&info);

	if(info.tropical)
	{
		int keptCount = 0;
		for(int i = 0; i < tagCount; i++)
		{
			if(tagsOut[i] != biomeTag_coniferous)
			{
				tagsOut[keptCount++] = tagsOut[i];
			}
		}
		tagCount = keptCount;
	}

	if(tagCount + 4 <= BIOME_MAX_BIOME_TAG_COUNT_PER_VERTEX)
	{
		double temperatureThreshold = (temperatureSummer + temperatureWinter) * 10.0;
		temperatureThreshold = spMix(temperatureThreshold, temperatureThreshold + 200.0, (rainfallSummer - rainfallWinter * 2.3) * 0.00001);
		if(info.winterCold && temperatureWinter >= 5.0)
		{
			tagsOut[tagCount++] = biomeTag_winterCool;
		}
		if(riverDistance < 0.015 && rainfallSummer + rainfallWinter < temperatureThreshold)
		{
			tagsOut[tagCount++] = biomeTag_dryRiver;
		}
		if(info.coniferous && !hadConiferous)
		{
			tagsOut[tagCount++] = biomeTag_coniferous;
		}
		if(info.forestDensity > 0)
		{
			if(info.mediterranean)
			{
				tagsOut[tagCount++] = biomeTag_mediterraneanForest;
			}
			else if(info.subtropical)
			{
				tagsOut[tagCount++] = biomeTag_subtropicalForest;
			}
			else if(info.deciduous)
			{
				tagsOut[tagCount++] = biomeTag_oakForest;
			}
			else if(info.mixedForest)
			{
				tagsOut[tagCount++] = biomeTag_mixedForest;
			}
			if(info.cloudForest)
			{
				tagsOut[tagCount++] = biomeTag_cloudForest;
			}
		}
		if(info.aspenParkland)
		{
			tagsOut[tagCount++] = biomeTag_aspenParkland;
		}
		else if(info.mediterraneanSteppe)
		{
			tagsOut[tagCount++] = biomeTag_mediterraneanSteppe;
		}
		else if(info.oakSavanna)
		{
			tagsOut[tagCount++] = biomeTag_oakSavanna;
		}
		if(info.desert)
		{
			SPVec3 riverNoiseLoc = spVec3Mul(noiseLoc, 802.0);
			double riverRainfall = (1.0 - pow(spMax(riverDistance - 0.01, 0.0), 0.1)) * (1.0 + spNoiseGet(threadState->spNoise1, riverNoiseLoc, 2)) * 500.0;
			if(rainfallSummer + rainfallWinter + riverRainfall < temperatureThreshold * 0.2)
			{
				tagsOut[tagCount++] = biomeTag_aridDesert;
			}
		}
		if(info.savanna)
		{
			SPVec3 lushLoc = spVec3Mul(noiseLoc, 30000.0);
			if(rainfallSummer + rainfallWinter + spNoiseGet(threadState->spNoise1, lushLoc, 2) * 300.0 > 1200.0)
			{
				tagsOut[tagCount++] = biomeTag_lushSavanna;
			}
		}
		if(info.tundra && info.tropicalLatitude)
		{
			tagsOut[tagCount++] = biomeTag_alpineTundra;
		}
		if(info.temperate && info.winterVeryCold && temperatureSummer < 15.0 && !info.drySummer && !info.tropicalLatitude)
		{
			tagsOut[tagCount++] = biomeTag_subarctic;
		}
	}

	*tagCountOut = tagCount;
}

#define ADD_OBJECT(__addType__)\
if(addedCount >= BIOME_MAX_GAME_OBJECT_COUNT_PER_SUBDIVISION)\
{\
	return addedCount;\
}\
types[addedCount++] = __addType__;

static uint64_t getStandID(SPBiomeThreadState* threadState, SPVec3 noiseLoc)
{
	SPVec3 standLoc = spVec3Mul(noiseLoc, 25000.0);
	SPVec3 offsetLoc = spVec3Mul(noiseLoc, 100000.0);
	double offset = spNoiseGet(threadState->spNoise2, offsetLoc, 2) * 0.6;
	uint64_t x = (uint64_t)(standLoc.x + offset);
	uint64_t y = (uint64_t)(standLoc.y + offset);
	uint64_t z = (uint64_t)(standLoc.z + offset);
	return (x * 73856093) ^ (y * 19349663) ^ (z * 83492791);
}

static uint32_t getStandRoll(uint64_t standID, uint64_t faceUniqueID, uint32_t seed, int i, uint32_t max)
{
	if(randomInt(faceUniqueID, 1195 + i, 10) < 6)
	{
		return randomInt(standID, seed, max);
	}
	return randomInt(faceUniqueID, seed + i, max);
}

static void setGrove(SPBiomeThreadState* threadState, BiomeInfo* info, SPVec3 noiseLoc)
{
	info->groveScale = 1;
	info->shadePercent = 100;
	info->sunPercent = 100;
	if(!info->temperate && !info->tundra && !info->coolSteppe)
	{
		return;
	}
	SPVec3 groveLoc = spVec3Mul(noiseLoc, 45000.0);
	info->grove = spNoiseGet(threadState->spNoise2, groveLoc, 2);
	if(info->temperate && info->forestDensity == 4)
	{
		info->sunPercent = 35;
	}
	if(info->nearRiver)
	{
		return;
	}
	if(info->temperate && info->forestDensity == 3)
	{
		info->canopy = 6;
		if(info->grove < -0.14)
		{
			info->canopy = 3;
			info->shadePercent = 50;
			info->sunPercent = 150;
		}
		else if(info->grove > 0.14)
		{
			info->canopy = 9;
			info->shadePercent = 150;
			info->sunPercent = 50;
		}
	}
	else if(info->forestDensity < 3)
	{
		if(info->forestDensity == 1 && !info->coolSteppe)
		{
			info->groveScale = info->grove > 0.2 ? 6 : 0;
		}
		else
		{
			info->groveScale = info->grove > 0.14 ? 4 : 0;
		}
		info->shadePercent = info->groveScale * 100;
		info->sunPercent = info->groveScale == 0 ? 133 : 0;
	}
}

static int addSavanna(SPBiomeThreadState* threadState, uint32_t* types, int addedCount, BiomeInfo* info, SPVec3 noiseLoc, uint64_t faceUniqueID, int level)
{
	SPVec3 clumpLoc = spVec3Mul(noiseLoc, 250000.0);
	double clump = spNoiseGet(threadState->spNoise1, clumpLoc, 2);

	if(level == SP_SUBDIVISIONS - 6)
	{
		int treeCount = 0;
		switch(info->forestDensity)
		{
		case 1:
			treeCount = (randomInt(faceUniqueID, 1302, info->lushSavanna ? 4 : 3) == 0 ? 1 : 0);
			break;
		case 2:
			treeCount = randomInt(faceUniqueID, 1302, 3);
			break;
		case 3:
			treeCount = randomInt(faceUniqueID, 1302, 3) + 1;
			break;
		case 4:
			treeCount = randomInt(faceUniqueID, 1302, 3) + 2;
			break;
		}
		if(info->forestDensity <= 2 && !info->nearRiver)
		{
			if(clump < -0.14)
			{
				treeCount /= 2;
			}
			else if(clump > 0.14)
			{
				treeCount *= 2;
			}
		}
		if(info->riverDistance < 0.008 || info->tidal || (info->forestDensity >= 3 && clump < -0.25))
		{
			treeCount = 0;
		}
		else if(info->riverDistance < 0.02)
		{
			if(treeCount > 1)
			{
				treeCount = 1;
			}
		}
		else if(clump > 0.35 && info->forestDensity == 3)
		{
			treeCount += 1;
		}
		if(info->forestDensity >= 2 && info->riverDistance >= 0.02 && clump > 0.14 && info->altitudeMeters > 1.5 && info->altitudeMeters < 1200.0 && randomInt(faceUniqueID, 1321, 2) == 0)
		{
			ADD_OBJECT(gameObjectType_banyanTypes[randomInt(faceUniqueID, 1322, BANYAN_TYPE_COUNT)]);
			treeCount = 0;
		}
		for(int i = 0; i < treeCount; i++)
		{
			ADD_OBJECT(randomInt(faceUniqueID, 1303 + i, 3) == 0 ? gameObjectType_acacia2 : gameObjectType_acaciaTypes[randomInt(faceUniqueID, 1309 + i, ACACIA_TYPE_COUNT)]);
		}
	}
	else if(level == SP_SUBDIVISIONS - 4)
	{
		if(clump > 0.0 && randomInt(faceUniqueID, 1304, 10) == 0)
		{
			if(randomInt(faceUniqueID, 1307, 2) == 0)
			{
				if(info->riverDistance >= 0.008 && !info->tidal)
				{
					ADD_OBJECT(gameObjectType_acacia2);
				}
			}
			else if(!info->bambooGrove && info->riverDistance >= 0.008 && info->altitudeMeters < 2000.0)
			{
				int cycadCount = randomInt(faceUniqueID, 1310, 3) + 1;
				for(int i = 0; i < cycadCount; i++)
				{
					ADD_OBJECT(gameObjectType_cycadTypes[randomInt(faceUniqueID, 1308 + i, CYCAD_TYPE_COUNT)]);
				}
			}
		}
	}
	else if(level == SP_SUBDIVISIONS - 3)
	{
		bool dampGround = info->lushSavanna ? info->steepness <= 0.3 : info->nearRiver;
		uint32_t plantChance = 12;
		if(!dampGround)
		{
			plantChance = info->lushSavanna ? 40 : (info->steepness > 0.3 ? 12 : 24);
		}
		if(!info->tidal && randomInt(faceUniqueID, 1305, plantChance) == 0)
		{
			int plantCount = randomInt(faceUniqueID, 1306, 3) + 2;
			for(int i = 0; i < plantCount; i++)
			{
				if(dampGround)
				{
					ADD_OBJECT(randomInt(faceUniqueID, 1341, 3) == 0 ? gameObjectType_gingerPlant : gameObjectType_turmericPlant);
				}
				else
				{
					ADD_OBJECT(gameObjectType_aloePlant);
				}
			}
		}
	}
	return addedCount;
}

static bool isBrazilNutGrove(SPBiomeThreadState* threadState, BiomeInfo* info, SPVec3 noiseLoc)
{
	if(!info->summerHot || info->riverDistance < 0.02 || info->altitudeMeters < 6.0 || info->altitudeMeters > 600.0 || info->steepness > 0.5)
	{
		return false;
	}
	SPVec3 groveLoc = spVec3Mul(noiseLoc, 15000.0);
	return spNoiseGet(threadState->spNoise1, groveLoc, 2) > 0.25;
}

static int addGalleryForest(SPBiomeThreadState* threadState, uint32_t* types, int addedCount, BiomeInfo* info, SPVec3 noiseLoc, uint64_t faceUniqueID, int level)
{
	if(level != SP_SUBDIVISIONS - 6)
	{
		return addedCount;
	}
	int treeCount = 0;
	if(info->riverDistance < 0.008)
	{
		treeCount = randomInt(faceUniqueID, 6101, 3) + 2;
	}
	else if(info->riverDistance < 0.02)
	{
		treeCount = randomInt(faceUniqueID, 6101, 3);
	}
	else if(info->forestDensity >= 3 || info->lushSavanna)
	{
		SPVec3 patchLoc = spVec3Mul(noiseLoc, 60000.0);
		if(spNoiseGet(threadState->spNoise1, patchLoc, 2) > (info->lushSavanna ? 0.14 : 0.45))
		{
			treeCount = randomInt(faceUniqueID, 6101, 3) + 1;
			if(info->lushSavanna && randomInt(faceUniqueID, 6111, 3) != 0 && isBrazilNutGrove(threadState, info, noiseLoc))
			{
				ADD_OBJECT(gameObjectType_brazilNutTree);
				treeCount--;
			}
		}
	}
	bool tidal = info->tidal;
	bool highland = info->altitudeMeters > 1500.0;
	if(treeCount > 0 && !tidal && info->altitudeMeters < 900.0 && info->steepness <= 0.5 && randomInt(faceUniqueID, 6121, 16) == 0)
	{
		ADD_OBJECT(gameObjectType_kapokBig);
		treeCount--;
	}
	bool banyan = false;
	for(int i = 0; i < treeCount; i++)
	{
		uint32_t roll = randomInt(faceUniqueID, 6102 + i, 20);
		if(roll < 6 && !banyan && !tidal && info->altitudeMeters < 1200.0)
		{
			ADD_OBJECT(gameObjectType_banyanTypes[randomInt(faceUniqueID, 6202 + i, BANYAN_TYPE_COUNT)]);
			banyan = true;
		}
		else if(roll >= 11 && roll < 14)
		{
			if(info->lushSavanna)
			{
				ADD_OBJECT(gameObjectType_wildPalmTypes[randomInt(faceUniqueID, 6302 + i, WILD_PALM_TYPE_COUNT)]);
			}
			else if(info->altitudeMeters < 1200.0)
			{
				ADD_OBJECT(gameObjectType_doumPalmTypes[randomInt(faceUniqueID, 6302 + i, DOUM_PALM_TYPE_COUNT)]);
			}
		}
		else if(tidal || highland)
		{
			continue;
		}
		else if(roll < 11 || info->steepness > 0.7 || info->altitudeMeters > 1200.0 || (info->altitudeMeters > 900.0 && randomInt(faceUniqueID, 6131 + i, 2) == 0))
		{
			if(info->altitudeMeters > 1200.0 && randomInt(faceUniqueID, 6141 + i, 2) == 0)
			{
				continue;
			}
			ADD_OBJECT(gameObjectType_mahoganyTypes[randomInt(faceUniqueID, 9601 + i, MAHOGANY_TYPE_COUNT)]);
		}
		else
		{
			ADD_OBJECT(gameObjectType_kapokTypes[randomInt(faceUniqueID, 6402 + i, KAPOK_TYPE_COUNT)]);
		}
	}
	return addedCount;
}

static int addRainforest(SPBiomeThreadState* threadState, uint32_t* types, int addedCount, BiomeInfo* info, SPVec3 noiseLoc, uint64_t faceUniqueID, int level)
{
	bool tidal = info->tidal;
	if(level == SP_SUBDIVISIONS - 7)
	{
		if(info->forestDensity >= 2 && isBrazilNutGrove(threadState, info, noiseLoc))
		{
			int treeCount = randomInt(faceUniqueID, 2311, info->forestDensity == 2 ? 2 : 3) + 1;
			for(int i = 0; i < treeCount; i++)
			{
				ADD_OBJECT(gameObjectType_brazilNutTree);
			}
		}
		else if(info->forestDensity >= 2 && !tidal && info->altitudeMeters < 900.0 && info->steepness <= 0.5)
		{
			uint32_t chance = info->forestDensity == 2 ? 20 : 10;
			if(info->riverDistance < 0.02)
			{
				chance = 4;
			}
			if(randomInt(faceUniqueID, 2301, chance) == 0)
			{
				ADD_OBJECT(gameObjectType_kapokBig);
			}
		}
	}
	else if(level == SP_SUBDIVISIONS - 6)
	{
		int treeCount = 0;
		int palmCount = 0;
		switch(info->forestDensity)
		{
		case 1:
			treeCount = (randomInt(faceUniqueID, 2302, 8) == 0 ? 1 : 0);
			break;
		case 2:
			treeCount = randomInt(faceUniqueID, 2302, 3) + 1;
			palmCount = (randomInt(faceUniqueID, 2303, 3) == 0 ? 1 : 0);
			break;
		case 3:
			treeCount = randomInt(faceUniqueID, 2302, 4) + 3;
			palmCount = randomInt(faceUniqueID, 2303, 3);
			break;
		case 4:
			treeCount = randomInt(faceUniqueID, 2302, 6) + 8;
			palmCount = randomInt(faceUniqueID, 2303, 3) + 2;
			break;
		}
		uint32_t palmStand = randomInt(info->standID, 2351, 3);
		if(palmStand == 0)
		{
			palmCount *= 2;
		}
		else if(palmStand == 2)
		{
			palmCount = 0;
		}
		if(info->river)
		{
			palmCount += 1;
		}
		if(tidal || info->altitudeMeters > 1500.0)
		{
			palmCount = 0;
		}
		else if(info->altitudeMeters > 900.0)
		{
			palmCount /= 2;
		}
		if(info->forestDensity == 1 && !tidal && randomInt(faceUniqueID, 2331, 3) == 0)
		{
			ADD_OBJECT(gameObjectType_acaciaTypes[randomInt(faceUniqueID, 2332, ACACIA_TYPE_COUNT)]);
		}
		if(treeCount > 0 && !tidal && info->altitudeMeters < 1200.0 && randomInt(faceUniqueID, 2325, (info->forestDensity == 3 || info->nearRiver) ? 2 : 3) == 0)
		{
			ADD_OBJECT(gameObjectType_banyanTypes[randomInt(faceUniqueID, 2324, BANYAN_TYPE_COUNT)]);
			treeCount--;
		}
		uint32_t kapokShare = 5;
		if(info->riverDistance < 0.02)
		{
			kapokShare = 6;
		}
		else if(info->forestDensity == 4)
		{
			kapokShare = 4;
		}
		for(int i = 0; i < treeCount; i++)
		{
			uint32_t roll = randomInt(faceUniqueID, 1196 + i, 10) < 4 ? randomInt(info->standID, 2314, 8) : randomInt(faceUniqueID, 2314 + i, 8);
			bool kapok = roll < kapokShare;
			if(kapok && tidal)
			{
				continue;
			}
			if(kapok && (info->steepness > 0.7 || info->altitudeMeters > 1200.0 || (info->altitudeMeters > 900.0 && randomInt(faceUniqueID, 2341 + i, 2) == 0)))
			{
				kapok = false;
			}
			if(kapok)
			{
				ADD_OBJECT(gameObjectType_kapokTypes[randomInt(faceUniqueID, 2304 + i, KAPOK_TYPE_COUNT)]);
			}
			else if(tidal)
			{
				continue;
			}
			else if(info->altitudeMeters > 1500.0 || (info->altitudeMeters > 1200.0 && randomInt(faceUniqueID, 2361 + i, 2) == 0) || (info->forestDensity == 4 && info->riverDistance >= 0.02 && randomInt(faceUniqueID, 2371 + i, 4) == 0))
			{
				ADD_OBJECT(gameObjectType_rubberTreeTypes[randomInt(faceUniqueID, 2381 + i, RUBBER_TREE_TYPE_COUNT)]);
			}
			else
			{
				ADD_OBJECT(gameObjectType_mahoganyTypes[randomInt(faceUniqueID, 9611 + i, MAHOGANY_TYPE_COUNT)]);
			}
		}
		for(int i = 0; i < palmCount; i++)
		{
			ADD_OBJECT(gameObjectType_wildPalmTypes[randomInt(faceUniqueID, 2404 + i, WILD_PALM_TYPE_COUNT)]);
		}
	}
	else if(level == SP_SUBDIVISIONS - 4)
	{
		int treeCount = 0;
		switch(info->forestDensity)
		{
		case 2:
			treeCount = randomInt(faceUniqueID, 2501, 3);
			break;
		case 3:
			treeCount = randomInt(faceUniqueID, 2501, 2) + 1;
			break;
		case 4:
			treeCount = randomInt(faceUniqueID, 2501, 3) + 1;
			break;
		}
		for(int i = 0; i < treeCount; i++)
		{
			uint32_t roll = randomInt(faceUniqueID, 2502 + i, 20);
			uint32_t fernRolls = 0;
			if(info->altitudeMeters > 1500.0)
			{
				fernRolls = 7;
			}
			else if(info->altitudeMeters > 900.0)
			{
				fernRolls = 5;
			}
			else if(info->altitudeMeters > 600.0)
			{
				fernRolls = 2;
			}
			else if(info->nearRiver && !tidal)
			{
				fernRolls = 1;
			}
			if(roll < fernRolls)
			{
				ADD_OBJECT(gameObjectType_treeFernTypes[randomInt(faceUniqueID, 2902 + i, TREE_FERN_TYPE_COUNT)]);
			}
			else if(roll < 8)
			{
				if(!tidal)
				{
					ADD_OBJECT(gameObjectType_rubberTreeTypes[randomInt(faceUniqueID, 2602 + i, RUBBER_TREE_TYPE_COUNT)]);
				}
			}
			else if(roll >= (uint32_t)(info->forestDensity == 2 ? 18 : 19))
			{
				if(!info->bambooGrove && !tidal && info->altitudeMeters < 2000.0)
				{
					ADD_OBJECT(gameObjectType_cycadTypes[randomInt(faceUniqueID, 2802 + i, CYCAD_TYPE_COUNT)]);
				}
			}
			else if(roll >= 14 && roll < (uint32_t)(info->forestDensity == 4 ? 16 : 17))
			{
				if(!tidal && info->altitudeMeters < 1800.0)
				{
					ADD_OBJECT(gameObjectType_bananaTree);
				}
			}
			else if(roll == 17 && info->nearRiver && !tidal && info->altitudeMeters < 1800.0)
			{
				ADD_OBJECT(gameObjectType_bananaTree);
			}
			else if(roll >= 10 && roll < 14 && info->altitudeMeters <= 1500.0)
			{
				ADD_OBJECT(gameObjectType_wildPalmTypes[randomInt(faceUniqueID, 2702 + i, WILD_PALM_TYPE_COUNT)]);
			}
		}
	}
	else if(level == SP_SUBDIVISIONS - 3)
	{
		if(!tidal && info->altitudeMeters < 2500.0 && randomInt(faceUniqueID, 2901, 12) == 0)
		{
			uint32_t plantType = gameObjectType_gingerPlant;
			if(info->forestDensity < 4 && info->altitudeMeters < 1800.0 && randomInt(faceUniqueID, 2902, 3) == 0)
			{
				plantType = gameObjectType_turmericPlant;
			}
			int plantCount = randomInt(faceUniqueID, 2903, 3) + 2;
			for(int i = 0; i < plantCount; i++)
			{
				ADD_OBJECT(plantType);
			}
		}
	}
	return addedCount;
}

static int addSubtropical(uint32_t* types, int addedCount, BiomeInfo* info, uint64_t faceUniqueID, int level)
{
	if(level == SP_SUBDIVISIONS - 4)
	{
		if(!info->bambooGrove && randomInt(faceUniqueID, 3311, 30) == 0)
		{
			int cycadCount = randomInt(faceUniqueID, 3313, 2) + 2;
			for(int i = 0; i < cycadCount; i++)
			{
				ADD_OBJECT(gameObjectType_cycadTypes[randomInt(faceUniqueID, 3312 + i * 10, CYCAD_TYPE_COUNT)]);
			}
		}
		if(info->altitudeMeters < 600.0 && !info->beach && randomInt(faceUniqueID, 3321, 60) == 0)
		{
			int palmCount = randomInt(faceUniqueID, 3322, 2) + 1;
			for(int i = 0; i < palmCount; i++)
			{
				ADD_OBJECT(gameObjectType_wildPalmTypes[randomInt(faceUniqueID, 3323 + i, WILD_PALM_TYPE_COUNT)]);
			}
		}
		if(info->nearRiver && info->altitudeMeters < 1000.0 && !info->beach && !info->tidal && randomInt(faceUniqueID, 3351, 24) == 0)
		{
			int bananaCount = randomInt(faceUniqueID, 3352, 2) + 2;
			for(int i = 0; i < bananaCount; i++)
			{
				ADD_OBJECT(gameObjectType_bananaTree);
			}
		}
		if(info->bambooGrove)
		{
			int bambooCount = randomInt(faceUniqueID, 3302, 4) + info->forestDensity + 2;
			for(int i = 0; i < bambooCount; i++)
			{
				ADD_OBJECT(gameObjectType_bamboo);
			}
		}
	}
	else if(level == SP_SUBDIVISIONS - 3)
	{
		if(info->river && info->bambooGrove)
		{
			int bambooCount = randomInt(faceUniqueID, 3304, 3) + 2;
			for(int i = 0; i < bambooCount; i++)
			{
				ADD_OBJECT(gameObjectType_smallBamboo);
			}
		}
		if(!info->beach && !info->tidal && info->altitudeMeters > 1.5)
		{
			if((int)randomInt(faceUniqueID, 3331, 4800) < info->shadePercent)
			{
				int gingerCount = randomInt(faceUniqueID, 3332, 3) + 2;
				for(int i = 0; i < gingerCount; i++)
				{
					ADD_OBJECT(gameObjectType_gingerPlant);
				}
			}
			if(info->altitudeMeters < 1800.0 && randomInt(faceUniqueID, 3341, 48) == 0)
			{
				int turmericCount = randomInt(faceUniqueID, 3342, 3) + 2;
				for(int i = 0; i < turmericCount; i++)
				{
					ADD_OBJECT(gameObjectType_turmericPlant);
				}
			}
		}
	}
	return addedCount;
}

static uint32_t getRiversideTree(BiomeInfo* info, uint64_t faceUniqueID, int i)
{
	uint32_t planeChance = 0;
	if(info->winterModerate || info->mediterranean)
	{
		planeChance = (info->riverDistance >= 0.008 && !info->mediterranean && !info->mediterraneanSteppe) ? 3 : 6;
	}
	else if(info->winterCold && info->summerHot && !info->drySummer)
	{
		planeChance = 4;
	}
	if(randomInt(faceUniqueID, 3204 + i, 12) < planeChance)
	{
		return gameObjectType_planeTreeTypes[randomInt(faceUniqueID, 9741 + i, PLANE_TREE_TYPE_COUNT)];
	}
	uint32_t alderChance = 70;
	if(info->hot)
	{
		alderChance = 0;
	}
	else if(info->summerHot)
	{
		alderChance = 20;
	}
	else if(info->drySummer || info->winterModerate)
	{
		alderChance = 40;
	}
	if(randomInt(faceUniqueID, 3207 + i, 100) >= alderChance)
	{
		if(info->winterCold && info->summerHot && !info->drySummer && info->altitudeMeters < 200.0 + randomInt(faceUniqueID, 3211 + i, 300))
		{
			uint32_t cypressRolls = info->riverDistance < 0.008 ? 5 : 2;
			if(!info->winterCool)
			{
				cypressRolls = info->riverDistance < 0.008 ? 2 : 0;
			}
			if(randomInt(faceUniqueID, 3209 + i, 8) < cypressRolls)
			{
				return gameObjectType_baldCypress;
			}
		}
		return gameObjectType_poplar;
	}
	if(info->riverDistance >= 0.008 && (info->drySummer || randomInt(faceUniqueID, 3208 + i, 2) == 0))
	{
		return 0;
	}
	return gameObjectType_alderTypes[randomInt(faceUniqueID, 3206 + i, ALDER_TYPE_COUNT)];
}

static uint32_t getMediterraneanOlive(BiomeInfo* info, uint64_t faceUniqueID, int i)
{
	if(info->altitudeMeters > 1000.0 + randomInt(faceUniqueID, 4351 + i, 300))
	{
		return gameObjectType_juniperTypes[randomInt(faceUniqueID, 9631 + i, JUNIPER_TYPE_COUNT)];
	}
	if(!info->winterModerate && !info->winterCool)
	{
		return gameObjectType_oakTypes[randomInt(faceUniqueID, 4502 + i, OAK_TYPE_COUNT)];
	}
	return gameObjectType_oliveTreeTypes[randomInt(faceUniqueID, 9621 + i, OLIVE_TREE_TYPE_COUNT)];
}

static uint32_t getMediterraneanTree(BiomeInfo* info, uint64_t faceUniqueID, int i)
{
	if(info->river && randomInt(faceUniqueID, 4361 + i, 4) == 0)
	{
		return gameObjectType_willowTypes[randomInt(faceUniqueID, 1161 + i, WILLOW_TYPE_COUNT)];
	}
	if(info->nearRiver && randomInt(faceUniqueID, 4311 + i, 2) == 0)
	{
		uint32_t type = getRiversideTree(info, faceUniqueID, i);
		if(type)
		{
			return type;
		}
	}
	if(info->seaside)
	{
		uint32_t seasideRoll = getStandRoll(info->standID, faceUniqueID, 4321, i, 10);
		if(seasideRoll < 2)
		{
			return gameObjectType_maritimePine;
		}
		if(seasideRoll < 5)
		{
			return gameObjectType_stonePine;
		}
	}
	if(info->forestDensity == 1 && info->winterModerate && info->riverDistance >= 0.008 && info->altitudeMeters < 1300.0 && randomInt(faceUniqueID, 4331 + i, 10) == 0)
	{
		return gameObjectType_argan;
	}
	bool riverBank = info->riverDistance < 0.008;
	bool lowland = info->altitudeMeters < 600.0;
	uint32_t roll = getStandRoll(info->standID, faceUniqueID, 4302, i, 20);
	if(roll < 6)
	{
		return getMediterraneanOlive(info, faceUniqueID, i);
	}
	if(roll < 8)
	{
		if(info->winterModerate && lowland)
		{
			return gameObjectType_carob;
		}
		return getMediterraneanOlive(info, faceUniqueID, i);
	}
	if(roll < 12)
	{
		if(riverBank)
		{
			return gameObjectType_oakTypes[randomInt(faceUniqueID, 4502 + i, OAK_TYPE_COUNT)];
		}
		if(info->altitudeMeters > 2000.0 + randomInt(faceUniqueID, 4341 + i, 300))
		{
			return gameObjectType_juniperTypes[randomInt(faceUniqueID, 9631 + i, JUNIPER_TYPE_COUNT)];
		}
		if(lowland && info->steepness < 0.3 && randomInt(faceUniqueID, 4342 + i, 2) == 0)
		{
			return gameObjectType_stonePine;
		}
		return gameObjectType_cypress;
	}
	if(roll < 17)
	{
		return gameObjectType_oakTypes[randomInt(faceUniqueID, 4502 + i, OAK_TYPE_COUNT)];
	}
	if(roll < 18)
	{
		if(lowland && !riverBank)
		{
			return gameObjectType_stonePine;
		}
		return gameObjectType_juniperTypes[randomInt(faceUniqueID, 9631 + i, JUNIPER_TYPE_COUNT)];
	}
	if(riverBank)
	{
		return gameObjectType_oakTypes[randomInt(faceUniqueID, 4502 + i, OAK_TYPE_COUNT)];
	}
	if(info->altitudeMeters > 1000.0 + randomInt(faceUniqueID, 4343 + i, 300))
	{
		return gameObjectType_juniperTypes[randomInt(faceUniqueID, 9631 + i, JUNIPER_TYPE_COUNT)];
	}
	if(!lowland && !info->hot && !info->winterModerate)
	{
		return gameObjectType_chestnut;
	}
	return gameObjectType_stonePine;
}

static int addMediterranean(uint32_t* types, int addedCount, BiomeInfo* info, uint64_t faceUniqueID, int level)
{
	int groveScale = info->groveScale;
	int canopy = info->canopy;
	if(level == SP_SUBDIVISIONS - 6 && groveScale == 1 && canopy == 0)
	{
		int treeCount = 0;
		switch(info->forestDensity)
		{
		case 1:
			treeCount = (randomInt(faceUniqueID, 4301, 4) == 0 ? 1 : 0);
			break;
		case 2:
			treeCount = randomInt(faceUniqueID, 4301, 3);
			break;
		case 3:
			treeCount = randomInt(faceUniqueID, 4301, 4) + 1;
			break;
		case 4:
			treeCount = randomInt(faceUniqueID, 4301, 4) + 3;
			break;
		}
		if(info->nearRiver)
		{
			treeCount += 1;
		}
		for(int i = 0; i < treeCount; i++)
		{
			ADD_OBJECT(getMediterraneanTree(info, faceUniqueID, i));
		}
	}
	else if(level == SP_SUBDIVISIONS - 4)
	{
		if(groveScale > 1 && randomInt(faceUniqueID, 4305, info->forestDensity == 1 ? 11 : 4) == 0)
		{
			ADD_OBJECT(getMediterraneanTree(info, faceUniqueID, 0));
		}
		if((int)randomInt(faceUniqueID, 4306, 40) < canopy)
		{
			ADD_OBJECT(getMediterraneanTree(info, faceUniqueID, 0));
		}
		if(info->riverDistance >= 0.008 && info->forestDensity < 4 && (int)randomInt(faceUniqueID, 4303, 10) < groveScale)
		{
			bool warm = info->winterModerate || info->winterCool;
			if(!warm || ((info->winterCool || info->altitudeMeters > 800.0) && randomInt(faceUniqueID, 9643, 2) == 0))
			{
				ADD_OBJECT(gameObjectType_oakTypes[randomInt(faceUniqueID, 9644, OAK_TYPE_COUNT)]);
			}
			else if(info->winterModerate && info->altitudeMeters < 600.0 && randomInt(faceUniqueID, 9642, 4) == 0)
			{
				ADD_OBJECT(gameObjectType_carob);
			}
			else
			{
				ADD_OBJECT(gameObjectType_oliveTreeTypes[randomInt(faceUniqueID, 9641, OLIVE_TREE_TYPE_COUNT)]);
			}
		}
	}
	return addedCount;
}

static int addHotSteppe(SPBiomeThreadState* threadState, uint32_t* types, int addedCount, BiomeInfo* info, SPVec3 noiseLoc, uint64_t faceUniqueID, int level)
{
	if(level == SP_SUBDIVISIONS - 6)
	{
		SPVec3 clumpLoc = spVec3Mul(noiseLoc, 250000.0);
		double clump = spNoiseGet(threadState->spNoise1, clumpLoc, 2);
		int treeCount = 0;
		if(clump > 0.14)
		{
			treeCount = randomInt(faceUniqueID, 5301, 3);
		}
		else if(clump > -0.14 && randomInt(faceUniqueID, 5301, 4) == 0)
		{
			treeCount = 1;
		}
		if(info->tidal)
		{
			treeCount = 0;
		}
		uint32_t arganChance = 0;
		if(info->winterModerate && !info->summerVeryHot && !info->tropicalLatitude && info->riverDistance >= 0.008 && info->altitudeMeters < 1300.0)
		{
			arganChance = info->summerHot ? 2 : 6;
		}
		uint32_t juniperChance = 0;
		if(info->winterVeryCold)
		{
			juniperChance = 10;
		}
		else if(info->winterCold)
		{
			juniperChance = 5;
		}
		for(int i = 0; i < treeCount; i++)
		{
			if(randomInt(faceUniqueID, 5331 + i, 10) < arganChance)
			{
				ADD_OBJECT(gameObjectType_argan);
			}
			else if(randomInt(faceUniqueID, 5341 + i, 10) < juniperChance)
			{
				ADD_OBJECT(gameObjectType_juniperTypes[randomInt(faceUniqueID, 5351 + i, JUNIPER_TYPE_COUNT)]);
			}
			else if(!info->winterCold || info->winterCool)
			{
				ADD_OBJECT(!info->winterCold && randomInt(faceUniqueID, 5321 + i, 10) < 3 ? gameObjectType_acaciaTypes[randomInt(faceUniqueID, 5311 + i, ACACIA_TYPE_COUNT)] : gameObjectType_acacia2);
			}
		}
	}
	else if(level == SP_SUBDIVISIONS - 2 && !info->winterVeryCold)
	{
		if(randomInt(faceUniqueID, 5305, 800) == 0)
		{
			SPVec3 clumpLoc = spVec3Mul(noiseLoc, 250000.0);
			if(spNoiseGet(threadState->spNoise1, clumpLoc, 2) > -0.1)
			{
				ADD_OBJECT(gameObjectType_acaciaBranch);
			}
		}
	}
	return addedCount;
}

static int addBaobab(SPBiomeThreadState* threadState, uint32_t* types, int addedCount, BiomeInfo* info, SPVec3 noiseLoc, uint64_t faceUniqueID, int level, bool wadi)
{
	if(level != SP_SUBDIVISIONS - 6 || info->beach || info->winterCold || info->winterVeryCold)
	{
		return addedCount;
	}
	if(info->altitudeMeters < 1.5 || info->altitudeMeters > 1250.0 || info->steepness > 0.5)
	{
		return addedCount;
	}
	if(info->winterModerate && !info->tropical && !info->tropicalLatitude)
	{
		return addedCount;
	}

	SPVec3 groveLoc = spVec3Mul(noiseLoc, 20000.0);
	bool grove = spNoiseGet(threadState->spNoise2, groveLoc, 2) > 0.2;
	uint32_t chance = 0;
	if(info->savanna)
	{
		if(info->riverDistance >= 0.02)
		{
			if(info->lushSavanna)
			{
				SPVec3 islandLoc = spVec3Mul(noiseLoc, 60000.0);
				if(spNoiseGet(threadState->spNoise1, islandLoc, 2) <= 0.14)
				{
					chance = grove ? 16 : 1;
				}
			}
			else if(info->forestDensity == 1 || info->forestDensity == 2)
			{
				chance = grove ? 60 : 5;
			}
			else if(info->forestDensity == 3)
			{
				chance = grove ? 20 : 2;
			}
		}
	}
	else if(info->steppe && info->hot)
	{
		if(info->riverDistance >= 0.008)
		{
			chance = grove ? 40 : 3;
		}
	}
	else if(info->desert)
	{
		if(wadi && !info->aridDesert)
		{
			chance = 8;
		}
	}
	else if(info->subtropical && info->dryWinter && info->hot && info->riverDistance >= 0.02 && (info->forestDensity == 1 || info->forestDensity == 2))
	{
		chance = grove ? 30 : 2;
	}
	if(info->altitudeMeters > 900.0)
	{
		chance /= 2;
	}
	if(randomInt(faceUniqueID, 1331, 100) < chance)
	{
		ADD_OBJECT(gameObjectType_baobab);
		if(grove && randomInt(faceUniqueID, 1332, 3) == 0)
		{
			ADD_OBJECT(gameObjectType_baobab);
		}
	}
	return addedCount;
}

static int addDesertRiver(uint32_t* types, int addedCount, BiomeInfo* info, uint64_t faceUniqueID, int level)
{
	if(level == SP_SUBDIVISIONS - 6 && randomInt(faceUniqueID, 7201, 3) == 0)
	{
		bool coldWinter = info->winterCold || info->winterVeryCold;
		int treeCount = randomInt(faceUniqueID, 7202, 2) + 1;
		for(int i = 0; i < treeCount; i++)
		{
			uint32_t roll = randomInt(faceUniqueID, 7203 + i, 10);
			if(roll < 1)
			{
				if(!coldWinter && !info->beach && info->altitudeMeters < 1800.0)
				{
					ADD_OBJECT(gameObjectType_figTreeWild);
				}
				continue;
			}
			if(roll < 4)
			{
				if(roll == 1)
				{
					if(info->hot && !coldWinter)
					{
						ADD_OBJECT(gameObjectType_datePalmTypes[randomInt(faceUniqueID, 7303 + i, DATE_PALM_TYPE_COUNT)]);
					}
				}
				else if(info->hot && !info->beach && !coldWinter)
				{
					ADD_OBJECT(randomInt(faceUniqueID, 7421 + i, 3) == 0 ? gameObjectType_acaciaTypes[randomInt(faceUniqueID, 7431 + i, ACACIA_TYPE_COUNT)] : gameObjectType_acacia2);
				}
				continue;
			}
			if(roll < 7)
			{
				if(coldWinter || !info->hot)
				{
					if(roll == 4 && info->river && coldWinter)
					{
						ADD_OBJECT(gameObjectType_willowTypes[randomInt(faceUniqueID, 7441 + i, WILLOW_TYPE_COUNT)]);
					}
					else if(roll == 6 && info->winterCold && info->summerVeryHot)
					{
						ADD_OBJECT(gameObjectType_datePalmTypes[randomInt(faceUniqueID, 7303 + i, DATE_PALM_TYPE_COUNT)]);
					}
					else
					{
						ADD_OBJECT(gameObjectType_poplar);
					}
				}
				else if(roll == 4 && info->winterModerate)
				{
					ADD_OBJECT(gameObjectType_poplar);
				}
				else
				{
					ADD_OBJECT(gameObjectType_datePalmTypes[randomInt(faceUniqueID, 7303 + i, DATE_PALM_TYPE_COUNT)]);
				}
			}
			else if(!info->summerCold && !info->summerVeryCold && info->altitudeMeters < 2500.0)
			{
				ADD_OBJECT(gameObjectType_tamarisk);
			}
		}
	}
	return addedCount;
}

static int addTundra(uint32_t* types, int addedCount, BiomeInfo* info, uint64_t faceUniqueID, int level)
{
	if(level != SP_SUBDIVISIONS - 4 || info->summerVeryCold)
	{
		return addedCount;
	}
	if((int)randomInt(faceUniqueID, 7401, 8) < info->groveScale)
	{
		int shrubCount = randomInt(faceUniqueID, 7402, 2) + 2;
		for(int i = 0; i < shrubCount; i++)
		{
			ADD_OBJECT(gameObjectType_dwarfBirchTypes[randomInt(faceUniqueID, 9751 + i, DWARF_BIRCH_TYPE_COUNT)]);
		}
	}
	else if(info->groveScale == 0 && info->grove > 0.0 && randomInt(faceUniqueID, 7403, 8) == 0)
	{
		ADD_OBJECT(gameObjectType_dwarfBirchTypes[randomInt(faceUniqueID, 9751, DWARF_BIRCH_TYPE_COUNT)]);
	}
	return addedCount;
}

static int addCloudForest(uint32_t* types, int addedCount, BiomeInfo* info, uint64_t faceUniqueID, int level)
{
	if(level != SP_SUBDIVISIONS - 4 || info->forestDensity == 0 || info->steepness > 0.5)
	{
		return addedCount;
	}
	if(!info->summerCold && !info->dryWinter && info->altitudeMeters < 3200.0 && (int)randomInt(faceUniqueID, 7501, info->winterCold ? 2000 : 1000) < info->shadePercent)
	{
		int fernCount = randomInt(faceUniqueID, 7502, 2) + 1;
		for(int i = 0; i < fernCount; i++)
		{
			ADD_OBJECT(gameObjectType_treeFernTypes[randomInt(faceUniqueID, 7503 + i, TREE_FERN_TYPE_COUNT)]);
		}
	}
	if(info->altitudeMeters < 2500.0 && (int)randomInt(faceUniqueID, 7521, 800) < info->shadePercent)
	{
		ADD_OBJECT(gameObjectType_gingerPlant);
		ADD_OBJECT(gameObjectType_gingerPlant);
	}
	if(info->bambooGrove && info->altitudeMeters < 3200.0)
	{
		int bambooCount = randomInt(faceUniqueID, 7511, 3) + 2;
		for(int i = 0; i < bambooCount; i++)
		{
			ADD_OBJECT(gameObjectType_smallBamboo);
		}
	}
	return addedCount;
}

static int addPatch(uint32_t* types, int addedCount, uint64_t faceUniqueID, uint32_t seed, uint32_t chance, int minCount, int extraCount, uint32_t* typeList, int typeCount)
{
	if(randomInt(faceUniqueID, seed, chance) == 0)
	{
		int count = minCount + randomInt(faceUniqueID, seed + 1, extraCount + 1);
		for(int i = 0; i < count; i++)
		{
			ADD_OBJECT(typeList[randomInt(faceUniqueID, seed + 2 + i, typeCount)]);
		}
	}
	return addedCount;
}

static int addSunPatch(uint32_t* types, int addedCount, uint64_t faceUniqueID, uint32_t seed, uint32_t chance, int minCount, int extraCount, uint32_t* typeList, int typeCount, int sunPercent)
{
	if(sunPercent == 0)
	{
		return addedCount;
	}
	return addPatch(types, addedCount, faceUniqueID, seed, chance * 100 / sunPercent, minCount, extraCount, typeList, typeCount);
}

static bool isSunPlant(uint32_t type)
{
	if(type == gameObjectType_gingerPlant || type == gameObjectType_turmericPlant)
	{
		return false;
	}
	return isInList(type, gameObjectType_cropTypes, CROP_TYPE_COUNT) || type == gameObjectType_temperatePlantTypes[2] || type == gameObjectType_temperatePlantTypes[3];
}

static int addSpawn(uint32_t* types, int addedCount, uint64_t faceUniqueID, uint32_t seed, double chance, int minCount, int maxCount, uint32_t type)
{
	if(randomInt(faceUniqueID, seed, 100000000) < 100000000 * chance)
	{
		int count = minCount;
		if(minCount < maxCount)
		{
			count += randomInt(faceUniqueID, seed + 1, maxCount - minCount);
		}
		for(int i = 0; i < count; i++)
		{
			ADD_OBJECT(type);
		}
	}
	return addedCount;
}

static int addWildPlants(uint32_t* types, int addedCount, BiomeInfo* info, uint64_t faceUniqueID, int level)
{
	bool frozen = info->polar || info->icecap;
	bool coldWinter = info->winterCold || info->winterVeryCold;
	bool hotSteppe = info->steppe && info->hot;
	double altitude = info->altitudeMeters;
	double shadeScale = info->shadePercent / 100.0;
	double sunScale = info->sunPercent / 100.0;
	bool barleyLand = altitude > 0.0 && altitude < 1800.0 && !info->beach && !info->river && (coldWinter || info->winterModerate) && !(info->summerCold || info->summerVeryCold);

	if(level == SP_SUBDIVISIONS - 3)
	{
		bool figWinter = !coldWinter || (info->winterCool && (info->mediterranean || info->mediterraneanSteppe));
		if(altitude > 0.0 && altitude < 1800.0 && !info->beach && info->summerHot && figWinter && !(info->tropical || info->desert || info->rainforest || info->forestDensity >= 3 || frozen))
		{
			double figChance = 0.003;
			if(hotSteppe || info->mediterraneanSteppe)
			{
				figChance = (info->cliff || info->riverDistance < 0.05) ? 0.003 : 0.0005;
			}
			else if(info->subtropical)
			{
				figChance = 0.0015;
			}
			addedCount = addSpawn(types, addedCount, faceUniqueID, 9101, figChance * sunScale, 1, 3, gameObjectType_figTreeWild);
		}
		if(altitude > 0.0 && altitude < 1800.0 && !info->beach && info->river && figWinter && !(info->tropical || info->rainforest || frozen || info->summerCold || info->summerVeryCold))
		{
			addedCount = addSpawn(types, addedCount, faceUniqueID, 9111, 0.002, 1, 2, gameObjectType_figTreeWild);
		}
		for(int i = 0; i < DATE_PALM_TYPE_COUNT; i++)
		{
			if(altitude > 0.2 && altitude < 3.0 && info->desert && !(frozen || coldWinter))
			{
				addedCount = addSpawn(types, addedCount, faceUniqueID, 9121 + i * 10, 0.004, 1, 3, gameObjectType_datePalmTypes[i]);
			}
			if(altitude > 0.0 && !info->beach && info->lushSavanna && !(info->desert || frozen || coldWinter))
			{
				addedCount = addSpawn(types, addedCount, faceUniqueID, 9161 + i * 10, 0.002, 1, 3, gameObjectType_wildPalmTypes[i]);
			}
			if(altitude > 0.2 && altitude < 2.0 && (info->tropical || info->summerHot) && !(info->desert || hotSteppe || frozen || coldWinter))
			{
				addedCount = addSpawn(types, addedCount, faceUniqueID, 9201 + i * 10, info->mediterranean ? 0.002 : 0.004, 1, 3, info->savanna && !info->lushSavanna ? gameObjectType_doumPalmTypes[i] : gameObjectType_wildPalmTypes[i]);
			}
		}
		if(altitude > 0.0 && altitude < 2500.0 && !info->beach && info->steepness < 0.3 && info->desert && (coldWinter || (info->aridDesert && info->winterModerate)) && !(frozen || info->summerCold || info->summerVeryCold))
		{
			addedCount = addSpawn(types, addedCount, faceUniqueID, 9431, 0.002, 1, 2, gameObjectType_saxaul);
		}
		if(altitude > 0.0 && altitude < (info->tropicalLatitude ? 3000.0 : 1800.0) && !info->beach && (info->desert || info->dry) && (!coldWinter || info->summerHot) && !(info->aridDesert || frozen || info->winterVeryCold))
		{
			double mesquiteChance = 0.008;
			if(info->desert || info->mediterraneanSteppe)
			{
				mesquiteChance = 0.004;
			}
			else if(info->nearRiver && !info->coolSteppe)
			{
				mesquiteChance = 0.016;
			}
			addedCount = addSpawn(types, addedCount, faceUniqueID, 9321, mesquiteChance * info->groveScale, 1, 3, gameObjectType_mesquiteTree);
		}
	}
	else if(level == SP_SUBDIVISIONS - 2)
	{
		if(altitude > 0.0 && !info->beach && coldWinter && !(info->desert || info->steppe || info->icecap || info->tropical || info->mediterranean || info->summerHot || info->summerVeryCold || info->river))
		{
			double lingonberryChance = 0.004;
			if(info->coniferous || info->tundra || info->subarctic)
			{
				lingonberryChance = 0.010;
			}
			else if(info->winterCold)
			{
				lingonberryChance = 0.0015;
			}
			addedCount = addSpawn(types, addedCount, faceUniqueID, 9301, lingonberryChance * shadeScale, 1, 3, gameObjectType_lingonberryBush);
		}
		if(altitude > 0.0 && !info->beach && info->tundra && !info->tropicalLatitude && info->grove < -0.14 && !(info->desert || info->icecap || info->summerVeryCold))
		{
			addedCount = addSpawn(types, addedCount, faceUniqueID, 9311, 0.016, 1, 3, gameObjectType_cloudberryBush);
		}
		if(barleyLand && info->desert && coldWinter && !info->aridDesert)
		{
			addedCount = addSpawn(types, addedCount, faceUniqueID, 9421, 0.001, 3, 8, gameObjectType_barley);
		}
		bool grapeWinter = info->winterCold || info->winterModerate || (info->winterVeryCold && info->nearRiver && (info->deciduous || info->mixedForest) && !info->subarctic);
		if(altitude > 0.0 && altitude < 1500.0 && !info->beach && grapeWinter && (info->river || info->forestDensity == 2 || info->forestDensity == 3 || info->mediterraneanSteppe) && !(info->desert || info->tropical || info->tundra || frozen))
		{
			double grapeChance = 0.001;
			double grapeScale = info->forestDensity == 3 ? 1.0 : shadeScale;
			if(info->nearRiver || info->river)
			{
				grapeChance = 0.004;
			}
			else if(info->mediterranean)
			{
				grapeChance = 0.002;
			}
			addedCount = addSpawn(types, addedCount, faceUniqueID, 9331, grapeChance * grapeScale, 1, 3, gameObjectType_grapevine);
		}
		if(barleyLand && (info->steppe || info->temperate) && !(info->desert || info->subtropical || info->forestDensity >= 3 || (info->winterVeryCold && !info->steppe) || (hotSteppe && info->winterModerate && info->tropicalLatitude)))
		{
			addedCount = addSpawn(types, addedCount, faceUniqueID, 9341, (info->winterVeryCold || (info->temperate && !info->mediterranean) ? 0.001 : 0.002) * sunScale, 3, 8, gameObjectType_barley);
		}
		if(barleyLand && (info->oakSavanna || info->mediterraneanSteppe || (info->mediterranean && info->forestDensity < 3) || (hotSteppe && info->winterCold)))
		{
			double barleyChance = 0.003 * sunScale;
			if(!hotSteppe && !info->nearRiver)
			{
				if(info->grove < -0.14)
				{
					barleyChance = 0.008;
				}
				else if(info->grove <= 0.14)
				{
					barleyChance = 0.002;
				}
				else
				{
					barleyChance = 0.0;
				}
			}
			addedCount = addSpawn(types, addedCount, faceUniqueID, 9451, barleyChance, 3, 8, gameObjectType_barley);
		}
		if(barleyLand && !info->desert && (info->oakSavanna || info->mediterraneanSteppe || (info->mediterranean && info->forestDensity < 3)))
		{
			addedCount = addSpawn(types, addedCount, faceUniqueID, 9491, (info->mediterraneanSteppe ? 0.001 : 0.002) * sunScale, 3, 8, gameObjectType_cropTypes[0]);
		}
		if(altitude > 2.0 && altitude < 2000.0 && !info->beach && info->summerHot && coldWinter && (info->steppe || (info->desert && !info->aridDesert)) && info->forestDensity <= 2 && !frozen)
		{
			addedCount = addSpawn(types, addedCount, faceUniqueID, 9501, 0.001 * sunScale, 1, 3, gameObjectType_cropTypes[2]);
		}
		if(altitude > 2.0 && altitude < 1500.0 && !info->beach && (info->summerHot || info->mediterraneanSteppe) && !(info->rainforest || info->lushSavanna || info->aridDesert || info->forestDensity >= 3 || (info->savanna && info->forestDensity >= 2) || (info->subtropical && !(info->dryWinter && info->hot && info->forestDensity <= 1)) || frozen || coldWinter))
		{
			double watermelonChance = 0.002;
			if(hotSteppe)
			{
				watermelonChance = 0.004;
			}
			else if(info->mediterraneanSteppe || info->desert)
			{
				watermelonChance = 0.001;
			}
			addedCount = addSpawn(types, addedCount, faceUniqueID, 9351, watermelonChance * sunScale, 1, 3, gameObjectType_watermelon);
		}
		if(altitude > -0.3 && altitude < 1.2 && info->river && !(info->aridDesert || frozen))
		{
			if(info->desert || info->subarctic)
			{
				addedCount = addSpawn(types, addedCount, faceUniqueID, 9361, 0.01, 3, 8, gameObjectType_cattail);
			}
			else if(info->rainforest || info->forestDensity >= 3)
			{
				addedCount = addSpawn(types, addedCount, faceUniqueID, 9361, 0.008, 3, 8, gameObjectType_cattail);
			}
			else
			{
				addedCount = addSpawn(types, addedCount, faceUniqueID, 9361, 0.012, 6, 13, gameObjectType_cattail);
			}
		}
		if(altitude > -0.3 && altitude < 1.2 && info->river && (info->desert || hotSteppe || (info->dryRiver && !info->tropical)) && !frozen)
		{
			addedCount = addSpawn(types, addedCount, faceUniqueID, 9371, 0.02, 3, 8, gameObjectType_commonReed);
		}
		if(altitude > -0.3 && altitude < 1.2 && info->river && coldWinter && !frozen)
		{
			addedCount = addSpawn(types, addedCount, faceUniqueID, 9381, 0.02, 3, 8, gameObjectType_bulrush);
		}
		if(info->marsh && altitude > -0.3 && altitude < 1.2 && info->riverDistance > 0.02 && info->steepness <= 0.5 && !(info->tropical || info->desert || frozen || info->subarctic || (info->subtropical && info->hot) || (hotSteppe && !coldWinter)))
		{
			addedCount = addSpawn(types, addedCount, faceUniqueID, 9391, info->beach ? 0.008 : 0.05, 3, 8, gameObjectType_cordgrass);
		}
		if(altitude > -0.3 && altitude < 1.2 && info->river && info->tundra && !info->tropicalLatitude)
		{
			addedCount = addSpawn(types, addedCount, faceUniqueID, 9401, 0.02, 3, 8, gameObjectType_cottonGrass);
		}
	}
	return addedCount;
}

static int addCacao(SPBiomeThreadState* threadState, uint32_t* types, int addedCount, BiomeInfo* info, SPVec3 noiseLoc, uint64_t faceUniqueID, int level)
{
	if(level != SP_SUBDIVISIONS - 4 || info->beach || info->bambooGrove || info->summerVeryHot || info->steepness > 0.5)
	{
		return addedCount;
	}
	if(info->tidal || info->altitudeMeters > 500.0 + randomInt(faceUniqueID, 2981, 400))
	{
		return addedCount;
	}
	uint32_t chance = 0;
	if(info->savanna)
	{
		if(info->lushSavanna && info->riverDistance < 0.008)
		{
			chance = 60;
		}
	}
	else if(info->nearRiver)
	{
		if(info->forestDensity >= 3)
		{
			chance = 7;
		}
		else if(info->forestDensity == 2)
		{
			chance = 20;
		}
	}
	else if(info->forestDensity >= 3)
	{
		SPVec3 groveLoc = spVec3Mul(noiseLoc, 70000.0);
		if(spNoiseGet(threadState->spNoise2, groveLoc, 2) > 0.0)
		{
			chance = info->forestDensity == 4 ? 7 : 10;
		}
	}
	if(chance == 0)
	{
		return addedCount;
	}
	if(info->winterHot)
	{
		chance *= 2;
	}
	return addPatch(types, addedCount, faceUniqueID, 2982, chance, 2, 1, &gameObjectType_cacao, 1);
}

static bool isFruitTree(uint32_t type)
{
	return type == gameObjectType_appleTree || type == gameObjectType_orangeTree || type == gameObjectType_peachTree || type == gameObjectType_elderberryTree || type == gameObjectType_bananaTree || type == gameObjectType_coconutTree;
}

static bool isForestTree(uint32_t type)
{
	return type == gameObjectType_aspenBig || isInList(type, gameObjectType_pineTypes, PINE_TYPE_COUNT) || isInList(type, gameObjectType_broadleafTypes, BROADLEAF_TYPE_COUNT) || isInList(type, gameObjectType_willowTypes, WILLOW_TYPE_COUNT);
}

static uint32_t getPine(uint64_t faceUniqueID, int i, int level)
{
	if(level == SP_SUBDIVISIONS - 4)
	{
		return gameObjectType_pineTypes[3];
	}
	if(randomInt(faceUniqueID, 1111 + i, 12) == 0)
	{
		return gameObjectType_pineTypes[1];
	}
	return gameObjectType_pineTypes[randomInt(faceUniqueID, 1121 + i, 2) * 2];
}

static uint32_t getBroadleaf(uint64_t faceUniqueID, int i, bool aspen)
{
	if(aspen)
	{
		return gameObjectType_broadleafTypes[4 + randomInt(faceUniqueID, 1131 + i, 3)];
	}
	return gameObjectType_broadleafTypes[randomInt(faceUniqueID, 1131 + i, 4)];
}

static uint32_t getSteppeTree(BiomeInfo* info, uint64_t faceUniqueID, int i, int level)
{
	uint32_t roll = getStandRoll(info->standID, faceUniqueID, 3401, i, 20);
	if(info->aspenParkland)
	{
		if(roll < 1)
		{
			return gameObjectType_poplar;
		}
		if(roll < 11)
		{
			return getBroadleaf(faceUniqueID, i, true);
		}
		if(roll < 13)
		{
			return getBroadleaf(faceUniqueID, i, false);
		}
		if(info->nearRiver)
		{
			if(info->riverDistance < 0.008 && !info->summerHot && randomInt(faceUniqueID, 3451 + i, 3) == 0)
			{
				return gameObjectType_alderTypes[randomInt(faceUniqueID, 3206 + i, ALDER_TYPE_COUNT)];
			}
			return gameObjectType_poplar;
		}
		if(roll < 15)
		{
			return gameObjectType_juniperTypes[randomInt(faceUniqueID, 9681 + i, JUNIPER_TYPE_COUNT)];
		}
		if(roll < 17)
		{
			return gameObjectType_larch;
		}
		if(roll < 18 && !info->summerCold)
		{
			return gameObjectType_oakTypes[randomInt(faceUniqueID, 3402 + i, OAK_TYPE_COUNT)];
		}
	}
	else if(info->mediterraneanSteppe)
	{
		if(info->nearRiver && randomInt(faceUniqueID, 3102 + i, 2) == 0)
		{
			uint32_t type = getRiversideTree(info, faceUniqueID, i);
			if(type)
			{
				return type;
			}
		}
		if(roll < 10)
		{
			if(info->riverDistance < 0.008)
			{
				return getRiversideTree(info, faceUniqueID, i);
			}
			if(roll < 6)
			{
				if(info->altitudeMeters > 1300.0 + randomInt(faceUniqueID, 3411 + i, 200))
				{
					if(randomInt(faceUniqueID, 3431 + i, 2) == 0)
					{
						return gameObjectType_cypress;
					}
					return gameObjectType_juniperTypes[randomInt(faceUniqueID, 9701 + i, JUNIPER_TYPE_COUNT)];
				}
				return gameObjectType_argan;
			}
			if(info->altitudeMeters > 700.0 + randomInt(faceUniqueID, 3421 + i, 200))
			{
				return gameObjectType_juniperTypes[randomInt(faceUniqueID, 9701 + i, JUNIPER_TYPE_COUNT)];
			}
			return gameObjectType_carob;
		}
		if(roll < 13)
		{
			return gameObjectType_oliveTreeTypes[randomInt(faceUniqueID, 9691 + i, OLIVE_TREE_TYPE_COUNT)];
		}
		if(roll < 15)
		{
			if(roll == 14 && info->altitudeMeters < 1000.0)
			{
				return gameObjectType_stonePine;
			}
			return gameObjectType_juniperTypes[randomInt(faceUniqueID, 9701 + i, JUNIPER_TYPE_COUNT)];
		}
		if(roll < 18)
		{
			return gameObjectType_oakTypes[randomInt(faceUniqueID, 3402 + i, OAK_TYPE_COUNT)];
		}
		if(info->altitudeMeters < 900.0 + randomInt(faceUniqueID, 3441 + i, 300))
		{
			return gameObjectType_stonePine;
		}
	}
	else
	{
		if(roll < 11)
		{
			return gameObjectType_oakTypes[randomInt(faceUniqueID, 3402 + i, OAK_TYPE_COUNT)];
		}
		if(info->nearRiver)
		{
			if(info->riverDistance < 0.008 && !info->summerHot && randomInt(faceUniqueID, 3451 + i, 3) == 0)
			{
				return gameObjectType_alderTypes[randomInt(faceUniqueID, 3206 + i, ALDER_TYPE_COUNT)];
			}
			return gameObjectType_poplar;
		}
		if(roll < 17)
		{
			return gameObjectType_juniperTypes[randomInt(faceUniqueID, 9711 + i, JUNIPER_TYPE_COUNT)];
		}
	}
	return getPine(faceUniqueID, i, level);
}

static uint32_t getTundraTree(BiomeInfo* info, uint64_t faceUniqueID, int i, int level)
{
	uint32_t roll = getStandRoll(info->standID, faceUniqueID, 3501, i, 10);
	if(roll < 3 || (roll < 5 && info->tropicalLatitude))
	{
		return gameObjectType_juniperTypes[randomInt(faceUniqueID, 9721 + i, JUNIPER_TYPE_COUNT)];
	}
	if(info->tropicalLatitude)
	{
		return getPine(faceUniqueID, i, level);
	}
	if(roll < 5)
	{
		if(info->summerVeryCold)
		{
			return gameObjectType_arcticWillow;
		}
		return gameObjectType_spruce;
	}
	if(roll < 8)
	{
		return gameObjectType_larch;
	}
	if(roll == 8)
	{
		if(info->nearRiver)
		{
			return gameObjectType_poplar;
		}
		return getBroadleaf(faceUniqueID, i, false);
	}
	if(info->nearRiver && !info->summerVeryCold)
	{
		return gameObjectType_alderTypes[randomInt(faceUniqueID, 3206 + i, ALDER_TYPE_COUNT)];
	}
	return getPine(faceUniqueID, i, level);
}

static uint32_t getConiferTree(BiomeInfo* info, uint64_t faceUniqueID, int i, int level, bool aspen)
{
	if(info->winterCold || info->winterVeryCold)
	{
		if(level == SP_SUBDIVISIONS - 4)
		{
			if(info->riverDistance < 0.008)
			{
				return 0;
			}
			uint32_t juniperChance = 0;
			if(!info->nearRiver)
			{
				if(info->forestDensity <= 2)
				{
					juniperChance = 6;
				}
				else if(info->forestDensity == 3)
				{
					juniperChance = 2;
				}
			}
			if(randomInt(faceUniqueID, 3601 + i, 10) < juniperChance)
			{
				return gameObjectType_juniperTypes[randomInt(faceUniqueID, 9731 + i, JUNIPER_TYPE_COUNT)];
			}
		}
		else
		{
			if(aspen && info->drySummer && info->winterVeryCold && randomInt(faceUniqueID, 3611 + i, 4) > 0)
			{
				return getBroadleaf(faceUniqueID, i, true);
			}
			uint32_t spruceLimit = 6;
			uint32_t larchRolls = 4;
			if(info->subarctic)
			{
				spruceLimit = 9;
				larchRolls = 6;
			}
			else if(!info->drySummer)
			{
				spruceLimit = 8;
			}
			else if(info->forestDensity == 1 || (info->altitudeMeters < 900.0 && !info->nearRiver))
			{
				spruceLimit = 3;
			}
			if(info->forestDensity >= 3)
			{
				spruceLimit += 3;
				larchRolls = 2;
			}
			if(info->summerHot)
			{
				spruceLimit = 0;
				larchRolls = 0;
			}
			if(info->tropicalLatitude || !info->winterVeryCold)
			{
				larchRolls = 0;
			}
			uint32_t roll = getStandRoll(info->standID, faceUniqueID, 3701, i, 20);
			if(roll < spruceLimit)
			{
				return gameObjectType_spruce;
			}
			if(roll < spruceLimit + larchRolls)
			{
				return gameObjectType_larch;
			}
			if(info->riverDistance < 0.008 && spruceLimit > 0)
			{
				return gameObjectType_spruce;
			}
		}
	}
	return getPine(faceUniqueID, i, level);
}

static uint32_t getBroadleafTree(BiomeInfo* info, uint64_t faceUniqueID, int i, bool aspen)
{
	uint32_t roll = getStandRoll(info->standID, faceUniqueID, 3101, i, 20);
	if(info->subtropical)
	{
		if(roll < 10 && info->altitudeMeters < 2000.0 + randomInt(faceUniqueID, 3221 + i, 500))
		{
			return gameObjectType_rubberTreeTypes[randomInt(faceUniqueID, 3201 + i, RUBBER_TREE_TYPE_COUNT)];
		}
		if(roll == 16)
		{
			return gameObjectType_chestnut;
		}
		if(roll == 17 && !info->dryWinter)
		{
			return gameObjectType_mapleTypes[randomInt(faceUniqueID, 3205 + i, MAPLE_TYPE_COUNT)];
		}
		if(roll < 18 || (!info->nearRiver && info->altitudeMeters < 800.0))
		{
			return gameObjectType_oakTypes[randomInt(faceUniqueID, 3202 + i, OAK_TYPE_COUNT)];
		}
	}
	else if(info->deciduous)
	{
		if(info->subarctic)
		{
			if(roll < 4)
			{
				return gameObjectType_spruce;
			}
			return getBroadleaf(faceUniqueID, i, aspen);
		}
		if(roll < 8)
		{
			return gameObjectType_oakTypes[randomInt(faceUniqueID, 3202 + i, OAK_TYPE_COUNT)];
		}
		if(roll < 11 && (!info->winterVeryCold || (info->summerHot && roll == 8)) && info->riverDistance >= 0.008 && !info->seaside && !info->hot && (info->tropicalLatitude || info->altitudeMeters < 1800.0 + randomInt(faceUniqueID, 3212 + i, 300)))
		{
			return gameObjectType_chestnut;
		}
		if(roll < (uint32_t)(info->forestDensity == 1 ? 13 : 15) && !info->summerCold)
		{
			return gameObjectType_mapleTypes[randomInt(faceUniqueID, 3205 + i, MAPLE_TYPE_COUNT)];
		}
		if(info->forestDensity >= 3 && roll >= 15 && roll < 17)
		{
			if(roll == 16 || info->hot)
			{
				return gameObjectType_poplar;
			}
			if(!info->seaside)
			{
				return gameObjectType_alderTypes[randomInt(faceUniqueID, 3206 + i, ALDER_TYPE_COUNT)];
			}
		}
		else if(info->winterModerate)
		{
			if(roll >= 15 && roll < 17)
			{
				return gameObjectType_oakTypes[randomInt(faceUniqueID, 3202 + i, OAK_TYPE_COUNT)];
			}
			if(roll >= 17 && roll < 19)
			{
				return gameObjectType_rubberTreeTypes[randomInt(faceUniqueID, 3201 + i, RUBBER_TREE_TYPE_COUNT)];
			}
		}
	}
	else if(!info->subarctic)
	{
		if(roll < 4 && !info->summerCold)
		{
			return gameObjectType_mapleTypes[randomInt(faceUniqueID, 3205 + i, MAPLE_TYPE_COUNT)];
		}
		if(roll >= 4 && roll < 6)
		{
			return gameObjectType_oakTypes[randomInt(faceUniqueID, 3202 + i, OAK_TYPE_COUNT)];
		}
	}
	return getBroadleaf(faceUniqueID, i, aspen);
}

static uint32_t getTemperateTree(BiomeInfo* info, uint64_t faceUniqueID, int i, int level, bool aspen)
{
	uint32_t type = 0;
	if(level == SP_SUBDIVISIONS - 6 && info->seaside && !info->winterVeryCold && getStandRoll(info->standID, faceUniqueID, 3104, i, 10) < 3)
	{
		return gameObjectType_maritimePine;
	}
	if(!info->birch || (info->coniferous && getStandRoll(info->standID, faceUniqueID, 1171, i, 2) == 0))
	{
		if(level == SP_SUBDIVISIONS - 6 && info->nearRiver && (info->winterCold || info->winterVeryCold) && randomInt(faceUniqueID, 3102 + i, 20) < 7)
		{
			type = getRiversideTree(info, faceUniqueID, i);
		}
		if(!type)
		{
			type = getConiferTree(info, faceUniqueID, i, level, aspen);
		}
		return type;
	}
	if(info->cloudForest)
	{
		uint32_t roll = randomInt(faceUniqueID, 3103 + i, 20);
		if(roll < 5 && !info->summerCold && info->altitudeMeters < 3200.0)
		{
			return gameObjectType_treeFernTypes[randomInt(faceUniqueID, 3203 + i, TREE_FERN_TYPE_COUNT)];
		}
		if(roll >= 8 && roll < 11)
		{
			return gameObjectType_alderTypes[randomInt(faceUniqueID, 3206 + i, ALDER_TYPE_COUNT)];
		}
	}
	if(info->subtropical)
	{
		if(info->nearRiver)
		{
			if(info->altitudeMeters < 200.0 + randomInt(faceUniqueID, 3211 + i, 300))
			{
				uint32_t cypressChance = info->riverDistance < 0.008 ? 90 : 35;
				if(randomInt(info->standID, 3212, 3) == 0)
				{
					cypressChance = info->riverDistance < 0.008 ? 30 : 10;
				}
				if(info->bambooGrove)
				{
					cypressChance /= 2;
				}
				if(randomInt(faceUniqueID, 3102 + i, 100) < cypressChance)
				{
					return gameObjectType_baldCypress;
				}
			}
			uint32_t riverRoll = randomInt(faceUniqueID, 3231 + i, 20);
			if(riverRoll < (uint32_t)(info->riverDistance < 0.008 ? 3 : 6))
			{
				return gameObjectType_planeTreeTypes[randomInt(faceUniqueID, 9741 + i, PLANE_TREE_TYPE_COUNT)];
			}
			if(riverRoll >= 6 && riverRoll < 10)
			{
				return gameObjectType_poplar;
			}
		}
	}
	else if(info->nearRiver && randomInt(faceUniqueID, 3102 + i, 2) == 0)
	{
		type = getRiversideTree(info, faceUniqueID, i);
	}
	if(!type)
	{
		type = getBroadleafTree(info, faceUniqueID, i, aspen);
	}
	return type;
}

static uint32_t getForestTree(BiomeInfo* info, uint64_t faceUniqueID, int i, int level, bool aspen)
{
	uint32_t willowRolls = randomInt(info->standID, 1152, 2) == 0 ? 6 : 2;
	if(info->subtropical)
	{
		willowRolls /= 2;
	}
	bool riverTree = level == SP_SUBDIVISIONS - 6 && info->river && randomInt(faceUniqueID, 1151 + i, 8) < willowRolls;
	if(info->tropicalForest)
	{
		if(level != SP_SUBDIVISIONS - 6 || !info->river || randomInt(faceUniqueID, 1151 + i, 2) != 0)
		{
			return 0;
		}
		if(info->savanna && !info->lushSavanna)
		{
			return gameObjectType_doumPalmTypes[randomInt(faceUniqueID, 1502 + i, DOUM_PALM_TYPE_COUNT)];
		}
		if(randomInt(faceUniqueID, 1501 + i, info->savanna ? 2 : 3) == 0)
		{
			return gameObjectType_wildPalmTypes[randomInt(faceUniqueID, 1502 + i, WILD_PALM_TYPE_COUNT)];
		}
		return gameObjectType_rubberTreeTypes[randomInt(faceUniqueID, 1503 + i, RUBBER_TREE_TYPE_COUNT)];
	}
	if(riverTree && (!info->tundra || (info->coniferous && !info->summerCold && !info->summerVeryCold && randomInt(faceUniqueID, 1153 + i, 2) == 0)))
	{
		return gameObjectType_willowTypes[randomInt(faceUniqueID, 1161 + i, WILLOW_TYPE_COUNT)];
	}
	if(info->coolSteppe)
	{
		return getSteppeTree(info, faceUniqueID, i, level);
	}
	if(info->tundra)
	{
		return getTundraTree(info, faceUniqueID, i, level);
	}
	if(info->temperate)
	{
		return getTemperateTree(info, faceUniqueID, i, level, aspen);
	}
	return getPine(faceUniqueID, i, level);
}

static int addForestTrees(SPBiomeThreadState* threadState, uint32_t* types, int addedCount, BiomeInfo* info, SPVec3 noiseLoc, uint64_t faceUniqueID, int level)
{
	SPVec3 aspenLoc = spVec3Mul(noiseLoc, 92273.0);
	double aspenLimit = 0.2;
	if(info->mixedForest)
	{
		aspenLimit = -0.05;
	}
	else if(info->deciduous && info->winterVeryCold)
	{
		aspenLimit = 0.1;
	}
	bool aspen = spNoiseGet(threadState->spNoise1, aspenLoc, 2) > aspenLimit && !(info->summerHot && info->winterModerate);
	int groveScale = info->groveScale;
	int canopy = info->canopy;

	if(level == SP_SUBDIVISIONS - 7)
	{
		if(info->forestDensity >= 3)
		{
			if(info->coniferous && !info->tropicalForest && randomInt(faceUniqueID, 1101, 16) == 0)
			{
				ADD_OBJECT(gameObjectType_pineTypes[4]);
			}
			if(info->birch && aspen && randomInt(faceUniqueID, 1102, 8) == 0)
			{
				ADD_OBJECT(gameObjectType_aspenBig);
			}
		}
	}
	else if(level == SP_SUBDIVISIONS - 6)
	{
		int treeCount = 0;
		if(info->coolSteppe)
		{
			if(!info->beach)
			{
				if(info->nearRiver)
				{
					treeCount = randomInt(faceUniqueID, 1141, 3);
					if(info->mediterraneanSteppe || info->riverDistance < 0.008)
					{
						treeCount += 1;
					}
				}
				else if(info->mediterraneanSteppe && groveScale == 0 && randomInt(faceUniqueID, 1142, 3) == 0)
				{
					if(info->altitudeMeters < 900.0 + randomInt(faceUniqueID, 1144, 200) && randomInt(faceUniqueID, 1143, 3) > 0)
					{
						ADD_OBJECT(gameObjectType_argan);
					}
					else
					{
						treeCount = 1;
					}
				}
			}
		}
		else if(info->coniferous || info->birch || info->tropicalForest)
		{
			switch(info->forestDensity)
			{
			case 1:
				treeCount = (randomInt(faceUniqueID, 1103, info->river && !info->tropicalForest ? 2 : 16) == 0 ? 1 : 0);
				break;
			case 2:
				treeCount = (int)randomInt(faceUniqueID, 1103, 8) - 2;
				break;
			case 3:
				treeCount = randomInt(faceUniqueID, 1103, 8) + 4;
				break;
			case 4:
				treeCount = randomInt(faceUniqueID, 1103, 8) + 24;
				break;
			}
			if(groveScale != 1 || canopy > 0)
			{
				treeCount = 0;
			}
		}
		for(int i = 0; i < treeCount; i++)
		{
			uint32_t type = getForestTree(info, faceUniqueID, i, level, aspen);
			if(type)
			{
				ADD_OBJECT(type);
			}
		}
	}
	else if(level == SP_SUBDIVISIONS - 2 && info->tropicalForest && info->forestDensity > 0)
	{
		if(randomInt(faceUniqueID, 1191, 400 / (info->forestDensity * info->forestDensity)) == 0)
		{
			uint32_t branchType = (info->savanna ? gameObjectType_acaciaBranch : gameObjectType_kapokBranch);
			ADD_OBJECT(branchType);
			if(info->river)
			{
				ADD_OBJECT(branchType);
			}
		}
	}
	else if(level == SP_SUBDIVISIONS - 4)
	{
		if(groveScale > 1 && !info->beach && (info->coolSteppe || info->coniferous || info->birch))
		{
			uint32_t chance = 2;
			if(info->coolSteppe)
			{
				chance = 4;
			}
			else if(info->forestDensity == 1)
			{
				chance = 43;
			}
			if(randomInt(faceUniqueID, 1105, chance) == 0)
			{
				uint32_t type = getForestTree(info, faceUniqueID, 0, SP_SUBDIVISIONS - 6, aspen);
				if(type)
				{
					ADD_OBJECT(type);
				}
			}
		}
		if((info->coniferous || info->birch) && (int)randomInt(faceUniqueID, 1106, 12) < canopy)
		{
			uint32_t type = getForestTree(info, faceUniqueID, 0, SP_SUBDIVISIONS - 6, aspen);
			if(type)
			{
				ADD_OBJECT(type);
			}
		}
		if((info->coniferous || info->birch) && !info->coolSteppe)
		{
			int treeCount = 0;
			switch(info->forestDensity)
			{
			case 1:
				treeCount = (randomInt(faceUniqueID, 1104, 32) == 0 ? 1 : 0);
				break;
			case 2:
				treeCount = (int)randomInt(faceUniqueID, 1104, 16) - 14;
				break;
			case 3:
				treeCount = (int)randomInt(faceUniqueID, 1104, 8) - 6;
				break;
			case 4:
				treeCount = (int)randomInt(faceUniqueID, 1104, 8) - 2;
				break;
			}
			treeCount *= groveScale;
			for(int i = 0; i < treeCount; i++)
			{
				uint32_t type = getForestTree(info, faceUniqueID, i, level, aspen);
				if(type)
				{
					ADD_OBJECT(type);
				}
			}
		}
	}
	return addedCount;
}

int spBiomeGetTransientGameObjectTypesForFaceSubdivision(SPBiomeThreadState* threadState,
	int incomingTypeCount,
	uint32_t* types,
	uint16_t* biomeTags,
	int tagCount,
	SPVec3 pointNormal,
	SPVec3 noiseLoc,
	uint64_t faceUniqueID,
	int level,
	double altitude,
	double steepness,
	double riverDistance)
{
	if(!hasTypes || level < SP_SUBDIVISIONS - 7 || level == SP_SUBDIVISIONS - 5 || level == SP_SUBDIVISIONS - 1)
	{
		return incomingTypeCount;
	}

	BiomeInfo info = {0};
	getBiomeInfo(biomeTags, tagCount, &info);
	info.altitudeMeters = SP_PRERENDER_TO_METERS(altitude);
	info.riverDistance = riverDistance;
	info.steepness = steepness;
	info.nearRiver = riverDistance < 0.015;
	info.tropicalLatitude = fabs(pointNormal.y) < 0.4;
	SPVec3 beachNoiseLoc = spVec3Mul(noiseLoc, 45999.0);
	SPVec3 beachNoiseLocLarge = spVec3Mul(noiseLoc, 8073.0);
	info.beach = (altitude + spNoiseGet(threadState->spNoise1, beachNoiseLoc, 2) * 0.00000005 + spNoiseGet(threadState->spNoise1, beachNoiseLocLarge, 2) * 0.0000005) < 0.0000001;

	setForestTypes(&info);
	setGrove(threadState, &info, noiseLoc);
	if(level == SP_SUBDIVISIONS - 6 || level == SP_SUBDIVISIONS - 4)
	{
		info.standID = getStandID(threadState, noiseLoc);
	}
	int groveScale = info.groveScale;
	int shadePercent = info.shadePercent;
	int sunPercent = info.sunPercent;
	if(info.tropical || info.subtropical || info.cloudForest)
	{
		SPVec3 bambooLoc = spVec3Mul(noiseLoc, 40000.0);
		info.bambooGrove = spNoiseGet(threadState->spNoise2, bambooLoc, 2) > (info.savanna && info.river ? 0.175 : 0.265);
	}
	double tundraPatch = info.grove;
	bool arcticTundra = info.tundra && !info.tropicalLatitude;
	bool tropicalForest = info.tropicalForest;
	bool subtropical = info.subtropical;
	bool mediterranean = info.mediterranean;
	bool hotSteppe = info.steppe && info.hot;
	bool coolSteppe = info.coolSteppe;
	bool aspenParkland = info.aspenParkland;
	bool mediterraneanSteppe = info.mediterraneanSteppe;
	bool cloudForest = info.cloudForest;
	bool coast = info.altitudeMeters > 0.1 && info.altitudeMeters < 1.5 && riverDistance > 0.05;
	info.seaside = !info.beach && info.altitudeMeters < 6.0 && riverDistance > 0.05;
	info.tidal = info.altitudeMeters < 1.5 && riverDistance > 0.05;
	bool coldWinter = info.winterCold || info.winterVeryCold;
	bool tamariskLand = !info.summerCold && !info.summerVeryCold && !info.polar && info.altitudeMeters < 2500.0;
	bool doumLand = info.hot && !coldWinter && info.altitudeMeters < 1200.0;
	if(info.altitudeMeters > -0.3 && info.altitudeMeters < 1.2 && riverDistance > 0.02 && !info.tropical)
	{
		SPVec3 marshLoc = spVec3Mul(noiseLoc, 60000.0);
		info.marsh = spNoiseGet(threadState->spNoise2, marshLoc, 2) > 0.1;
	}
	bool noFruitTrees = info.polar || info.winterVeryCold;

	bool yarrowLand = !info.tropical && !info.desert && !hotSteppe && !subtropical && !info.summerVeryCold && (info.temperate || info.tundra || coolSteppe || info.coniferous);
	bool gotuKolaLand = info.rainforest || info.lushSavanna || ((info.tropical || subtropical) && info.nearRiver);
	bool lemongrassLand = info.tropical && !info.nearRiver && info.altitudeMeters > 1.5 && !(info.rainforest && info.forestDensity >= 3);
	bool mintLand = info.nearRiver && (info.temperate || coolSteppe || (info.tundra && info.coniferous && !info.summerVeryCold));
	bool thinTurmeric = yarrowLand;
	bool thinGinger = (info.temperate && info.nearRiver) || info.winterVeryCold;
	bool thinAloe = info.temperate && !info.drySummer;
	bool thinMarigold = gotuKolaLand || (yarrowLand && (info.tundra || info.winterVeryCold || info.altitudeMeters > 1500.0));
	bool thinGarlic = lemongrassLand;
	bool thinEchinacea = info.tundra;
	bool thinWheat = info.tropical || info.tundra || info.summerCold || info.summerVeryCold || info.altitudeMeters > 2000.0;
	bool coldLand = info.tundra || info.polar || info.subarctic || info.summerCold || info.summerVeryCold || info.altitudeMeters > 2500.0;
	bool drySavanna = info.savanna && !info.lushSavanna;
	bool forestEdge = info.temperate && info.forestDensity < 3 && !info.nearRiver;
	bool keepThinnedPlants = randomInt(faceUniqueID, 1701, 3) == 0;
	bool thinCrops = (info.forestDensity == 4 || (info.savanna && info.forestDensity == 3)) && randomInt(faceUniqueID, 1702, 5) >= 2;
	bool thinDenseForestCrops = info.forestDensity == 4 && !tropicalForest && randomInt(faceUniqueID, 1703, 3) != 0;

	uint32_t incomingTypes[BIOME_MAX_GAME_OBJECT_COUNT_PER_SUBDIVISION];
	for(int i = 0; i < incomingTypeCount; i++)
	{
		incomingTypes[i] = types[i];
	}

	bool blocked = info.cliff || steepness > 1.0 || altitude < -0.0000001;

	int addedCount = 0;
	if(!blocked && altitude >= 0.0)
	{
		addedCount = addForestTrees(threadState, types, addedCount, &info, noiseLoc, faceUniqueID, level);
	}

	for(int i = 0; i < incomingTypeCount; i++)
	{
		uint32_t type = incomingTypes[i];

		if(isForestTree(type))
		{
			continue;
		}

		if(!keepThinnedPlants)
		{
			if((thinTurmeric && type == gameObjectType_turmericPlant) ||
				(thinGinger && type == gameObjectType_gingerPlant) ||
				(thinAloe && type == gameObjectType_aloePlant) ||
				(thinMarigold && type == gameObjectType_marigoldPlant) ||
				(thinGarlic && type == gameObjectType_garlicPlant) ||
				(thinEchinacea && type == gameObjectType_echinaceaPlant) ||
				(thinWheat && type == gameObjectType_cropTypes[0]))
			{
				continue;
			}
		}

		bool crop = isInList(type, gameObjectType_cropTypes, CROP_TYPE_COUNT);
		bool temperatePlant = isInList(type, gameObjectType_temperatePlantTypes, TEMPERATE_PLANT_TYPE_COUNT);
		if(crop || temperatePlant || isFruitTree(type))
		{
			if(altitude <= 0.0 || (info.tidal && type != gameObjectType_temperatePlantTypes[3]))
			{
				continue;
			}
		}

		if(type == gameObjectType_orangeTree)
		{
			if(noFruitTrees || info.altitudeMeters > 2000.0 || (info.rainforest && info.forestDensity == 4))
			{
				continue;
			}
			if(drySavanna && !info.nearRiver && info.forestDensity <= 1)
			{
				continue;
			}
			if(info.drySummer && !info.nearRiver && (mediterraneanSteppe || (mediterranean && randomInt(faceUniqueID, 1723, 3) != 0)))
			{
				continue;
			}
			if(info.winterCold && !(info.winterCool && info.summerHot))
			{
				type = gameObjectType_peachTree;
			}
		}
		else if(type == gameObjectType_peachTree)
		{
			if(info.polar || info.tundra || info.coniferous || info.summerVeryCold || !info.temperate)
			{
				continue;
			}
		}
		else if(type == gameObjectType_appleTree)
		{
			if(info.polar || info.subarctic || info.winterModerate || info.winterHot)
			{
				continue;
			}
			if(info.forestDensity == 4 && randomInt(faceUniqueID, 1750 + i, 3) != 0)
			{
				continue;
			}
		}
		else if(type == gameObjectType_elderberryTree)
		{
			if(info.polar || info.subarctic || info.summerVeryCold || (info.tundra && info.summerCold))
			{
				continue;
			}
			if(info.drySummer && !info.nearRiver && randomInt(faceUniqueID, 1721, 3) != 0)
			{
				continue;
			}
			if(randomInt(faceUniqueID, 1760 + i, 2) == 0)
			{
				continue;
			}
		}
		else if(type == gameObjectType_bananaTree)
		{
			if(info.altitudeMeters >= 1800.0 || (drySavanna && !info.nearRiver))
			{
				continue;
			}
		}
		else if(type == gameObjectType_coconutTree)
		{
			if(info.altitudeMeters > 150.0 || (drySavanna && !info.nearRiver))
			{
				continue;
			}
		}
		else if(type == gameObjectType_temperatePlantTypes[0])
		{
			if(((mediterranean || mediterraneanSteppe) && !info.nearRiver) || (info.tundra && info.summerVeryCold))
			{
				continue;
			}
			if(subtropical && !info.nearRiver && randomInt(faceUniqueID, 1724, 3) != 0)
			{
				continue;
			}
			if(forestEdge && (info.grove < -0.14 || info.grove > 0.35))
			{
				continue;
			}
		}
		else if(type == gameObjectType_temperatePlantTypes[1])
		{
			if(info.summerVeryCold || (!coldWinter && (subtropical || mediterranean || info.summerHot)))
			{
				continue;
			}
			if(forestEdge)
			{
				if(info.grove < -0.14)
				{
					continue;
				}
				if(groveScale > 0)
				{
					ADD_OBJECT(type);
				}
			}
		}
		else if(type == gameObjectType_temperatePlantTypes[2] || type == gameObjectType_temperatePlantTypes[3] || type == gameObjectType_cropTypes[2])
		{
			if(coldLand)
			{
				continue;
			}
		}
		else if(type == gameObjectType_cropTypes[1])
		{
			if(info.rainforest && randomInt(faceUniqueID, 1704, 3) != 0)
			{
				continue;
			}
			if(((info.tundra && info.coniferous) || (info.river && info.altitudeMeters < 1.6)) && randomInt(faceUniqueID, 1705, 2) == 0)
			{
				continue;
			}
		}
		else if(type == gameObjectType_cropTypes[3])
		{
			if(info.rainforest && info.forestDensity == 3 && randomInt(faceUniqueID, 1702, 5) >= 2)
			{
				continue;
			}
			if(!info.tropical && info.river && info.altitudeMeters < 1.6 && randomInt(faceUniqueID, 1706, 3) != 0)
			{
				continue;
			}
		}
		else if(type == gameObjectType_echinaceaPlant && info.altitudeMeters < 1.5)
		{
			continue;
		}

		if(type == gameObjectType_peachTree && (mediterranean || coolSteppe) && randomInt(faceUniqueID, 1770 + i, 2) == 0)
		{
			continue;
		}

		if(thinDenseForestCrops && !isSunPlant(type) && (crop || temperatePlant))
		{
			continue;
		}

		if((type == gameObjectType_bamboo || type == gameObjectType_smallBamboo) && (altitude <= 0.0 || info.tidal))
		{
			continue;
		}

		if(tropicalForest)
		{
			if(temperatePlant)
			{
				continue;
			}
			if(type == gameObjectType_bamboo || type == gameObjectType_smallBamboo || type == gameObjectType_bambooBranch)
			{
				if(!info.bambooGrove || (info.savanna && !info.river && info.forestDensity <= 1 && !info.lushSavanna))
				{
					continue;
				}
			}
			if(type == gameObjectType_pineBranch || type == gameObjectType_willowBranch)
			{
				continue;
			}
			if(type == gameObjectType_elderberryTree || type == gameObjectType_cropTypes[2])
			{
				continue;
			}
			if(thinCrops && crop)
			{
				continue;
			}
		}

		if(sunPercent != 100 && isSunPlant(type))
		{
			if(sunPercent < 100)
			{
				if((int)randomInt(faceUniqueID, 1711 + i, 100) >= sunPercent)
				{
					continue;
				}
			}
			else if((int)randomInt(faceUniqueID, 1711 + i, 100) < sunPercent - 100)
			{
				ADD_OBJECT(type);
			}
		}

		ADD_OBJECT(type);
	}

	addedCount = addWildPlants(types, addedCount, &info, faceUniqueID, level);

	if(blocked)
	{
		return addedCount;
	}

	bool mangroveLand = info.tropical || (subtropical && info.hot) || ((info.desert || hotSteppe) && info.hot && !coldWinter);
	if(level == SP_SUBDIVISIONS - 4 && info.altitudeMeters > -0.3 && info.altitudeMeters < 6.0 && riverDistance > 0.05 && steepness <= 0.5 && mangroveLand)
	{
		SPVec3 mangroveLoc = spVec3Mul(noiseLoc, 20000.0);
		bool mangroveShore = spNoiseGet(threadState->spNoise2, mangroveLoc, 2) > 0.0;
		if(info.tropical)
		{
			uint32_t coconutChance = 0;
			if(!mangroveShore && info.altitudeMeters > 0.3)
			{
				coconutChance = 8;
			}
			else if(mangroveShore && info.altitudeMeters > 1.5)
			{
				coconutChance = 32;
			}
			if(info.savanna && !info.lushSavanna)
			{
				coconutChance *= 2;
			}
			if(coconutChance > 0)
			{
				addedCount = addPatch(types, addedCount, faceUniqueID, 9031, coconutChance, 1, 2, &gameObjectType_coconutTree, 1);
			}
		}
		if(mangroveShore && info.altitudeMeters < 1.5)
		{
			if(info.tropical)
			{
				addedCount = addPatch(types, addedCount, faceUniqueID, 7601, 2, 1, 2, gameObjectType_mangroveTypes, MANGROVE_TYPE_COUNT);
			}
			else if(subtropical)
			{
				addedCount = addPatch(types, addedCount, faceUniqueID, 7601, 5, 1, 1, gameObjectType_mangroveTypes, MANGROVE_TYPE_COUNT);
			}
			else
			{
				addedCount = addPatch(types, addedCount, faceUniqueID, 7601, 8, 1, 0, gameObjectType_mangroveTypes, MANGROVE_TYPE_COUNT);
			}
		}
	}
	if((info.desert || hotSteppe) && info.nearRiver && altitude > 0.0)
	{
		addedCount = addDesertRiver(types, addedCount, &info, faceUniqueID, level);
	}
	if(arcticTundra && !info.beach && altitude > 0.0 && (fabs(pointNormal.y) > 0.6 || randomInt(faceUniqueID, 7400, 3) == 0))
	{
		addedCount = addTundra(types, addedCount, &info, faceUniqueID, level);
	}
	if(cloudForest && !info.beach)
	{
		addedCount = addCloudForest(types, addedCount, &info, faceUniqueID, level);
	}
	if(tropicalForest && info.savanna && !info.beach && altitude >= 0.0)
	{
		addedCount = addGalleryForest(threadState, types, addedCount, &info, noiseLoc, faceUniqueID, level);
	}

	bool dryLand = info.desert || hotSteppe || mediterranean || mediterraneanSteppe;
	bool warmRiverLand = (mediterranean || mediterraneanSteppe || subtropical || (info.temperate && info.winterModerate)) && info.nearRiver;
	bool coldDesert = info.desert && coldWinter && !info.polar && !info.icecap;
	bool dryPineWoodland = info.forestDensity == 1 && info.coniferous && (info.dry || info.drySummer) && !info.tropical && !info.tundra && !info.polar;
	bool dampForest = info.forestDensity >= 2 && !info.drySummer && !info.desert && (info.temperate || info.rainforest || (info.coniferous && !info.tropical));

	bool oasis = false;
	bool coldOasis = false;
	bool hollow = false;
	double patchNoise = 0.0;
	if((info.desert || hotSteppe || info.lushSavanna) && !info.polar && !info.icecap && !info.beach && altitude > 0.0)
	{
		SPVec3 oasisLoc = spVec3Mul(noiseLoc, 60000.0);
		patchNoise = spNoiseGet(threadState->spNoise1, oasisLoc, 2);
		if(info.altitudeMeters < 1500.0 && steepness < 0.5)
		{
			if(info.desert)
			{
				if(coldDesert)
				{
					coldOasis = patchNoise > 0.35;
				}
				else
				{
					oasis = info.summerHot && patchNoise > 0.4;
				}
			}
			else if(hotSteppe)
			{
				hollow = patchNoise > 0.35;
			}
		}
	}
	double savannaClump = 0.0;
	if(info.savanna && !info.lushSavanna && level == SP_SUBDIVISIONS - 4)
	{
		SPVec3 clumpLoc = spVec3Mul(noiseLoc, 250000.0);
		savannaClump = spNoiseGet(threadState->spNoise1, clumpLoc, 2);
	}

	bool wadi = false;
	if(info.desert && !coldDesert && !info.polar && !info.icecap && !info.beach && altitude > 0.0 && steepness < 0.5)
	{
		SPVec3 wadiLoc = spVec3Mul(noiseLoc, 20000.0);
		wadi = fabs(spNoiseGet(threadState->spNoise2, wadiLoc, 2)) < 0.012;
	}

	bool bog = false;
	if((arcticTundra || info.subarctic || (info.temperate && info.coniferous && info.winterVeryCold && !info.drySummer && !info.tropicalLatitude && !info.summerHot)) && !info.beach && altitude > 0.0)
	{
		SPVec3 bogLoc = spVec3Mul(noiseLoc, 173000.0);
		bog = spNoiseGet(threadState->spNoise2, bogLoc, 2) > 0.33;
	}

	if(level == SP_SUBDIVISIONS - 6)
	{
		if(oasis)
		{
			addedCount = addPatch(types, addedCount, faceUniqueID, 8501, 1, 4, 4, gameObjectType_datePalmTypes, DATE_PALM_TYPE_COUNT);
			addedCount = addPatch(types, addedCount, faceUniqueID, 8511, 2, 1, 1, &gameObjectType_tamarisk, 1);
			if(doumLand)
			{
				addedCount = addPatch(types, addedCount, faceUniqueID, 8521, 3, 1, 1, gameObjectType_doumPalmTypes, DOUM_PALM_TYPE_COUNT);
			}
			if(info.hot)
			{
				addedCount = addPatch(types, addedCount, faceUniqueID, 8771, 3, 1, 1, &gameObjectType_acacia2, 1);
			}
		}
		if(mediterraneanSteppe && !info.beach && altitude > 0.0 && (int)randomInt(faceUniqueID, 8790, 10) < groveScale)
		{
			addedCount = addPatch(types, addedCount, faceUniqueID, 8791, 1, 1, 0, &gameObjectType_acacia2, 1);
		}
		if(subtropical && info.dryWinter && info.hot && (info.forestDensity == 1 || info.forestDensity == 2) && !info.beach && altitude > 0.0)
		{
			addedCount = addPatch(types, addedCount, faceUniqueID, 8801, info.forestDensity == 1 ? 3 : 8, 1, 1, &gameObjectType_acacia2, 1);
			addedCount = addPatch(types, addedCount, faceUniqueID, 8811, info.forestDensity == 1 ? 8 : 24, 1, 0, gameObjectType_acaciaTypes, ACACIA_TYPE_COUNT);
		}
		if(subtropical && info.dryWinter && info.hot && info.forestDensity > 0 && info.altitudeMeters < 1200.0 && !info.beach && !info.tidal && altitude > 0.0)
		{
			addedCount = addPatch(types, addedCount, faceUniqueID, 8861, 12, 1, 0, gameObjectType_banyanTypes, BANYAN_TYPE_COUNT);
		}
		if(wadi)
		{
			if(info.hot)
			{
				addedCount = addPatch(types, addedCount, faceUniqueID, 8661, 2, 1, 1, &gameObjectType_acacia2, 1);
				addedCount = addPatch(types, addedCount, faceUniqueID, 8781, 6, 1, 0, gameObjectType_acaciaTypes, ACACIA_TYPE_COUNT);
			}
			if(tamariskLand)
			{
				addedCount = addPatch(types, addedCount, faceUniqueID, 8671, 2, 1, 1, &gameObjectType_tamarisk, 1);
			}
			addedCount = addPatch(types, addedCount, faceUniqueID, 8681, 1, 1, 2, &gameObjectType_mesquiteTree, 1);
			if(!info.aridDesert)
			{
				addedCount = addPatch(types, addedCount, faceUniqueID, 8871, 10, 1, 0, &gameObjectType_figTreeWild, 1);
			}
			if(info.hot && info.altitudeMeters < 1500.0)
			{
				addedCount = addPatch(types, addedCount, faceUniqueID, 8881, 8, 1, 0, gameObjectType_datePalmTypes, DATE_PALM_TYPE_COUNT);
			}
			if(!info.aridDesert && info.winterModerate && !info.summerVeryHot && !info.tropicalLatitude && info.altitudeMeters < 1300.0)
			{
				addedCount = addPatch(types, addedCount, faceUniqueID, 8841, 4, 1, 0, &gameObjectType_argan, 1);
			}
		}
		if(coldOasis && tamariskLand)
		{
			addedCount = addPatch(types, addedCount, faceUniqueID, 8561, 2, 1, 1, &gameObjectType_tamarisk, 1);
		}
		if(coldDesert && !info.beach && altitude > 0.0)
		{
			SPVec3 groveLoc = spVec3Mul(noiseLoc, 250000.0);
			double groveNoise = spNoiseGet(threadState->spNoise1, groveLoc, 2);
			if(info.altitudeMeters > 500.0 || steepness > 0.3)
			{
				if(!info.aridDesert && groveNoise > (info.altitudeMeters > 500.0 ? 0.1 : 0.3))
				{
					addedCount = addPatch(types, addedCount, faceUniqueID, 8531, 1, 1, 1, gameObjectType_juniperTypes, JUNIPER_TYPE_COUNT);
				}
			}
			else if(groveNoise > 0.3 && !info.summerCold && !info.summerVeryCold)
			{
				addedCount = addPatch(types, addedCount, faceUniqueID, 8611, 1, 1, 2, &gameObjectType_saxaul, 1);
			}
		}
		if(info.beach && info.nearRiver && altitude > 0.0 && (subtropical || (info.temperate && info.winterCold && info.summerHot && !info.drySummer)))
		{
			addedCount = addPatch(types, addedCount, faceUniqueID, 8851, (subtropical || info.winterCool) ? 2 : 6, 1, 1, &gameObjectType_baldCypress, 1);
		}
		if(info.seaside && info.forestDensity <= 1 && !info.tropical && !info.winterVeryCold && (info.temperate || mediterranean) && groveScale > 0 && altitude > 0.0)
		{
			addedCount = addPatch(types, addedCount, faceUniqueID, 8111, 1, 2, 2, &gameObjectType_maritimePine, 1);
		}
		if(info.seaside && mediterraneanSteppe && altitude > 0.0)
		{
			addedCount = addPatch(types, addedCount, faceUniqueID, 8121, 3, 1, 1, &gameObjectType_maritimePine, 1);
		}
	}
	else if(level == SP_SUBDIVISIONS - 4)
	{
		if((info.rainforest || (info.savanna && info.river)) && info.bambooGrove && info.forestDensity > 0 && !info.beach && !info.tidal && altitude > 0.0)
		{
			addedCount = addPatch(types, addedCount, faceUniqueID, 8821, 1, 5, 4, &gameObjectType_bamboo, 1);
		}
		if(info.nearRiver && altitude > 0.0 && !info.winterVeryCold && info.altitudeMeters < 1500.0)
		{
			if((mediterranean || mediterraneanSteppe) && info.forestDensity < 3)
			{
				addedCount = addPatch(types, addedCount, faceUniqueID, 8201, info.winterCold ? 12 : 6, 2, 2, &gameObjectType_oleander, 1);
				if(tamariskLand)
				{
					addedCount = addPatch(types, addedCount, faceUniqueID, 8891, 16, 1, 0, &gameObjectType_tamarisk, 1);
				}
			}
			else if((hotSteppe || info.desert) && !info.winterCold)
			{
				addedCount = addPatch(types, addedCount, faceUniqueID, 8201, 12, 2, 2, &gameObjectType_oleander, 1);
			}
		}
		if(wadi)
		{
			addedCount = addPatch(types, addedCount, faceUniqueID, 8971, 12, 2, 2, &gameObjectType_oleander, 1);
			if(doumLand)
			{
				addedCount = addPatch(types, addedCount, faceUniqueID, 8901, 40, 2, 1, gameObjectType_doumPalmTypes, DOUM_PALM_TYPE_COUNT);
			}
		}
		if(tamariskLand)
		{
			if(info.altitudeMeters > 0.1 && info.altitudeMeters < 1.5 && riverDistance > 0.01 && dryLand)
			{
				addedCount = addPatch(types, addedCount, faceUniqueID, 8211, 12, 2, 2, &gameObjectType_tamarisk, 1);
			}
			if((info.desert || hotSteppe || (info.dryRiver && coolSteppe)) && info.nearRiver && altitude > 0.0)
			{
				addedCount = addPatch(types, addedCount, faceUniqueID, 8911, 12, 1, 1, &gameObjectType_tamarisk, 1);
			}
		}
		if(doumLand)
		{
			if(coast && (info.desert || hotSteppe))
			{
				addedCount = addPatch(types, addedCount, faceUniqueID, 8221, 36, 2, 1, gameObjectType_doumPalmTypes, DOUM_PALM_TYPE_COUNT);
			}
			if((info.desert || hotSteppe) && info.nearRiver)
			{
				if(altitude > 0.0)
				{
					addedCount = addPatch(types, addedCount, faceUniqueID, 8231, 50, 2, 1, gameObjectType_doumPalmTypes, DOUM_PALM_TYPE_COUNT);
				}
			}
			else if(hollow)
			{
				addedCount = addPatch(types, addedCount, faceUniqueID, 8241, 10, 2, 1, gameObjectType_doumPalmTypes, DOUM_PALM_TYPE_COUNT);
			}
			if(info.savanna && !info.lushSavanna && !info.beach && altitude > 0.0)
			{
				if(info.nearRiver)
				{
					addedCount = addPatch(types, addedCount, faceUniqueID, 8251, 40, 2, 1, gameObjectType_doumPalmTypes, DOUM_PALM_TYPE_COUNT);
				}
				else if(savannaClump > 0.14)
				{
					addedCount = addPatch(types, addedCount, faceUniqueID, 8921, 40, 2, 1, gameObjectType_doumPalmTypes, DOUM_PALM_TYPE_COUNT);
				}
			}
		}
		if(info.lushSavanna && info.nearRiver && altitude > 0.0)
		{
			addedCount = addPatch(types, addedCount, faceUniqueID, 8251, 120, 2, 1, gameObjectType_wildPalmTypes, WILD_PALM_TYPE_COUNT);
		}
		if(aspenParkland && !info.beach && altitude > 0.0 && !info.nearRiver && info.grove > 0.0 && groveScale == 0)
		{
			addedCount = addPatch(types, addedCount, faceUniqueID, 8261, 6, 1, 2, gameObjectType_juniperTypes, JUNIPER_TYPE_COUNT);
			addedCount = addPatch(types, addedCount, faceUniqueID, 8691, 6, 2, 2, &gameObjectType_seaBuckthorn, 1);
		}
		if(info.nearRiver && altitude > 0.0 && (aspenParkland || info.oakSavanna || coldDesert))
		{
			addedCount = addPatch(types, addedCount, faceUniqueID, 8931, 6, 1, 1, &gameObjectType_seaBuckthorn, 1);
		}
		if(coldOasis)
		{
			addedCount = addPatch(types, addedCount, faceUniqueID, 8941, 6, 1, 1, &gameObjectType_seaBuckthorn, 1);
		}
		if(riverDistance > 0.05 && info.altitudeMeters > 0.5 && info.altitudeMeters < 6.0 && (info.temperate || coolSteppe) && coldWinter && !info.drySummer && info.forestDensity <= 2 && groveScale == 0)
		{
			addedCount = addPatch(types, addedCount, faceUniqueID, 8951, 8, 2, 2, &gameObjectType_seaBuckthorn, 1);
		}
		if(coldDesert && !info.beach && altitude > 0.0)
		{
			if(!coldOasis && !info.nearRiver)
			{
				bool rocky = steepness > 0.3 || info.altitudeMeters > 1500.0;
				uint32_t ephedraChance = rocky ? 12 : 30;
				if(info.aridDesert)
				{
					ephedraChance *= 2;
				}
				addedCount = addPatch(types, addedCount, faceUniqueID, 9511, ephedraChance, 1, 1, &gameObjectType_ephedra, 1);
			}
			if(patchNoise > 0.1 && info.altitudeMeters < 1500.0 && steepness < 0.3)
			{
				addedCount = addPatch(types, addedCount, faceUniqueID, 9521, 12, 1, 1, &gameObjectType_seaBuckthorn, 1);
			}
		}
		else if(hotSteppe && coldWinter && !info.beach && !info.nearRiver && altitude > 0.0)
		{
			addedCount = addPatch(types, addedCount, faceUniqueID, 9511, info.winterVeryCold ? 20 : 30, 1, 1, &gameObjectType_ephedra, 1);
		}
		else if((mediterraneanSteppe || info.desert) && steepness > 0.3 && !info.beach && !info.nearRiver && altitude > 0.0)
		{
			addedCount = addPatch(types, addedCount, faceUniqueID, 9511, 60, 1, 1, &gameObjectType_ephedra, 1);
		}
		if(!coldWinter && !info.beach && altitude > 0.0)
		{
			uint32_t myrrhChance = 0;
			uint32_t hennaChance = 0;
			int hennaMin = 1;
			bool hennaWater = info.nearRiver || oasis || wadi || hollow;
			if(info.desert)
			{
				if(wadi)
				{
					myrrhChance = 6;
					hennaChance = 10;
				}
				else if(oasis)
				{
					hennaChance = 8;
				}
				else if(info.nearRiver)
				{
					hennaChance = 12;
				}
				else if(steepness > 0.3)
				{
					myrrhChance = 24;
					hennaChance = 160;
				}
				else
				{
					myrrhChance = info.aridDesert ? 120 : 80;
					hennaChance = info.aridDesert ? 160 : 120;
				}
			}
			else if(hotSteppe)
			{
				myrrhChance = info.winterHot ? 16 : 30;
				hennaChance = hennaWater ? 10 : (info.winterHot ? 60 : 80);
			}
			else if(info.savanna && !info.lushSavanna)
			{
				if(info.forestDensity <= 2)
				{
					myrrhChance = info.forestDensity <= 1 ? 16 : 30;
				}
				hennaChance = info.nearRiver ? 16 : 80;
			}
			else if(info.lushSavanna && info.nearRiver)
			{
				hennaChance = 30;
			}
			if(hennaWater)
			{
				hennaMin = 2;
			}
			if(!info.summerHot && !info.summerVeryHot)
			{
				myrrhChance *= 2;
				hennaChance *= 2;
			}
			if(myrrhChance > 0 && !info.nearRiver && info.altitudeMeters > 5.0 && info.altitudeMeters < (info.tropicalLatitude ? 2000.0 : 1500.0))
			{
				addedCount = addPatch(types, addedCount, faceUniqueID, 9531, myrrhChance, 1, 1, &gameObjectType_myrrh, 1);
			}
			if(hennaChance > 0 && info.altitudeMeters < (info.tropicalLatitude ? 1800.0 : 1300.0))
			{
				addedCount = addPatch(types, addedCount, faceUniqueID, 9541, hennaChance, hennaMin, 1, &gameObjectType_henna, 1);
			}
		}
		if(info.rainforest && !info.beach && !info.tidal && !info.bambooGrove && altitude > 0.0 && info.altitudeMeters < 1800.0)
		{
			uint32_t dragonsBloodChance = info.forestDensity <= 2 ? 12 : (info.forestDensity == 3 ? 24 : 80);
			if(info.nearRiver)
			{
				dragonsBloodChance = 8;
			}
			addedCount = addPatch(types, addedCount, faceUniqueID, 9551, dragonsBloodChance, info.nearRiver ? 2 : 1, 1, &gameObjectType_dragonsBlood, 1);
		}
		else if(info.lushSavanna && !info.beach && !info.tidal && !info.bambooGrove && altitude > 0.0 && info.altitudeMeters < 1500.0)
		{
			addedCount = addPatch(types, addedCount, faceUniqueID, 9551, info.nearRiver ? 12 : 60, 1, 1, &gameObjectType_dragonsBlood, 1);
		}
		else if(cloudForest && !info.beach && altitude > 0.0 && info.altitudeMeters < 2000.0)
		{
			addedCount = addPatch(types, addedCount, faceUniqueID, 9551, 40, 1, 1, &gameObjectType_dragonsBlood, 1);
		}
		if(bog && (arcticTundra || info.subarctic) && !info.summerVeryCold)
		{
			addedCount = addPatch(types, addedCount, faceUniqueID, 8581, 4, 1, 1, gameObjectType_dwarfBirchTypes, DWARF_BIRCH_TYPE_COUNT);
			addedCount = addPatch(types, addedCount, faceUniqueID, 8961, 12, 1, 0, &gameObjectType_larch, 1);
			addedCount = addPatch(types, addedCount, faceUniqueID, 9071, 6, 1, 1, &gameObjectType_arcticWillow, 1);
		}
		else if(bog && !info.summerVeryCold)
		{
			addedCount = addPatch(types, addedCount, faceUniqueID, 8581, 8, 1, 1, gameObjectType_dwarfBirchTypes, DWARF_BIRCH_TYPE_COUNT);
		}
		if(bog && info.temperate && info.coniferous && !info.subarctic && info.forestDensity > 0)
		{
			addedCount = addPatch(types, addedCount, faceUniqueID, 9061, 12, 1, 0, gameObjectType_alderTypes, ALDER_TYPE_COUNT);
		}
		if(info.temperate && coldWinter && !info.summerHot && !mediterranean && info.forestDensity >= 1 && info.forestDensity <= 3 && !info.beach && info.altitudeMeters > 1.5 && info.grove > 0.0 && info.grove < 0.25)
		{
			addedCount = addPatch(types, addedCount, faceUniqueID, 9041, 32, 2, 3, &gameObjectType_temperatePlantTypes[0], 1);
		}
		if((info.deciduous || info.mixedForest || subtropical || cloudForest) && !info.subarctic && info.forestDensity > 0 && !info.beach && info.altitudeMeters > 1.5)
		{
			if(info.nearRiver)
			{
				addedCount = addPatch(types, addedCount, faceUniqueID, 9051, 60, 1, 1, &gameObjectType_elderberryTree, 1);
			}
			else if(groveScale == 0 || sunPercent > 100)
			{
				addedCount = addPatch(types, addedCount, faceUniqueID, 9051, 160, 1, 0, &gameObjectType_elderberryTree, 1);
			}
		}
		if((info.deciduous || info.mixedForest) && !subtropical && !info.subarctic && !cloudForest && info.forestDensity > 0 && !info.beach && info.altitudeMeters > 1.5 && (int)randomInt(faceUniqueID, 8620, info.mixedForest ? 1600 : 800) < shadePercent)
		{
			addedCount = addPatch(types, addedCount, faceUniqueID, 8621, 1, 1, 2, &gameObjectType_hazelBush, 1);
		}
		if((info.oakSavanna || aspenParkland) && !info.beach && info.altitudeMeters > 1.5 && (int)randomInt(faceUniqueID, 8620, 3200) < shadePercent)
		{
			addedCount = addPatch(types, addedCount, faceUniqueID, 8621, 1, 1, 2, &gameObjectType_hazelBush, 1);
		}
		if(info.subarctic && info.forestDensity <= 2 && !info.nearRiver && !info.beach && altitude > 0.0 && tundraPatch < -0.14)
		{
			addedCount = addPatch(types, addedCount, faceUniqueID, 8271, info.summerCold ? 2 : 4, 1, 1, gameObjectType_dwarfBirchTypes, DWARF_BIRCH_TYPE_COUNT);
		}
	}
	else if(level == SP_SUBDIVISIONS - 3)
	{
		if((info.rainforest || (info.savanna && info.river)) && info.bambooGrove && info.forestDensity > 0 && !info.beach && !info.tidal && altitude > 0.0)
		{
			addedCount = addPatch(types, addedCount, faceUniqueID, 8831, 4, 2, 3, &gameObjectType_smallBamboo, 1);
		}
		bool warmDryRiver = hotSteppe && !coldWinter && info.river;
		if(info.altitudeMeters < 1.2 && ((info.tropical && info.river) || (warmDryRiver && info.tropicalLatitude)))
		{
			addedCount = addPatch(types, addedCount, faceUniqueID, 8301, (info.tropical && (info.rainforest || info.lushSavanna)) ? 4 : 8, 3, 3, &gameObjectType_papyrus, 1);
		}
		if(info.altitudeMeters > -0.1 && !info.winterVeryCold)
		{
			if(warmRiverLand && info.river)
			{
				addedCount = addPatch(types, addedCount, faceUniqueID, 8311, (subtropical || mediterranean || mediterraneanSteppe) ? 4 : 8, 3, 3, &gameObjectType_giantReed, 1);
			}
			else if(warmDryRiver && !info.tropicalLatitude)
			{
				addedCount = addPatch(types, addedCount, faceUniqueID, 8311, 8, 3, 3, &gameObjectType_giantReed, 1);
			}
		}
		if(arcticTundra && info.altitudeMeters > -0.3 && (!info.beach || info.nearRiver) && (altitude > 0.0 || info.river) && tundraPatch < -0.14 && randomInt(faceUniqueID, 8380, 10) < (uint32_t)(info.summerVeryCold ? 1 : 4))
		{
			addedCount = addPatch(types, addedCount, faceUniqueID, 8381, 1, 3, 3, &gameObjectType_cottonGrass, 1);
		}
		if(arcticTundra && info.nearRiver && altitude > 0.0)
		{
			addedCount = addPatch(types, addedCount, faceUniqueID, 8631, info.summerVeryCold ? 8 : 4, 2, 2, &gameObjectType_arcticWillow, 1);
		}
		else if(arcticTundra && !info.beach && altitude > 0.0 && tundraPatch > 0.0 && tundraPatch <= 0.14 && randomInt(faceUniqueID, 8630, 14) < (info.summerVeryCold ? 2 : 4))
		{
			addedCount = addPatch(types, addedCount, faceUniqueID, 8631, 1, 2, 2, &gameObjectType_arcticWillow, 1);
		}
		if(info.temperate && info.summerCold && info.winterVeryCold && !info.drySummer && !info.tropicalLatitude && altitude > 0.0)
		{
			if(info.nearRiver)
			{
				addedCount = addPatch(types, addedCount, faceUniqueID, 8631, 16, 2, 2, &gameObjectType_arcticWillow, 1);
			}
			else if(info.forestDensity <= 2 && !info.beach && tundraPatch > 0.0 && tundraPatch <= 0.14)
			{
				addedCount = addPatch(types, addedCount, faceUniqueID, 8631, 14, 2, 2, &gameObjectType_arcticWillow, 1);
			}
		}
		bool dryWinterWoodland = subtropical && info.dryWinter && info.hot && info.forestDensity <= 2;
		bool drySummerPine = info.temperate && info.drySummer && info.coniferous && info.winterVeryCold && !info.tundra && !info.polar;
		if(info.savanna && !info.beach && !info.tidal && altitude > 0.0)
		{
			uint32_t elephantGrassChance = 16;
			if(info.nearRiver && !info.river)
			{
				elephantGrassChance = 4;
			}
			else if(info.lushSavanna)
			{
				if(patchNoise > 0.14)
				{
					elephantGrassChance = 0;
				}
				else
				{
					elephantGrassChance = patchNoise > 0.02 ? 2 : 8;
				}
			}
			if(info.forestDensity >= 3)
			{
				elephantGrassChance *= 2;
			}
			if(elephantGrassChance > 0)
			{
				addedCount = addPatch(types, addedCount, faceUniqueID, 8641, elephantGrassChance, 2, 3, &gameObjectType_elephantGrass, 1);
			}
		}
		else if(dryWinterWoodland && !info.beach && altitude > 0.0)
		{
			addedCount = addSunPatch(types, addedCount, faceUniqueID, 8641, 24, 2, 3, &gameObjectType_elephantGrass, 1, sunPercent);
		}
		if(!info.beach && !info.nearRiver && altitude > 0.0)
		{
			uint32_t thymeChance = 0;
			if(mediterranean || mediterraneanSteppe)
			{
				thymeChance = steepness > 0.3 ? 10 : 15;
			}
			else if(hotSteppe)
			{
				thymeChance = (info.winterHot && info.altitudeMeters < 1000.0) ? 30 : 15;
			}
			else if(info.oakSavanna || aspenParkland || (drySummerPine && info.forestDensity <= 2))
			{
				thymeChance = 30;
			}
			if(thymeChance > 0)
			{
				addedCount = addSunPatch(types, addedCount, faceUniqueID, 8651, thymeChance, 2, 2, &gameObjectType_thyme, 1, sunPercent);
			}
		}
		if(dampForest && !info.tundra && !info.beach && !info.bambooGrove && altitude > 0.0 && !(dryWinterWoodland && info.forestDensity == 2 && !info.nearRiver))
		{
			uint32_t fernChance = 600;
			if(info.rainforest)
			{
				fernChance = info.altitudeMeters > 900.0 ? 600 : 1600;
			}
			else if(cloudForest)
			{
				fernChance = 300;
			}
			else if(info.subarctic)
			{
				fernChance = 1200;
			}
			if((int)randomInt(faceUniqueID, 8320, fernChance) < shadePercent)
			{
				addedCount = addPatch(types, addedCount, faceUniqueID, 8321, 1, 2, 3, &gameObjectType_groundFern, 1);
			}
		}
		if(yarrowLand && !info.beach && info.altitudeMeters > 1.5 && (!info.tundra || tundraPatch >= -0.14))
		{
			uint32_t yarrowChance = 15;
			if(info.tundra || (mediterranean && info.winterModerate))
			{
				yarrowChance = 30;
			}
			else if(aspenParkland)
			{
				yarrowChance = 8;
			}
			addedCount = addSunPatch(types, addedCount, faceUniqueID, 8331, yarrowChance, 2, 2, &gameObjectType_yarrow, 1, sunPercent);
		}
		bool tundraOpenGround = info.tundra && !info.icecap && !info.summerVeryCold && tundraPatch > -0.14 && tundraPatch <= 0.0;
		if(((info.temperate && !info.drySummer) || coolSteppe || tundraOpenGround || (info.nearRiver && (drySummerPine || (arcticTundra && info.coniferous)))) && !info.beach && altitude > 0.0)
		{
			uint32_t plantainChance = 15;
			if(tundraOpenGround)
			{
				plantainChance = 30;
			}
			else if(info.nearRiver)
			{
				plantainChance = aspenParkland ? 8 : 10;
			}
			else if(mediterraneanSteppe)
			{
				plantainChance = 30;
			}
			else if(info.oakSavanna)
			{
				plantainChance = 20;
			}
			addedCount = addSunPatch(types, addedCount, faceUniqueID, 8341, plantainChance, 2, 2, &gameObjectType_plantain, 1, sunPercent);
		}
		if(mintLand && !info.beach && altitude > 0.0)
		{
			uint32_t mintChance = info.temperate ? 12 : 24;
			if(info.altitudeMeters < 5.0)
			{
				addedCount = addPatch(types, addedCount, faceUniqueID, 8351, mintChance, 4, 4, &gameObjectType_peppermint, 1);
			}
			else
			{
				addedCount = addPatch(types, addedCount, faceUniqueID, 8351, mintChance * 2, 2, 2, &gameObjectType_peppermint, 1);
			}
		}
		else if(dampForest && info.temperate && info.forestDensity >= 3 && !info.beach && altitude > 0.0)
		{
			addedCount = addPatch(types, addedCount, faceUniqueID, 8351, 30, 2, 2, &gameObjectType_peppermint, 1);
		}
		if(!info.beach && altitude > 0.0 && info.altitudeMeters < 2500.0)
		{
			if(mintLand && !mediterranean && !mediterraneanSteppe && !subtropical)
			{
				addedCount = addPatch(types, addedCount, faceUniqueID, 9651, info.temperate ? 36 : 72, 3, 3, &gameObjectType_nettle, 1);
			}
			else if(coldDesert && (coldOasis || info.nearRiver))
			{
				addedCount = addPatch(types, addedCount, faceUniqueID, 9651, 30, 2, 2, &gameObjectType_nettle, 1);
			}
			else if(info.forestDensity > 0 && info.altitudeMeters > 1.5)
			{
				uint32_t nettleChance = 0;
				if((info.deciduous || info.mixedForest) && !subtropical && !cloudForest)
				{
					nettleChance = info.mixedForest ? 14400 : 7200;
				}
				else if(cloudForest)
				{
					nettleChance = 14400;
				}
				else if(info.oakSavanna || aspenParkland)
				{
					nettleChance = 7200;
				}
				if(info.subarctic)
				{
					nettleChance *= 2;
				}
				if(nettleChance > 0 && (int)randomInt(faceUniqueID, 9660, nettleChance) < shadePercent)
				{
					addedCount = addPatch(types, addedCount, faceUniqueID, 9661, 1, 3, 3, &gameObjectType_nettle, 1);
				}
			}
		}
		if(gotuKolaLand && !info.beach && altitude > 0.0)
		{
			uint32_t gotuKolaChance = 24;
			if(!subtropical)
			{
				if(info.nearRiver)
				{
					gotuKolaChance = 12;
				}
				else if(info.lushSavanna || info.forestDensity >= 3)
				{
					gotuKolaChance = 48;
				}
			}
			addedCount = addPatch(types, addedCount, faceUniqueID, 8361, gotuKolaChance, 2, 2, &gameObjectType_gotuKola, 1);
		}
		if(lemongrassLand && !info.beach)
		{
			addedCount = addPatch(types, addedCount, faceUniqueID, 8371, (info.savanna && !info.lushSavanna) ? 16 : 24, 2, 2, &gameObjectType_lemongrass, 1);
		}
		else if(dryWinterWoodland && !info.nearRiver && !info.beach && altitude > 0.0)
		{
			addedCount = addSunPatch(types, addedCount, faceUniqueID, 8371, 30, 2, 2, &gameObjectType_lemongrass, 1, sunPercent);
		}
		if(coldDesert && !info.beach && altitude > 0.0)
		{
			addedCount = addSunPatch(types, addedCount, faceUniqueID, 8411, info.aridDesert ? 30 : 6, 1, 2, gameObjectType_sagebrushTypes, SAGEBRUSH_TYPE_COUNT, sunPercent);
		}
		else if(coolSteppe && !info.beach && altitude > 0.0)
		{
			addedCount = addSunPatch(types, addedCount, faceUniqueID, 8411, info.nearRiver ? 30 : (mediterraneanSteppe ? 16 : 10), 1, 2, gameObjectType_sagebrushTypes, SAGEBRUSH_TYPE_COUNT, sunPercent);
		}
		else if(hotSteppe && coldWinter && !info.beach && altitude > 0.0)
		{
			addedCount = addSunPatch(types, addedCount, faceUniqueID, 8411, 30, 1, 2, gameObjectType_sagebrushTypes, SAGEBRUSH_TYPE_COUNT, sunPercent);
		}
		else if(dryPineWoodland && !info.beach && altitude > 0.0)
		{
			addedCount = addSunPatch(types, addedCount, faceUniqueID, 8411, 20, 1, 2, gameObjectType_sagebrushTypes, SAGEBRUSH_TYPE_COUNT, sunPercent);
		}
		else if(drySummerPine && info.forestDensity == 2 && !info.nearRiver && !info.beach && altitude > 0.0)
		{
			addedCount = addSunPatch(types, addedCount, faceUniqueID, 8411, 40, 1, 2, gameObjectType_sagebrushTypes, SAGEBRUSH_TYPE_COUNT, sunPercent);
		}
		else if(mediterranean && info.forestDensity <= 2 && !info.nearRiver && !info.beach && altitude > 0.0)
		{
			addedCount = addSunPatch(types, addedCount, faceUniqueID, 8411, 25, 1, 2, gameObjectType_sagebrushTypes, SAGEBRUSH_TYPE_COUNT, sunPercent);
		}
		else if(info.tundra && info.forestDensity <= 2 && !info.nearRiver && !info.icecap && !info.summerVeryCold && !info.beach && altitude > 0.0 && tundraPatch > -0.14 && tundraPatch <= 0.0)
		{
			addedCount = addSunPatch(types, addedCount, faceUniqueID, 8411, 30, 1, 2, gameObjectType_sagebrushTypes, SAGEBRUSH_TYPE_COUNT, sunPercent);
		}
		if(!info.beach && !info.nearRiver && altitude > 0.0 && steepness < 0.3)
		{
			uint32_t syrianRueChance = 0;
			if(coldDesert)
			{
				syrianRueChance = 60;
				if(info.aridDesert)
				{
					syrianRueChance = patchNoise > 0.15 ? 30 : 240;
				}
			}
			else if(hotSteppe)
			{
				syrianRueChance = coldWinter ? 60 : (info.winterHot ? 0 : 90);
			}
			else if(mediterraneanSteppe)
			{
				syrianRueChance = 90;
			}
			else if(info.oakSavanna && info.forestDensity <= 1)
			{
				syrianRueChance = 120;
			}
			if(info.summerCold || info.summerVeryCold)
			{
				syrianRueChance *= 2;
			}
			if(info.altitudeMeters > 2500.0)
			{
				syrianRueChance *= 3;
			}
			if(syrianRueChance > 0)
			{
				addedCount = addSunPatch(types, addedCount, faceUniqueID, 9561, syrianRueChance, 2, 2, &gameObjectType_syrianRue, 1, sunPercent);
			}
		}
		if(dryPineWoodland && !info.beach && !info.nearRiver && altitude > 0.0)
		{
			addedCount = addSunPatch(types, addedCount, faceUniqueID, 9581, 60, 1, 1, &gameObjectType_ephedra, 1, sunPercent);
		}
		if(info.tundra && !info.icecap && altitude > 0.0)
		{
			if(info.nearRiver)
			{
				addedCount = addPatch(types, addedCount, faceUniqueID, 9571, 20, 2, 2, &gameObjectType_angelica, 1);
			}
			else if(arcticTundra && coast)
			{
				addedCount = addPatch(types, addedCount, faceUniqueID, 9571, 20, 2, 2, &gameObjectType_angelica, 1);
			}
			else if(!info.beach && !bog && !info.summerVeryCold && tundraPatch > -0.2 && tundraPatch < -0.1)
			{
				addedCount = addPatch(types, addedCount, faceUniqueID, 9571, info.tropicalLatitude ? 16 : 8, 2, 2, &gameObjectType_angelica, 1);
			}
			else if(!info.beach && info.summerVeryCold && tundraPatch < -0.14)
			{
				addedCount = addPatch(types, addedCount, faceUniqueID, 9571, 60, 2, 2, &gameObjectType_angelica, 1);
			}
		}
		else if(info.nearRiver && !info.beach && altitude > 0.0 && info.forestDensity <= 3 && (info.subarctic || (info.temperate && info.winterVeryCold && info.summerCold && !info.drySummer)))
		{
			addedCount = addPatch(types, addedCount, faceUniqueID, 9571, info.subarctic ? 16 : 30, 2, 2, &gameObjectType_angelica, 1);
		}
		else if(info.subarctic && coast)
		{
			addedCount = addPatch(types, addedCount, faceUniqueID, 9571, 20, 2, 2, &gameObjectType_angelica, 1);
		}
		if(oasis)
		{
			addedCount = addPatch(types, addedCount, faceUniqueID, 8541, 8, 3, 3, &gameObjectType_commonReed, 1);
			addedCount = addPatch(types, addedCount, faceUniqueID, 8551, 16, 3, 3, &gameObjectType_cattail, 1);
		}
		if(coldOasis)
		{
			addedCount = addPatch(types, addedCount, faceUniqueID, 8571, 24, 3, 3, &gameObjectType_commonReed, 1);
		}
		if(wadi && info.hot)
		{
			addedCount = addPatch(types, addedCount, faceUniqueID, 8431, 12, 2, 2, &gameObjectType_lemongrass, 1);
		}
		if(!coldWinter && !info.beach && !info.nearRiver && !info.river && !oasis && altitude > 0.0 && info.altitudeMeters < (info.tropicalLatitude ? 3500.0 : 2000.0))
		{
			double cactusChance = 0.0;
			int cactusMax = 2;
			if(info.aridDesert)
			{
				cactusChance = (wadi || steepness > 0.3) ? 0.004 : 0.0005;
			}
			else if(info.desert)
			{
				cactusChance = 0.004;
				if(steepness > 0.3)
				{
					cactusChance = 0.012;
					cactusMax = 3;
				}
			}
			else if(hotSteppe)
			{
				cactusChance = info.winterHot ? 0.003 : 0.0015;
			}
			if(cactusChance > 0.0 && !info.polar && !info.icecap)
			{
				for(int i = 0; i < CACTUS_TYPE_COUNT; i++)
				{
					addedCount = addSpawn(types, addedCount, faceUniqueID, 9241 + i * 10, cactusChance, 1, cactusMax, gameObjectType_cactusTypes[i]);
				}
			}
		}
		if(info.desert && !info.aridDesert && !coldDesert && !info.beach && altitude > 0.0)
		{
			addedCount = addPatch(types, addedCount, faceUniqueID, 8701, 60, 2, 1, &gameObjectType_aloePlant, 1);
		}
		if(!info.winterVeryCold && (!info.winterCold || info.summerHot) && !info.beach && !info.nearRiver && !oasis && altitude > 0.0 && info.altitudeMeters < (info.tropicalLatitude ? 3000.0 : 2500.0))
		{
			uint32_t agaveChance = 0;
			if(info.aridDesert)
			{
				agaveChance = wadi ? 40 : (steepness > 0.3 ? 100 : 0);
			}
			else if(info.desert)
			{
				agaveChance = (wadi || steepness > 0.3) ? 40 : 100;
			}
			else if(hotSteppe)
			{
				agaveChance = info.winterCold ? 40 : (info.winterHot ? 45 : 30);
			}
			else if(mediterraneanSteppe)
			{
				agaveChance = 50;
			}
			else if(info.oakSavanna || (mediterranean && info.forestDensity == 1))
			{
				agaveChance = 80;
			}
			else if(info.savanna && info.forestDensity == 1 && !info.lushSavanna)
			{
				agaveChance = steepness > 0.3 ? 50 : 150;
			}
			if(agaveChance > 0)
			{
				addedCount = addSunPatch(types, addedCount, faceUniqueID, 8711, agaveChance, 2, 2, &gameObjectType_agave, 1, sunPercent);
			}
		}
		if(!info.beach && !info.tidal && altitude > 0.0)
		{
			uint32_t featherGrassChance = 0;
			if(info.tundra)
			{
				if(info.tropicalLatitude && !info.summerVeryCold && !info.nearRiver && tundraPatch <= 0.14)
				{
					if(info.heavySnowSummer)
					{
						featherGrassChance = tundraPatch < -0.14 ? 0 : 20;
					}
					else
					{
						featherGrassChance = tundraPatch < -0.14 ? 30 : 10;
					}
				}
			}
			else if(coolSteppe)
			{
				if(!info.nearRiver && info.grove <= 0.14)
				{
					featherGrassChance = aspenParkland ? 10 : 16;
					if(info.grove < -0.14)
					{
						featherGrassChance /= 2;
					}
				}
			}
			else if(hotSteppe)
			{
				if((info.winterCold || info.winterVeryCold) && !info.nearRiver)
				{
					featherGrassChance = 30;
				}
			}
			else if(info.aridDesert)
			{
				if(coldDesert)
				{
					featherGrassChance = 40;
				}
				else if(wadi)
				{
					featherGrassChance = 10;
				}
				else if(info.winterModerate && !info.summerVeryHot)
				{
					featherGrassChance = 80;
				}
			}
			else if(info.desert)
			{
				if(info.nearRiver)
				{
					featherGrassChance = 0;
				}
				else if(coldDesert)
				{
					featherGrassChance = 16;
				}
				else if(wadi)
				{
					featherGrassChance = 10;
				}
				else if(info.winterModerate && !info.summerVeryHot)
				{
					featherGrassChance = 40;
				}
			}
			else if(mediterranean && info.forestDensity == 1 && groveScale == 0)
			{
				featherGrassChance = 20;
			}
			else if(dryPineWoodland && groveScale == 0)
			{
				featherGrassChance = 30;
			}
			if(featherGrassChance > 0)
			{
				addedCount = addPatch(types, addedCount, faceUniqueID, 8721, featherGrassChance, info.desert ? 2 : 3, info.desert ? 1 : 2, &gameObjectType_featherGrass, 1);
			}
		}
		if(bog)
		{
			if(arcticTundra)
			{
				addedCount = addPatch(types, addedCount, faceUniqueID, 8591, 3, 3, 3, &gameObjectType_cottonGrass, 1);
			}
			else
			{
				addedCount = addSunPatch(types, addedCount, faceUniqueID, 8591, 3, 3, 3, &gameObjectType_cottonGrass, 1, sunPercent);
			}
			if(!info.summerVeryCold)
			{
				addedCount = addPatch(types, addedCount, faceUniqueID, 8601, 5, 2, 1, &gameObjectType_cloudberryBush, 1);
			}
		}
		if(hotSteppe && !info.beach && altitude > 0.0)
		{
			if(info.winterVeryCold)
			{
				addedCount = addSunPatch(types, addedCount, faceUniqueID, 8421, 20, 2, 1, &gameObjectType_plantain, 1, sunPercent);
			}
			else
			{
				if(!info.nearRiver)
				{
					addedCount = addPatch(types, addedCount, faceUniqueID, 8421, info.winterCold ? 30 : 20, 2, 1, &gameObjectType_aloePlant, 1);
				}
				addedCount = addPatch(types, addedCount, faceUniqueID, 8431, 30, 2, 2, &gameObjectType_lemongrass, 1);
			}
			if(coldWinter)
			{
				addedCount = addSunPatch(types, addedCount, faceUniqueID, 8403, 48, 2, 2, &gameObjectType_echinaceaPlant, 1, sunPercent);
			}
			if(!info.winterHot)
			{
				addedCount = addSunPatch(types, addedCount, faceUniqueID, 8991, 400, 3, 3, &gameObjectType_temperatePlantTypes[2], 1, sunPercent);
			}
		}
		if(coolSteppe && !info.beach && altitude > 0.0)
		{
			addedCount = addSunPatch(types, addedCount, faceUniqueID, 8391, aspenParkland ? 24 : 48, 2, 2, &gameObjectType_garlicPlant, 1, sunPercent);
			addedCount = addSunPatch(types, addedCount, faceUniqueID, 8981, 120, 2, 2, &gameObjectType_cropTypes[1], 1, sunPercent);
			if(!info.summerCold && !info.summerVeryCold)
			{
				addedCount = addSunPatch(types, addedCount, faceUniqueID, 8991, 200, 3, 3, &gameObjectType_temperatePlantTypes[2], 1, sunPercent);
			}
			if(!info.nearRiver && info.altitudeMeters > 1.5)
			{
				if(aspenParkland)
				{
					addedCount = addSunPatch(types, addedCount, faceUniqueID, 8401, 20, 2, 2, &gameObjectType_echinaceaPlant, 1, sunPercent);
				}
				else if(info.oakSavanna)
				{
					addedCount = addSunPatch(types, addedCount, faceUniqueID, 8401, 24, 2, 2, &gameObjectType_echinaceaPlant, 1, sunPercent);
				}
			}
		}
		if((coldDesert && !info.aridDesert) || (info.tundra && info.tropicalLatitude && !info.summerVeryCold))
		{
			if(!info.beach && altitude > 0.0)
			{
				addedCount = addSunPatch(types, addedCount, faceUniqueID, 8981, 300, 2, 2, &gameObjectType_cropTypes[1], 1, sunPercent);
			}
		}
		if(!info.beach && altitude > 0.0 && info.altitudeMeters < 1500.0 && !info.winterVeryCold)
		{
			if(mediterranean || mediterraneanSteppe)
			{
				addedCount = addSunPatch(types, addedCount, faceUniqueID, 8731, 120, 3, 3, &gameObjectType_marigoldPlant, 1, sunPercent);
			}
			else if(info.oakSavanna || (hotSteppe && !info.winterHot))
			{
				addedCount = addSunPatch(types, addedCount, faceUniqueID, 8731, 240, 3, 3, &gameObjectType_marigoldPlant, 1, sunPercent);
			}
		}
		if(!info.beach && !info.nearRiver && altitude > 0.0)
		{
			uint32_t poppyChance = 0;
			if(mediterraneanSteppe)
			{
				poppyChance = 220;
			}
			else if(mediterranean)
			{
				poppyChance = 330;
			}
			else if(info.oakSavanna || aspenParkland)
			{
				poppyChance = 650;
			}
			if(poppyChance > 0)
			{
				addedCount = addSunPatch(types, addedCount, faceUniqueID, 9001, poppyChance, 3, 3, &gameObjectType_cropTypes[3], 1, sunPercent);
			}
			if(mediterranean && !coldWinter)
			{
				addedCount = addSunPatch(types, addedCount, faceUniqueID, 9011, 60, 2, 1, &gameObjectType_aloePlant, 1, sunPercent);
			}
		}
		if((info.seaside || (info.beach && riverDistance > 0.05 && info.altitudeMeters < 6.0)) && altitude > 0.0 && !info.tropical && !info.winterHot && !info.winterVeryCold && !coldLand && !info.aridDesert)
		{
			addedCount = addSunPatch(types, addedCount, faceUniqueID, 9021, 160, 2, 2, &gameObjectType_temperatePlantTypes[3], 1, sunPercent);
		}
	}

	if(level == SP_SUBDIVISIONS - 2 && wadi && !oasis)
	{
		addedCount = addSpawn(types, addedCount, faceUniqueID, 9471, 0.008, 1, 3, gameObjectType_watermelon);
		if(info.winterModerate && !info.aridDesert && !info.summerCold && !info.summerVeryCold && info.altitudeMeters < 1800.0)
		{
			addedCount = addSpawn(types, addedCount, faceUniqueID, 9481, 0.004, 3, 8, gameObjectType_barley);
		}
	}

	if(altitude < 0.0)
	{
		return addedCount;
	}

	addedCount = addBaobab(threadState, types, addedCount, &info, noiseLoc, faceUniqueID, level, wadi);
	if(tropicalForest)
	{
		addedCount = addCacao(threadState, types, addedCount, &info, noiseLoc, faceUniqueID, level);
	}

	if(tropicalForest)
	{
		if(info.forestDensity == 0)
		{
			return addedCount;
		}
		if(info.savanna)
		{
			return addSavanna(threadState, types, addedCount, &info, noiseLoc, faceUniqueID, level);
		}
		return addRainforest(threadState, types, addedCount, &info, noiseLoc, faceUniqueID, level);
	}
	if(subtropical && info.forestDensity > 0)
	{
		return addSubtropical(types, addedCount, &info, faceUniqueID, level);
	}
	if(mediterranean && info.forestDensity > 0)
	{
		return addMediterranean(types, addedCount, &info, faceUniqueID, level);
	}
	if(hotSteppe && !info.beach)
	{
		return addHotSteppe(threadState, types, addedCount, &info, noiseLoc, faceUniqueID, level);
	}

	return addedCount;
}
