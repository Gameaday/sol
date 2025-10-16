# Golden Sun Systems - Implementation Plan

## Overview
This document outlines all the systems needed to create a Golden Sun-esque RPG experience for Android.

## Core Systems to Implement

### 1. PSY Energy System (Psynergy) ✓ Priority
**Description**: Magical abilities that can be used both in battle and on the overworld
**Components**:
- Psynergy model with types: Offensive, Defensive, Utility, Overworld
- PP (Psynergy Points) - separate from MP
- Elemental affinities (Venus/Earth, Mars/Fire, Jupiter/Wind, Mercury/Water)
- Field abilities: Move, Lift, Frost, Growth, etc.
- Battle abilities: elemental attacks, buffs, healing

**Implementation**:
- `models/psynergy.dart` - Psynergy definitions
- `services/psynergy_manager.dart` - Psynergy system logic
- Update Player model to include PP and learned psynergy
- Update battle screen for psynergy menu
- Create overworld psynergy interaction system

### 2. Appearance/Visual Settings ✓ Priority
**Description**: Toggle between GBC and GBA color palettes
**Components**:
- GBC Mode: 4-color green palette (current)
- GBA Mode: Enhanced color palette with more vibrant colors
- Theme manager service
- Settings screen update

**Implementation**:
- `services/theme_manager.dart` - Manage color schemes
- Update main.dart to support dynamic theming
- Add palette selection to settings screen

### 3. Djinn System
**Description**: Collectible creatures that modify stats and enable summons
**Components**:
- Djinn models (Venus, Mars, Jupiter, Mercury)
- Set/Standby states affecting stats
- Combination system for summons
- Recovery mechanics
- Collection tracker

**Implementation**:
- `models/djinn.dart` - Djinn definitions
- `screens/djinn_screen.dart` - Djinn management UI
- Integration with battle and stat systems

### 4. Class System
**Description**: Character classes determined by Djinn combinations
**Components**:
- Base classes per element
- Advanced classes unlocked by Djinn combinations
- Stat modifiers per class
- Available Psynergy per class
- Class change animations

**Implementation**:
- `models/character_class.dart` - Class definitions
- Dynamic stat calculation based on Djinn setup
- Psynergy availability based on class

### 5. Party System
**Description**: Multiple playable characters
**Components**:
- Party of up to 4 characters
- Character switching
- Individual inventories and equipment
- Party-based overworld movement
- Formation system

**Implementation**:
- Extend Player model to Character model
- `models/party.dart` - Party management
- Update game screens for party display

### 6. Equipment System
**Description**: Weapons, armor, and accessories with stats
**Components**:
- Equipment slots: Weapon, Body Armor, Head, Arms, Accessory (x2)
- Stat bonuses from equipment
- Special abilities/Psynergy granted by equipment
- Cursed equipment
- Equipment sets with bonuses

**Implementation**:
- Extend Item model for equipment
- Add equipment slots to Character
- Equipment screen UI
- Stat calculation with equipment

### 7. Elemental System
**Description**: Rock-paper-scissors elemental interactions
**Components**:
- 4 elements: Earth, Fire, Wind, Water
- Elemental resistances/weaknesses
- Elemental damage calculations
- Visual effects per element

**Implementation**:
- `models/element.dart` - Element definitions
- Damage calculation modifiers
- Visual feedback system

### 8. Advanced Battle System
**Description**: Strategic turn-based combat
**Components**:
- Turn order based on speed/agility
- Defending reduces damage
- Unleash system (weapon special attacks)
- Counter-attacks
- Multi-target abilities
- Status effects (poison, stun, sleep, etc.)
- Summon sequences

**Implementation**:
- Expand BattleScreen with more mechanics
- `models/battle_action.dart` - Action types
- `models/status_effect.dart` - Status definitions
- Turn queue system

### 9. Overworld Puzzle System
**Description**: Environmental puzzles using Psynergy
**Components**:
- Pushable objects (Move Psynergy)
- Frozen pillars (Frost Psynergy)
- Growing vines (Growth Psynergy)
- Whirlwinds (Whirlwind Psynergy)
- Pressure plates and switches
- Sliding ice puzzles
- Block pushing puzzles

**Implementation**:
- Expand puzzle system with Psynergy requirements
- Interactive overworld objects
- Puzzle state persistence

### 10. Dungeon System
**Description**: Multi-level dungeons with enemies and treasures
**Components**:
- Multiple floors/rooms
- Random encounters
- Treasure chests
- Hidden items (Reveal Psynergy)
- Boss encounters
- Save points

**Implementation**:
- `models/dungeon.dart` - Dungeon structure
- Room/floor transition system
- Chest and treasure system
- Boss battle triggers

### 11. World Map System
**Description**: Large overworld with towns and dungeons
**Components**:
- Multiple connected maps
- Towns, dungeons, caves
- Map transitions
- Fast travel points
- Secret areas
- Weather effects

**Implementation**:
- `models/world_map.dart` - Map data structure
- Map loading/unloading system
- Transition animations
- POI (Point of Interest) markers

### 12. Enhanced Dialogue System
**Description**: Rich NPC interactions
**Components**:
- Mind Read ability to read thoughts
- Yes/No choices affecting outcomes
- Quest tracking integration
- Emotional reactions
- Party member interjections

**Implementation**:
- Expand dialogue system
- Add mind read mechanic
- Quest flag integration

### 13. Quest System
**Description**: Main story and side quests
**Components**:
- Quest log/journal
- Quest objectives
- Quest rewards
- Quest chains
- Optional quests

**Implementation**:
- `models/quest.dart` - Quest structure
- `screens/quest_log_screen.dart` - UI
- Quest tracking in GameStateManager

### 14. Forge/Synthesis System
**Description**: Item crafting and upgrading
**Components**:
- Item synthesis recipes
- Artifact creation
- Equipment upgrading
- Material collection
- Blacksmith NPCs

**Implementation**:
- `models/recipe.dart` - Crafting recipes
- `screens/forge_screen.dart` - Crafting UI
- Material inventory tracking

### 15. Summon System
**Description**: Powerful attacks using Djinn
**Components**:
- Summon sequences with animations
- Djinn combinations required
- Multi-target massive damage
- Djinn recovery after summon
- Progressive unlock system

**Implementation**:
- `models/summon.dart` - Summon definitions
- Battle integration
- Animation sequences

### 16. Status Screen
**Description**: Comprehensive character information
**Components**:
- Stats display
- Equipment view
- Psynergy list
- Djinn setup
- Elemental resistances
- Status effects

**Implementation**:
- `screens/status_screen.dart` - Full character UI
- Detailed stat breakdowns
- Equipment comparison

### 17. Encyclopedia/Bestiary
**Description**: Track discovered enemies and items
**Components**:
- Enemy encyclopedia
- Item catalog
- Psynergy list
- Djinn collection tracker
- Completion percentages

**Implementation**:
- `models/encyclopedia_entry.dart`
- `screens/encyclopedia_screen.dart`
- Discovery tracking

### 18. Save Points & Auto-Save
**Description**: Save system with designated save points
**Components**:
- Sanctum (save point) locations
- Auto-save on major events
- Multiple save files
- Save file details (time, location, party)

**Implementation**:
- Expand SaveManager
- Save point objects in overworld
- Auto-save triggers

### 19. Mini-Game Collection
**Description**: Various mini-games for items/rewards
**Components**:
- Luck-based games (slot machine style)
- Timing challenges
- Puzzle mini-games
- Collectible rewards

**Implementation**:
- Multiple mini-game screens
- Reward distribution system

### 20. Audio System Enhancement
**Description**: Context-aware music and sound effects
**Components**:
- Battle music variations
- Town-specific themes
- Dungeon atmospheres
- Psynergy sound effects
- Summon music sequences

**Implementation**:
- Expand AudioManager
- Music transition system
- SFX library

## Implementation Priority

### Phase 1 (Immediate) ✓
1. Appearance Settings (GBC/GBA palettes)
2. PSY Energy/Psynergy System
3. Enhanced Battle System with Psynergy

### Phase 2 (Near-term)
4. Equipment System
5. Djinn System (basic)
6. Party System
7. Elemental System

### Phase 3 (Mid-term)
8. Class System
9. Overworld Psynergy Puzzles
10. Dungeon System
11. World Map System

### Phase 4 (Long-term)
12. Summon System
13. Quest System
14. Status Screen
15. Enhanced Dialogue (Mind Read)

### Phase 5 (Polish)
16. Forge/Synthesis
17. Encyclopedia
18. Additional Mini-Games
19. Audio Enhancement
20. Visual Effects

## Technical Considerations

### Performance
- Lazy loading for large maps
- Asset caching
- Efficient state management
- Background processing for auto-save

### Testing
- Unit tests for each system
- Integration tests for system interactions
- Battle simulation tests
- Save/load validation

### Scalability
- Modular system design
- Clear interfaces between systems
- JSON-based data definitions
- Plugin architecture for extensions

## Golden Sun Spirit
Maintaining the essence of Golden Sun:
- Emphasis on exploration and discovery
- Psynergy-based puzzle solving
- Strategic but accessible combat
- Rich world with lore
- Character growth through Djinn collection
- Epic summon sequences
- Challenging but fair difficulty
