# Game Content Data

This directory contains game content data files including quests, dialogue trees, cutscenes, and character definitions.

## Structure

```
data/
├── example_content.dart    # Example quests and dialogues for reference
├── quests/                 # Quest definitions (future)
├── dialogues/             # Dialogue trees (future)
├── cutscenes/             # Cutscene scripts (future)
└── characters/            # Character definitions (future)
```

## Creating Content

### Quests

Quests are defined using the `Quest` model:

```dart
Quest createMyQuest() {
  return Quest(
    id: 'unique_quest_id',
    name: 'Quest Name',
    description: 'Quest description shown in journal',
    type: QuestType.main, // main, side, character, lore, collection
    objectives: [
      QuestObjective(
        id: 'objective_1',
        description: 'Do something',
        type: ObjectiveType.talk, // talk, collect, defeat, reach, event
        required: true,
        targetId: 'npc_id', // Optional: specific target
        targetCount: 1, // Optional: required count
      ),
    ],
    reward: QuestReward(
      experience: 100,
      gold: 50,
      items: ['potion', 'herb'],
      psynergy: 'earthquake', // Optional: learn new Psynergy
      relationships: { // Optional: relationship changes
        'char1_char2': 10,
      },
    ),
    requiredFlags: { // Optional: flags needed to start
      'chapter_1_started': true,
    },
    flagsToSetOnComplete: { // Optional: flags to set on completion
      'quest_complete': true,
    },
  );
}
```

### Dialogue Trees

Dialogue trees are branching conversations:

```dart
DialogueTree createMyDialogue() {
  return DialogueTree(
    id: 'dialogue_id',
    name: 'Dialogue Name',
    startNodeId: 'start',
    nodes: {
      'start': DialogueTreeNode(
        id: 'start',
        text: 'What the character says',
        speaker: 'Character Name', // Optional
        nextNodeId: 'next', // For linear progression
        choices: [ // For branching
          DialogueTreeChoice(
            id: 'choice_1',
            text: 'What player says',
            nextNodeId: 'response_1',
            tone: ChoiceTone.diplomatic, // Optional: aggressive, curious, etc.
            requiredFlags: {'flag': true}, // Optional
            flagsToSet: {'new_flag': true}, // Optional
          ),
        ],
        flagsToSet: {'dialogue_seen': true}, // Optional: set when node is shown
        requiredFlags: {'required': true}, // Optional: needed to access node
        action: DialogueAction( // Optional: trigger action
          type: DialogueActionType.startQuest,
          parameters: {'questId': 'quest_id'},
        ),
      ),
    },
  );
}
```

### Cutscenes

Cutscenes are sequences of events:

```dart
CutsceneScript createMyCutscene() {
  return CutsceneScript(
    id: 'cutscene_id',
    name: 'Cutscene Name',
    skippable: true, // Allow player to skip
    autoSaveBeforeStart: true, // Save before playing
    events: [
      CutsceneEvent(
        id: 'fade_in',
        type: CutsceneEventType.fadeIn,
        duration: 1.0, // seconds
      ),
      CutsceneEvent(
        id: 'show_location',
        type: CutsceneEventType.showLocation,
        duration: 2.0,
        parameters: {
          'location': 'Venus Lighthouse',
        },
      ),
      CutsceneEvent(
        id: 'dialogue',
        type: CutsceneEventType.dialogue,
        duration: 4.0,
        parameters: {
          'speaker': 'Character Name',
          'text': 'Dialogue text',
        },
      ),
      CutsceneEvent(
        id: 'fade_out',
        type: CutsceneEventType.fadeOut,
        duration: 1.0,
      ),
    ],
  );
}
```

## Event Types

### CutsceneEventType Options

- `fadeIn` - Fade in from black
- `fadeOut` - Fade to black
- `showLocation` - Display location name
- `hideLocation` - Hide location display
- `dialogue` - Show dialogue box with text
- `moveCharacter` - Move character to position
- `showCharacter` - Make character visible
- `hideCharacter` - Make character invisible
- `playAnimation` - Play character animation
- `showObject` - Show object in scene
- `hideObject` - Hide object
- `playSound` - Play sound effect
- `playMusic` - Start music track
- `stopMusic` - Stop music
- `cameraMove` - Move camera to position
- `cameraZoom` - Zoom camera
- `screenShake` - Shake screen effect
- `wait` - Wait for duration
- `setFlag` - Set story flag
- `startBattle` - Trigger battle
- `giveItem` - Give item to party
- `parallel` - Run events in parallel

## Choice Tones

Used to track player personality:

- `aggressive` - Forceful, confrontational
- `diplomatic` - Tactful, persuasive
- `curious` - Inquisitive, questioning
- `compassionate` - Empathetic, caring
- `pragmatic` - Practical, logical
- `neutral` - No specific tone

## Objective Types

- `talk` - Speak with NPC
- `collect` - Gather items
- `defeat` - Defeat enemies
- `reach` - Reach a location
- `event` - Trigger specific event

## Quest Types

- `main` - Main story quest
- `side` - Optional side quest
- `character` - Character personal quest
- `lore` - Lore discovery quest
- `collection` - Collection/gathering quest

## Relationship Levels

Based on relationship value (-100 to 100):

- -100 to -80: Enemy
- -80 to -60: Hostile
- -60 to -40: Unfriendly
- -40 to -20: Tense
- -20 to 20: Neutral
- 20 to 40: Friendly
- 40 to 60: Friend
- 60 to 80: Trusted Ally
- 80 to 100: Soulmate

## Best Practices

### Quests
- Use clear, actionable objective descriptions
- Provide balanced rewards (XP, gold, items)
- Chain quests with story flags
- Test flag requirements

### Dialogues
- Keep node text concise (1-3 sentences)
- Provide 2-3 meaningful choices
- Use tones to add personality
- Test all dialogue paths
- End conversations clearly

### Cutscenes
- Keep duration reasonable (30-120 seconds)
- Make important cutscenes non-skippable
- Use dialogue sparingly
- Time events appropriately
- Test on different screen sizes

### Relationships
- Use small increments (5-15 points)
- Document major relationship events
- Balance positive and negative interactions
- Gate special content on relationship levels

## Examples

See `example_content.dart` for complete working examples of:
- Main quest with multiple objectives
- Character quest with relationship rewards
- Side quest with collection objective
- Branching dialogue with choices
- Simple merchant dialogue

## Integration

Content is loaded and used via the service managers:

```dart
// Load quest
final quest = MyQuests.createQuestName();
storyManager.startQuest(quest);

// Load dialogue
final dialogue = MyDialogues.createDialogueName();
dialogueManager.startDialogue(dialogue, storyManager.getAllFlags());

// Load cutscene
final cutscene = MyCutscenes.createCutsceneName();
cutsceneDirector.startCutscene(cutscene);
```

## File Organization

As content grows, organize by:
- Chapter (chapter_1_quests.dart)
- Character (kai_quests.dart, ember_dialogues.dart)
- Location (venus_tower_content.dart)
- Type (main_quests.dart, side_quests.dart)

## Version Control

- Keep content files separate from code
- Document breaking changes
- Use semantic versioning for major content updates
- Test thoroughly before committing

## Questions?

See `PHASE2_GUIDE.md` for detailed system documentation.
