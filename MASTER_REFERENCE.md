# Sol - Master Reference Documentation

**Complete Catalog of All Game Elements, Systems, and Implementation Specifications**

This document serves as the definitive reference for all content, systems, characters, and features in Sol. Use this as the primary source when implementing any game element.

---

## Table of Contents

1. [Characters](#characters)
2. [Psynergy System](#psynergy-system)
3. [Story Dungeons](#story-dungeons)
4. [Monsters & Enemies](#monsters--enemies)
5. [Items & Equipment](#items--equipment)
6. [NPCs & Dialogue](#npcs--dialogue)
7. [Puzzle Types](#puzzle-types)
8. [Boss Encounters](#boss-encounters)
9. [Game Systems](#game-systems)
10. [UI Screens](#ui-screens)
11. [Integration Points](#integration-points)

---

## Characters

### Playable Party (4 Characters)

#### 1. Kai - Venus Alchemist (Earth)
- **Element**: Venus (Earth/Gold)
- **Role**: Tank/Defender
- **Resources**: HP/PP
- **Starting Stats** (Level 1):
  - HP: 40
  - PP: 15
  - Attack: 12
  - Defense: 10
  - Speed: 8
- **Growth per Level**:
  - HP: +8
  - PP: +5
  - Attack: +3
  - Defense: +2
  - Speed: +1
- **Signature Psynergy**: Quake, Spire, Move
- **Character Arc**: Pragmatic leader → Learns compassion
- **Background**: Former enforcer, disillusioned with discrimination

#### 2. Ember - Mars Alchemist (Fire)
- **Element**: Mars (Fire/Red)
- **Role**: Attacker/DPS
- **Resources**: HP/PP
- **Starting Stats** (Level 1):
  - HP: 35
  - PP: 18
  - Attack: 14
  - Defense: 8
  - Speed: 10
- **Growth per Level**:
  - HP: +6
  - PP: +5
  - Attack: +4
  - Defense: +1
  - Speed: +2
- **Signature Psynergy**: Flare, Fireball, Blaze
- **Character Arc**: Impulsive hothead → Strategic thinker
- **Background**: Rebel outcast, fights for non-adepts

#### 3. Aria - Mercury Witch (Water)
- **Element**: Mercury (Water/Blue)
- **Role**: Healer/Support
- **Resources**: HP/PP
- **Starting Stats** (Level 1):
  - HP: 32
  - PP: 22
  - Attack: 9
  - Defense: 9
  - Speed: 11
- **Growth per Level**:
  - HP: +5
  - PP: +6
  - Attack: +2
  - Defense: +2
  - Speed: +2
- **Signature Psynergy**: Cure, Drizzle, Frost
- **Character Arc**: Idealistic scholar → Accepts harsh realities
- **Background**: Academy researcher, seeks knowledge

#### 4. Zephyr - Jupiter Sorcerer (Wind)
- **Element**: Jupiter (Wind/Purple)
- **Role**: Mage/Utility
- **Resources**: HP/PP
- **Starting Stats** (Level 1):
  - HP: 30
  - PP: 25
  - Attack: 10
  - Defense: 7
  - Speed: 13
- **Growth per Level**:
  - HP: +4
  - PP: +7
  - Attack: +2
  - Defense: +1
  - Speed: +3
- **Signature Psynergy**: Gust, Whirlwind, Reveal
- **Character Arc**: Mysterious prophet → Trusted friend
- **Background**: Visionary, foresaw the need to seal Alchemy

---

## Psynergy System

### Core Mechanics
- **PP (Psynergy Points)**: Sole magical resource (no MP)
- **Learning**: Auto-learn at specific levels
- **Categories**: Attack, Defend, Heal, Field, Utility
- **Elements**: Venus, Mars, Mercury, Jupiter

### Complete Psynergy List (15 Abilities)

#### Venus (Earth) - 4 Abilities
1. **Quake**
   - Type: Offensive
   - PP Cost: 7
   - Power: 40
   - Range: All enemies
   - Effect: Earth damage to all foes
   - Learn: Level 1 (Kai)

2. **Spire**
   - Type: Offensive
   - PP Cost: 5
   - Power: 30
   - Range: Single
   - Effect: Sharp earth spike attack
   - Learn: Level 3 (Kai)

3. **Move**
   - Type: Field
   - PP Cost: 2
   - Effect: Push/pull heavy objects
   - Learn: Level 5 (Kai)

4. **Growth**
   - Type: Field
   - PP Cost: 4
   - Effect: Create vine bridges
   - Learn: Level 8 (Kai)

#### Mars (Fire) - 4 Abilities
1. **Flare**
   - Type: Offensive
   - PP Cost: 8
   - Power: 45
   - Range: Single
   - Effect: Intense fire attack
   - Learn: Level 1 (Ember)

2. **Fireball**
   - Type: Offensive
   - PP Cost: 6
   - Power: 35
   - Range: Area (3x3)
   - Effect: Explosive fire damage
   - Learn: Level 3 (Ember)

3. **Blaze**
   - Type: Offensive
   - PP Cost: 4
   - Power: 25
   - Range: Single
   - Effect: Quick fire strike
   - Learn: Level 2 (Ember)

4. **Kindle**
   - Type: Field
   - PP Cost: 3
   - Effect: Light torches, melt ice
   - Learn: Level 6 (Ember)

#### Mercury (Water) - 4 Abilities
1. **Cure**
   - Type: Healing
   - PP Cost: 6
   - Power: 40 HP
   - Range: Single ally
   - Effect: Restore HP
   - Learn: Level 1 (Aria)

2. **Drizzle**
   - Type: Offensive
   - PP Cost: 5
   - Power: 30
   - Range: All enemies
   - Effect: Water damage to all
   - Learn: Level 2 (Aria)

3. **Frost**
   - Type: Field
   - PP Cost: 3
   - Effect: Freeze water, create ice platforms
   - Learn: Level 4 (Aria)

4. **Ply**
   - Type: Healing
   - PP Cost: 10
   - Power: 70 HP
   - Range: Single ally
   - Effect: Major HP restoration
   - Learn: Level 9 (Aria)

#### Jupiter (Wind) - 3 Abilities
1. **Gust**
   - Type: Offensive
   - PP Cost: 4
   - Power: 25
   - Range: Single
   - Effect: Wind blade attack
   - Learn: Level 1 (Zephyr)

2. **Whirlwind**
   - Type: Offensive
   - PP Cost: 7
   - Power: 40
   - Range: All enemies
   - Effect: Cyclone damages all foes
   - Learn: Level 3 (Zephyr)

3. **Reveal**
   - Type: Utility
   - PP Cost: 2
   - Effect: Show hidden objects/paths
   - Learn: Level 5 (Zephyr)

---

## Story Dungeons

### 10 Major Dungeons + Prologue/Epilogue

#### Prologue
- **Location**: Vale Village (future site)
- **Purpose**: Tutorial, party formation
- **Encounters**: None (story only)
- **Duration**: 30 minutes

#### 1. Venus Sanctuary (Natural Dungeon)
- **Location**: Deep underground cavern
- **Objective**: Reach Master Djinn before capture
- **Result**: Arrive too late, Djinn already condensed
- **Enemies**: Rock Golems, Earth Sprites
- **Puzzles**: Move boulders, navigate cave-ins
- **Boss**: None (story defeat)
- **Duration**: 2 hours

#### 2. Venus Lighthouse (Constructed)
- **Location**: Eastern mountains
- **Objective**: Retrieve sphere, prevent activation
- **Result**: Success - lighthouse never lit
- **Enemies**: Adept Guards, Earth Constructs
- **Puzzles**: Lever sequences, platform navigation
- **Boss**: Adept Commander (Level 10)
- **Key Item**: Venus Sphere
- **Duration**: 1.5 hours

#### 3. Mars Forge (Natural Dungeon)
- **Location**: Active volcano
- **Objective**: Reach Master Djinn before capture
- **Result**: Arrive too late, Djinn already condensed
- **Enemies**: Lava Beasts, Fire Elementals
- **Puzzles**: Timing lava flows, Kindle torches
- **Boss**: None (story defeat)
- **Duration**: 2 hours

#### 4. Mars Lighthouse (Constructed)
- **Location**: Southern volcanic island
- **Objective**: Retrieve sphere, prevent activation
- **Result**: Success - lighthouse never lit
- **Enemies**: Adept Guards, Fire Constructs
- **Puzzles**: Heat vents, rotating platforms
- **Boss**: Fire Champion (Level 15)
- **Key Item**: Mars Sphere
- **Duration**: 1.5 hours

#### 5. Wise One's Chamber
- **Location**: Hidden grove
- **Objective**: Learn sealing plan
- **Result**: Gain mission clarity
- **Encounters**: None (story only)
- **Key Dialogue**: Wise One explains philosophy
- **Duration**: 45 minutes

#### 6. Jupiter Sky Sanctum (Natural Dungeon)
- **Location**: Floating sky islands
- **Objective**: Convince wild Master Djinn to join
- **Result**: Success - Djinn joins willingly
- **Enemies**: Sky Serpents, Wind Spirits
- **Puzzles**: Wind currents, floating platforms
- **Boss**: Jupiter Master Djinn (Level 18)
- **Key Item**: Jupiter's blessing
- **Duration**: 2.5 hours

#### 7. Jupiter Lighthouse (Constructed)
- **Location**: Northern mountains
- **Objective**: Siege - prevent activation
- **Result**: Success - lighthouse never lit
- **Enemies**: Adept Army, Wind Constructs
- **Puzzles**: Storm navigation, lightning rods
- **Boss**: Storm General (Level 20)
- **Duration**: 2 hours

#### 8. Mercury Frozen Abyss (Natural Dungeon)
- **Location**: Deep arctic cave
- **Objective**: Convince wild Master Djinn to join
- **Result**: Success - Djinn joins willingly
- **Enemies**: Ice Wraiths, Frost Beasts
- **Puzzles**: Frost bridges, ice sliding
- **Boss**: Mercury Master Djinn (Level 22)
- **Key Item**: Mercury's blessing
- **Duration**: 2.5 hours

#### 9. Mercury Lighthouse (Constructed)
- **Location**: Western frozen sea
- **Objective**: Final siege - prevent activation
- **Result**: Success - lighthouse never lit
- **Enemies**: Elite Adepts, Ice Constructs
- **Puzzles**: Ice melting, water level control
- **Boss**: Ice Archmage (Level 25)
- **Duration**: 2 hours

#### 10. Sol Sanctum (Sealing Chamber)
- **Location**: Central mountain peak
- **Objective**: Seal all four elemental forces
- **Result**: Success - Aria & Zephyr sacrifice themselves
- **Enemies**: None (ceremony)
- **Puzzles**: Elemental alignment
- **Cutscenes**: Major story climax
- **Duration**: 1.5 hours

#### Epilogue
- **Location**: Vale Village founding
- **Objective**: Establish guardian settlement
- **Result**: Bridge to Golden Sun
- **Duration**: 30 minutes

**Total Playtime**: 25-30 hours

---

## Monsters & Enemies

### Regular Enemies (20+ Types)

#### Venus (Earth) Enemies
1. **Rock Golem**
   - HP: 50, Attack: 15, Defense: 12
   - Weakness: Mars (Fire)
   - Drops: Earth Shard, Gold

2. **Earth Sprite**
   - HP: 30, Attack: 10, Defense: 8
   - Weakness: Jupiter (Wind)
   - Drops: Herb, PP Crystal

3. **Stone Guardian**
   - HP: 80, Attack: 20, Defense: 18
   - Weakness: Mars (Fire)
   - Drops: Stone Armor piece

#### Mars (Fire) Enemies
1. **Lava Beast**
   - HP: 45, Attack: 18, Defense: 8
   - Weakness: Mercury (Water)
   - Drops: Fire Gem, Gold

2. **Fire Elemental**
   - HP: 35, Attack: 16, Defense: 6
   - Weakness: Mercury (Water)
   - Drops: Burn Salve, PP Crystal

3. **Ember Wyrm**
   - HP: 70, Attack: 22, Defense: 10
   - Weakness: Mercury (Water)
   - Drops: Dragon Scale

#### Mercury (Water) Enemies
1. **Ice Wraith**
   - HP: 40, Attack: 14, Defense: 10
   - Weakness: Mars (Fire)
   - Drops: Frost Crystal, Gold

2. **Frost Beast**
   - HP: 55, Attack: 17, Defense: 12
   - Weakness: Mars (Fire)
   - Drops: Ice Shard, Antidote

3. **Tidal Horror**
   - HP: 75, Attack: 20, Defense: 14
   - Weakness: Venus (Earth)
   - Drops: Water Amulet

#### Jupiter (Wind) Enemies
1. **Sky Serpent**
   - HP: 35, Attack: 19, Defense: 7
   - Weakness: Venus (Earth)
   - Drops: Feather, Gold

2. **Wind Spirit**
   - HP: 38, Attack: 16, Defense: 9
   - Weakness: Venus (Earth)
   - Drops: Breeze Charm, PP Crystal

3. **Storm Hawk**
   - HP: 60, Attack: 21, Defense: 11
   - Weakness: Venus (Earth)
   - Drops: Talon, Elixir

#### Current Implementation (3 Basic)
1. **Slime** - Starter enemy (all elements)
2. **Goblin** - Mid-level fighter
3. **Wolf** - Fast attacker

---

## Items & Equipment

### Consumables (Healing & Restoration)
1. **Herb** - Restores 30 HP - Cost: 10 gold
2. **Potion** - Restores 50 HP - Cost: 25 gold
3. **Elixir** - Restores 100 HP - Cost: 100 gold
4. **Psy Crystal** - Restores 20 PP - Cost: 30 gold
5. **Psy Gem** - Restores 40 PP - Cost: 75 gold
6. **Antidote** - Cures poison - Cost: 15 gold
7. **Revive** - Revives KO'd ally (50% HP) - Cost: 150 gold

### Weapons (Attack Bonus)
1. **Wood Staff** - +5 Attack - Cost: 50 gold
2. **Iron Sword** - +10 Attack - Cost: 150 gold
3. **Steel Blade** - +15 Attack - Cost: 350 gold
4. **Flame Sword** - +20 Attack, Mars affinity - Cost: 600 gold
5. **Earth Mace** - +20 Attack, Venus affinity - Cost: 600 gold
6. **Frost Spear** - +20 Attack, Mercury affinity - Cost: 600 gold
7. **Storm Staff** - +20 Attack, Jupiter affinity - Cost: 600 gold

### Armor (Defense Bonus)
1. **Cloth Shirt** - +3 Defense - Cost: 40 gold
2. **Leather Vest** - +7 Defense - Cost: 120 gold
3. **Chain Mail** - +12 Defense - Cost: 300 gold
4. **Steel Armor** - +18 Defense - Cost: 550 gold
5. **Elemental Robe** - +15 Defense, +5 PP - Cost: 500 gold

### Accessories (Special Effects)
1. **Venus Ring** - +10 HP, Earth resist - Cost: 200 gold
2. **Mars Badge** - +5 Attack, Fire resist - Cost: 200 gold
3. **Mercury Pendant** - +10 PP, Water resist - Cost: 200 gold
4. **Jupiter Earring** - +3 Speed, Wind resist - Cost: 200 gold

### Key Items (Story Progress)
1. **Venus Sphere** - Condensed earth element
2. **Mars Sphere** - Condensed fire element
3. **Jupiter's Blessing** - Wild wind element approval
4. **Mercury's Blessing** - Wild water element approval
5. **Ancient Map** - Shows elemental locations
6. **Wise One's Seal** - Grants access to Sol Sanctum

---

## NPCs & Dialogue

### Major NPCs (Story-Critical)

#### The Wise One
- **Role**: Mentor, quest giver
- **Location**: Hidden Grove
- **Dialogue Topics**:
  - Philosophy of Alchemy protection
  - Sealing instructions
  - Prophecy about Golden Sun era
- **Key Scenes**: 3 major conversations

#### Tower Project Leader
- **Role**: Antagonist
- **Location**: Various lighthouses
- **Dialogue Topics**:
  - Justification for capturing elements
  - Vision of controlled Alchemy
  - Final confrontation
- **Key Scenes**: 4 encounters

#### Venus Sanctuary Guardian
- **Role**: Failed protector
- **Location**: Venus Sanctuary
- **Dialogue**: Regret, warnings
- **Key Scenes**: 1 conversation

#### Mars Forge Keeper
- **Role**: Failed protector
- **Location**: Mars Forge
- **Dialogue**: Despair, acceptance
- **Key Scenes**: 1 conversation

### Town NPCs (50+ Characters)

#### Town 1: Alchemist's Citadel
- Population: 12 NPCs
- Shopkeeper, Inn, Info NPCs
- Theme: Discrimination against non-adepts

#### Town 2: Neutral Crossroads
- Population: 8 NPCs
- Merchants, Travelers
- Theme: Fear of elemental chaos

#### Town 3: Non-Adept Village
- Population: 10 NPCs
- Oppressed citizens
- Theme: Hope for equality

#### Town 4: Coastal Port
- Population: 8 NPCs
- Sailors, Traders
- Theme: News about lighthouses

#### Town 5: Mountain Settlement
- Population: 6 NPCs
- Miners, Guides
- Theme: Elemental disturbances

#### Town 6: Academic City
- Population: 10 NPCs
- Scholars, Students
- Theme: Knowledge about Alchemy

#### Town 7: Northern Outpost
- Population: 4 NPCs
- Guards, Scouts
- Theme: Warning about Jupiter events

#### Town 8: Vale (Founding)
- Population: 2 NPCs (Kai & Ember)
- Theme: New beginning, guardianship

### NPC Templates
1. **Shopkeeper**: Sells items, gossip
2. **Innkeeper**: Rest, heal, rumors
3. **Elder**: Lore, quests, wisdom
4. **Guard**: Access control, warnings
5. **Scholar**: Information, Psynergy tips
6. **Child**: Innocent perspective, hints
7. **Mysterious Stranger**: Foreshadowing

---

## Puzzle Types

### 1. Push Block Puzzles
- **Mechanic**: Move blocks to pressure plates or create paths
- **Psynergy**: Move
- **Difficulty Progression**: 1-block → Multi-block → Ice blocks
- **Locations**: Venus Sanctuary, Mars Lighthouse
- **Examples**:
  - Simple: Push 1 block onto switch
  - Medium: Push 2 blocks in sequence
  - Hard: Push blocks on ice (sliding)

### 2. Sequence Puzzles
- **Mechanic**: Activate switches in correct order
- **Psynergy**: Various (element-specific)
- **Difficulty Progression**: 3-step → 5-step → 7-step
- **Locations**: All lighthouses
- **Examples**:
  - Simple: Light 3 torches in order
  - Medium: Activate 5 elemental plates
  - Hard: Timed 7-switch sequence

### 3. Elemental Effect Puzzles
- **Mechanic**: Use Psynergy to alter environment
- **Psynergy**: Frost, Kindle, Move, Reveal
- **Locations**: Natural dungeons
- **Examples**:
  - Frost: Freeze water to cross
  - Kindle: Melt ice barriers
  - Move: Create vine bridges
  - Reveal: Show hidden paths

### 4. Navigation Puzzles
- **Mechanic**: Find correct path through maze
- **Difficulty**: Dead ends, multiple floors
- **Locations**: Sky Sanctum, Frozen Abyss
- **Examples**:
  - Wind currents redirect movement
  - Ice sliding paths
  - Rotating platforms

### 5. Timing Puzzles
- **Mechanic**: Complete action within time limit
- **Psynergy**: Quick reflexes
- **Locations**: Mars Forge, Jupiter Lighthouse
- **Examples**:
  - Cross before lava rises
  - Navigate through lightning strikes
  - Dodge moving obstacles

---

## Boss Encounters

### Master Djinn Bosses (4 Major)

#### 1. Jupiter Master Djinn
- **Name**: Tempest
- **Location**: Jupiter Sky Sanctum
- **Level**: 18
- **Stats**:
  - HP: 800
  - Attack: 35
  - Defense: 25
  - Speed: 40
- **Attacks**:
  - Gale Force (45 damage, all party)
  - Lightning Strike (60 damage, single)
  - Whirlwind Shield (raises defense)
- **Weakness**: Venus (Earth)
- **Strategy**: Use Quake, defend against Gale Force
- **Reward**: Jupiter's Blessing, 500 XP, 300 gold

#### 2. Mercury Master Djinn
- **Name**: Glacius
- **Location**: Mercury Frozen Abyss
- **Level**: 22
- **Stats**:
  - HP: 1000
  - Attack: 40
  - Defense: 30
  - Speed: 35
- **Attacks**:
  - Blizzard (50 damage, all party)
  - Ice Prison (binds character)
  - Frost Armor (raises defense)
- **Weakness**: Mars (Fire)
- **Strategy**: Use Flare/Fireball, cure binds
- **Reward**: Mercury's Blessing, 700 XP, 400 gold

### Lieutenant Bosses (4 Mid-Level)

#### 1. Adept Commander (Venus Lighthouse)
- **Level**: 10
- **HP**: 300
- **Strategy**: Tank with earth armor
- **Reward**: 200 XP, 150 gold, Venus Key

#### 2. Fire Champion (Mars Lighthouse)
- **Level**: 15
- **HP**: 450
- **Strategy**: High damage, use water Psynergy
- **Reward**: 350 XP, 200 gold, Mars Key

#### 3. Storm General (Jupiter Lighthouse)
- **Level**: 20
- **HP**: 600
- **Strategy**: Fast attacks, use earth Psynergy
- **Reward**: 500 XP, 300 gold, Jupiter Key

#### 4. Ice Archmage (Mercury Lighthouse)
- **Level**: 25
- **HP**: 850
- **Strategy**: Freezing attacks, use fire Psynergy
- **Reward**: 800 XP, 500 gold, Mercury Key

### Mini-Bosses (10+ Optional)
- Dungeon mid-point guardians
- Scaled to current level
- Reward: Rare items, equipment

---

## Game Systems

### 1. Combat System
- **Type**: Turn-based
- **Actions**: Attack, Psynergy, Item, Run
- **Turn Order**: Speed stat determines order
- **Damage Formula**: (Attack - Defense/2) × Random(0.9-1.1)
- **Psynergy Damage**: Power × ElementalMultiplier
- **Elemental Multipliers**:
  - Super Effective: 1.5×
  - Normal: 1.0×
  - Resistant: 0.5×
- **Status Effects**: None (Phase 1), Add later
- **Experience**: 100 XP per level, scales with enemy level
- **Gold**: Random(50-150) per battle

### 2. Progression System
- **Level Cap**: 30 (Phase 1), 50 (future)
- **XP Required**: Level × 100
- **Stat Growth**: Per character tables (see Characters)
- **Psynergy Learning**: Auto-learn at specific levels
- **PP Growth**: +5 per level for all characters

### 3. Party System
- **Size**: 4 characters (all active)
- **Formation**: Front/Back row (future Phase 2)
- **Switching**: In-battle (future Phase 3)
- **Individual inventories**: No (shared inventory)

### 4. Inventory System
- **Capacity**: Unlimited (item stacks)
- **Categories**: Items, Weapons, Armor, Key Items
- **Usage**: Battle or field
- **Sorting**: By category, name, quantity
- **Quick Use**: From game screen for consumables

### 5. Save System
- **Slots**: 3 independent saves
- **Format**: JSON via SharedPreferences
- **Data Saved**:
  - Player stats (HP, PP, level, XP, gold)
  - Inventory contents
  - Learned Psynergy
  - Story flags (dungeons completed)
  - Location/map position
  - Playtime
- **Auto-Save**: None (manual only)
- **Save Points**: Towns, dungeons (checkpoints)

### 6. Shop System
- **Types**: General, Weapon, Armor, Item
- **Currency**: Gold
- **Stock**: Fixed per shop type
- **Prices**: See Items section
- **Buy/Sell**: Buy only (no selling Phase 1)
- **Affordability**: Visual indication

### 7. Audio System
- **Music**: Background tracks (placeholder)
- **SFX**: Battle, menu, Psynergy sounds
- **Controls**: Volume sliders, toggle switches
- **Persistence**: Saved to preferences
- **Channels**: Music and SFX independent

### 8. Theme System
- **Palettes**: GBC (green), GBA (blue)
- **Switching**: Settings menu
- **Persistence**: Saved to preferences
- **Scope**: All UI screens
- **Element Colors**: Fixed regardless of palette

---

## UI Screens

### 1. Main Menu
- **Buttons**: New Game, Continue, Settings, About
- **Features**: Animated fade-in, save slot selection
- **State**: Provider-managed GameStateManager

### 2. Game Screen
- **View**: Flame game loop, tilemap
- **HUD**: HP bar, PP bar, gold, level
- **Controls**: WASD/Arrows for movement
- **Quick Access**: Inventory button, Psynergy button
- **Pause**: Menu with Save option

### 3. Battle Screen
- **Layout**: Enemy display (top), actions (bottom)
- **HUD**: Player HP/PP bars
- **Log**: Scrolling battle text
- **Actions**: Attack, Psynergy, Item, Run
- **Animations**: Damage numbers, effects

### 4. Psynergy Screen
- **Tabs**: Attack, Defend, Heal, Field
- **Display**: Icon, name, PP cost, power, description
- **Sorting**: By element, learned order
- **Usage**: Select to use in field
- **Indicator**: Usable (colored) vs unavailable (gray)

### 5. Inventory Screen
- **Tabs**: Items, Weapons, Armor, Key Items
- **Display**: Icon, name, quantity, description
- **Actions**: Use, Equip (future), Discard
- **Quick Use**: Consumables from game screen

### 6. Shop Screen
- **Categories**: Per shop type
- **Display**: Item, price, owned quantity
- **Actions**: Buy (sell future)
- **Affordability**: Green (can buy), Red (too expensive)

### 7. Dialogue Screen
- **Format**: Character portrait, text box
- **Animation**: Character-by-character text
- **Choices**: Multiple options with consequences
- **Flags**: Track story progress

### 8. Settings Screen
- **Sections**: Appearance, Audio
- **Appearance**: Palette selector (GBC/GBA)
- **Audio**: Music volume, SFX volume, toggles
- **Save**: Automatic on change

### 9. Mini-Game Screen (Memory Match)
- **Layout**: 4×4 grid of cards
- **Mechanics**: Match pairs
- **Scoring**: Moves taken
- **Reward**: Gold based on performance

---

## Integration Points

### System Dependencies

```
GameStateManager (central hub)
├── Player (stats, inventory, Psynergy)
├── SaveManager (persistence)
│   └── SharedPreferences
├── AudioManager (music, SFX)
│   └── Settings
├── ThemeManager (palettes)
│   └── Settings
└── Battle System
    ├── Monster (enemies)
    ├── Item (consumables)
    └── Psynergy (abilities)
```

### Data Flow

#### New Game
1. GameStateManager.startNewGame()
2. Create Player (level 1, starting stats)
3. Add starting items (5 Herbs, 3 Psy Crystals)
4. Learn starting Psynergy (level 1 abilities)
5. Navigate to Game Screen

#### Battle Encounter
1. Random encounter check (1/50 per step)
2. Select monster based on location
3. Navigate to Battle Screen
4. Turn-based loop (player → enemy)
5. Victory: Award XP/gold, check level up
6. Return to Game Screen

#### Level Up
1. Check XP >= requiredXP
2. Increment level
3. Add stat bonuses
4. Check for new Psynergy
5. Show level up dialog
6. Save progress

#### Save Game
1. Player triggers save (pause menu)
2. SaveManager.saveGame(slotNumber)
3. Serialize Player to JSON
4. Save to SharedPreferences
5. Show confirmation

#### Load Game
1. Player selects save slot
2. SaveManager.loadGame(slotNumber)
3. Deserialize JSON to Player
4. Restore GameStateManager state
5. Navigate to last location

### Event Handling

#### Psynergy Usage
```dart
// Field Psynergy
onPsynergyUse(Psynergy psy) {
  if (player.currentPP >= psy.ppCost) {
    player.usePP(psy.ppCost);
    applyFieldEffect(psy.fieldEffect);
    showPsynergyAnimation(psy);
  }
}

// Battle Psynergy
onBattlePsynergyUse(Psynergy psy, Enemy target) {
  if (player.currentPP >= psy.ppCost) {
    player.usePP(psy.ppCost);
    int damage = calculatePsynergyDamage(psy, target);
    target.takeDamage(damage);
    checkVictory();
  }
}
```

#### Item Usage
```dart
onItemUse(Item item) {
  if (item.type == ItemType.consumable) {
    if (item.healHp > 0) player.heal(item.healHp);
    if (item.healPp > 0) player.restorePP(item.healPp);
    player.removeItem(item, 1);
  }
}
```

#### Theme Change
```dart
onThemeChange(PaletteMode mode) {
  ThemeManager.setMode(mode);
  rebuildAllWidgets();
  savePreference('palette', mode);
}
```

---

## Implementation Checklist

### Phase 1 (✅ Complete)
- [x] Psynergy system (13 abilities)
- [x] GBC/GBA palettes
- [x] HP/PP mechanics
- [x] Story documentation
- [x] Master reference

### Phase 2 (Next - 8 weeks)
- [ ] Enhanced dialogue system
- [ ] Quest tracking
- [ ] Cutscene system
- [ ] Party management (4 characters)
- [ ] Equipment system

### Phase 3 (12 weeks)
- [ ] 10 story dungeons
- [ ] 4 Master Djinn bosses
- [ ] 50+ NPCs
- [ ] Character arcs

### Phase 4 (8 weeks)
- [ ] 8 towns
- [ ] Optional dungeons
- [ ] Side quests
- [ ] Lore discovery

### Phases 5-8 (12 weeks)
- [ ] Djinn system
- [ ] Summons
- [ ] Polish
- [ ] Testing

---

## Quick Reference Tables

### Elemental Effectiveness
| Attacker →<br>Defender ↓ | Venus | Mars | Mercury | Jupiter |
|---|---|---|---|---|
| **Venus** | 1.0× | 1.5× | 0.5× | 1.0× |
| **Mars** | 0.5× | 1.0× | 1.5× | 1.0× |
| **Mercury** | 1.5× | 0.5× | 1.0× | 1.0× |
| **Jupiter** | 1.0× | 1.0× | 1.5× | 1.0× |

### Level Progression
| Level | XP Required | Total XP |
|---|---|---|
| 1 | 0 | 0 |
| 5 | 500 | 1,000 |
| 10 | 1,000 | 5,000 |
| 15 | 1,500 | 11,000 |
| 20 | 2,000 | 19,000 |
| 25 | 2,500 | 29,500 |
| 30 | 3,000 | 43,000 |

### Dungeon Order
1. Prologue → 2. Venus Sanctuary → 3. Venus Lighthouse →
4. Mars Forge → 5. Mars Lighthouse → 6. Wise One →
7. Jupiter Sky Sanctum → 8. Jupiter Lighthouse →
9. Mercury Frozen Abyss → 10. Mercury Lighthouse →
11. Sol Sanctum → 12. Epilogue

---

**This document serves as the complete reference for implementing Sol. All specifications, stats, and design decisions are documented here for consistent implementation.**
