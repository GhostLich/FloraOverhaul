# Endemic: Flora

a sapiens mod that gives every biome its own unique trees and plants, not finished yet

works on both Stable 0.6.1.3 and Unstable 0.7.0.2

a lot of the models are placeholders right now, but the code is largely done. i'll likely continue to tweak spawn conditions and possibly add more plants to fill in areas lacking coverage

now includes my fix for villages to make them spawn with biome-appropriate trees and crops

lib/EndemicFlora.dll (Windows) and lib/libEndemicFlora.so (Linux) handle where the trees spawn during world generation. the source is in src/EndemicFlora.c, and the headers in src/include are dave's from github.com/Majic-Jungle/splugins

code is MIT, new models are CC BY 4.0, see LICENSE

## plants checklist

✔ = finished remodel

leaf fringes / colors / uvs may be pending or continued to be adjusted on ✔'d models

✔'d models may also receive more variants

Bamboo & Birch vanilla model replacements are for size adjustments

i'm also planning to do a second pass on all the LODs to ensure they look as minimally terrible as possible while still being reasonably optimized

```
Acacia1 - ✔
Acacia2 - ✔
Acacia3 - ✔
AcaciaSapling - ✔
AcaciaSeed - ✔

AgavePlant -
AgavePlantSapling -

Alder1 - ✔
Alder1Winter - ✔
Alder2 - ✔
Alder2Winter - ✔
AlderCone - ✔
AlderSapling - ✔

AngelicaPlant -
AngelicaPlantSapling -
AngelicaRoot -

ArcticWillowWinter - ✔

ArganTree -
ArganTreeSapling -
ArganNut - ✔

BaldCypress1 - ✔
BaldCypress1Winter - ✔
BaldCypressSapling - ✔
BaldCypressCone -

Banyan1 - ✔
Banyan2 - ✔
BanyanSapling - ✔

Baobab1 - ✔
Baobab1Winter - ✔
BaobabSapling - ✔
BaobabFruit - ✔

BarleyPlant - ✔
BarleyPlantCluster - ✔
BarleyPlantSapling - ✔
BarleyPlantSaplingCluster - ✔
Barley -

BrazilNutTree - ✔
BrazilNutTreeSapling - ✔
BrazilNut - ✔

Bulrush -
BulrushSapling -

CacaoTree - ✔
CacaoTreeSapling - ✔
CacaoPod - ✔

Cactus1 -
Cactus2 -
Cactus3 -
CactusSapling -
CactusFruit -

CarobTree - ✔
CarobTreeSapling - ✔

Cattail -
CattailSapling -
CattailRoot -
CattailRootCooked -

Chestnut1 -
Chestnut1Winter -
ChestnutSapling -
Chestnut -

CloudberryBush -
CloudberryBushSapling -
Cloudberry -

CommonReed -
CommonReedSapling -
ReedRhizome -

CordgrassCluster -
CordgrassStalk -
CordgrassSaplingCluster -
CordgrassStalkSapling -

CottonGrassCluster -
CottonGrassStalk -
CottonGrassSaplingCluster -
CottonGrassStalkSapling -

Cycad1 - ✔
Cycad2 - ✔
Cycad3 - ✔
Cycad4 - ✔
CycadSapling - ✔
CycadSeed - ✔

Cypress1 - ✔
CypressSapling - ✔

DatePalm1 - ✔
DatePalm2 - ✔
DatePalm3 - ✔
DatePalmSapling - ✔
Date - 

DoumPalm1 - ✔
DoumPalm2 - ✔
DoumPalm3 - ✔
DoumPalmSapling - ✔

DragonsBloodTree -
DragonsBloodTreeSapling -
DragonsBlood -

DwarfBirch1 - ✔
DwarfBirch1Winter - ✔
DwarfBirch2 - ✔
DwarfBirch2Winter - ✔
DwarfBirch3 - ✔
DwarfBirch3Winter - ✔
DwarfBirchSapling - ✔

ElephantGrass -
ElephantGrassSapling -

EphedraBush -
EphedraBushSapling -
Ephedra -

GroundFern -
GroundFernSapling -

FeatherGrass -
FeatherGrassSapling -

FigTree -
FigTreeWinter -
FigTreeSapling -
Fig -

KapokBig1 -

GiantReed -
GiantReedSapling -

GotuKolaPlant -
GotuKolaPlantSapling -
GotuKolaLeaf -

GrapevinePlant -
GrapevinePlantSapling -
Grape -

HazelBush - ✔
HazelBushWinter - ✔
HazelBushSapling -

HennaBush -
HennaBushSapling -
HennaLeaf -

Juniper1 -
Juniper1Snow -
Juniper2 -
Juniper2Snow -

Kapok1 -
Kapok2 -
Kapok3 -
KapokSapling -
KapokSeed -

Larch1 -
Larch1Winter -

LemongrassPlant -
LemongrassPlantSapling -
Lemongrass -

LingonberryBush -
LingonberryBushSapling -
Lingonberry -

Mahogany1 -
Mahogany2 -
MahoganySapling -

Mangrove1 -
Mangrove2 -
MangroveSapling -
MangroveSeed -

Maple1 -
Maple1Winter -
Maple2 -
Maple2Winter -
Maple3 -
Maple3Winter -
Maple4 -
Maple4Winter -
MapleSapling -
MapleSeed -

MaritimePine1 -
MaritimePine1Snow -

MesquiteTree - ✔
MesquiteTreeSapling - ✔
MesquitePod -

MyrrhBush -
MyrrhBushSapling -
Myrrh -

Oak1 -
Oak1Winter -
Oak2 -
Oak2Winter -
Oak3 -
Oak3Winter -
Oak4 -
Oak4Winter -
OakSapling -
Acorn -

Oleander1 -
OleanderSapling -

OliveTree -
OliveTree2 -
OliveTreeSapling -
Olive -

WildPalm1 - ✔
WildPalm2 - ✔
WildPalm3 - ✔
PalmSeed - ✔
PalmLeaf -
PalmLeafDried -

Papyrus -
PapyrusSapling -

PeppermintPlant -
PeppermintPlantSapling -
PeppermintLeaf -

PlaneTree1 -
PlaneTree1Winter -
PlaneTree2 -
PlaneTree2Winter -
PlaneTreeSapling -
PlaneSeed -

PlantainPlant -
PlantainPlantSapling -
PlantainLeaf -

Poplar1 -
Poplar1Winter -
PoplarSapling -
PoplarSeed -

RubberTree1 -
RubberTree2 -
RubberTree3 -
RubberTree4 -
RubberTreeSapling -

Sagebrush1 - ✔
Sagebrush2 - ✔
Sagebrush3 - ✔
SagebrushSapling - ✔

Saxaul1 -
SaxaulSapling -

SeaBuckthornBush -
SeaBuckthornBushSapling -

Spruce1 -
Spruce1Snow -
SpruceSapling -

StonePine1 -
StonePine1Snow -
StonePineCone -

SyrianRuePlant -
SyrianRuePlantSapling -
SyrianRue -

Tamarisk1 -
TamariskSapling -
TamariskSeed -

ThymePlant -
ThymePlantSapling -
Thyme -

TreeFern1 - ✔
TreeFern2 - ✔
TreeFern3 - ✔
TreeFern4 - ✔
TreeFernSapling - ✔
TreeFernSpores -

WatermelonPlant -
WatermelonPlantSapling -
WaterMelon -

WillowBark -

YarrowPlant -
YarrowPlantSapling -
YarrowFlower -
```
