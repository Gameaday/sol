# Sol - Quick Start Guide

Welcome to Sol, a Golden Sun-inspired prequel story about sealing Alchemy. This guide will help you understand what has been implemented and how to work with the existing systems.

## What's Been Implemented?

### ✅ Phase 1: Technical Foundation (COMPLETE)
- Game engine (Flutter + Flame)
- Turn-based combat system
- Psynergy system (field and battle)
- Save/load system (3 slots)
- Retro UI framework (GameBoy aesthetic)

### ✅ Phase 2: Narrative Framework (COMPLETE)
- Story management (flags, milestones)
- Quest system (main, side, character quests)
- Dialogue trees (branching conversations)
- Party management (up to 4 characters)
- Relationship system (character bonds)
- Cutscene system (21 event types)

### ✅ Phase 2.5: Journal & Progressive Party (COMPLETE)
- Story journal (event tracking)
- Current objective display
- Progressive party acquisition system

### ✅ Phase 3: Party System (COMPLETE)
- 4 main characters fully defined
- Character-specific Psynergy
- Balanced growth rates
- Personality traits

### 🔄 Phase 4: Story Content (30% COMPLETE)
- Chapter 1: "The Awakening" (complete)
- Tutorial: "First Steps" (complete)
- Starting village NPCs (complete)
- Remaining 6 chapters (planned)

## Quick Navigation

### For Developers

**Core Systems:**
- `lib/models/` - Data models (Player, Quest, DialogueTree, etc.)
- `lib/services/` - Business logic (StoryManager, DialogueManager, etc.)
- `lib/screens/` - UI screens
- `lib/game/` - Flame game components

**Game Content:**
- `lib/data/characters/` - Character definitions
- `lib/data/story/chapters/` - Story content
- `lib/data/npcs/` - NPC definitions
- `lib/data/example_content.dart` - Example content

**Documentation:**
- `IMPLEMENTATION_PLAN.md` - Complete roadmap
- `IMPLEMENTATION_STATUS.md` - Current progress
- `PHASE*_SUMMARY.md` - Phase details
- `lib/data/*/README.md` - Content creation guides

### For Content Creators

**Creating Characters:**
See `lib/data/characters/README.md`
```dart
import 'package:sol/data/characters/character_registry.dart';

// Create a character at default level
final kai = CharacterRegistry.createCharacter(CharacterId.kai);

// Create a character at specific level
final ember = CharacterRegistry.createCharacter(CharacterId.ember, level: 5);
```

**Creating Story Content:**
See `lib/data/story/README.md`
```dart
import 'package:sol/data/story/chapters/chapter1_the_awakening.dart';

// Get all chapter content
final chapter1 = Chapter1TheAwakening.getAllContent();

// Get specific quest
final mainQuest = Chapter1TheAwakening.createMainQuest();

// Get specific dialogue
final elderDialogue = Chapter1TheAwakening.createElderDialogue();
```

**Creating NPCs:**
See existing examples in `lib/data/npcs/starting_village_npcs.dart`
```dart
static NPC createNPC() {
  return NPC(
    id: 'npc_id',
    name: 'NPC Name',
    x: 100,
    y: 150,
    mapId: 'town_name',
    spriteId: 'sprite_name',
    dialogue: [
      DialogueNode(
        text: 'Dialogue text',
        speaker: 'NPC Name',
      ),
    ],
  );
}
```

## The Four Heroes

### Kai - Venus (Earth) Alchemist
- **Joins:** Chapter 1 (game start)
- **Role:** Main protagonist, balanced fighter
- **Element:** Venus (Earth)
- **Fate:** Survives to found Vale

### Ember - Mars (Fire) Alchemist
- **Joins:** Tutorial (early game)
- **Role:** Offensive powerhouse, former soldier
- **Element:** Mars (Fire)
- **Fate:** Survives to found Vale

### Aria - Mercury (Water) Witch
- **Joins:** Second Town (mid-game)
- **Role:** Healer and support, scholar
- **Element:** Mercury (Water)
- **Fate:** Sacrifices herself at Sol Sanctum

### Zephyr - Jupiter (Wind) Sorcerer
- **Joins:** Before 1st Lighthouse
- **Role:** Fast spellcaster, visionary
- **Element:** Jupiter (Wind)
- **Fate:** Sacrifices himself at Sol Sanctum

## Story Overview

### The 8 Chapters

1. **The Awakening** (✅ Complete) - Kai witnesses injustice
2. **The Race Begins** (⏳ Planned) - Travel and investigation, Aria joins
3. **Too Late** (⏳ Planned) - Venus Sanctuary failure, Zephyr joins
4. **Learning from Mistakes** (⏳ Planned) - Mars region
5. **The Guide** (⏳ Planned) - Meet the Wise One
6. **Victory and Theft** (⏳ Planned) - Collect spheres, theft occurs
7. **The Lighthouses** (⏳ Planned) - Jupiter & Mercury lighthouses
8. **The Sacrifice** (⏳ Planned) - Sol Sanctum, sealing, ending

### Tutorial: First Steps
(✅ Complete) - Ember joins, learn party mechanics

## Key Systems Overview

### Quest System
- **Types:** Main, Side, Character, Lore, Collection
- **Objectives:** Talk, Reach, Event, Collect, Battle
- **Rewards:** XP, Gold, Items, Psynergy, Relationships
- **Tracking:** Active quests, completed quests, objectives

### Dialogue System
- **Branching:** Multiple choices with consequences
- **Tones:** Aggressive, Diplomatic, Curious, Pragmatic, Sarcastic, Mysterious
- **Flags:** Set/check story flags
- **Actions:** Start quests, trigger events, open shops

### Party System
- **Size:** Up to 4 members
- **Leader:** Designated party leader
- **Relationships:** Track bonds between all pairs
- **Shared Resources:** Gold pool, party-wide actions

### Cutscene System
- **21 Event Types:** FadeIn, FadeOut, ShowText, ShowDialogue, MoveCharacter, etc.
- **Skippable:** Can be skipped (configurable)
- **Progress Tracking:** Current event, playback state

## Common Tasks

### Starting a New Game
1. Create starting character (Kai)
2. Initialize story flags
3. Start Chapter 1 opening cutscene
4. Begin first quest

### Adding a Character to Party
```dart
final ember = CharacterRegistry.createCharacter(CharacterId.ember, level: 2);
partyManager.addMember(ember);

storyManager.addStoryEvent(
  'character_ember_joins',
  'A Kindred Spirit',
  'Ember joins the party',
  EventType.character,
);
```

### Starting a Quest
```dart
final quest = Chapter1TheAwakening.createMainQuest();
storyManager.startQuest(quest);
```

### Playing a Cutscene
```dart
final cutscene = Chapter1TheAwakening.createOpeningCutscene();
await cutsceneDirector.playCutscene(cutscene);
```

### Tracking Story Events
```dart
storyManager.addStoryEvent(
  'event_id',
  'Event Title',
  'Brief description of what happened',
  EventType.story,  // story, quest, character, location, battle, discovery
);
```

## Project Statistics

- **Lines of Code:** ~11,655
- **Documentation:** ~41,200 words
- **Files:** ~54 files
- **Completion:** ~40%
- **Characters:** 4 fully defined
- **Story Chapters:** 2 of 8 complete
- **NPCs:** 8 created

## Getting Started with Development

1. **Install Flutter:**
   ```bash
   flutter doctor
   ```

2. **Get Dependencies:**
   ```bash
   flutter pub get
   ```

3. **Run the App:**
   ```bash
   flutter run
   ```

4. **Build for Android:**
   ```bash
   flutter build apk --release
   ```

## Next Steps

### For Contributors
1. Read `IMPLEMENTATION_PLAN.md` for the full roadmap
2. Check `IMPLEMENTATION_STATUS.md` for current progress
3. Look at `lib/data/*/README.md` for content creation guides
4. Follow existing patterns in completed chapters

### Immediate Priorities
1. Complete Chapter 2 (Aria joining)
2. Complete Chapter 3 (Zephyr joining)
3. Create town layouts and NPCs
4. Build first dungeons

### Long-Term Goals
1. Complete all 8 chapters
2. Implement all dungeons
3. Add enhanced combat
4. Polish and balance
5. Playtest and refine

## Resources

- **Main Documentation:** README.md
- **Implementation Plan:** IMPLEMENTATION_PLAN.md
- **Current Status:** IMPLEMENTATION_STATUS.md
- **Story & Lore:** STORY_AND_LORE.md
- **Architecture:** ARCHITECTURE.md
- **Phase Guides:** PHASE*_SUMMARY.md, PHASE*_GUIDE.md

## Support

For questions or issues:
1. Check the documentation in `lib/data/*/README.md`
2. Review existing examples in `lib/data/`
3. See `IMPLEMENTATION_PLAN.md` for design decisions
4. Check `IMPLEMENTATION_STATUS.md` for what's done/planned

---

**Welcome to the Sol development team! Let's create an amazing prequel story together.**
