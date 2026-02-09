# Implementation Plan - Sol Prequel Story

## Overview

This document outlines the complete implementation plan for transforming Sol into a fully-realized Golden Sun prequel with the story of sealing Alchemy.

## Story Implementation Phases

### Phase 1: Technical Foundation ✓ COMPLETE

**Completed:**
- Basic game engine (Flutter + Flame)
- Combat system
- Psynergy system
- Save/load system
- UI framework
- Palette switching
- Initial documentation

### Phase 2: Narrative Framework (CURRENT PRIORITY)

**2.1 Enhanced Dialogue System**

*Timeline: 2-3 weeks*

**Requirements:**
- Branching dialogue trees
- Choice consequences tracking
- Character-specific responses
- Tone-based dialogue options (Aggressive, Diplomatic, Curious)
- Memory of past choices

**Implementation:**
```dart
// New models needed
models/dialogue_tree.dart
models/dialogue_choice.dart  
models/story_flags.dart

// Enhanced services
services/story_manager.dart  // Track narrative state
services/dialogue_manager.dart  // Handle conversations

// New screens
screens/dialogue_scene_screen.dart  // Full-screen dialogue
```

**Files to Create:**
1. `lib/models/dialogue_tree.dart` - Dialogue structure
2. `lib/services/story_manager.dart` - Story state tracking
3. `lib/services/dialogue_manager.dart` - Conversation handling
4. Update existing `screens/dialogue_screen.dart` with choice consequences

**2.2 Quest & Objective System**

*Timeline: 1-2 weeks*

**Requirements:**
- Main quest tracking
- Side quest management
- Objective indicators
- Quest journal UI
- Completion rewards

**Implementation:**
```dart
// New models
models/quest.dart  // Enhanced from existing
models/objective.dart
models/quest_reward.dart

// New screens
screens/quest_journal_screen.dart

// Service updates
services/game_state_manager.dart  // Add quest tracking
```

**Files to Create:**
1. Enhance existing `lib/models/quest.dart`
2. `lib/models/objective.dart` - Quest objectives
3. `lib/screens/quest_journal_screen.dart` - Quest UI

**2.3 Cutscene System**

*Timeline: 2-3 weeks*

**Requirements:**
- Scripted sequences
- Character positioning
- Camera control
- Text display with timing
- Skipable but memorable
- Auto-save before cutscenes

**Implementation:**
```dart
// New system
game/cutscene/cutscene_director.dart
game/cutscene/cutscene_script.dart
game/cutscene/camera_controller.dart

// New models
models/cutscene_event.dart
models/cutscene_action.dart

// New screens
screens/cutscene_player_screen.dart
```

**Files to Create:**
1. `lib/game/cutscene/cutscene_director.dart` - Orchestrate cutscenes
2. `lib/models/cutscene_script.dart` - Cutscene definitions
3. `lib/screens/cutscene_player_screen.dart` - Playback UI

**2.4 Character Relationship System**

*Timeline: 1-2 weeks*

**Requirements:**
- Relationship values between each character pair
- Visual indicators in UI
- Unlock thresholds for special content
- Combat bonuses for strong bonds
- Dialogue variations based on relationships

**Implementation:**
```dart
// New models
models/character_relationship.dart
models/relationship_event.dart

// Service updates  
services/party_manager.dart  // New service
services/relationship_manager.dart  // New service

// UI updates
widgets/relationship_indicator.dart
```

**Files to Create:**
1. `lib/models/character_relationship.dart` - Relationship data
2. `lib/services/party_manager.dart` - Party management
3. `lib/widgets/relationship_indicator.dart` - UI component

### Phase 3: Party System (Weeks 8-12)

**3.1 Progressive Party Formation**

**UPDATED REQUIREMENTS - Progressive Party Acquisition:**
- **Start with 1 character**: Kai (Venus Alchemist) - Player begins solo
- **2nd character joins in tutorial/starting area**: Ember (Mars Alchemist) - Joins early to teach party mechanics
- **3rd character joins in 2nd town**: Aria (Mercury Witch) - Mid-game addition
- **4th character joins before 1st lighthouse**: Zephyr (Jupiter Sorcerer) - Joins when arriving too late to first elemental spirit room

**Character Acquisition Timeline:**
1. **Chapter 1 Opening**: Player controls only Kai (Venus Alchemist)
   - Solo tutorial and initial story setup
   - Learn basic movement and combat
   
2. **Tutorial/Starting Area**: Ember (Mars Alchemist) joins
   - Introduction to party mechanics
   - First dungeon with 2-character party
   - Learn about party formation and tactics
   
3. **Second Town**: Aria (Mercury Witch) joins
   - Party expands to 3 members
   - Introduce healing and support mechanics
   - Relationship system becomes more complex
   
4. **Before First Lighthouse** (arriving too late): Zephyr (Jupiter Sorcerer) joins
   - Full 4-character party complete
   - Final party member adds versatility
   - Ready for major story challenges

**3.2 Four-Character Party System**

**Requirements:**
- Four distinct characters with unique stats
- Character switching in menu
- Formation system
- Individual inventories
- Character-specific Psynergy

**Implementation:**
```dart
// Update existing Player model to Character model
models/character.dart  // Replace player.dart
models/party.dart  // Manage 4 characters (already exists)

// Character definitions
data/characters/kai_venus.dart      // 1st - Venus Alchemist
data/characters/ember_mars.dart     // 2nd - Mars Alchemist  
data/characters/aria_mercury.dart   // 3rd - Mercury Witch
data/characters/zephyr_jupiter.dart // 4th - Jupiter Sorcerer
```

**Files to Create/Modify:**
1. Rename/extend `lib/models/player.dart` → `lib/models/character.dart`
2. Update `lib/models/party.dart` - Already exists, verify progressive addition
3. `lib/data/characters/` - Character definitions with acquisition flags

**3.3 Character-Specific Systems**

**Requirements:**
- Unique Psynergy lists per character
- Character portraits and sprites
- Personal equipment slots
- Individual level progression
- Character-specific dialogue

**Implementation:**
- Update Psynergy system to be character-specific
- Create character data files
- Add portrait system
- Character selection in menus

### Phase 4: Story Content Creation (Weeks 13-20)

**4.1 Main Quest Implementation - UPDATED for Progressive Party Formation**

**Chapter 1: "The Awakening" (Solo Start)**
- Opening cutscene showing non-adept abuse
- Player controls **only Kai (Venus Alchemist)** initially
- Solo exploration and character introduction
- Witness injustice and decision to act
- First combat tutorial as solo character

**Tutorial Area: "First Steps" (2-Character Party)**
- **Ember (Mars Alchemist) joins** as 2nd party member
- Tutorial dungeon introducing party mechanics
- Learn formation, party commands, and tactics
- First cooperative Psynergy puzzles
- Decision to investigate the towers
- End with determination to stop the tower project

**Chapter 2: "The Race Begins"**
- Travel to first major town
- Investigation and gathering intel
- **Travel to second town**
- **Aria (Mercury Witch) joins** as 3rd party member (healer/support)
- 3-character party explores Venus region
- Preparation for first major challenge

**Chapter 3: "Too Late" (4-Character Party Complete)**
- Rush to Venus Elemental Sanctuary
- **Arrive TOO LATE** - Venus Master Djinn already captured
- At this moment of failure, **Zephyr (Jupiter Sorcerer) joins** as 4th member
- Zephyr brings news and determination to continue
- **Full 4-character party is now complete**
- Must pursue to Venus Lighthouse
- Venus Lighthouse battle (prevent activation, retrieve sphere)
- First sphere secured

**Chapter 4: "Learning from Mistakes"**
- Travel to Mars region with full party
- Mars Elemental Forge (arrive late again, already captured)
- Mars Lighthouse battle (prevent activation, retrieve sphere)
- Second sphere secured but pattern of failure clear
- Party must change strategy

**Chapter 5: "The Guide"**
- Meet the Wise One cutscene
- Learn about sealing plan and lighthouse mechanics
- Character debates and bonding
- Decision to try a new approach
- Determination to arrive in time next time

**Chapter 6: "Victory and Theft"**
- Jupiter Sky Sanctum (arrive IN TIME!)
- Jupiter Master Djinn boss fight (in wild form)
- Obtain Jupiter sphere directly + Lighthouse Key
- Mercury Frozen Abyss (arrive IN TIME!)
- Mercury Master Djinn battle
- All four spheres collected!
- **The Theft**: Three spheres stolen (Venus, Mars, Mercury)

**Chapter 7: "The Lighthouses"**
- Jupiter Lighthouse - retrieve key, prevent activation
- Mercury Lighthouse - epic heist to steal back all three spheres
- All four lighthouses remain unlit

**Chapter 8: "The Sacrifice"**
- Calm Venus and Mars Master Djinn in orb form
- Journey to Sol Sanctum
- Final boss: Tower Leaders
- Aria's sacrifice cutscene
- Zephyr's sacrifice cutscene
- The Sealing ceremony (Kai and Ember survive)
- Vale foundation epilogue
- Time skip sequence
- Bridge to Golden Sun scene

**4.2 Side Quest Content**

**Character Personal Quests:**
1. Alchemist (Venus): Face prejudice from own people
2. Alchemist (Mars): Confront former commander
3. Witch (Mercury): Return to academic institution
4. Sorcerer (Jupiter): Seek family understanding

**World Quests:**
1. Help villages affected by elemental chaos
2. Discover ancient pre-Alchemy ruins
3. Collect legendary equipment
4. Find all Djinn fragments
5. Unlock secret dungeon

**Lore Quests:**
1. Collect ancient texts
2. Interview elder NPCs
3. Explore abandoned research facilities
4. Discover prophecies

**4.3 Dungeon Design**

**Story Dungeons:**
1. Training Grounds (Tutorial) - 4 floors
2. Venus Elemental Sanctuary (Natural dungeon) - 6 floors
3. Venus Lighthouse (Battle, prevent activation) - 4 floors
4. Mars Elemental Forge (Natural dungeon) - 6 floors
5. Mars Lighthouse (Battle, prevent activation) - 4 floors
6. Jupiter Sky Sanctum (Natural dungeon with wild Master Djinn) - 12 floors
7. Jupiter Lighthouse (Prevent adept forces from lighting) - 8 floors
8. Mercury Frozen Abyss (Natural dungeon with wild Master Djinn) - 15 floors
9. Mercury Lighthouse (Final siege, prevent activation) - 10 floors
10. Sol Sanctum (Sealing ceremony) - 10 floors

**Optional Dungeons:**
1. Venus Personal Dungeon - 6 floors
2. Mars Personal Dungeon - 6 floors
3. Mercury Personal Dungeon - 6 floors
4. Jupiter Personal Dungeon - 6 floors
5. Ancient Ruins - 8 floors
6. Secret Endgame Dungeon - 20 floors

### Phase 5: World Building (Weeks 21-26)

**5.1 Towns and NPCs**

**Major Towns:**
1. Starting Town - Tutorial hub
2. Venus Territory Town - Earth adepts
3. Mars Territory Town - Fire adepts
4. Jupiter Territory Town - Wind adepts
5. Mercury Territory Town - Water adepts
6. Neutral Town - Non-adepts
7. Research City - Tower project base
8. Proto-Vale - Future Vale location

**NPC Categories:**
- Quest givers (20+)
- Shopkeepers (8+)
- Lore speakers (30+)
- Random dialogue (50+)
- Character-specific (12+)

**5.2 Environmental Storytelling**

**Implementable Elements:**
- Ruined structures showing history
- Murals depicting past events
- Journals and notes scattered
- NPC conversations revealing lore
- Environmental changes post-story events

### Phase 6: Enhanced Combat (Weeks 27-30)

**6.1 Psynergy in Battle**

**Requirements:**
- Psynergy menu in battle
- Elemental damage calculations
- Multi-target abilities
- Combination Psynergy (party combos)
- PP usage in combat

**Implementation:**
- Extend existing battle screen
- Add Psynergy selection UI
- Implement elemental multipliers
- Create combo system

**6.2 Djinn Combat System**

**Requirements:**
- Set/Standby states
- Summon mechanics
- Stat changes from Djinn setup
- Recovery mechanics
- Visual effects

**Implementation:**
- Djinn battle integration
- Summon sequences
- Stat recalculation system

### Phase 7: Polish & Enhancement (Weeks 31-36)

**7.1 Visual Polish**

**Requirements:**
- Particle effects for Psynergy
- Battle animations
- Cutscene camera work
- Transition effects
- UI animations

**7.2 Audio Implementation**

**Requirements:**
- Background music tracks
- Psynergy sound effects
- Battle sounds
- Cutscene music
- Ambient sounds

**7.3 Balancing**

**Requirements:**
- Experience curve tuning
- Damage calculation balance
- Boss difficulty adjustment
- Puzzle complexity review
- Pacing improvements

### Phase 8: Testing & Refinement (Weeks 37-40)

**8.1 Playtesting**

**Focus Areas:**
- Story flow and pacing
- Combat balance
- Puzzle difficulty
- Bug identification
- Performance optimization

**8.2 Content Completion**

**Requirements:**
- All dialogue written
- All cutscenes implemented
- All side quests functional
- All items/equipment available
- All Djinn collectible

**8.3 Golden Sun Integration**

**Requirements:**
- Lore consistency check
- Character naming review
- Location accuracy
- Event timeline verification
- Easter egg placement

## Priority Order for Implementation

### Immediate (Next 2 Weeks)

1. **Story Manager Service** - Track narrative state
2. **Enhanced Dialogue System** - Support choices and consequences
3. **Quest Journal Screen** - Track objectives
4. **Character Relationship Models** - Foundation for party dynamics

### Short Term (Weeks 3-6)

1. **Cutscene System** - Enable story scenes
2. **Party Management** - Four character system
3. **Character-Specific Psynergy** - Differentiate heroes
4. **First Story Chapter** - Playable opening

### Medium Term (Weeks 7-16)

1. **All Main Story Chapters** - Complete narrative
2. **Tower Dungeons** - Major story locations
3. **Boss Battles** - Master Djinn encounters
4. **Character Side Quests** - Personal stories

### Long Term (Weeks 17-30)

1. **World Population** - All towns and NPCs
2. **Optional Content** - Side quests and dungeons
3. **Combat Enhancement** - Full Psynergy/Djinn integration
4. **Lore Discovery** - Environmental storytelling

### Final (Weeks 31-40)

1. **Visual/Audio Polish** - Effects and music
2. **Balance Pass** - Difficulty tuning
3. **Quality Assurance** - Bug fixing
4. **Golden Sun Integration** - Lore consistency

## Technical Architecture Updates Needed

### New Services

```dart
services/
├── story_manager.dart           // NEW: Narrative state
├── dialogue_manager.dart        // NEW: Conversations
├── quest_manager.dart          // NEW: Quest tracking
├── party_manager.dart          // NEW: Four characters
├── relationship_manager.dart   // NEW: Character bonds
├── cutscene_manager.dart       // NEW: Scene playback
└── element_manager.dart        // NEW: Elemental damage
```

### New Models

```dart
models/
├── character.dart              // REPLACE player.dart
├── party.dart                  // NEW: Party of 4
├── dialogue_tree.dart          // NEW: Conversation structure
├── dialogue_choice.dart        // NEW: Player choices
├── story_flag.dart            // NEW: Narrative tracking
├── quest.dart                 // ENHANCE existing
├── objective.dart             // NEW: Quest goals
├── character_relationship.dart // NEW: Party bonds
├── cutscene_script.dart       // NEW: Scene definitions
└── element_damage.dart        // NEW: Elemental system
```

### New Screens

```dart
screens/
├── cutscene_player_screen.dart    // NEW: Play cutscenes
├── quest_journal_screen.dart      // NEW: Quest UI
├── party_status_screen.dart       // NEW: Full party view
├── relationship_screen.dart       // NEW: Bond viewing
└── chapter_title_screen.dart      // NEW: Chapter intros
```

### Enhanced Game Components

```dart
game/
├── cutscene/                      // NEW: Cutscene system
│   ├── cutscene_director.dart
│   ├── camera_controller.dart
│   └── event_sequencer.dart
├── components/
│   └── npc_component.dart         // NEW: NPC entities
└── systems/
    ├── dialogue_system.dart       // NEW: In-game dialogue
    └── quest_system.dart          // NEW: Quest triggers
```

## Data Structure for Story Content

### Dialogue Format

```json
{
  "dialogue_id": "opening_scene_01",
  "speaker": "narrator",
  "text": "In an age when Alchemy flowed freely...",
  "choices": [
    {
      "text": "Tell me more about Alchemy",
      "next": "opening_scene_02a",
      "flags": {"curious_about_alchemy": true}
    },
    {
      "text": "What happened to the world?",
      "next": "opening_scene_02b",
      "flags": {"concerned_about_world": true}
    }
  ]
}
```

### Quest Format

```json
{
  "quest_id": "main_01_the_call",
  "name": "The Call to Adventure",
  "description": "Investigate rumors about the tower project",
  "objectives": [
    {
      "id": "talk_to_elder",
      "description": "Speak with the village elder",
      "type": "dialogue",
      "required": true
    },
    {
      "id": "gather_party",
      "description": "Form a party of heroes",
      "type": "event",
      "required": true
    }
  ],
  "rewards": {
    "experience": 100,
    "gold": 50,
    "items": ["potion", "potion"]
  }
}
```

### Cutscene Format

```json
{
  "cutscene_id": "venus_tower_failure",
  "scenes": [
    {
      "type": "fade_in",
      "duration": 1.0
    },
    {
      "type": "show_location",
      "location": "Venus Tower Entrance",
      "duration": 2.0
    },
    {
      "type": "dialogue",
      "speaker": "venus_alchemist",
      "text": "No... we're too late."
    },
    {
      "type": "show_sphere",
      "object": "venus_sphere",
      "effect": "glow"
    },
    {
      "type": "fade_out",
      "duration": 1.0
    }
  ]
}
```

## Milestones and Deliverables

### Milestone 1: Narrative Foundation (Week 6)
- ✓ Story documentation complete
- ✓ Design document finalized
- Story manager service functional
- Enhanced dialogue system working
- Quest journal displaying
- First cutscene playable

### Milestone 2: Party System (Week 12)
- Four characters selectable
- Character-specific Psynergy
- Party management UI complete
- Relationship system tracking
- Character switching functional

### Milestone 3: Core Story (Week 20)
- All 6 chapters playable
- All main quests implemented
- All tower dungeons complete
- All Master Djinn encounters
- Sealing sequence complete

### Milestone 4: World Complete (Week 28)
- All towns populated
- All NPCs with dialogue
- All side quests available
- All optional dungeons
- All collectibles placed

### Milestone 5: Polish Complete (Week 36)
- All visual effects implemented
- All audio tracks integrated
- Combat fully balanced
- Pacing optimized
- Golden Sun connections verified

### Milestone 6: Release Ready (Week 40)
- All content complete
- All bugs fixed
- Performance optimized
- Documentation updated
- Ready for player testing

## Resource Requirements

### Development Team Needs

**Core Development:**
- 1 Programmer (full-time) - 40 weeks
- 1 Writer (part-time) - 20 weeks
- 1 Designer (part-time) - 16 weeks

**Art & Audio (if custom assets):**
- 1 Pixel Artist (part-time) - 12 weeks
- 1 Composer (contract) - 4 weeks
- 1 Sound Designer (contract) - 2 weeks

### Asset Requirements

**Sprites Needed:**
- 4 character sprites with animations
- 50+ NPC sprites
- 20+ monster sprites
- Environment tilesets (10+ sets)
- UI elements and icons

**Audio Needed:**
- 20+ music tracks
- 50+ sound effects
- Ambient sounds

### Testing Resources

**Quality Assurance:**
- Playtesting (weeks 30-36)
- Bug tracking system
- Performance monitoring
- Balance testing

## Success Criteria

### Must Have (Critical)
- Complete main story (6 chapters)
- All 4 characters playable
- Psynergy system in battle
- Basic Djinn system
- Save/load with story state
- Quest tracking
- Cutscene system functional

### Should Have (High Priority)
- All side quests
- Character relationships
- Combination Psynergy
- Optional dungeons
- Full Djinn collection
- Environmental storytelling

### Could Have (Medium Priority)
- Voice acting
- Animated cutscenes
- Advanced visual effects
- Dynamic music system
- New Game Plus

### Won't Have (This Version)
- Online features
- Multiplayer
- User-generated content
- VR support

## Risk Management

### Technical Risks

**Risk:** Performance issues with cutscenes
**Mitigation:** Optimize early, use efficient rendering

**Risk:** Save system corruption
**Mitigation:** Multiple auto-save slots, backup system

**Risk:** Complex dialogue tree bugs
**Mitigation:** Thorough testing, visual editor tool

### Content Risks

**Risk:** Story pacing issues
**Mitigation:** Regular playtesting, adjustable chapter lengths

**Risk:** Inconsistency with Golden Sun lore
**Mitigation:** Lore consultant, fan community review

**Risk:** Combat balance problems
**Mitigation:** Iterative balance passes, data-driven tuning

### Schedule Risks

**Risk:** Scope creep
**Mitigation:** Strict milestone reviews, prioritized feature list

**Risk:** Content creation bottleneck
**Mitigation:** Reusable templates, asset library

## Conclusion

This implementation plan provides a comprehensive roadmap for transforming Sol into a complete Golden Sun prequel. The phased approach ensures steady progress while maintaining flexibility for adjustments based on testing and feedback.

**Next Steps:**
1. Begin Phase 2 implementation (Narrative Framework)
2. Create story manager service
3. Enhance dialogue system
4. Build quest journal
5. Start first cutscene

The 40-week timeline is ambitious but achievable with focused development and clear priorities. Regular milestone reviews will ensure the project stays on track while maintaining quality standards.
