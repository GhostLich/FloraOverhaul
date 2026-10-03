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
static uint16_t biomeTag_desert;
static uint16_t biomeTag_icecap;
static uint16_t biomeTag_dry;

#define BROADLEAF_TYPE_COUNT 7
static uint32_t gameObjectType_broadleafTypes[BROADLEAF_TYPE_COUNT];

#define PINE_TYPE_COUNT 5
static uint32_t gameObjectType_pineTypes[PINE_TYPE_COUNT];
static uint32_t gameObjectType_pineBranch;

#define WILLOW_TYPE_COUNT 2
static uint32_t gameObjectType_willowTypes[WILLOW_TYPE_COUNT];
static uint32_t gameObjectType_willowBranch;

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

#define DOUM_PALM_TYPE_COUNT 2
static uint32_t gameObjectType_doumPalmTypes[DOUM_PALM_TYPE_COUNT];
static uint32_t gameObjectType_dwarfBirch;
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
static uint32_t gameObjectType_desertScrub;
static uint32_t gameObjectType_grapevine;
static uint32_t gameObjectType_barley;
static uint32_t gameObjectType_watermelon;
static uint32_t gameObjectType_reedPlant;
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
	biomeTag_desert = threadState->getBiomeTag(threadState, "desert");
	biomeTag_icecap = threadState->getBiomeTag(threadState, "icecap");
	biomeTag_dry = threadState->getBiomeTag(threadState, "dry");

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
		gameObjectType_dwarfBirch = threadState->getGameObjectTypeIndex(threadState, "dwarfBirch1");
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
		gameObjectType_desertScrub = threadState->getGameObjectTypeIndex(threadState, "desertScrub");
		gameObjectType_grapevine = threadState->getGameObjectTypeIndex(threadState, "grapevinePlant");
		gameObjectType_barley = threadState->getGameObjectTypeIndex(threadState, "barleyPlant");
		gameObjectType_watermelon = threadState->getGameObjectTypeIndex(threadState, "watermelonPlant");
		gameObjectType_reedPlant = threadState->getGameObjectTypeIndex(threadState, "reedPlant");
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
	bool desert;
	bool icecap;
	bool dry;
	int forestDensity;
	double altitudeMeters;
	double riverDistance;
	bool nearRiver;
	bool tropicalLatitude;
	bool beach;
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
		else if(tag == biomeTag_desert) info->desert = true;
		else if(tag == biomeTag_icecap) info->icecap = true;
		else if(tag == biomeTag_dry) info->dry = true;
		else if(tag == biomeTag_denseForest) info->forestDensity = 4;
		else if(tag == biomeTag_mediumForest) info->forestDensity = 3;
		else if(tag == biomeTag_sparseForest) info->forestDensity = 2;
		else if(tag == biomeTag_verySparseForest) info->forestDensity = 1;
	}
}

#define ADD_OBJECT(__addType__)\
if(addedCount >= BIOME_MAX_GAME_OBJECT_COUNT_PER_SUBDIVISION)\
{\
	return addedCount;\
}\
types[addedCount++] = __addType__;

static int addSavanna(SPBiomeThreadState* threadState, uint32_t* types, int addedCount, BiomeInfo* info, SPVec3 noiseLoc, uint64_t faceUniqueID, int level)
{
	SPVec3 clumpLoc = spVec3Mul(noiseLoc, 250000.0);
	double clump = spNoiseGet(threadState->spNoise1, clumpLoc, 2);

	if(level == SP_SUBDIVISIONS - 7)
	{
		if(info->forestDensity >= 2 && randomInt(faceUniqueID, 1301, 24) == 0)
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
			treeCount = randomInt(faceUniqueID, 1302, 4) + 2;
			break;
		}
		if(clump < -0.25)
		{
			treeCount = 0;
		}
		else if(clump > 0.35)
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
				ADD_OBJECT(gameObjectType_acacia2);
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
			treeCount = randomInt(faceUniqueID, 2501, 3) + 1;
			break;
		case 4:
			treeCount = randomInt(faceUniqueID, 2501, 3) + 2;
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

		if(info->forestDensity >= 2 && randomInt(faceUniqueID, 2801, 5) == 0)
		{
			int bambooCount = randomInt(faceUniqueID, 2802, 4) + info->forestDensity;
			for(int i = 0; i < bambooCount; i++)
			{
				ADD_OBJECT(gameObjectType_bamboo);
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

static int addMediterranean(uint32_t* types, int addedCount, BiomeInfo* info, uint64_t faceUniqueID, int level)
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
		for(int i = 0; i < treeCount; i++)
		{
			uint32_t roll = randomInt(faceUniqueID, 4302 + i, 20);
			if(roll < 6)
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
		if(randomInt(faceUniqueID, 4303, 10) == 0)
		{
			ADD_OBJECT(gameObjectType_oliveTreeTypes[randomInt(faceUniqueID, 9641, OLIVE_TREE_TYPE_COUNT)]);
		}
	}
	return addedCount;
}

static int addHotSteppe(SPBiomeThreadState* threadState, uint32_t* types, int addedCount, SPVec3 noiseLoc, uint64_t faceUniqueID, int level)
{
	if(level == SP_SUBDIVISIONS - 6)
	{
		SPVec3 clumpLoc = spVec3Mul(noiseLoc, 250000.0);
		double clump = spNoiseGet(threadState->spNoise1, clumpLoc, 2);
		if(clump > -0.1 && randomInt(faceUniqueID, 5301, 6) == 0)
		{
			uint32_t roll = randomInt(faceUniqueID, 5302, 10);
			if(roll < 3)
			{
				ADD_OBJECT(gameObjectType_doumPalmTypes[randomInt(faceUniqueID, 9651, DOUM_PALM_TYPE_COUNT)]);
			}
			else
			{
				ADD_OBJECT(roll < 5 ? gameObjectType_acaciaTypes[randomInt(faceUniqueID, 5303, ACACIA_TYPE_COUNT)] : gameObjectType_acacia2);
			}
		}
	}
	return addedCount;
}

static int addDesertRiver(uint32_t* types, int addedCount, uint64_t faceUniqueID, int level)
{
	if(level == SP_SUBDIVISIONS - 6 && randomInt(faceUniqueID, 7201, 3) == 0)
	{
		int treeCount = randomInt(faceUniqueID, 7202, 2) + 1;
		for(int i = 0; i < treeCount; i++)
		{
			uint32_t roll = randomInt(faceUniqueID, 7203 + i, 10);
			if(roll < 4)
			{
				ADD_OBJECT(gameObjectType_doumPalmTypes[randomInt(faceUniqueID, 9661 + i, DOUM_PALM_TYPE_COUNT)]);
			}
			else if(roll < 7)
			{
				ADD_OBJECT(gameObjectType_datePalmTypes[randomInt(faceUniqueID, 7303 + i, DATE_PALM_TYPE_COUNT)]);
			}
			else
			{
				ADD_OBJECT(gameObjectType_tamarisk);
			}
		}
	}
	return addedCount;
}

static int addTundra(uint32_t* types, int addedCount, BiomeInfo* info, uint64_t faceUniqueID, int level)
{
	if(level == SP_SUBDIVISIONS - 4 && randomInt(faceUniqueID, 7401, info->nearRiver ? 3 : 8) == 0)
	{
		int shrubCount = randomInt(faceUniqueID, 7402, 2) + 1;
		for(int i = 0; i < shrubCount; i++)
		{
			ADD_OBJECT(gameObjectType_dwarfBirch);
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

static int addWildPlants(uint32_t* types, int addedCount, BiomeInfo* info, uint64_t faceUniqueID, int level)
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
				addedCount = addSpawn(types, addedCount, faceUniqueID, 9161 + i * 10, 0.002, 1, 3, gameObjectType_datePalmTypes[i]);
			}
			if(altitude > 0.2 && altitude < 2.0 && (info->tropical || info->summerHot) && !(frozen || coldWinter))
			{
				addedCount = addSpawn(types, addedCount, faceUniqueID, 9201 + i * 10, 0.004, 1, 3, gameObjectType_wildPalmTypes[i]);
			}
		}
		for(int i = 0; i < CACTUS_TYPE_COUNT; i++)
		{
			if(altitude > 0.0 && !info->beach && info->desert && !frozen)
			{
				addedCount = addSpawn(types, addedCount, faceUniqueID, 9241 + i * 10, 0.004, 1, 2, gameObjectType_cactusTypes[i]);
			}
		}
		if(altitude > 0.0 && !info->beach && info->savanna && !(info->desert || frozen || coldWinter))
		{
			addedCount = addSpawn(types, addedCount, faceUniqueID, 9281, 0.001, 1, 1, gameObjectType_baobab);
		}
		if(altitude > 0.0 && !info->beach && (info->desert || info->dry) && !(frozen || info->winterVeryCold))
		{
			addedCount = addSpawn(types, addedCount, faceUniqueID, 9321, 0.024, 1, 3, gameObjectType_desertScrub);
		}
	}
	else if(level == SP_SUBDIVISIONS - 2)
	{
		if(altitude > 0.0 && !info->beach && coldWinter && !(info->desert || info->steppe || info->icecap || info->tropical))
		{
			addedCount = addSpawn(types, addedCount, faceUniqueID, 9301, 0.004, 1, 3, gameObjectType_lingonberryBush);
		}
		if(altitude > 0.0 && !info->beach && info->tundra && !(info->desert || info->icecap))
		{
			addedCount = addSpawn(types, addedCount, faceUniqueID, 9311, 0.004, 1, 3, gameObjectType_cloudberryBush);
		}
		if(altitude > 0.0 && !info->beach && (info->river || info->forestDensity == 2 || info->forestDensity == 3) && !(info->desert || info->rainforest || info->tundra || frozen || info->winterVeryCold))
		{
			addedCount = addSpawn(types, addedCount, faceUniqueID, 9331, 0.002, 1, 3, gameObjectType_grapevine);
		}
		if(altitude > 0.0 && !info->beach && (info->steppe || info->temperate) && !(info->tropical || info->desert || info->rainforest || info->forestDensity >= 3 || info->tundra || frozen || info->winterVeryCold))
		{
			addedCount = addSpawn(types, addedCount, faceUniqueID, 9341, 0.002, 3, 8, gameObjectType_barley);
		}
		if(altitude > 0.0 && !info->beach && info->summerHot && !(info->tropical || info->rainforest || info->forestDensity == 4 || frozen || coldWinter))
		{
			addedCount = addSpawn(types, addedCount, faceUniqueID, 9351, 0.002, 1, 3, gameObjectType_watermelon);
		}
		if(altitude > -0.3 && altitude < 1.2 && info->river && !(info->desert || frozen))
		{
			addedCount = addSpawn(types, addedCount, faceUniqueID, 9361, 0.02, 3, 8, gameObjectType_reedPlant);
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

	bool tropicalForest = info.tropical && (info.savanna || info.rainforest);
	bool subtropical = info.temperate && info.winterModerate && info.summerHot && !info.drySummer;
	bool deciduous = info.temperate && info.birch && !info.coniferous && !info.drySummer;
	bool mediterranean = info.temperate && info.drySummer && !info.coniferous;
	bool hotSteppe = info.steppe && info.hot;
	bool coolSteppe = info.steppe && !info.hot && !info.polar;
	bool aspenParkland = coolSteppe && info.winterVeryCold;
	bool mediterraneanSteppe = coolSteppe && info.winterModerate;
	bool oakSavanna = coolSteppe && !info.winterVeryCold && !info.winterModerate;
	bool mixedForest = info.temperate && info.birch && info.coniferous && !info.drySummer;
	bool cloudForest = info.tropicalLatitude && !info.tropical && info.temperate && !info.drySummer && info.altitudeMeters > 1500.0;
	bool coast = info.altitudeMeters > 0.1 && info.altitudeMeters < 1.5 && riverDistance > 0.05;
	bool seaside = !info.beach && info.altitudeMeters < 6.0 && riverDistance > 0.05;
	bool noFruitTrees = info.polar || info.winterVeryCold;

	bool yarrowLand = !info.tropical && !info.desert && !hotSteppe && (info.temperate || info.tundra || coolSteppe || info.coniferous);
	bool gotuKolaLand = info.rainforest || (info.tropical && info.nearRiver);
	bool thinTurmeric = yarrowLand;
	bool thinGinger = info.temperate && info.nearRiver;
	bool thinAloe = info.temperate && !info.drySummer;
	bool thinMarigold = gotuKolaLand || (info.tundra && yarrowLand);
	bool thinGarlicAndEchinacea = info.tropical;
	bool keepThinnedPlants = randomInt(faceUniqueID, 1701, 3) == 0;

	int addedCount = 0;
	for(int i = 0; i < incomingTypeCount; i++)
	{
		uint32_t type = types[i];

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

		if(tropicalForest)
		{
			if(isInList(type, gameObjectType_pineTypes, PINE_TYPE_COUNT) || isInList(type, gameObjectType_temperatePlantTypes, TEMPERATE_PLANT_TYPE_COUNT))
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
			if(isInList(type, gameObjectType_willowTypes, WILLOW_TYPE_COUNT))
			{
				if(info.savanna || randomInt(faceUniqueID, 1501 + i, 2) == 0)
				{
					type = gameObjectType_wildPalmTypes[randomInt(faceUniqueID, 1502 + i, WILD_PALM_TYPE_COUNT)];
				}
				else
				{
					type = gameObjectType_rubberTreeTypes[randomInt(faceUniqueID, 1503 + i, RUBBER_TREE_TYPE_COUNT)];
				}
			}
			else if(type == gameObjectType_pineBranch || type == gameObjectType_willowBranch)
			{
				type = (info.savanna ? gameObjectType_acaciaBranch : gameObjectType_kapokBranch);
			}
		}
		else if(isInList(type, gameObjectType_pineTypes, PINE_TYPE_COUNT))
		{
			if(aspenParkland)
			{
				uint32_t roll = randomInt(faceUniqueID, 3401 + i, 20);
				if(roll < 10)
				{
					type = gameObjectType_broadleafTypes[randomInt(faceUniqueID, 3402 + i, BROADLEAF_TYPE_COUNT)];
				}
				else if(roll < 13)
				{
					type = gameObjectType_juniperTypes[randomInt(faceUniqueID, 9681 + i, JUNIPER_TYPE_COUNT)];
				}
			}
			else if(mediterraneanSteppe)
			{
				uint32_t roll = randomInt(faceUniqueID, 3401 + i, 20);
				if(roll < 6)
				{
					type = gameObjectType_argan;
				}
				else if(roll < 10)
				{
					type = gameObjectType_carob;
				}
				else if(roll < 13)
				{
					type = gameObjectType_oliveTreeTypes[randomInt(faceUniqueID, 9691 + i, OLIVE_TREE_TYPE_COUNT)];
				}
				else if(roll < 15)
				{
					type = gameObjectType_juniperTypes[randomInt(faceUniqueID, 9701 + i, JUNIPER_TYPE_COUNT)];
				}
			}
			else if(oakSavanna)
			{
				uint32_t roll = randomInt(faceUniqueID, 3401 + i, 20);
				if(roll < 11)
				{
					type = gameObjectType_oakTypes[randomInt(faceUniqueID, 3402 + i, OAK_TYPE_COUNT)];
				}
				else if(roll < 15)
				{
					type = gameObjectType_juniperTypes[randomInt(faceUniqueID, 9711 + i, JUNIPER_TYPE_COUNT)];
				}
			}
			else if(info.tundra)
			{
				uint32_t roll = randomInt(faceUniqueID, 3501 + i, 10);
				if(roll < 3)
				{
					type = gameObjectType_juniperTypes[randomInt(faceUniqueID, 9721 + i, JUNIPER_TYPE_COUNT)];
				}
				else if(roll < 5)
				{
					type = gameObjectType_dwarfBirch;
				}
			}
			else if(level == SP_SUBDIVISIONS - 4 && type == gameObjectType_pineTypes[3] && (info.winterCold || info.winterVeryCold))
			{
				if(randomInt(faceUniqueID, 3601 + i, 10) < 4)
				{
					type = gameObjectType_juniperTypes[randomInt(faceUniqueID, 9731 + i, JUNIPER_TYPE_COUNT)];
				}
			}
		}
		else if(isInList(type, gameObjectType_broadleafTypes, BROADLEAF_TYPE_COUNT))
		{
			uint32_t roll = randomInt(faceUniqueID, 3101 + i, 20);
			if(cloudForest && roll < 8)
			{
				type = gameObjectType_treeFernTypes[randomInt(faceUniqueID, 3203 + i, TREE_FERN_TYPE_COUNT)];
			}
			else if(info.temperate && info.nearRiver && !info.drySummer && roll < 10)
			{
				uint32_t riverRoll = randomInt(faceUniqueID, 3204 + i, 10);
				if(subtropical)
				{
					type = gameObjectType_baldCypress;
				}
				else if(info.winterModerate && riverRoll < 5)
				{
					type = gameObjectType_planeTreeTypes[randomInt(faceUniqueID, 9741 + i, PLANE_TREE_TYPE_COUNT)];
				}
				else
				{
					type = (riverRoll < 7 ? gameObjectType_alderTypes[randomInt(faceUniqueID, 3206 + i, ALDER_TYPE_COUNT)] : gameObjectType_poplar);
				}
			}
			else if(subtropical)
			{
				if(roll < 10)
				{
					type = gameObjectType_rubberTreeTypes[randomInt(faceUniqueID, 3201 + i, RUBBER_TREE_TYPE_COUNT)];
				}
				else if(roll < 16)
				{
					type = gameObjectType_oakTypes[randomInt(faceUniqueID, 3202 + i, OAK_TYPE_COUNT)];
				}
			}
			else if(deciduous)
			{
				if(roll < 9)
				{
					type = gameObjectType_oakTypes[randomInt(faceUniqueID, 3202 + i, OAK_TYPE_COUNT)];
				}
				else if(roll < 12)
				{
					type = gameObjectType_mapleTypes[randomInt(faceUniqueID, 3205 + i, MAPLE_TYPE_COUNT)];
				}
			}
			else if(mixedForest && roll < 4)
			{
				type = gameObjectType_mapleTypes[randomInt(faceUniqueID, 3205 + i, MAPLE_TYPE_COUNT)];
			}
		}

		types[addedCount++] = type;
	}

	addedCount = addWildPlants(types, addedCount, &info, faceUniqueID, level);

	if(info.cliff || steepness > 1.0 || altitude < -0.0000001)
	{
		return addedCount;
	}

	if(info.tropical && coast)
	{
		addedCount = addMangroves(types, addedCount, faceUniqueID, level);
	}
	if((info.desert || hotSteppe) && info.nearRiver)
	{
		addedCount = addDesertRiver(types, addedCount, faceUniqueID, level);
	}
	if(info.tundra && !info.beach)
	{
		addedCount = addTundra(types, addedCount, &info, faceUniqueID, level);
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
	bool dampForest = info.forestDensity >= 2 && !info.drySummer && !info.desert && (info.temperate || info.rainforest || info.coniferous);

	if(level == SP_SUBDIVISIONS - 6)
	{
		if((mediterranean || mediterraneanSteppe) && info.nearRiver && !info.beach)
		{
			addedCount = addPatch(types, addedCount, faceUniqueID, 8101, 3, 1, 0, gameObjectType_planeTreeTypes, PLANE_TREE_TYPE_COUNT);
		}
		if(seaside && !info.tropical && (info.temperate || mediterranean))
		{
			addedCount = addPatch(types, addedCount, faceUniqueID, 8111, 3, 1, 1, &gameObjectType_maritimePine, 1);
		}
	}
	else if(level == SP_SUBDIVISIONS - 4)
	{
		if((mediterranean || mediterraneanSteppe) && info.nearRiver)
		{
			addedCount = addPatch(types, addedCount, faceUniqueID, 8201, 3, 1, 1, &gameObjectType_oleander, 1);
		}
		if(coast && dryLand)
		{
			addedCount = addPatch(types, addedCount, faceUniqueID, 8211, 4, 1, 0, &gameObjectType_tamarisk, 1);
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
		if(info.tundra)
		{
			addedCount = addPatch(types, addedCount, faceUniqueID, 8381, 10, 3, 3, &gameObjectType_cottonGrass, 1);
		}
		if(dampForest && !info.beach)
		{
			addedCount = addPatch(types, addedCount, faceUniqueID, 8321, 6, 2, 3, &gameObjectType_groundFern, 1);
		}
		if(yarrowLand && !info.beach)
		{
			addedCount = addPatch(types, addedCount, faceUniqueID, 8331, 15, 2, 2, &gameObjectType_yarrow, 1);
		}
		if(((info.temperate && !info.drySummer) || coolSteppe) && !info.beach)
		{
			addedCount = addPatch(types, addedCount, faceUniqueID, 8341, 15, 2, 2, &gameObjectType_plantain, 1);
		}
		if(info.temperate && info.nearRiver && !info.beach)
		{
			addedCount = addPatch(types, addedCount, faceUniqueID, 8351, 6, 2, 2, &gameObjectType_peppermint, 1);
		}
		if(gotuKolaLand && !info.beach)
		{
			addedCount = addPatch(types, addedCount, faceUniqueID, 8361, 12, 2, 2, &gameObjectType_gotuKola, 1);
		}
		if(info.tropical && !info.beach)
		{
			addedCount = addPatch(types, addedCount, faceUniqueID, 8371, 12, 2, 2, &gameObjectType_lemongrass, 1);
		}
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
		return addMediterranean(types, addedCount, &info, faceUniqueID, level);
	}
	if(hotSteppe && !info.beach)
	{
		return addHotSteppe(threadState, types, addedCount, noiseLoc, faceUniqueID, level);
	}

	return addedCount;
}
