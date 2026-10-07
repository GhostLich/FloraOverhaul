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
static uint16_t biomeTag_temperatureSummerVeryHot;
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
static uint32_t gameObjectType_larch;
static uint32_t gameObjectType_cacao;
static uint32_t gameObjectType_papyrus;
static uint32_t gameObjectType_giantReed;
static uint32_t gameObjectType_groundFern;
static uint32_t gameObjectType_yarrow;
static uint32_t gameObjectType_gotuKola;
static uint32_t gameObjectType_plantain;
static uint32_t gameObjectType_peppermint;
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
	biomeTag_temperatureSummerVeryHot = threadState->getBiomeTag(threadState, "temperatureSummerVeryHot");
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
		gameObjectType_larch = threadState->getGameObjectTypeIndex(threadState, "larch1");
		gameObjectType_cacao = threadState->getGameObjectTypeIndex(threadState, "cacaoTree");
		gameObjectType_papyrus = threadState->getGameObjectTypeIndex(threadState, "papyrus");
		gameObjectType_giantReed = threadState->getGameObjectTypeIndex(threadState, "giantReed");
		gameObjectType_groundFern = threadState->getGameObjectTypeIndex(threadState, "groundFern");
		gameObjectType_yarrow = threadState->getGameObjectTypeIndex(threadState, "yarrowPlant");
		gameObjectType_gotuKola = threadState->getGameObjectTypeIndex(threadState, "gotuKolaPlant");
		gameObjectType_plantain = threadState->getGameObjectTypeIndex(threadState, "plantainPlant");
		gameObjectType_peppermint = threadState->getGameObjectTypeIndex(threadState, "peppermintPlant");
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
	bool summerHot;
	bool drySummer;
	bool dryWinter;
	bool desert;
	bool aridDesert;
	bool icecap;
	bool dry;
	int forestDensity;
	double altitudeMeters;
	double riverDistance;
	bool nearRiver;
	bool tropicalLatitude;
	bool beach;
	bool seaside;
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
		else if(tag == biomeTag_temperatureSummerHot || tag == biomeTag_temperatureSummerVeryHot) info->summerHot = true;
		else if(tag == biomeTag_drySummer) info->drySummer = true;
		else if(tag == biomeTag_dryWinter) info->dryWinter = true;
		else if(tag == biomeTag_desert) info->desert = true;
		else if(tag == biomeTag_aridDesert) info->aridDesert = true;
		else if(tag == biomeTag_icecap) info->icecap = true;
		else if(tag == biomeTag_dry) info->dry = true;
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
	info->mediterranean = info->temperate && info->drySummer && !info->coniferous;
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

	if(tagCount + 3 <= BIOME_MAX_BIOME_TAG_COUNT_PER_VERTEX)
	{
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
			double temperatureThreshold = (temperatureSummer + temperatureWinter) * 10.0;
			temperatureThreshold = spMix(temperatureThreshold, temperatureThreshold + 200.0, (rainfallSummer - rainfallWinter * 2.3) * 0.00001);
			SPVec3 riverNoiseLoc = spVec3Mul(noiseLoc, 802.0);
			double riverRainfall = (1.0 - pow(spMax(riverDistance - 0.01, 0.0), 0.1)) * (1.0 + spNoiseGet(threadState->spNoise1, riverNoiseLoc, 2)) * 500.0;
			if(rainfallSummer + rainfallWinter + riverRainfall < temperatureThreshold * 0.2)
			{
				tagsOut[tagCount++] = biomeTag_aridDesert;
			}
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

static int getGroveScale(SPBiomeThreadState* threadState, BiomeInfo* info, SPVec3 noiseLoc)
{
	if((!info->temperate && !info->tundra && !info->coolSteppe) || info->forestDensity > 2 || info->nearRiver)
	{
		return 1;
	}
	SPVec3 groveLoc = spVec3Mul(noiseLoc, 250000.0);
	double grove = spNoiseGet(threadState->spNoise1, groveLoc, 2);
	if(info->forestDensity == 1 && !info->coolSteppe)
	{
		return grove > 0.2 ? 6 : 0;
	}
	return grove > 0.14 ? 4 : 0;
}

static int addSavanna(SPBiomeThreadState* threadState, uint32_t* types, int addedCount, BiomeInfo* info, SPVec3 noiseLoc, uint64_t faceUniqueID, int level)
{
	SPVec3 clumpLoc = spVec3Mul(noiseLoc, 250000.0);
	double clump = spNoiseGet(threadState->spNoise1, clumpLoc, 2);

	if(level == SP_SUBDIVISIONS - 7)
	{
		if(info->forestDensity >= 2 && randomInt(faceUniqueID, 1301, 8) == 0)
		{
			ADD_OBJECT(gameObjectType_baobab);
		}
	}
	else if(level == SP_SUBDIVISIONS - 6)
	{
		int treeCount = 0;
		switch(info->forestDensity)
		{
		case 1:
			treeCount = (randomInt(faceUniqueID, 1302, 4) == 0 ? 1 : 0);
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
		if(info->riverDistance < 0.008 || (info->forestDensity >= 3 && clump < -0.25))
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
				if(info->riverDistance >= 0.008)
				{
					ADD_OBJECT(gameObjectType_acacia2);
				}
			}
			else
			{
				ADD_OBJECT(gameObjectType_cycadTypes[randomInt(faceUniqueID, 1308, CYCAD_TYPE_COUNT)]);
			}
		}
	}
	else if(level == SP_SUBDIVISIONS - 3)
	{
		if(randomInt(faceUniqueID, 1305, 12) == 0)
		{
			int plantCount = randomInt(faceUniqueID, 1306, 3) + 2;
			for(int i = 0; i < plantCount; i++)
			{
				ADD_OBJECT(gameObjectType_aloePlant);
			}
		}
	}
	return addedCount;
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
	else if(info->forestDensity >= 3)
	{
		SPVec3 patchLoc = spVec3Mul(noiseLoc, 60000.0);
		if(spNoiseGet(threadState->spNoise1, patchLoc, 2) > 0.45)
		{
			treeCount = randomInt(faceUniqueID, 6101, 3) + 1;
		}
	}
	for(int i = 0; i < treeCount; i++)
	{
		uint32_t roll = randomInt(faceUniqueID, 6102 + i, 20);
		if(roll < 6)
		{
			ADD_OBJECT(gameObjectType_banyanTypes[randomInt(faceUniqueID, 6202 + i, BANYAN_TYPE_COUNT)]);
		}
		else if(roll < 12)
		{
			ADD_OBJECT(gameObjectType_mahoganyTypes[randomInt(faceUniqueID, 9601 + i, MAHOGANY_TYPE_COUNT)]);
		}
		else if(roll < 17)
		{
			ADD_OBJECT(gameObjectType_wildPalmTypes[randomInt(faceUniqueID, 6302 + i, WILD_PALM_TYPE_COUNT)]);
		}
		else
		{
			ADD_OBJECT(gameObjectType_kapokTypes[randomInt(faceUniqueID, 6402 + i, KAPOK_TYPE_COUNT)]);
		}
	}
	return addedCount;
}

static int addRainforest(uint32_t* types, int addedCount, BiomeInfo* info, uint64_t faceUniqueID, int level)
{
	if(level == SP_SUBDIVISIONS - 7)
	{
		if(info->forestDensity >= 3 && randomInt(faceUniqueID, 2301, 5) == 0)
		{
			ADD_OBJECT(randomInt(faceUniqueID, 2311, 2) == 0 ? gameObjectType_kapokBig : gameObjectType_brazilNutTree);
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
		if(info->river)
		{
			palmCount += 2;
		}
		if(info->forestDensity <= 2 && randomInt(faceUniqueID, 2331, info->forestDensity == 1 ? 3 : 16) == 0)
		{
			ADD_OBJECT(gameObjectType_acaciaTypes[randomInt(faceUniqueID, 2332, ACACIA_TYPE_COUNT)]);
		}
		for(int i = 0; i < treeCount; i++)
		{
			uint32_t roll = randomInt(faceUniqueID, 2314 + i, 10);
			if(roll < 5)
			{
				ADD_OBJECT(gameObjectType_kapokTypes[randomInt(faceUniqueID, 2304 + i, KAPOK_TYPE_COUNT)]);
			}
			else if(roll < 8)
			{
				ADD_OBJECT(gameObjectType_mahoganyTypes[randomInt(faceUniqueID, 9611 + i, MAHOGANY_TYPE_COUNT)]);
			}
			else
			{
				ADD_OBJECT(gameObjectType_banyanTypes[randomInt(faceUniqueID, 2324 + i, BANYAN_TYPE_COUNT)]);
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
			if(info->altitudeMeters > 900.0 && roll < 5)
			{
				ADD_OBJECT(gameObjectType_treeFernTypes[randomInt(faceUniqueID, 2902 + i, TREE_FERN_TYPE_COUNT)]);
			}
			else if(roll < 8)
			{
				ADD_OBJECT(gameObjectType_rubberTreeTypes[randomInt(faceUniqueID, 2602 + i, RUBBER_TREE_TYPE_COUNT)]);
			}
			else if(roll < 10)
			{
				ADD_OBJECT(gameObjectType_cacao);
			}
			else if(roll < 14)
			{
				ADD_OBJECT(gameObjectType_wildPalmTypes[randomInt(faceUniqueID, 2702 + i, WILD_PALM_TYPE_COUNT)]);
			}
			else if(roll < 17)
			{
				ADD_OBJECT(gameObjectType_bananaTree);
			}
			else
			{
				ADD_OBJECT(gameObjectType_cycadTypes[randomInt(faceUniqueID, 2802 + i, CYCAD_TYPE_COUNT)]);
			}
		}
	}
	else if(level == SP_SUBDIVISIONS - 3)
	{
		if(randomInt(faceUniqueID, 2901, 12) == 0)
		{
			uint32_t plantType = (randomInt(faceUniqueID, 2902, 2) == 0 ? gameObjectType_gingerPlant : gameObjectType_turmericPlant);
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
		if(randomInt(faceUniqueID, 3311, 15) == 0)
		{
			ADD_OBJECT(gameObjectType_cycadTypes[randomInt(faceUniqueID, 3312, CYCAD_TYPE_COUNT)]);
		}
		if(randomInt(faceUniqueID, 3301, 8) == 0)
		{
			int bambooCount = randomInt(faceUniqueID, 3302, 4) + info->forestDensity + 1;
			for(int i = 0; i < bambooCount; i++)
			{
				ADD_OBJECT(gameObjectType_bamboo);
			}
		}
	}
	else if(level == SP_SUBDIVISIONS - 3 && info->river)
	{
		if(randomInt(faceUniqueID, 3303, 10) == 0)
		{
			int bambooCount = randomInt(faceUniqueID, 3304, 3) + 2;
			for(int i = 0; i < bambooCount; i++)
			{
				ADD_OBJECT(gameObjectType_smallBamboo);
			}
		}
	}
	return addedCount;
}

static uint32_t getRiversideTree(BiomeInfo* info, uint64_t faceUniqueID, int i)
{
	if(info->subtropical)
	{
		return gameObjectType_baldCypress;
	}
	if((info->winterModerate || info->mediterranean) && randomInt(faceUniqueID, 3204 + i, 2) == 0)
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
		return gameObjectType_poplar;
	}
	if(info->riverDistance >= 0.008 && randomInt(faceUniqueID, 3208 + i, 2) == 0)
	{
		return 0;
	}
	return gameObjectType_alderTypes[randomInt(faceUniqueID, 3206 + i, ALDER_TYPE_COUNT)];
}

static int getMediumForestCount(SPBiomeThreadState* threadState, BiomeInfo* info, SPVec3 noiseLoc, int treeCount)
{
	if(info->forestDensity != 3 || info->nearRiver)
	{
		return treeCount;
	}
	SPVec3 groveLoc = spVec3Mul(noiseLoc, 250000.0);
	double grove = spNoiseGet(threadState->spNoise1, groveLoc, 2);
	if(grove < -0.14)
	{
		return treeCount / 2;
	}
	if(grove > 0.14)
	{
		return treeCount + treeCount / 2;
	}
	return treeCount;
}

static int addMediterranean(SPBiomeThreadState* threadState, uint32_t* types, int addedCount, BiomeInfo* info, SPVec3 noiseLoc, uint64_t faceUniqueID, int level)
{
	if(level == SP_SUBDIVISIONS - 6)
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
		treeCount *= getGroveScale(threadState, info, noiseLoc);
		treeCount = getMediumForestCount(threadState, info, noiseLoc, treeCount);
		if(info->nearRiver)
		{
			treeCount += 1;
		}
		for(int i = 0; i < treeCount; i++)
		{
			uint32_t roll = randomInt(faceUniqueID, 4302 + i, 20);
			if(info->nearRiver && randomInt(faceUniqueID, 4311 + i, 2) == 0)
			{
				uint32_t type = getRiversideTree(info, faceUniqueID, i);
				if(type)
				{
					ADD_OBJECT(type);
					continue;
				}
			}
			if(info->seaside && randomInt(faceUniqueID, 4321 + i, 10) < 3)
			{
				ADD_OBJECT(gameObjectType_maritimePine);
			}
			else if(roll < 6)
			{
				ADD_OBJECT(gameObjectType_oliveTreeTypes[randomInt(faceUniqueID, 9621 + i, OLIVE_TREE_TYPE_COUNT)]);
			}
			else if(roll < 8)
			{
				ADD_OBJECT(gameObjectType_figTree);
			}
			else if(roll < 12)
			{
				ADD_OBJECT(gameObjectType_cypress);
			}
			else if(roll < 17)
			{
				ADD_OBJECT(gameObjectType_oakTypes[randomInt(faceUniqueID, 4502 + i, OAK_TYPE_COUNT)]);
			}
			else if(roll < 18)
			{
				ADD_OBJECT(gameObjectType_juniperTypes[randomInt(faceUniqueID, 9631 + i, JUNIPER_TYPE_COUNT)]);
			}
			else
			{
				ADD_OBJECT(gameObjectType_stonePine);
			}
		}
	}
	else if(level == SP_SUBDIVISIONS - 4)
	{
		if((int)randomInt(faceUniqueID, 4303, 10) < getGroveScale(threadState, info, noiseLoc))
		{
			ADD_OBJECT(gameObjectType_oliveTreeTypes[randomInt(faceUniqueID, 9641, OLIVE_TREE_TYPE_COUNT)]);
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
		for(int i = 0; i < treeCount; i++)
		{
			ADD_OBJECT(!info->winterCold && randomInt(faceUniqueID, 5321 + i, 10) < 3 ? gameObjectType_acaciaTypes[randomInt(faceUniqueID, 5311 + i, ACACIA_TYPE_COUNT)] : gameObjectType_acacia2);
		}
	}
	else if(level == SP_SUBDIVISIONS - 2)
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

static int addDesertRiver(uint32_t* types, int addedCount, BiomeInfo* info, uint64_t faceUniqueID, int level)
{
	if(level == SP_SUBDIVISIONS - 6 && randomInt(faceUniqueID, 7201, 3) == 0)
	{
		int treeCount = randomInt(faceUniqueID, 7202, 2) + 1;
		for(int i = 0; i < treeCount; i++)
		{
			uint32_t roll = randomInt(faceUniqueID, 7203 + i, 10);
			if(roll < 2)
			{
				continue;
			}
			if(roll < 4)
			{
				if(info->hot && !info->beach && !info->winterCold && !info->winterVeryCold)
				{
					ADD_OBJECT(randomInt(faceUniqueID, 7421 + i, 3) == 0 ? gameObjectType_acaciaTypes[randomInt(faceUniqueID, 7431 + i, ACACIA_TYPE_COUNT)] : gameObjectType_acacia2);
				}
				continue;
			}
			if(roll < 7)
			{
				if(info->winterCold || info->winterVeryCold)
				{
					ADD_OBJECT(gameObjectType_poplar);
				}
				else
				{
					ADD_OBJECT(gameObjectType_datePalmTypes[randomInt(faceUniqueID, 7303 + i, DATE_PALM_TYPE_COUNT)]);
				}
			}
			else
			{
				ADD_OBJECT(gameObjectType_tamarisk);
			}
		}
	}
	return addedCount;
}

static int addTundra(uint32_t* types, int addedCount, BiomeInfo* info, uint64_t faceUniqueID, int level, int groveScale)
{
	if(level == SP_SUBDIVISIONS - 4 && (int)randomInt(faceUniqueID, 7401, info->nearRiver ? 3 : 8) < groveScale)
	{
		int shrubCount = randomInt(faceUniqueID, 7402, 2) + 1;
		for(int i = 0; i < shrubCount; i++)
		{
			ADD_OBJECT(gameObjectType_dwarfBirchTypes[randomInt(faceUniqueID, 9751 + i, DWARF_BIRCH_TYPE_COUNT)]);
		}
	}
	return addedCount;
}

static int addCloudForest(uint32_t* types, int addedCount, uint64_t faceUniqueID, int level)
{
	if(level == SP_SUBDIVISIONS - 4 && randomInt(faceUniqueID, 7501, 5) == 0)
	{
		int fernCount = randomInt(faceUniqueID, 7502, 2) + 1;
		for(int i = 0; i < fernCount; i++)
		{
			ADD_OBJECT(gameObjectType_treeFernTypes[randomInt(faceUniqueID, 7503 + i, TREE_FERN_TYPE_COUNT)]);
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

static int addWildPlants(uint32_t* types, int addedCount, BiomeInfo* info, uint64_t faceUniqueID, int level, int groveScale)
{
	bool frozen = info->polar || info->icecap;
	bool coldWinter = info->winterCold || info->winterVeryCold;
	double altitude = info->altitudeMeters;

	if(level == SP_SUBDIVISIONS - 3)
	{
		if(altitude > 0.0 && !info->beach && info->summerHot && !(info->tropical || info->desert || info->rainforest || info->forestDensity == 4 || frozen || coldWinter))
		{
			addedCount = addSpawn(types, addedCount, faceUniqueID, 9101, 0.003, 1, 3, gameObjectType_figTreeWild);
		}
		if(altitude > 0.0 && !info->beach && info->river && !(info->tropical || info->rainforest || frozen || coldWinter))
		{
			addedCount = addSpawn(types, addedCount, faceUniqueID, 9111, 0.002, 1, 2, gameObjectType_figTreeWild);
		}
		for(int i = 0; i < DATE_PALM_TYPE_COUNT; i++)
		{
			if(altitude > 0.2 && altitude < 3.0 && info->desert && !(frozen || coldWinter))
			{
				addedCount = addSpawn(types, addedCount, faceUniqueID, 9121 + i * 10, 0.004, 1, 3, gameObjectType_datePalmTypes[i]);
			}
			if(altitude > 0.0 && !info->beach && info->savanna && !(info->desert || frozen || coldWinter))
			{
				addedCount = addSpawn(types, addedCount, faceUniqueID, 9161 + i * 10, 0.002, 1, 3, gameObjectType_doumPalmTypes[i]);
			}
			if(altitude > 0.2 && altitude < 2.0 && (info->tropical || info->summerHot) && !(frozen || coldWinter))
			{
				addedCount = addSpawn(types, addedCount, faceUniqueID, 9201 + i * 10, 0.004, 1, 3, gameObjectType_wildPalmTypes[i]);
			}
		}
		for(int i = 0; i < CACTUS_TYPE_COUNT; i++)
		{
			if(altitude > 0.0 && !info->beach && info->desert && !(frozen || coldWinter))
			{
				addedCount = addSpawn(types, addedCount, faceUniqueID, 9241 + i * 10, info->aridDesert ? 0.002 : 0.008, 1, 2, gameObjectType_cactusTypes[i]);
			}
			if(altitude > 0.0 && !info->beach && info->steppe && info->hot && !coldWinter)
			{
				addedCount = addSpawn(types, addedCount, faceUniqueID, 9461 + i * 10, 0.0015, 1, 2, gameObjectType_cactusTypes[i]);
			}
		}
		if(altitude > 0.0 && !info->beach && info->savanna && !(info->desert || frozen || coldWinter))
		{
			addedCount = addSpawn(types, addedCount, faceUniqueID, 9281, 0.003, 1, 1, gameObjectType_baobab);
		}
		if(altitude > 0.0 && !info->beach && info->steppe && info->hot && !coldWinter)
		{
			addedCount = addSpawn(types, addedCount, faceUniqueID, 9441, 0.0003, 1, 1, gameObjectType_baobab);
		}
		if(altitude > 0.0 && !info->beach && info->desert && (coldWinter || info->aridDesert) && !frozen)
		{
			addedCount = addSpawn(types, addedCount, faceUniqueID, 9431, 0.004, 1, 2, gameObjectType_saxaul);
		}
		if(altitude > 0.0 && !info->beach && (info->desert || info->dry) && !(info->aridDesert || frozen || info->winterVeryCold))
		{
			addedCount = addSpawn(types, addedCount, faceUniqueID, 9321, 0.008 * groveScale, 1, 3, gameObjectType_mesquiteTree);
		}
	}
	else if(level == SP_SUBDIVISIONS - 2)
	{
		if(altitude > 0.0 && !info->beach && coldWinter && !(info->desert || info->steppe || info->icecap || info->tropical))
		{
			addedCount = addSpawn(types, addedCount, faceUniqueID, 9301, 0.004, 1, 3, gameObjectType_lingonberryBush);
		}
		if(altitude > 0.0 && !info->beach && (info->tundra || (info->temperate && info->coniferous && info->winterVeryCold && info->nearRiver)) && !(info->desert || info->icecap))
		{
			addedCount = addSpawn(types, addedCount, faceUniqueID, 9311, 0.004, 1, 3, gameObjectType_cloudberryBush);
		}
		if(altitude > 0.0 && !info->beach && info->desert && coldWinter && !(info->aridDesert || frozen))
		{
			addedCount = addSpawn(types, addedCount, faceUniqueID, 9421, 0.001, 3, 8, gameObjectType_barley);
		}
		if(altitude > 0.0 && !info->beach && (info->river || info->forestDensity == 2 || info->forestDensity == 3 || info->mediterraneanSteppe) && !(info->desert || info->rainforest || info->tundra || frozen || info->winterVeryCold))
		{
			addedCount = addSpawn(types, addedCount, faceUniqueID, 9331, 0.002, 1, 3, gameObjectType_grapevine);
		}
		if(altitude > 0.0 && !info->beach && (info->steppe || info->temperate) && !(info->tropical || info->desert || info->rainforest || info->forestDensity >= 3 || info->tundra || frozen || (info->winterVeryCold && !info->steppe)))
		{
			addedCount = addSpawn(types, addedCount, faceUniqueID, 9341, 0.002, 3, 8, gameObjectType_barley);
		}
		if(altitude > 0.0 && !info->beach && info->oakSavanna)
		{
			addedCount = addSpawn(types, addedCount, faceUniqueID, 9451, 0.003, 3, 8, gameObjectType_barley);
		}
		if(altitude > 0.0 && !info->beach && (info->summerHot || info->mediterraneanSteppe) && !(info->rainforest || info->forestDensity == 4 || frozen || coldWinter))
		{
			addedCount = addSpawn(types, addedCount, faceUniqueID, 9351, 0.002, 1, 3, gameObjectType_watermelon);
		}
		if(altitude > -0.3 && altitude < 1.2 && info->river && !(info->desert || frozen))
		{
			addedCount = addSpawn(types, addedCount, faceUniqueID, 9361, 0.02, 3, 8, gameObjectType_cattail);
		}
		if(altitude > -0.3 && altitude < 1.2 && info->river && (info->desert || (info->steppe && info->hot)) && !frozen)
		{
			addedCount = addSpawn(types, addedCount, faceUniqueID, 9371, 0.02, 3, 8, gameObjectType_commonReed);
		}
		if(altitude > -0.3 && altitude < 1.2 && info->river && coldWinter && !(info->desert || frozen))
		{
			addedCount = addSpawn(types, addedCount, faceUniqueID, 9381, 0.015, 3, 8, gameObjectType_bulrush);
		}
		if(altitude > -0.3 && altitude < 1.2 && info->riverDistance > 0.05 && !(info->tropical || info->desert || frozen))
		{
			addedCount = addSpawn(types, addedCount, faceUniqueID, 9391, 0.02, 3, 8, gameObjectType_cordgrass);
		}
		if(altitude > -0.3 && altitude < 1.2 && info->river && info->tundra)
		{
			addedCount = addSpawn(types, addedCount, faceUniqueID, 9401, 0.02, 3, 8, gameObjectType_cottonGrass);
		}
	}
	return addedCount;
}

static int addMangroves(uint32_t* types, int addedCount, uint64_t faceUniqueID, int level)
{
	if(level == SP_SUBDIVISIONS - 4 && randomInt(faceUniqueID, 7601, 3) == 0)
	{
		int treeCount = randomInt(faceUniqueID, 7602, 2) + 1;
		for(int i = 0; i < treeCount; i++)
		{
			ADD_OBJECT(gameObjectType_mangroveTypes[randomInt(faceUniqueID, 9671 + i, MANGROVE_TYPE_COUNT)]);
		}
	}
	return addedCount;
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
	uint32_t roll = randomInt(faceUniqueID, 3401 + i, 20);
	if(info->aspenParkland)
	{
		if(roll < 1)
		{
			return gameObjectType_poplar;
		}
		if(roll < 10)
		{
			return gameObjectType_broadleafTypes[randomInt(faceUniqueID, 3402 + i, BROADLEAF_TYPE_COUNT)];
		}
		if(roll < 13)
		{
			return gameObjectType_juniperTypes[randomInt(faceUniqueID, 9681 + i, JUNIPER_TYPE_COUNT)];
		}
		if(info->nearRiver)
		{
			return gameObjectType_poplar;
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
		if(roll < 6)
		{
			return gameObjectType_argan;
		}
		if(roll < 10)
		{
			return gameObjectType_carob;
		}
		if(roll < 13)
		{
			return gameObjectType_oliveTreeTypes[randomInt(faceUniqueID, 9691 + i, OLIVE_TREE_TYPE_COUNT)];
		}
		if(roll < 15)
		{
			return gameObjectType_juniperTypes[randomInt(faceUniqueID, 9701 + i, JUNIPER_TYPE_COUNT)];
		}
	}
	else
	{
		if(roll < 11)
		{
			return gameObjectType_oakTypes[randomInt(faceUniqueID, 3402 + i, OAK_TYPE_COUNT)];
		}
		if(roll < 15)
		{
			return gameObjectType_juniperTypes[randomInt(faceUniqueID, 9711 + i, JUNIPER_TYPE_COUNT)];
		}
		if(info->nearRiver)
		{
			return gameObjectType_poplar;
		}
	}
	return getPine(faceUniqueID, i, level);
}

static uint32_t getTundraTree(BiomeInfo* info, uint64_t faceUniqueID, int i, int level)
{
	uint32_t roll = randomInt(faceUniqueID, 3501 + i, 10);
	if(roll < 3)
	{
		return gameObjectType_juniperTypes[randomInt(faceUniqueID, 9721 + i, JUNIPER_TYPE_COUNT)];
	}
	if(roll < 5)
	{
		return gameObjectType_dwarfBirchTypes[randomInt(faceUniqueID, 9761 + i, DWARF_BIRCH_TYPE_COUNT)];
	}
	if(roll < 7)
	{
		return gameObjectType_larch;
	}
	if(info->nearRiver && roll == 9)
	{
		return gameObjectType_alderTypes[randomInt(faceUniqueID, 3206 + i, ALDER_TYPE_COUNT)];
	}
	return getPine(faceUniqueID, i, level);
}

static uint32_t getConiferTree(BiomeInfo* info, uint64_t faceUniqueID, int i, int level)
{
	if(info->winterCold || info->winterVeryCold)
	{
		if(level == SP_SUBDIVISIONS - 4)
		{
			if(randomInt(faceUniqueID, 3601 + i, 10) < 6)
			{
				return gameObjectType_juniperTypes[randomInt(faceUniqueID, 9731 + i, JUNIPER_TYPE_COUNT)];
			}
		}
		else
		{
			uint32_t roll = randomInt(faceUniqueID, 3701 + i, 20);
			if(roll < 6)
			{
				return gameObjectType_spruce;
			}
			if(info->winterVeryCold && roll < 10)
			{
				return gameObjectType_larch;
			}
		}
	}
	return getPine(faceUniqueID, i, level);
}

static uint32_t getBroadleafTree(BiomeInfo* info, uint64_t faceUniqueID, int i, bool aspen)
{
	uint32_t roll = randomInt(faceUniqueID, 3101 + i, 20);
	if(info->subtropical)
	{
		if(roll < 10)
		{
			return gameObjectType_rubberTreeTypes[randomInt(faceUniqueID, 3201 + i, RUBBER_TREE_TYPE_COUNT)];
		}
		if(roll < 16)
		{
			return gameObjectType_oakTypes[randomInt(faceUniqueID, 3202 + i, OAK_TYPE_COUNT)];
		}
	}
	else if(info->deciduous)
	{
		if(roll < 8)
		{
			return gameObjectType_oakTypes[randomInt(faceUniqueID, 3202 + i, OAK_TYPE_COUNT)];
		}
		if(roll < 11 && !info->winterVeryCold)
		{
			return gameObjectType_chestnut;
		}
		if(roll < 15)
		{
			return gameObjectType_mapleTypes[randomInt(faceUniqueID, 3205 + i, MAPLE_TYPE_COUNT)];
		}
		if(info->forestDensity >= 3 && roll < 17)
		{
			if(roll == 15 && !info->hot && !info->seaside)
			{
				return gameObjectType_alderTypes[randomInt(faceUniqueID, 3206 + i, ALDER_TYPE_COUNT)];
			}
			return gameObjectType_poplar;
		}
	}
	else if(roll < 4)
	{
		return gameObjectType_mapleTypes[randomInt(faceUniqueID, 3205 + i, MAPLE_TYPE_COUNT)];
	}
	return getBroadleaf(faceUniqueID, i, aspen);
}

static uint32_t getTemperateTree(BiomeInfo* info, uint64_t faceUniqueID, int i, int level, bool aspen)
{
	uint32_t type = 0;
	if(level == SP_SUBDIVISIONS - 6 && info->seaside && randomInt(faceUniqueID, 3104 + i, 10) < 3)
	{
		return gameObjectType_maritimePine;
	}
	if(!info->birch || (info->coniferous && randomInt(faceUniqueID, 1171 + i, 2) == 0))
	{
		if(level == SP_SUBDIVISIONS - 6 && info->nearRiver && (info->winterCold || info->winterVeryCold) && randomInt(faceUniqueID, 3102 + i, 20) < 7)
		{
			type = getRiversideTree(info, faceUniqueID, i);
		}
		if(!type)
		{
			type = getConiferTree(info, faceUniqueID, i, level);
		}
		return type;
	}
	if(info->cloudForest)
	{
		uint32_t roll = randomInt(faceUniqueID, 3103 + i, 20);
		if(roll < 8)
		{
			return gameObjectType_treeFernTypes[randomInt(faceUniqueID, 3203 + i, TREE_FERN_TYPE_COUNT)];
		}
		if(roll < 11)
		{
			return gameObjectType_alderTypes[randomInt(faceUniqueID, 3206 + i, ALDER_TYPE_COUNT)];
		}
	}
	if(info->nearRiver && randomInt(faceUniqueID, 3102 + i, 2) == 0)
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
	bool riverTree = level == SP_SUBDIVISIONS - 6 && info->river && randomInt(faceUniqueID, 1151 + i, 2) == 0;
	if(info->tropicalForest)
	{
		if(!riverTree)
		{
			return 0;
		}
		if(info->savanna || randomInt(faceUniqueID, 1501 + i, 2) == 0)
		{
			return gameObjectType_wildPalmTypes[randomInt(faceUniqueID, 1502 + i, WILD_PALM_TYPE_COUNT)];
		}
		return gameObjectType_rubberTreeTypes[randomInt(faceUniqueID, 1503 + i, RUBBER_TREE_TYPE_COUNT)];
	}
	if(riverTree)
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
	bool aspen = spNoiseGet(threadState->spNoise1, aspenLoc, 2) > 0.2;

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
					if(info->mediterraneanSteppe)
					{
						treeCount += 1;
					}
				}
				else if(getGroveScale(threadState, info, noiseLoc) > 0)
				{
					treeCount = randomInt(faceUniqueID, 1141, 3) + 3;
				}
			}
		}
		else if(info->coniferous || info->birch || info->tropicalForest)
		{
			switch(info->forestDensity)
			{
			case 1:
				treeCount = (randomInt(faceUniqueID, 1103, 16) == 0 ? 1 : 0);
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
			treeCount *= getGroveScale(threadState, info, noiseLoc);
			treeCount = getMediumForestCount(threadState, info, noiseLoc, treeCount);
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
	else if(level == SP_SUBDIVISIONS - 4 && (info->coniferous || info->birch) && !info->coolSteppe)
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
		treeCount *= getGroveScale(threadState, info, noiseLoc);
		for(int i = 0; i < treeCount; i++)
		{
			uint32_t type = getForestTree(info, faceUniqueID, i, level, false);
			if(type)
			{
				ADD_OBJECT(type);
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
	if(!hasTypes || level < SP_SUBDIVISIONS - 7)
	{
		return incomingTypeCount;
	}

	BiomeInfo info = {0};
	getBiomeInfo(biomeTags, tagCount, &info);
	info.altitudeMeters = SP_PRERENDER_TO_METERS(altitude);
	info.riverDistance = riverDistance;
	info.nearRiver = riverDistance < 0.015;
	info.tropicalLatitude = fabs(pointNormal.y) < 0.4;
	SPVec3 beachNoiseLoc = spVec3Mul(noiseLoc, 45999.0);
	SPVec3 beachNoiseLocLarge = spVec3Mul(noiseLoc, 8073.0);
	info.beach = (altitude + spNoiseGet(threadState->spNoise1, beachNoiseLoc, 2) * 0.00000005 + spNoiseGet(threadState->spNoise1, beachNoiseLocLarge, 2) * 0.0000005) < 0.0000001;

	setForestTypes(&info);
	int groveScale = getGroveScale(threadState, &info, noiseLoc);
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
	bool noFruitTrees = info.polar || info.winterVeryCold;

	bool yarrowLand = !info.tropical && !info.desert && !hotSteppe && (info.temperate || info.tundra || coolSteppe || info.coniferous);
	bool gotuKolaLand = info.rainforest || (info.tropical && info.nearRiver);
	bool thinTurmeric = yarrowLand;
	bool thinGinger = info.temperate && info.nearRiver;
	bool thinAloe = info.temperate && !info.drySummer;
	bool thinMarigold = gotuKolaLand || (info.tundra && yarrowLand);
	bool thinGarlicAndEchinacea = info.tropical;
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
				(thinGarlicAndEchinacea && (type == gameObjectType_garlicPlant || type == gameObjectType_echinaceaPlant)))
			{
				continue;
			}
		}

		if(type == gameObjectType_orangeTree)
		{
			if(noFruitTrees)
			{
				continue;
			}
			if(info.winterCold)
			{
				type = gameObjectType_peachTree;
			}
		}
		else if(type == gameObjectType_peachTree && noFruitTrees)
		{
			continue;
		}

		if(thinDenseForestCrops && (isInList(type, gameObjectType_cropTypes, CROP_TYPE_COUNT) || isInList(type, gameObjectType_temperatePlantTypes, TEMPERATE_PLANT_TYPE_COUNT)))
		{
			continue;
		}

		if(tropicalForest)
		{
			if(isInList(type, gameObjectType_temperatePlantTypes, TEMPERATE_PLANT_TYPE_COUNT))
			{
				continue;
			}
			if(info.savanna && !info.river && (type == gameObjectType_bamboo || type == gameObjectType_smallBamboo || type == gameObjectType_bambooBranch))
			{
				if(info.forestDensity <= 1 || randomInt(faceUniqueID, 1401, 3) != 0)
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
			if(info.rainforest && type == gameObjectType_smallBamboo && randomInt(faceUniqueID, 1403, 3) != 0)
			{
				continue;
			}
			if(info.rainforest && type == gameObjectType_bamboo && randomInt(faceUniqueID, 1404, 3) == 0)
			{
				continue;
			}
			if(thinCrops && isInList(type, gameObjectType_cropTypes, CROP_TYPE_COUNT))
			{
				continue;
			}
			if(type == gameObjectType_bambooBranch && !info.coniferous && randomInt(faceUniqueID, 1402, 2) == 0)
			{
				continue;
			}
		}

		ADD_OBJECT(type);
	}

	addedCount = addWildPlants(types, addedCount, &info, faceUniqueID, level, groveScale);

	if(blocked)
	{
		return addedCount;
	}

	if(info.tropical && info.altitudeMeters > -0.3 && info.altitudeMeters < 1.5 && riverDistance > 0.05)
	{
		addedCount = addMangroves(types, addedCount, faceUniqueID, level);
	}
	if((info.desert || hotSteppe) && info.nearRiver && altitude > 0.0)
	{
		addedCount = addDesertRiver(types, addedCount, &info, faceUniqueID, level);
	}
	if(info.tundra && !info.beach)
	{
		addedCount = addTundra(types, addedCount, &info, faceUniqueID, level, groveScale);
	}
	if(cloudForest && !info.beach)
	{
		addedCount = addCloudForest(types, addedCount, faceUniqueID, level);
	}
	if(tropicalForest && info.savanna && !info.beach)
	{
		addedCount = addGalleryForest(threadState, types, addedCount, &info, noiseLoc, faceUniqueID, level);
	}

	bool dryLand = info.desert || hotSteppe || mediterranean || mediterraneanSteppe;
	bool warmRiverLand = (mediterranean || mediterraneanSteppe || subtropical || (info.temperate && info.winterModerate)) && info.nearRiver;
	bool coldDesert = info.desert && (info.winterCold || info.winterVeryCold) && !info.polar && !info.icecap;
	bool dryPineWoodland = info.forestDensity == 1 && info.coniferous && (info.dry || info.drySummer) && !info.tropical && !info.tundra && !info.polar;
	bool dampForest = info.forestDensity >= 2 && !info.drySummer && !info.desert && (info.temperate || info.rainforest || (info.coniferous && !info.tropical));

	bool oasis = false;
	bool coldOasis = false;
	if(info.desert && !info.polar && !info.icecap && !info.beach && altitude > 0.0)
	{
		SPVec3 oasisLoc = spVec3Mul(noiseLoc, 60000.0);
		if(spNoiseGet(threadState->spNoise1, oasisLoc, 2) > 0.35)
		{
			oasis = !coldDesert;
			coldOasis = coldDesert;
		}
	}

	bool wadi = false;
	if(info.desert && !coldDesert && !info.polar && !info.icecap && !info.beach && altitude > 0.0 && steepness < 0.5)
	{
		SPVec3 wadiLoc = spVec3Mul(noiseLoc, 20000.0);
		wadi = fabs(spNoiseGet(threadState->spNoise2, wadiLoc, 2)) < 0.012;
	}

	bool bog = false;
	if((info.tundra || (info.temperate && info.coniferous && (info.winterCold || info.winterVeryCold))) && !info.beach && altitude > 0.0)
	{
		SPVec3 bogLoc = spVec3Mul(noiseLoc, 173000.0);
		bog = spNoiseGet(threadState->spNoise2, bogLoc, 2) > 0.33;
	}

	if(level == SP_SUBDIVISIONS - 6)
	{
		if(oasis)
		{
			addedCount = addPatch(types, addedCount, faceUniqueID, 8501, 1, 2, 3, gameObjectType_datePalmTypes, DATE_PALM_TYPE_COUNT);
			addedCount = addPatch(types, addedCount, faceUniqueID, 8511, 2, 1, 1, &gameObjectType_tamarisk, 1);
			addedCount = addPatch(types, addedCount, faceUniqueID, 8521, 3, 1, 1, gameObjectType_doumPalmTypes, DOUM_PALM_TYPE_COUNT);
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
		if(wadi)
		{
			if(info.hot)
			{
				addedCount = addPatch(types, addedCount, faceUniqueID, 8661, 2, 1, 1, &gameObjectType_acacia2, 1);
				addedCount = addPatch(types, addedCount, faceUniqueID, 8781, 6, 1, 0, gameObjectType_acaciaTypes, ACACIA_TYPE_COUNT);
			}
			addedCount = addPatch(types, addedCount, faceUniqueID, 8671, 2, 1, 1, &gameObjectType_tamarisk, 1);
			addedCount = addPatch(types, addedCount, faceUniqueID, 8681, 3, 1, 1, &gameObjectType_mesquiteTree, 1);
		}
		if(coldOasis)
		{
			addedCount = addPatch(types, addedCount, faceUniqueID, 8561, 2, 1, 1, &gameObjectType_tamarisk, 1);
		}
		if(coldDesert && !info.beach)
		{
			SPVec3 groveLoc = spVec3Mul(noiseLoc, 250000.0);
			if(spNoiseGet(threadState->spNoise1, groveLoc, 2) > (info.altitudeMeters > 500.0 ? 0.1 : 0.3))
			{
				if(!info.aridDesert)
				{
					addedCount = addPatch(types, addedCount, faceUniqueID, 8531, 1, 1, 1, gameObjectType_juniperTypes, JUNIPER_TYPE_COUNT);
				}
				addedCount = addPatch(types, addedCount, faceUniqueID, 8611, 2, 1, 1, &gameObjectType_saxaul, 1);
			}
		}
		if(info.seaside && info.forestDensity <= 1 && !info.tropical && (info.temperate || mediterranean) && groveScale > 0)
		{
			addedCount = addPatch(types, addedCount, faceUniqueID, 8111, 1, 2, 2, &gameObjectType_maritimePine, 1);
		}
	}
	else if(level == SP_SUBDIVISIONS - 4)
	{
		if((mediterranean || mediterraneanSteppe) && info.nearRiver && altitude > 0.0)
		{
			addedCount = addPatch(types, addedCount, faceUniqueID, 8201, 3, 1, 1, &gameObjectType_oleander, 1);
		}
		if(coast && dryLand)
		{
			addedCount = addPatch(types, addedCount, faceUniqueID, 8211, 4, 1, 0, &gameObjectType_tamarisk, 1);
		}
		if(!info.winterVeryCold)
		{
			if(coast && (info.desert || hotSteppe))
			{
				addedCount = addPatch(types, addedCount, faceUniqueID, 8221, 12, 2, 1, gameObjectType_doumPalmTypes, DOUM_PALM_TYPE_COUNT);
			}
			if((info.desert || hotSteppe) && info.nearRiver)
			{
				if(altitude > 0.0)
				{
					addedCount = addPatch(types, addedCount, faceUniqueID, 8231, 150, 2, 1, gameObjectType_doumPalmTypes, DOUM_PALM_TYPE_COUNT);
				}
			}
			else if(hotSteppe && !info.beach)
			{
				addedCount = addPatch(types, addedCount, faceUniqueID, 8241, 600, 2, 1, gameObjectType_doumPalmTypes, DOUM_PALM_TYPE_COUNT);
			}
		}
		if(info.tropical && info.savanna && info.nearRiver && altitude > 0.0)
		{
			addedCount = addPatch(types, addedCount, faceUniqueID, 8251, 120, 2, 1, gameObjectType_doumPalmTypes, DOUM_PALM_TYPE_COUNT);
		}
		if(aspenParkland && !info.beach)
		{
			if((int)randomInt(faceUniqueID, 8260, 20) < groveScale)
			{
				addedCount = addPatch(types, addedCount, faceUniqueID, 8261, 1, 1, 2, gameObjectType_juniperTypes, JUNIPER_TYPE_COUNT);
			}
			if((int)randomInt(faceUniqueID, 8690, 12) < groveScale)
			{
				addedCount = addPatch(types, addedCount, faceUniqueID, 8691, 1, 1, 1, &gameObjectType_seaBuckthorn, 1);
			}
		}
		if(bog)
		{
			addedCount = addPatch(types, addedCount, faceUniqueID, 8581, 4, 1, 1, gameObjectType_dwarfBirchTypes, DWARF_BIRCH_TYPE_COUNT);
		}
		if((info.deciduous || info.mixedForest) && !subtropical && info.forestDensity > 0 && !info.beach && (int)randomInt(faceUniqueID, 8620, info.winterVeryCold ? 16 : 8) < groveScale)
		{
			addedCount = addPatch(types, addedCount, faceUniqueID, 8621, 1, 1, 2, &gameObjectType_hazelBush, 1);
		}
		if(info.temperate && info.coniferous && info.winterVeryCold && !info.beach && (int)randomInt(faceUniqueID, 8270, info.nearRiver ? 6 : 24) < groveScale)
		{
			addedCount = addPatch(types, addedCount, faceUniqueID, 8271, 1, 1, 1, gameObjectType_dwarfBirchTypes, DWARF_BIRCH_TYPE_COUNT);
		}
	}
	else if(level == SP_SUBDIVISIONS - 3)
	{
		if(info.tropical && info.river)
		{
			addedCount = addPatch(types, addedCount, faceUniqueID, 8301, 4, 3, 3, &gameObjectType_papyrus, 1);
		}
		if(warmRiverLand && info.river)
		{
			addedCount = addPatch(types, addedCount, faceUniqueID, 8311, 4, 3, 3, &gameObjectType_giantReed, 1);
		}
		if(info.tundra && info.altitudeMeters > -0.3)
		{
			addedCount = addPatch(types, addedCount, faceUniqueID, 8381, 10, 3, 3, &gameObjectType_cottonGrass, 1);
		}
		if(info.tundra && !info.beach)
		{
			addedCount = addPatch(types, addedCount, faceUniqueID, 8631, 14, 2, 2, &gameObjectType_arcticWillow, 1);
		}
		if(info.savanna && !info.beach)
		{
			addedCount = addPatch(types, addedCount, faceUniqueID, 8641, 12, 2, 3, &gameObjectType_elephantGrass, 1);
		}
		if((mediterranean || mediterraneanSteppe || hotSteppe) && !info.beach)
		{
			addedCount = addPatch(types, addedCount, faceUniqueID, 8651, 15, 2, 2, &gameObjectType_thyme, 1);
		}
		if(dampForest && !info.beach)
		{
			addedCount = addPatch(types, addedCount, faceUniqueID, 8321, info.rainforest ? 12 : 6, 2, 3, &gameObjectType_groundFern, 1);
		}
		if(yarrowLand && !info.beach)
		{
			addedCount = addPatch(types, addedCount, faceUniqueID, 8331, aspenParkland ? 8 : 15, 2, 2, &gameObjectType_yarrow, 1);
		}
		if(((info.temperate && !info.drySummer) || coolSteppe) && !info.beach)
		{
			addedCount = addPatch(types, addedCount, faceUniqueID, 8341, aspenParkland ? 8 : 15, 2, 2, &gameObjectType_plantain, 1);
		}
		if(info.temperate && info.nearRiver && !info.beach)
		{
			addedCount = addPatch(types, addedCount, faceUniqueID, 8351, 6, 2, 2, &gameObjectType_peppermint, 1);
		}
		else if(dampForest && info.temperate && info.forestDensity >= 3 && !info.beach)
		{
			addedCount = addPatch(types, addedCount, faceUniqueID, 8351, 30, 2, 2, &gameObjectType_peppermint, 1);
		}
		if(gotuKolaLand && !info.beach)
		{
			addedCount = addPatch(types, addedCount, faceUniqueID, 8361, 24, 2, 2, &gameObjectType_gotuKola, 1);
		}
		if(info.tropical && !info.beach)
		{
			addedCount = addPatch(types, addedCount, faceUniqueID, 8371, 24, 2, 2, &gameObjectType_lemongrass, 1);
		}
		if(coldDesert && !info.beach)
		{
			addedCount = addPatch(types, addedCount, faceUniqueID, 8411, info.aridDesert ? 30 : 6, 1, 2, gameObjectType_sagebrushTypes, SAGEBRUSH_TYPE_COUNT);
		}
		else if(coolSteppe && !info.beach)
		{
			addedCount = addPatch(types, addedCount, faceUniqueID, 8411, 10, 1, 2, gameObjectType_sagebrushTypes, SAGEBRUSH_TYPE_COUNT);
		}
		else if(dryPineWoodland && !info.beach)
		{
			addedCount = addPatch(types, addedCount, faceUniqueID, 8411, 20, 1, 2, gameObjectType_sagebrushTypes, SAGEBRUSH_TYPE_COUNT);
		}
		else if(mediterranean && info.forestDensity <= 2 && !info.beach)
		{
			addedCount = addPatch(types, addedCount, faceUniqueID, 8411, 25, 1, 2, gameObjectType_sagebrushTypes, SAGEBRUSH_TYPE_COUNT);
		}
		else if(info.tundra && info.forestDensity == 0 && !info.nearRiver && !info.icecap && !info.beach)
		{
			addedCount = addPatch(types, addedCount, faceUniqueID, 8411, 30, 1, 2, gameObjectType_sagebrushTypes, SAGEBRUSH_TYPE_COUNT);
		}
		if(oasis)
		{
			addedCount = addPatch(types, addedCount, faceUniqueID, 8541, 8, 3, 3, &gameObjectType_commonReed, 1);
		}
		if(coldOasis)
		{
			addedCount = addPatch(types, addedCount, faceUniqueID, 8571, 8, 3, 3, &gameObjectType_bulrush, 1);
		}
		if(info.desert && !info.aridDesert && !coldDesert && !info.beach && altitude > 0.0)
		{
			addedCount = addPatch(types, addedCount, faceUniqueID, 8701, 60, 2, 1, &gameObjectType_aloePlant, 1);
		}
		if(info.aridDesert && !info.beach && altitude > 0.0)
		{
			addedCount = addPatch(types, addedCount, faceUniqueID, 8731, 40, 2, 1, &gameObjectType_featherGrass, 1);
		}
		if(!info.winterVeryCold && (!info.winterCold || info.summerHot) && !info.beach && !info.nearRiver && !oasis && altitude > 0.0 && info.altitudeMeters < 2500.0)
		{
			uint32_t agaveChance = 0;
			if(info.aridDesert)
			{
				agaveChance = wadi ? 40 : 0;
			}
			else if(info.desert)
			{
				agaveChance = (wadi || steepness > 0.3) ? 40 : 100;
			}
			else if(hotSteppe)
			{
				agaveChance = info.winterCold ? 40 : 30;
			}
			else if(mediterraneanSteppe)
			{
				agaveChance = 50;
			}
			else if(info.oakSavanna || (mediterranean && info.forestDensity == 1))
			{
				agaveChance = 80;
			}
			else if(info.savanna && info.forestDensity == 1)
			{
				agaveChance = 100;
			}
			if(agaveChance > 0)
			{
				addedCount = addPatch(types, addedCount, faceUniqueID, 8711, agaveChance, 2, 2, &gameObjectType_agave, 1);
			}
		}
		if(coolSteppe && !info.beach)
		{
			addedCount = addPatch(types, addedCount, faceUniqueID, 8721, aspenParkland ? 12 : 30, 3, 2, &gameObjectType_featherGrass, 1);
		}
		if(bog)
		{
			addedCount = addPatch(types, addedCount, faceUniqueID, 8591, 3, 3, 3, &gameObjectType_cottonGrass, 1);
			addedCount = addPatch(types, addedCount, faceUniqueID, 8601, 8, 1, 1, &gameObjectType_cloudberryBush, 1);
		}
		if(hotSteppe && !info.beach)
		{
			addedCount = addPatch(types, addedCount, faceUniqueID, 8421, 20, 2, 1, &gameObjectType_aloePlant, 1);
			addedCount = addPatch(types, addedCount, faceUniqueID, 8431, 30, 2, 2, &gameObjectType_lemongrass, 1);
		}
		if(aspenParkland && !info.beach)
		{
			addedCount = addPatch(types, addedCount, faceUniqueID, 8391, 12, 2, 2, &gameObjectType_garlicPlant, 1);
			addedCount = addPatch(types, addedCount, faceUniqueID, 8401, 12, 2, 2, &gameObjectType_echinaceaPlant, 1);
		}
	}

	if(altitude < 0.0)
	{
		return addedCount;
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
		return addRainforest(types, addedCount, &info, faceUniqueID, level);
	}
	if(subtropical && info.forestDensity > 0)
	{
		return addSubtropical(types, addedCount, &info, faceUniqueID, level);
	}
	if(mediterranean && info.forestDensity > 0)
	{
		return addMediterranean(threadState, types, addedCount, &info, noiseLoc, faceUniqueID, level);
	}
	if(hotSteppe && !info.beach && !info.winterVeryCold)
	{
		return addHotSteppe(threadState, types, addedCount, &info, noiseLoc, faceUniqueID, level);
	}

	return addedCount;
}
