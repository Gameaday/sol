# Story Content

This directory contains the story content for Sol, organized by chapters and story beats.

## Structure

```
story/
├── chapters/           # Main story chapters
│   ├── chapter1_the_awakening.dart
│   ├── tutorial_first_steps.dart
│   ├── chapter2_the_race_begins.dart
│   ├── chapter3_too_late.dart
│   └── ...
└── README.md
```

## Story Overview

The story follows four heroes who seek to seal away Alchemy to prevent its abuse. The narrative is divided into 8 chapters plus a tutorial section.

### Progressive Party Formation

The party grows throughout the story:
1. **Chapter 1** - Solo (Kai only)
2. **Tutorial** - 2 Party (Kai + Ember)
3. **Chapter 2+** - 3 Party (+ Aria at second town)
4. **Chapter 3+** - 4 Party (+ Zephyr at Venus Sanctuary)

## Completed Chapters

### Chapter 1: The Awakening
**Status:** ✓ Complete

Solo start where Kai witnesses injustice and decides to act.

**Content:**
- Opening cutscene (world-building narration)
- Injustice cutscene (witnessing abuse)
- Main quest: "The Call to Adventure"
- Side quest: "A Child's Fear"
- Elder dialogue (main story)
- Worried Mother dialogue (side quest)

**Key Events:**
- Player witnesses treatment of non-adepts
- Learns about tower project from Elder
- Decides to investigate
- Leaves starting village

### Tutorial: First Steps
**Status:** ✓ Complete

Ember joins as the second party member and teaches party mechanics.

**Content:**
- Ember introduction cutscene
- Party formation tutorial cutscene
- Main quest: "First Ally"
- Side quest: "Combined Power" (Psynergy puzzles)
- Ember first conversation
- Post-dungeon dialogue

**Key Events:**
- Kai meets Ember at training grounds
- Learn Ember was part of tower project
- Form a 2-character party
- Clear training dungeon together
- Learn cooperative Psynergy
- Partnership established

## Chapter Templates

Each chapter file should follow this structure:

```dart
import '../../../models/quest.dart';
import '../../../models/dialogue_tree.dart';
import '../../../models/cutscene_script.dart';

class ChapterName {
  static const String chapterId = 'chapter_x';
  static const String chapterName = 'Chapter Name';
  static const String chapterDescription = 'Description';

  // Cutscenes
  static CutsceneScript createCutsceneName() { ... }

  // Quests
  static Quest createMainQuest() { ... }
  static Quest createSideQuest() { ... }

  // Dialogues
  static DialogueTree createDialogueName() { ... }

  // Get all content
  static Map<String, dynamic> getAllContent() {
    return {
      'chapter_id': chapterId,
      'chapter_name': chapterName,
      'chapter_description': chapterDescription,
      'cutscenes': { ... },
      'quests': { ... },
      'dialogues': { ... },
    };
  }
}
```

## Usage

### Loading Chapter Content

```dart
import 'package:sol/data/story/chapters/chapter1_the_awakening.dart';

// Get all chapter 1 content
final chapter1 = Chapter1TheAwakening.getAllContent();

// Get specific cutscene
final openingCutscene = Chapter1TheAwakening.createOpeningCutscene();

// Get main quest
final mainQuest = Chapter1TheAwakening.createMainQuest();

// Get dialogue
final elderDialogue = Chapter1TheAwakening.createElderDialogue();
```

### Starting a Chapter

```dart
// Load chapter content
final chapter = Chapter1TheAwakening.getAllContent();

// Play opening cutscene
cutsceneDirector.playCutscene(chapter['cutscenes']['opening']);

// Start main quest
storyManager.startQuest(chapter['quests']['main']);

// Add story event to journal
storyManager.addStoryEvent(
  chapter['chapter_id'],
  chapter['chapter_name'],
  'Started ${chapter['chapter_name']}',
  EventType.story,
);
```

## Planned Chapters

### Chapter 2: The Race Begins
**Status:** Planned

- Travel to first major town
- Investigation and intel gathering
- Travel to second town
- **Aria joins** as 3rd party member
- 3-character party explores Venus region

### Chapter 3: Too Late
**Status:** Planned

- Rush to Venus Elemental Sanctuary
- Arrive TOO LATE - Venus Master Djinn captured
- **Zephyr joins** at this critical moment
- Full 4-character party complete
- Must pursue to Venus Lighthouse
- First sphere secured

### Chapter 4: Learning from Mistakes
**Status:** Planned

- Travel to Mars region with full party
- Mars Elemental Forge (arrive late, already captured)
- Mars Lighthouse battle
- Second sphere secured

### Chapter 5: The Guide
**Status:** Planned

- Meet the Wise One cutscene
- Learn about sealing plan
- Character debates and bonding
- Decision to change strategy

### Chapter 6: Victory and Theft
**Status:** Planned

- Jupiter Sky Sanctum (arrive IN TIME!)
- Jupiter Master Djinn boss fight
- Mercury Frozen Abyss (arrive IN TIME!)
- All four spheres collected
- **The Theft**: Three spheres stolen

### Chapter 7: The Lighthouses
**Status:** Planned

- Jupiter Lighthouse - retrieve key
- Mercury Lighthouse - epic heist
- All four lighthouses remain unlit

### Chapter 8: The Sacrifice
**Status:** Planned

- Calm Venus and Mars Master Djinn
- Journey to Sol Sanctum
- Final boss: Tower Leaders
- Aria's sacrifice cutscene
- Zephyr's sacrifice cutscene
- The Sealing ceremony
- Vale foundation epilogue
- Bridge to Golden Sun

## Content Guidelines

### Cutscenes

- Keep cutscenes between 1-3 minutes
- Allow skipping except for critical story moments
- Use fadeIn/fadeOut for transitions
- Include character animations when possible
- Set appropriate durations for text display

### Quests

- Main quests should have 3-5 objectives
- Side quests should have 2-4 objectives
- Always include experience and gold rewards
- Add item rewards for side quests
- Set appropriate flags for story progression
- Use required flags to gate quests properly

### Dialogues

- Provide 2-4 choices at decision points
- Vary choice tones (aggressive, diplomatic, curious, pragmatic)
- Set flags for important decisions
- Use actions to trigger events or start quests
- Keep dialogue nodes concise (2-3 sentences max)
- Create branching paths that converge to key story beats

### Story Events

When implementing chapter content, remember to add journal events:

```dart
storyManager.addStoryEvent(
  'event_id',
  'Event Title',
  'Brief summary of what happened',
  EventType.story,  // or character, location, battle, discovery
);
```

## Integration with Game Systems

### With Character System

```dart
// When characters join
if (chapter == 'tutorial') {
  final ember = CharacterRegistry.createCharacter(CharacterId.ember);
  partyManager.addMember(ember);
  
  storyManager.addStoryEvent(
    'character_ember_joins',
    'A Kindred Spirit',
    'Ember joins the party',
    EventType.character,
  );
}
```

### With Cutscene Director

```dart
// Play cutscene from chapter
await cutsceneDirector.playCutscene(
  Chapter1TheAwakening.createOpeningCutscene()
);
```

### With Dialogue Manager

```dart
// Start dialogue from chapter
dialogueManager.startDialogue(
  Chapter1TheAwakening.createElderDialogue()
);
```

### With Quest System

```dart
// Start quest from chapter
storyManager.startQuest(
  Chapter1TheAwakening.createMainQuest()
);
```

## Best Practices

1. **Consistent Naming:** Use descriptive IDs for all content
2. **Flag Management:** Track all story flags carefully
3. **Relationship Changes:** Update character relationships through quests
4. **Experience Balance:** Scale rewards with expected player level
5. **Story Journal:** Add events for all major story beats
6. **Pacing:** Balance story and gameplay in each chapter
7. **Testing:** Test all dialogue branches and quest paths

## Future Enhancements

- Chapter selection screen
- Story replay system
- Alternative dialogue based on party composition
- Dynamic quest generation
- Chapter-specific achievements
- Story branch tracking

## See Also

- `IMPLEMENTATION_PLAN.md` - Overall project roadmap
- `STORY_AND_LORE.md` - Detailed story and character backgrounds
- `lib/models/quest.dart` - Quest data model
- `lib/models/dialogue_tree.dart` - Dialogue system
- `lib/models/cutscene_script.dart` - Cutscene system
- `lib/services/story_manager.dart` - Story management service
