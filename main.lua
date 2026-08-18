-- More Attacks v1.0.0
-- Adds 10 Gen 3+ moves with historically-informed learnsets for #001-251.
-- Each Pokemon's learnset is the full merged Crystal learnset (from
-- gen2_moves_learnsets_251) plus the new moves, sorted by level.
-- Requires gen2_moves_learnsets_251 (priority 300); this mod runs at 400.
--
-- New moves: X-Scissor, Signal Beam, Shadow Claw, Dragon Claw, Dark Pulse,
--            Air Slash, Iron Head, Flash Cannon, Poison Jab, Power Gem
--
-- Effect references (all registered by gen2_moves_learnsets_251):
--   GEN2_CONFUSE_CHANCE, GEN2_FLINCH_CHANCE, GEN2_POISON_CHANCE,
--   GEN2_SPECIAL_DOWN_CHANCE, NO_ADDITIONAL_EFFECT (built-in)
--
-- Shadow Claw: highCrit=true uses the move-record field introduced in
--   gen1recomp Damage.lua to grant a boosted critical-hit rate.

local newMoves = {
  X_SCISSOR    = {id="X_SCISSOR",    name="X-SCISSOR",    type="BUG",    power=80, accuracy=100, pp=15, effect="NO_ADDITIONAL_EFFECT",    category="physical"},
  SIGNAL_BEAM  = {id="SIGNAL_BEAM",  name="SIGNAL BEAM",  type="BUG",    power=75, accuracy=100, pp=15, effect="GEN2_CONFUSE_CHANCE",     category="special",  effectChance=26},
  SHADOW_CLAW  = {id="SHADOW_CLAW",  name="SHADOW CLAW",  type="GHOST",  power=70, accuracy=100, pp=15, effect="NO_ADDITIONAL_EFFECT",    category="physical", highCrit=true},
  DRAGON_CLAW  = {id="DRAGON_CLAW",  name="DRAGON CLAW",  type="DRAGON", power=80, accuracy=100, pp=15, effect="NO_ADDITIONAL_EFFECT",    category="physical"},
  DARK_PULSE   = {id="DARK_PULSE",   name="DARK PULSE",   type="DARK",   power=80, accuracy=100, pp=15, effect="GEN2_FLINCH_CHANCE",      category="special",  effectChance=51},
  AIR_SLASH    = {id="AIR_SLASH",    name="AIR SLASH",    type="FLYING", power=75, accuracy=95,  pp=15, effect="GEN2_FLINCH_CHANCE",      category="special",  effectChance=77},
  IRON_HEAD    = {id="IRON_HEAD",    name="IRON HEAD",    type="STEEL",  power=80, accuracy=100, pp=15, effect="GEN2_FLINCH_CHANCE",      category="physical", effectChance=77},
  FLASH_CANNON = {id="FLASH_CANNON", name="FLASH CANNON", type="STEEL",  power=80, accuracy=100, pp=10, effect="GEN2_SPECIAL_DOWN_CHANCE", category="special",  effectChance=26},
  POISON_JAB   = {id="POISON_JAB",   name="POISON JAB",   type="POISON", power=80, accuracy=100, pp=20, effect="GEN2_POISON_CHANCE",      category="physical", effectChance=77},
  POWER_GEM    = {id="POWER_GEM",    name="POWER GEM",    type="ROCK",   power=80, accuracy=100, pp=20, effect="NO_ADDITIONAL_EFFECT",    category="special"},
}

-- Full merged learnsets: Crystal baseline (gen2_moves_learnsets_251) + new moves.
-- Patching learnset replaces the whole array, so every entry must be present.
local learnsets = {

  -- #006 Charizard  +Air Slash (50), +Dragon Claw (59)
  CHARIZARD={level1Moves={"SCRATCH","GROWL","EMBER","SMOKESCREEN"}, learnset={
    {level=7,  move="EMBER"},       {level=13, move="SMOKESCREEN"}, {level=20, move="RAGE"},
    {level=27, move="SCARY_FACE"},  {level=34, move="FLAMETHROWER"},{level=36, move="WING_ATTACK"},
    {level=44, move="SLASH"},       {level=50, move="AIR_SLASH"},   {level=54, move="DRAGON_RAGE"},
    {level=59, move="DRAGON_CLAW"}, {level=64, move="FIRE_SPIN"},
  }},

  -- #009 Blastoise  +Flash Cannon (level1)
  BLASTOISE={level1Moves={"TACKLE","TAIL_WHIP","BUBBLE","WITHDRAW","FLASH_CANNON"}, learnset={
    {level=4,  move="TAIL_WHIP"},  {level=7,  move="BUBBLE"},     {level=10, move="WITHDRAW"},
    {level=13, move="WATER_GUN"}, {level=19, move="BITE"},       {level=25, move="RAPID_SPIN"},
    {level=31, move="PROTECT"},   {level=42, move="RAIN_DANCE"}, {level=55, move="SKULL_BASH"},
    {level=68, move="HYDRO_PUMP"},
  }},

  -- #012 Butterfree  +Signal Beam (25)
  BUTTERFREE={level1Moves={"CONFUSION"}, learnset={
    {level=10, move="CONFUSION"},   {level=13, move="POISONPOWDER"},{level=14, move="STUN_SPORE"},
    {level=15, move="SLEEP_POWDER"},{level=18, move="SUPERSONIC"},  {level=23, move="WHIRLWIND"},
    {level=25, move="SIGNAL_BEAM"}, {level=28, move="GUST"},        {level=34, move="PSYBEAM"},
    {level=40, move="SAFEGUARD"},
  }},

  -- #015 Beedrill  +Poison Jab (28), +X-Scissor (41)
  BEEDRILL={level1Moves={"FURY_ATTACK"}, learnset={
    {level=10, move="FURY_ATTACK"},  {level=15, move="FOCUS_ENERGY"},{level=20, move="TWINEEDLE"},
    {level=25, move="RAGE"},         {level=28, move="POISON_JAB"},  {level=30, move="PURSUIT"},
    {level=35, move="PIN_MISSILE"},  {level=40, move="AGILITY"},     {level=41, move="X_SCISSOR"},
  }},

  -- #016 Pidgey  +Air Slash (42)
  PIDGEY={level1Moves={"TACKLE"}, learnset={
    {level=5,  move="SAND_ATTACK"}, {level=9,  move="GUST"},        {level=15, move="QUICK_ATTACK"},
    {level=21, move="WHIRLWIND"},   {level=29, move="WING_ATTACK"},  {level=37, move="AGILITY"},
    {level=42, move="AIR_SLASH"},   {level=47, move="MIRROR_MOVE"},
  }},

  -- #017 Pidgeotto  +Air Slash (49)
  PIDGEOTTO={level1Moves={"TACKLE","SAND_ATTACK","GUST"}, learnset={
    {level=5,  move="SAND_ATTACK"}, {level=9,  move="GUST"},        {level=15, move="QUICK_ATTACK"},
    {level=23, move="WHIRLWIND"},   {level=33, move="WING_ATTACK"},  {level=43, move="AGILITY"},
    {level=49, move="AIR_SLASH"},   {level=55, move="MIRROR_MOVE"},
  }},

  -- #018 Pidgeot  +Air Slash (53)
  PIDGEOT={level1Moves={"TACKLE","SAND_ATTACK","GUST","QUICK_ATTACK"}, learnset={
    {level=5,  move="SAND_ATTACK"}, {level=9,  move="GUST"},        {level=15, move="QUICK_ATTACK"},
    {level=23, move="WHIRLWIND"},   {level=33, move="WING_ATTACK"},  {level=46, move="AGILITY"},
    {level=53, move="AIR_SLASH"},   {level=61, move="MIRROR_MOVE"},
  }},

  -- #023 Ekans  +Poison Jab (37) — same level as Acid; both coexist
  EKANS={level1Moves={"WRAP","LEER"}, learnset={
    {level=9,  move="POISON_STING"},{level=15, move="BITE"},     {level=23, move="GLARE"},
    {level=29, move="SCREECH"},     {level=37, move="ACID"},     {level=37, move="POISON_JAB"},
    {level=43, move="HAZE"},
  }},

  -- #024 Arbok  +Poison Jab (46)
  ARBOK={level1Moves={"WRAP","LEER","POISON_STING","BITE"}, learnset={
    {level=9,  move="POISON_STING"},{level=15, move="BITE"},      {level=25, move="GLARE"},
    {level=33, move="SCREECH"},     {level=43, move="ACID"},       {level=46, move="POISON_JAB"},
    {level=51, move="HAZE"},
  }},

  -- #031 Nidoqueen  +Poison Jab (40)
  NIDOQUEEN={level1Moves={"TACKLE","SCRATCH","DOUBLE_KICK","TAIL_WHIP"}, learnset={
    {level=23, move="BODY_SLAM"},   {level=40, move="POISON_JAB"},
  }},

  -- #032 Nidoran-M  +Poison Jab (29)
  NIDORAN_M={level1Moves={"LEER","TACKLE"}, learnset={
    {level=8,  move="HORN_ATTACK"}, {level=12, move="DOUBLE_KICK"}, {level=17, move="POISON_STING"},
    {level=23, move="FOCUS_ENERGY"},{level=29, move="POISON_JAB"},  {level=30, move="FURY_ATTACK"},
    {level=38, move="HORN_DRILL"},
  }},

  -- #033 Nidorino  +Poison Jab (38) — between Fury Attack (36) and Horn Drill (46)
  NIDORINO={level1Moves={"LEER","TACKLE"}, learnset={
    {level=8,  move="HORN_ATTACK"}, {level=12, move="DOUBLE_KICK"}, {level=19, move="POISON_STING"},
    {level=27, move="FOCUS_ENERGY"},{level=36, move="FURY_ATTACK"}, {level=38, move="POISON_JAB"},
    {level=46, move="HORN_DRILL"},
  }},

  -- #034 Nidoking  +Poison Jab (40)
  NIDOKING={level1Moves={"TACKLE","HORN_ATTACK","DOUBLE_KICK","POISON_STING"}, learnset={
    {level=23, move="THRASH"},      {level=40, move="POISON_JAB"},
  }},

  -- #041 Zubat  +Poison Jab (31), +Air Slash (40)
  ZUBAT={level1Moves={"LEECH_LIFE"}, learnset={
    {level=6,  move="SUPERSONIC"},  {level=12, move="BITE"},        {level=19, move="CONFUSE_RAY"},
    {level=27, move="WING_ATTACK"}, {level=31, move="POISON_JAB"},  {level=36, move="MEAN_LOOK"},
    {level=40, move="AIR_SLASH"},   {level=46, move="HAZE"},
  }},

  -- #042 Golbat  +Poison Jab (46), +Air Slash (48)
  GOLBAT={level1Moves={"SCREECH","LEECH_LIFE","SUPERSONIC"}, learnset={
    {level=6,  move="SUPERSONIC"},  {level=12, move="BITE"},        {level=19, move="CONFUSE_RAY"},
    {level=30, move="WING_ATTACK"}, {level=42, move="MEAN_LOOK"},   {level=46, move="POISON_JAB"},
    {level=48, move="AIR_SLASH"},   {level=55, move="HAZE"},
  }},

  -- #046 Paras  +X-Scissor (40)
  PARAS={level1Moves={"SCRATCH"}, learnset={
    {level=7,  move="STUN_SPORE"},  {level=13, move="POISONPOWDER"},{level=19, move="LEECH_LIFE"},
    {level=25, move="SPORE"},       {level=31, move="SLASH"},       {level=37, move="GROWTH"},
    {level=40, move="X_SCISSOR"},   {level=43, move="GIGA_DRAIN"},
  }},

  -- #047 Parasect  +X-Scissor (40)
  PARASECT={level1Moves={"SCRATCH","STUN_SPORE","POISONPOWDER"}, learnset={
    {level=7,  move="STUN_SPORE"},  {level=13, move="POISONPOWDER"},{level=19, move="LEECH_LIFE"},
    {level=28, move="SPORE"},       {level=37, move="SLASH"},       {level=40, move="X_SCISSOR"},
    {level=46, move="GROWTH"},      {level=55, move="GIGA_DRAIN"},
  }},

  -- #048 Venonat  +Signal Beam (25) — same level as Leech Life; both coexist
  VENONAT={level1Moves={"TACKLE","DISABLE","FORESIGHT"}, learnset={
    {level=9,  move="SUPERSONIC"},  {level=17, move="CONFUSION"},   {level=20, move="POISONPOWDER"},
    {level=25, move="LEECH_LIFE"},  {level=25, move="SIGNAL_BEAM"}, {level=28, move="STUN_SPORE"},
    {level=33, move="PSYBEAM"},     {level=36, move="SLEEP_POWDER"},{level=41, move="PSYCHIC_M"},
  }},

  -- #049 Venomoth  +Signal Beam (25) — same level as Leech Life; both coexist
  VENOMOTH={level1Moves={"TACKLE","DISABLE","FORESIGHT","SUPERSONIC"}, learnset={
    {level=9,  move="SUPERSONIC"},  {level=17, move="CONFUSION"},   {level=20, move="POISONPOWDER"},
    {level=25, move="LEECH_LIFE"},  {level=25, move="SIGNAL_BEAM"}, {level=28, move="STUN_SPORE"},
    {level=31, move="GUST"},        {level=36, move="PSYBEAM"},     {level=42, move="SLEEP_POWDER"},
    {level=52, move="PSYCHIC_M"},
  }},

  -- #053 Persian  +Power Gem (32)
  PERSIAN={level1Moves={"SCRATCH","GROWL","BITE"}, learnset={
    {level=11, move="BITE"},        {level=20, move="PAY_DAY"},     {level=29, move="FAINT_ATTACK"},
    {level=32, move="POWER_GEM"},   {level=38, move="SCREECH"},     {level=46, move="FURY_SWIPES"},
    {level=53, move="SLASH"},
  }},

  -- #069 Bellsprout  +Poison Jab (41)
  BELLSPROUT={level1Moves={"VINE_WHIP"}, learnset={
    {level=6,  move="GROWTH"},      {level=11, move="WRAP"},        {level=15, move="SLEEP_POWDER"},
    {level=17, move="POISONPOWDER"},{level=19, move="STUN_SPORE"},  {level=23, move="ACID"},
    {level=30, move="SWEET_SCENT"}, {level=37, move="RAZOR_LEAF"},  {level=41, move="POISON_JAB"},
    {level=45, move="SLAM"},
  }},

  -- #070 Weepinbell  +Poison Jab (47)
  WEEPINBELL={level1Moves={"VINE_WHIP","GROWTH","WRAP"}, learnset={
    {level=6,  move="GROWTH"},      {level=11, move="WRAP"},        {level=15, move="SLEEP_POWDER"},
    {level=17, move="POISONPOWDER"},{level=19, move="STUN_SPORE"},  {level=24, move="ACID"},
    {level=33, move="SWEET_SCENT"}, {level=42, move="RAZOR_LEAF"},  {level=47, move="POISON_JAB"},
    {level=54, move="SLAM"},
  }},

  -- #072 Tentacool  +Poison Jab (39)
  TENTACOOL={level1Moves={"POISON_STING"}, learnset={
    {level=6,  move="SUPERSONIC"},  {level=12, move="CONSTRICT"},   {level=19, move="ACID"},
    {level=25, move="BUBBLEBEAM"},  {level=30, move="WRAP"},        {level=36, move="BARRIER"},
    {level=39, move="POISON_JAB"},  {level=43, move="SCREECH"},     {level=49, move="HYDRO_PUMP"},
  }},

  -- #073 Tentacruel  +Poison Jab (43)
  TENTACRUEL={level1Moves={"POISON_STING","SUPERSONIC","CONSTRICT"}, learnset={
    {level=6,  move="SUPERSONIC"},  {level=12, move="CONSTRICT"},   {level=19, move="ACID"},
    {level=25, move="BUBBLEBEAM"},  {level=30, move="WRAP"},        {level=38, move="BARRIER"},
    {level=43, move="POISON_JAB"},  {level=47, move="SCREECH"},     {level=55, move="HYDRO_PUMP"},
  }},

  -- #081 Magnemite  +Flash Cannon (34), +Iron Head (37)
  MAGNEMITE={level1Moves={"TACKLE"}, learnset={
    {level=6,  move="THUNDERSHOCK"},{level=11, move="SUPERSONIC"},  {level=16, move="SONICBOOM"},
    {level=21, move="THUNDER_WAVE"},{level=27, move="LOCK_ON"},     {level=33, move="SWIFT"},
    {level=34, move="FLASH_CANNON"},{level=37, move="IRON_HEAD"},   {level=39, move="SCREECH"},
    {level=45, move="ZAP_CANNON"},
  }},

  -- #082 Magneton  +Flash Cannon (48), +Iron Head (51)
  MAGNETON={level1Moves={"TACKLE","THUNDERSHOCK","SUPERSONIC","SONICBOOM"}, learnset={
    {level=6,  move="THUNDERSHOCK"},{level=11, move="SUPERSONIC"},  {level=16, move="SONICBOOM"},
    {level=21, move="THUNDER_WAVE"},{level=27, move="LOCK_ON"},     {level=35, move="TRI_ATTACK"},
    {level=43, move="SCREECH"},     {level=48, move="FLASH_CANNON"},{level=51, move="IRON_HEAD"},
    {level=53, move="ZAP_CANNON"},
  }},

  -- #083 Farfetch'd  +Air Slash (40)
  FARFETCHD={level1Moves={"PECK"}, learnset={
    {level=7,  move="SAND_ATTACK"}, {level=13, move="LEER"},        {level=19, move="FURY_ATTACK"},
    {level=25, move="SWORDS_DANCE"},{level=31, move="AGILITY"},     {level=37, move="SLASH"},
    {level=40, move="AIR_SLASH"},   {level=44, move="FALSE_SWIPE"},
  }},

  -- #087 Dewgong  +Signal Beam (7)
  DEWGONG={level1Moves={"HEADBUTT","GROWL","AURORA_BEAM"}, learnset={
    {level=5,  move="GROWL"},       {level=7,  move="SIGNAL_BEAM"}, {level=16, move="AURORA_BEAM"},
    {level=21, move="REST"},        {level=32, move="TAKE_DOWN"},   {level=43, move="ICE_BEAM"},
    {level=60, move="SAFEGUARD"},
  }},

  -- #092 Gastly  +Shadow Claw (35), +Dark Pulse (39)
  GASTLY={level1Moves={"HYPNOSIS","LICK"}, learnset={
    {level=8,  move="SPITE"},       {level=13, move="MEAN_LOOK"},   {level=16, move="CURSE"},
    {level=21, move="NIGHT_SHADE"}, {level=28, move="CONFUSE_RAY"}, {level=33, move="DREAM_EATER"},
    {level=35, move="SHADOW_CLAW"}, {level=36, move="DESTINY_BOND"},{level=39, move="DARK_PULSE"},
  }},

  -- #093 Haunter  +Shadow Claw (42), +Dark Pulse (44)
  HAUNTER={level1Moves={"HYPNOSIS","LICK","SPITE"}, learnset={
    {level=8,  move="SPITE"},       {level=13, move="MEAN_LOOK"},   {level=16, move="CURSE"},
    {level=21, move="NIGHT_SHADE"}, {level=31, move="CONFUSE_RAY"}, {level=39, move="DREAM_EATER"},
    {level=42, move="SHADOW_CLAW"}, {level=44, move="DARK_PULSE"},  {level=48, move="DESTINY_BOND"},
  }},

  -- #094 Gengar  +Dark Pulse (44), +Shadow Claw (50)
  GENGAR={level1Moves={"HYPNOSIS","LICK","SPITE"}, learnset={
    {level=8,  move="SPITE"},       {level=13, move="MEAN_LOOK"},   {level=16, move="CURSE"},
    {level=21, move="NIGHT_SHADE"}, {level=31, move="CONFUSE_RAY"}, {level=39, move="DREAM_EATER"},
    {level=44, move="DARK_PULSE"},  {level=48, move="DESTINY_BOND"},{level=50, move="SHADOW_CLAW"},
  }},

  -- #120 Staryu  +Power Gem (46)
  STARYU={level1Moves={"TACKLE","HARDEN"}, learnset={
    {level=7,  move="WATER_GUN"},   {level=13, move="RAPID_SPIN"},  {level=19, move="RECOVER"},
    {level=25, move="SWIFT"},       {level=31, move="BUBBLEBEAM"},  {level=37, move="MINIMIZE"},
    {level=43, move="LIGHT_SCREEN"},{level=46, move="POWER_GEM"},   {level=50, move="HYDRO_PUMP"},
  }},

  -- #123 Scyther  +X-Scissor (41), +Air Slash (45)
  SCYTHER={level1Moves={"QUICK_ATTACK","LEER"}, learnset={
    {level=6,  move="FOCUS_ENERGY"},{level=12, move="PURSUIT"},     {level=18, move="FALSE_SWIPE"},
    {level=24, move="AGILITY"},     {level=30, move="WING_ATTACK"},  {level=36, move="SLASH"},
    {level=41, move="X_SCISSOR"},   {level=42, move="SWORDS_DANCE"},{level=45, move="AIR_SLASH"},
    {level=48, move="DOUBLE_TEAM"},
  }},

  -- #127 Pinsir  +X-Scissor (41)
  PINSIR={level1Moves={"VICEGRIP"}, learnset={
    {level=7,  move="FOCUS_ENERGY"},{level=13, move="BIND"},        {level=19, move="SEISMIC_TOSS"},
    {level=25, move="HARDEN"},      {level=31, move="GUILLOTINE"},   {level=37, move="SUBMISSION"},
    {level=41, move="X_SCISSOR"},   {level=43, move="SWORDS_DANCE"},
  }},

  -- #130 Gyarados  +Dragon Claw (48)
  GYARADOS={level1Moves={"THRASH"}, learnset={
    {level=20, move="BITE"},        {level=25, move="DRAGON_RAGE"},  {level=30, move="LEER"},
    {level=35, move="TWISTER"},     {level=40, move="HYDRO_PUMP"},   {level=45, move="RAIN_DANCE"},
    {level=48, move="DRAGON_CLAW"}, {level=50, move="HYPER_BEAM"},
  }},

  -- #137 Porygon  +Signal Beam (29)
  PORYGON={level1Moves={"CONVERSION2","TACKLE","CONVERSION"}, learnset={
    {level=9,  move="AGILITY"},     {level=12, move="PSYBEAM"},      {level=20, move="RECOVER"},
    {level=24, move="SHARPEN"},     {level=29, move="SIGNAL_BEAM"},  {level=32, move="LOCK_ON"},
    {level=36, move="TRI_ATTACK"},  {level=44, move="ZAP_CANNON"},
  }},

  -- #142 Aerodactyl  +Dragon Claw (45), +Iron Head (47)
  AERODACTYL={level1Moves={"WING_ATTACK"}, learnset={
    {level=8,  move="AGILITY"},     {level=15, move="BITE"},         {level=22, move="SUPERSONIC"},
    {level=29, move="ANCIENTPOWER"},{level=36, move="SCARY_FACE"},   {level=43, move="TAKE_DOWN"},
    {level=45, move="DRAGON_CLAW"}, {level=47, move="IRON_HEAD"},    {level=50, move="HYPER_BEAM"},
  }},

  -- #146 Moltres  +Air Slash (55)
  MOLTRES={level1Moves={"WING_ATTACK","EMBER"}, learnset={
    {level=13, move="FIRE_SPIN"},   {level=25, move="AGILITY"},      {level=37, move="ENDURE"},
    {level=49, move="FLAMETHROWER"},{level=55, move="AIR_SLASH"},    {level=61, move="SAFEGUARD"},
    {level=73, move="SKY_ATTACK"},
  }},

  -- #147 Dratini  +Dragon Claw (40)
  DRATINI={level1Moves={"WRAP","LEER"}, learnset={
    {level=8,  move="THUNDER_WAVE"},{level=15, move="TWISTER"},      {level=22, move="DRAGON_RAGE"},
    {level=29, move="SLAM"},        {level=36, move="AGILITY"},      {level=40, move="DRAGON_CLAW"},
    {level=43, move="SAFEGUARD"},   {level=50, move="OUTRAGE"},      {level=57, move="HYPER_BEAM"},
  }},

  -- #148 Dragonair  +Dragon Claw (45)
  DRAGONAIR={level1Moves={"WRAP","LEER","THUNDER_WAVE","TWISTER"}, learnset={
    {level=8,  move="THUNDER_WAVE"},{level=15, move="TWISTER"},      {level=22, move="DRAGON_RAGE"},
    {level=29, move="SLAM"},        {level=38, move="AGILITY"},      {level=45, move="DRAGON_CLAW"},
    {level=47, move="SAFEGUARD"},   {level=56, move="OUTRAGE"},      {level=65, move="HYPER_BEAM"},
  }},

  -- #149 Dragonite  +Dragon Claw (53)
  DRAGONITE={level1Moves={"WRAP","LEER","THUNDER_WAVE","TWISTER"}, learnset={
    {level=8,  move="THUNDER_WAVE"},{level=15, move="TWISTER"},      {level=22, move="DRAGON_RAGE"},
    {level=29, move="SLAM"},        {level=38, move="AGILITY"},      {level=47, move="SAFEGUARD"},
    {level=53, move="DRAGON_CLAW"}, {level=55, move="WING_ATTACK"},  {level=61, move="OUTRAGE"},
    {level=75, move="HYPER_BEAM"},
  }},

  -- #163 Hoothoot  +Air Slash (30)
  HOOTHOOT={level1Moves={"TACKLE","GROWL"}, learnset={
    {level=6,  move="FORESIGHT"},   {level=11, move="PECK"},         {level=16, move="HYPNOSIS"},
    {level=22, move="REFLECT"},     {level=28, move="TAKE_DOWN"},    {level=30, move="AIR_SLASH"},
    {level=34, move="CONFUSION"},   {level=48, move="DREAM_EATER"},
  }},

  -- #164 Noctowl  +Air Slash (37)
  NOCTOWL={level1Moves={"TACKLE","GROWL","FORESIGHT","PECK"}, learnset={
    {level=6,  move="FORESIGHT"},   {level=11, move="PECK"},         {level=16, move="HYPNOSIS"},
    {level=25, move="REFLECT"},     {level=33, move="TAKE_DOWN"},    {level=37, move="AIR_SLASH"},
    {level=41, move="CONFUSION"},   {level=57, move="DREAM_EATER"},
  }},

  -- #167 Spinarak  +Poison Jab (40), +X-Scissor (41)
  SPINARAK={level1Moves={"POISON_STING","STRING_SHOT"}, learnset={
    {level=6,  move="SCARY_FACE"},  {level=11, move="CONSTRICT"},   {level=17, move="NIGHT_SHADE"},
    {level=23, move="LEECH_LIFE"},  {level=30, move="FURY_SWIPES"},  {level=37, move="SPIDER_WEB"},
    {level=40, move="POISON_JAB"},  {level=41, move="X_SCISSOR"},   {level=45, move="AGILITY"},
    {level=53, move="PSYCHIC_M"},
  }},

  -- #168 Ariados  +X-Scissor (41), +Poison Jab (46)
  ARIADOS={level1Moves={"POISON_STING","STRING_SHOT","SCARY_FACE","CONSTRICT"}, learnset={
    {level=6,  move="SCARY_FACE"},  {level=11, move="CONSTRICT"},   {level=17, move="NIGHT_SHADE"},
    {level=25, move="LEECH_LIFE"},  {level=34, move="FURY_SWIPES"},  {level=41, move="X_SCISSOR"},
    {level=43, move="SPIDER_WEB"},  {level=46, move="POISON_JAB"},  {level=53, move="AGILITY"},
    {level=63, move="PSYCHIC_M"},
  }},

  -- #169 Crobat  +Air Slash (48), +Poison Jab (53)
  CROBAT={level1Moves={"SCREECH","LEECH_LIFE","SUPERSONIC"}, learnset={
    {level=6,  move="SUPERSONIC"},  {level=12, move="BITE"},         {level=19, move="CONFUSE_RAY"},
    {level=30, move="WING_ATTACK"}, {level=42, move="MEAN_LOOK"},    {level=48, move="AIR_SLASH"},
    {level=53, move="POISON_JAB"},  {level=55, move="HAZE"},
  }},

  -- #170 Chinchou  +Signal Beam (28)
  CHINCHOU={level1Moves={"BUBBLE","THUNDER_WAVE"}, learnset={
    {level=5,  move="SUPERSONIC"},  {level=13, move="FLAIL"},        {level=17, move="WATER_GUN"},
    {level=25, move="SPARK"},       {level=28, move="SIGNAL_BEAM"},  {level=29, move="CONFUSE_RAY"},
    {level=37, move="TAKE_DOWN"},   {level=41, move="HYDRO_PUMP"},
  }},

  -- #171 Lanturn  +Signal Beam (29)
  LANTURN={level1Moves={"BUBBLE","THUNDER_WAVE","SUPERSONIC"}, learnset={
    {level=5,  move="SUPERSONIC"},  {level=13, move="FLAIL"},        {level=17, move="WATER_GUN"},
    {level=25, move="SPARK"},       {level=29, move="SIGNAL_BEAM"},  {level=33, move="CONFUSE_RAY"},
    {level=45, move="TAKE_DOWN"},   {level=53, move="HYDRO_PUMP"},
  }},

  -- #179 Mareep  +Power Gem (29), +Signal Beam (39)
  MAREEP={level1Moves={"TACKLE","GROWL"}, learnset={
    {level=9,  move="THUNDERSHOCK"},{level=16, move="THUNDER_WAVE"}, {level=23, move="COTTON_SPORE"},
    {level=29, move="POWER_GEM"},   {level=30, move="LIGHT_SCREEN"}, {level=37, move="THUNDER"},
    {level=39, move="SIGNAL_BEAM"},
  }},

  -- #180 Flaaffy  +Power Gem (34), +Signal Beam (47)
  FLAAFFY={level1Moves={"TACKLE","GROWL","THUNDERSHOCK"}, learnset={
    {level=9,  move="THUNDERSHOCK"},{level=18, move="THUNDER_WAVE"}, {level=27, move="COTTON_SPORE"},
    {level=34, move="POWER_GEM"},   {level=36, move="LIGHT_SCREEN"}, {level=45, move="THUNDER"},
    {level=47, move="SIGNAL_BEAM"},
  }},

  -- #181 Ampharos  +Power Gem (35), +Signal Beam (51)
  AMPHAROS={level1Moves={"TACKLE","GROWL","THUNDERSHOCK","THUNDER_WAVE"}, learnset={
    {level=9,  move="THUNDERSHOCK"},{level=18, move="THUNDER_WAVE"}, {level=27, move="COTTON_SPORE"},
    {level=30, move="THUNDERPUNCH"},{level=35, move="POWER_GEM"},    {level=42, move="LIGHT_SCREEN"},
    {level=51, move="SIGNAL_BEAM"},{level=57, move="THUNDER"},
  }},

  -- #193 Yanma  +Signal Beam (26), +Air Slash (50)
  YANMA={level1Moves={"TACKLE","FORESIGHT"}, learnset={
    {level=7,  move="QUICK_ATTACK"},{level=13, move="DOUBLE_TEAM"},  {level=19, move="SONICBOOM"},
    {level=25, move="DETECT"},      {level=26, move="SIGNAL_BEAM"},  {level=31, move="SUPERSONIC"},
    {level=37, move="WING_ATTACK"}, {level=43, move="SCREECH"},      {level=50, move="AIR_SLASH"},
  }},

  -- #197 Umbreon  +Dark Pulse (40)
  UMBREON={level1Moves={"TACKLE","TAIL_WHIP"}, learnset={
    {level=8,  move="SAND_ATTACK"}, {level=16, move="PURSUIT"},      {level=23, move="QUICK_ATTACK"},
    {level=30, move="CONFUSE_RAY"}, {level=36, move="FAINT_ATTACK"}, {level=40, move="DARK_PULSE"},
    {level=42, move="MEAN_LOOK"},   {level=47, move="SCREECH"},      {level=52, move="MOONLIGHT"},
  }},

  -- #198 Murkrow  +Dark Pulse (45)
  MURKROW={level1Moves={"PECK"}, learnset={
    {level=11, move="PURSUIT"},     {level=16, move="HAZE"},         {level=26, move="NIGHT_SHADE"},
    {level=31, move="FAINT_ATTACK"},{level=41, move="MEAN_LOOK"},    {level=45, move="DARK_PULSE"},
  }},

  -- #199 Slowking  +Power Gem (level1)
  SLOWKING={level1Moves={"CURSE","TACKLE","POWER_GEM"}, learnset={
    {level=6,  move="GROWL"},       {level=15, move="WATER_GUN"},    {level=20, move="CONFUSION"},
    {level=29, move="DISABLE"},     {level=34, move="HEADBUTT"},     {level=43, move="SWAGGER"},
    {level=48, move="PSYCHIC_M"},
  }},

  -- #200 Misdreavus  +Shadow Claw (42), +Power Gem (50)
  MISDREAVUS={level1Moves={"GROWL","PSYWAVE"}, learnset={
    {level=6,  move="SPITE"},       {level=12, move="CONFUSE_RAY"},  {level=19, move="MEAN_LOOK"},
    {level=27, move="PSYBEAM"},     {level=36, move="PAIN_SPLIT"},   {level=42, move="SHADOW_CLAW"},
    {level=46, move="PERISH_SONG"}, {level=50, move="POWER_GEM"},
  }},

  -- #205 Forretress  +X-Scissor (41)
  FORRETRESS={level1Moves={"TACKLE","PROTECT","SELFDESTRUCT"}, learnset={
    {level=8,  move="SELFDESTRUCT"},{level=15, move="TAKE_DOWN"},    {level=22, move="RAPID_SPIN"},
    {level=29, move="BIDE"},        {level=39, move="EXPLOSION"},    {level=41, move="X_SCISSOR"},
    {level=49, move="SPIKES"},      {level=59, move="DOUBLE_EDGE"},
  }},

  -- #207 Gligar  +X-Scissor (41)
  GLIGAR={level1Moves={"POISON_STING"}, learnset={
    {level=6,  move="SAND_ATTACK"}, {level=13, move="HARDEN"},       {level=20, move="QUICK_ATTACK"},
    {level=28, move="FAINT_ATTACK"},{level=36, move="SLASH"},         {level=41, move="X_SCISSOR"},
    {level=44, move="SCREECH"},     {level=52, move="GUILLOTINE"},
  }},

  -- #208 Steelix  +Iron Head (45)
  STEELIX={level1Moves={"TACKLE","SCREECH"}, learnset={
    {level=10, move="BIND"},        {level=14, move="ROCK_THROW"},   {level=23, move="HARDEN"},
    {level=27, move="RAGE"},        {level=36, move="SANDSTORM"},    {level=40, move="SLAM"},
    {level=45, move="IRON_HEAD"},   {level=49, move="CRUNCH"},
  }},

  -- #211 Qwilfish  +Poison Jab (31)
  QWILFISH={level1Moves={"SPIKES","TACKLE","POISON_STING"}, learnset={
    {level=10, move="HARDEN"},      {level=10, move="MINIMIZE"},     {level=19, move="WATER_GUN"},
    {level=28, move="PIN_MISSILE"}, {level=31, move="POISON_JAB"},   {level=37, move="TAKE_DOWN"},
    {level=46, move="HYDRO_PUMP"},
  }},

  -- #212 Scizor  +X-Scissor (41), +Air Slash (50), +Iron Head (51)
  SCIZOR={level1Moves={"QUICK_ATTACK","LEER"}, learnset={
    {level=6,  move="FOCUS_ENERGY"},{level=12, move="PURSUIT"},      {level=18, move="FALSE_SWIPE"},
    {level=24, move="AGILITY"},     {level=30, move="METAL_CLAW"},   {level=36, move="SLASH"},
    {level=41, move="X_SCISSOR"},   {level=42, move="SWORDS_DANCE"}, {level=48, move="DOUBLE_TEAM"},
    {level=50, move="AIR_SLASH"},   {level=51, move="IRON_HEAD"},
  }},

  -- #215 Sneasel  +Shadow Claw (44)
  SNEASEL={level1Moves={"SCRATCH","LEER"}, learnset={
    {level=9,  move="QUICK_ATTACK"},{level=17, move="SCREECH"},      {level=25, move="FAINT_ATTACK"},
    {level=33, move="FURY_SWIPES"}, {level=41, move="AGILITY"},      {level=44, move="SHADOW_CLAW"},
    {level=49, move="SLASH"},       {level=57, move="BEAT_UP"},      {level=65, move="METAL_CLAW"},
  }},

  -- #222 Corsola  +Power Gem (40)
  CORSOLA={level1Moves={"TACKLE"}, learnset={
    {level=7,  move="HARDEN"},      {level=13, move="BUBBLE"},       {level=19, move="RECOVER"},
    {level=25, move="BUBBLEBEAM"},  {level=31, move="SPIKE_CANNON"},  {level=37, move="MIRROR_COAT"},
    {level=40, move="POWER_GEM"},   {level=43, move="ANCIENTPOWER"},
  }},

  -- #223 Remoraid  +Signal Beam (30)
  REMORAID={level1Moves={"WATER_GUN"}, learnset={
    {level=11, move="LOCK_ON"},     {level=22, move="PSYBEAM"},      {level=22, move="AURORA_BEAM"},
    {level=22, move="BUBBLEBEAM"},  {level=30, move="SIGNAL_BEAM"},  {level=33, move="FOCUS_ENERGY"},
    {level=44, move="ICE_BEAM"},    {level=55, move="HYPER_BEAM"},
  }},

  -- #224 Octillery  +Signal Beam (34)
  OCTILLERY={level1Moves={"WATER_GUN"}, learnset={
    {level=11, move="CONSTRICT"},   {level=22, move="PSYBEAM"},      {level=22, move="AURORA_BEAM"},
    {level=22, move="BUBBLEBEAM"},  {level=25, move="OCTAZOOKA"},    {level=34, move="SIGNAL_BEAM"},
    {level=38, move="FOCUS_ENERGY"},{level=54, move="ICE_BEAM"},     {level=70, move="HYPER_BEAM"},
  }},

  -- #226 Mantine  +Signal Beam (level1), +Air Slash (44)
  MANTINE={level1Moves={"TACKLE","BUBBLE","SIGNAL_BEAM"}, learnset={
    {level=10, move="SUPERSONIC"},  {level=18, move="BUBBLEBEAM"},   {level=25, move="TAKE_DOWN"},
    {level=32, move="AGILITY"},     {level=40, move="WING_ATTACK"},  {level=44, move="AIR_SLASH"},
    {level=49, move="CONFUSE_RAY"},
  }},

  -- #227 Skarmory  +Air Slash (53), +Iron Head (55)
  SKARMORY={level1Moves={"LEER","PECK"}, learnset={
    {level=13, move="SAND_ATTACK"}, {level=19, move="SWIFT"},        {level=25, move="AGILITY"},
    {level=37, move="FURY_ATTACK"}, {level=49, move="STEEL_WING"},   {level=53, move="AIR_SLASH"},
    {level=55, move="IRON_HEAD"},
  }},

  -- #228 Houndour  +Dark Pulse (37) — between Flamethrower (35) and Crunch (43)
  HOUNDOUR={level1Moves={"LEER","EMBER"}, learnset={
    {level=7,  move="ROAR"},        {level=13, move="SMOG"},         {level=20, move="BITE"},
    {level=27, move="FAINT_ATTACK"},{level=35, move="FLAMETHROWER"}, {level=37, move="DARK_PULSE"},
    {level=43, move="CRUNCH"},
  }},

  -- #229 Houndoom  +Dark Pulse (53) — after Crunch (52)
  HOUNDOOM={level1Moves={"LEER","EMBER"}, learnset={
    {level=7,  move="ROAR"},        {level=13, move="SMOG"},         {level=20, move="BITE"},
    {level=30, move="FAINT_ATTACK"},{level=41, move="FLAMETHROWER"}, {level=52, move="CRUNCH"},
    {level=53, move="DARK_PULSE"},
  }},

  -- #230 Kingdra  +Dragon Claw (45)
  KINGDRA={level1Moves={"BUBBLE","SMOKESCREEN","LEER","WATER_GUN"}, learnset={
    {level=8,  move="SMOKESCREEN"}, {level=15, move="LEER"},         {level=22, move="WATER_GUN"},
    {level=29, move="TWISTER"},     {level=40, move="AGILITY"},      {level=45, move="DRAGON_CLAW"},
    {level=51, move="HYDRO_PUMP"},
  }},

  -- #233 Porygon2  +Signal Beam (29)
  PORYGON2={level1Moves={"CONVERSION2","TACKLE","CONVERSION"}, learnset={
    {level=9,  move="AGILITY"},     {level=12, move="PSYBEAM"},      {level=20, move="RECOVER"},
    {level=24, move="DEFENSE_CURL"},{level=29, move="SIGNAL_BEAM"},  {level=32, move="LOCK_ON"},
    {level=36, move="TRI_ATTACK"},  {level=44, move="ZAP_CANNON"},
  }},

  -- #246 Larvitar  +Dragon Claw (40), +Dark Pulse (40)
  LARVITAR={level1Moves={"BITE","LEER"}, learnset={
    {level=8,  move="SANDSTORM"},   {level=15, move="SCREECH"},      {level=22, move="ROCK_SLIDE"},
    {level=29, move="THRASH"},      {level=36, move="SCARY_FACE"},   {level=40, move="DRAGON_CLAW"},
    {level=40, move="DARK_PULSE"},  {level=43, move="CRUNCH"},       {level=50, move="EARTHQUAKE"},
    {level=57, move="HYPER_BEAM"},
  }},

  -- #247 Pupitar  +Dark Pulse (42), +Dragon Claw (45)
  PUPITAR={level1Moves={"BITE","LEER","SANDSTORM","SCREECH"}, learnset={
    {level=8,  move="SANDSTORM"},   {level=15, move="SCREECH"},      {level=22, move="ROCK_SLIDE"},
    {level=29, move="THRASH"},      {level=38, move="SCARY_FACE"},   {level=42, move="DARK_PULSE"},
    {level=45, move="DRAGON_CLAW"}, {level=47, move="CRUNCH"},       {level=56, move="EARTHQUAKE"},
    {level=65, move="HYPER_BEAM"},
  }},

  -- #248 Tyranitar  +Dragon Claw (53), +Dark Pulse (53)
  TYRANITAR={level1Moves={"BITE","LEER","SANDSTORM","SCREECH"}, learnset={
    {level=8,  move="SANDSTORM"},   {level=15, move="SCREECH"},      {level=22, move="ROCK_SLIDE"},
    {level=29, move="THRASH"},      {level=38, move="SCARY_FACE"},   {level=47, move="CRUNCH"},
    {level=53, move="DRAGON_CLAW"}, {level=53, move="DARK_PULSE"},   {level=61, move="EARTHQUAKE"},
    {level=75, move="HYPER_BEAM"},
  }},
}

return function(mod)
  for id, rec in pairs(newMoves) do
    if mod.content.moves:get(id) then
      mod.content.moves:override(id, rec)
    else
      mod.content.moves:register(id, rec)
    end
  end

  local n = 0
  for id, ls in pairs(learnsets) do
    mod.content.pokemon:patch(id, {
      level1Moves = ls.level1Moves,
      learnset    = ls.learnset,
    })
    n = n + 1
  end

  mod.log:info("more_attacks v1.0.0: registered 10 Gen 3+ moves, patched " .. n .. " Pokemon learnsets")
end
