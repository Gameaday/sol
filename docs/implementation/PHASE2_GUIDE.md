# Phase 2 - Narrative Framework Guide

## Overview

This guide covers the new narrative framework systems added in Phase 2, designed to be extensible and maintainable for future story development.

## Core Systems

### 1. Story Manager

**Purpose:** Central hub for narrative state, story flags, and quest management.

**Usage:**
```dart
// Access via Provider
final storyManager = context.read<StoryManager>();

// Set story flags
storyManager.setFlag('met_wise_one', true);
storyManager.setFlag('current_chapter', 2);

// Check flags
if (storyManager.getFlag('knows_about_towers', defaultValue: false)) {
  // Show tower-related dialogue
}

// Manage quests
storyManager.startQuest(myQuest);
storyManager.updateObjectiveProgress('quest_id', 'objective_id', true);
```

**Key Features:**
- Story flags for tracking narrative state
- Chapter progression tracking
- Story milestones recording
- Quest tracking (active and completed)
- Objective progress monitoring
- JSON serialization for save/load

### 2. Dialogue Manager

**Purpose:** Handle branching dialogue trees with player choices.

**Usage:**
```dart
final dialogueManager = context.read<DialogueManager>();
final storyManager = context.read<StoryManager>();

// Start a dialogue tree
final tree = ExampleDialogueTrees.createElderIntroDialogue();
dialogueManager.startDialogue(tree, storyManager.getAllFlags());

// Get current node
final currentNode = dialogueManager.currentNode;

// Get available choices
final choices = dialogueManager.getAvailableChoices(storyManager.getAllFlags());

// Make a choice
dialogueManager.makeChoice(
  selectedChoice,
  storyManager.getAllFlags(),
  (flags) {
    // Update game flags
    for (final entry in flags.entries) {
      storyManager.setFlag(entry.key, entry.value);
    }
  },
);
```

**Key Features:**
- Branching dialogue trees
- Player choice tracking
- Tone-based responses (aggressive, diplomatic, curious, etc.)
- Flag requirements for nodes and choices
- Action triggers (start quest, give item, etc.)
- Conversation state management

### 3. Party Manager

**Purpose:** Manage up to 4 party members and their relationships.

**Usage:**
```dart
final partyManager = context.read<PartyManager>();

// Add party members
partyManager.addMember(kaiCharacter);
partyManager.addMember(emberCharacter);

// Set party leader
partyManager.setLeader('Kai');

// Access members
final leader = partyManager.leader;
final allMembers = partyManager.members;

// Manage relationships
partyManager.modifyRelationship('Kai', 'Ember', 10, 'Saved Ember in battle');
final relationship = partyManager.getRelationship('Kai', 'Ember');
final level = relationship?.level; // Returns RelationshipLevel enum

// Party actions
partyManager.healParty();
partyManager.distributeExperience(100);
partyManager.addGold(50);
```

**Key Features:**
- Up to 4 party members
- Party leader designation
- Character relationships with history
- Relationship levels (enemy to soulmate)
- Shared gold pool
- Party-wide actions
- JSON serialization

### 4. Cutscene Director

**Purpose:** Orchestrate cutscenes with events, dialogue, and camera control.

**Usage:**
```dart
final director = context.read<CutsceneDirector>();

// Create cutscene script
final script = CutsceneScript(
  id: 'intro_cutscene',
  name: 'Opening Scene',
  events: [
    CutsceneEvent(
      id: 'fade_in',
      type: CutsceneEventType.fadeIn,
      duration: 2.0,
    ),
    CutsceneEvent(
      id: 'dialogue_1',
      type: CutsceneEventType.dialogue,
      duration: 5.0,
      parameters: {
        'speaker': 'Narrator',
        'text': 'In an age when Alchemy flowed freely...',
      },
    ),
  ],
  skippable: true,
);

// Start cutscene
director.startCutscene(script);

// Check state
if (director.isPlaying) {
  // Cutscene is active
}

// Control playback
director.pause();
director.resume();
director.skip(); // Only if skippable
```

**Key Features:**
- Event-based cutscene system
- Multiple event types (dialogue, camera, movement, etc.)
- Camera control (position, zoom)
- Character positioning and visibility
- Skippable cutscenes
- Progress tracking

## Data Models

### Quest Model

```dart
Quest(
  id: 'main_01',
  name: 'The Call to Adventure',
  description: 'Investigate the tower project...',
  type: QuestType.main,
  objectives: [
    QuestObjective(
      id: 'talk_elder',
      description: 'Speak with the elder',
      type: ObjectiveType.talk,
      required: true,
    ),
  ],
  reward: QuestReward(
    experience: 100,
    gold: 50,
    items: ['potion'],
  ),
  requiredFlags: {'chapter_1_started': true},
  flagsToSetOnComplete: {'tower_quest_complete': true},
)
```

### Dialogue Tree Model

```dart
DialogueTree(
  id: 'elder_intro',
  name: 'Elder Introduction',
  startNodeId: 'start',
  nodes: {
    'start': DialogueTreeNode(
      id: 'start',
      text: 'Welcome, traveler!',
      speaker: 'Elder',
      choices: [
        DialogueTreeChoice(
          id: 'greet',
          text: 'Hello, Elder.',
          nextNodeId: 'greeting_response',
          tone: ChoiceTone.diplomatic,
        ),
      ],
    ),
  },
)
```

### Character Relationship Model

```dart
CharacterRelationship(
  character1Id: 'kai',
  character2Id: 'ember',
  value: 45, // -100 to 100
)

// Relationship levels (automatic based on value):
// -100 to -80: Enemy
// -80 to -60: Hostile
// -60 to -40: Unfriendly
// -40 to -20: Tense
// -20 to 20: Neutral
// 20 to 40: Friendly
// 40 to 60: Friend
// 60 to 80: Trusted Ally
// 80 to 100: Soulmate
```

## UI Screens

### Quest Journal Screen

Shows active and completed quests with objectives.

**Usage:**
```dart
Navigator.push(
  context,
  MaterialPageRoute(
    builder: (context) => const QuestJournalScreen(),
  ),
);
```

### Party Status Screen

Shows all party members with stats and relationships.

**Usage:**
```dart
Navigator.push(
  context,
  MaterialPageRoute(
    builder: (context) => const PartyStatusScreen(),
  ),
);
```

### Cutscene Player Screen

Plays cutscenes with dialogue, events, and progress bar.

**Usage:**
```dart
Navigator.push(
  context,
  MaterialPageRoute(
    builder: (context) => CutscenePlayerScreen(
      script: myCutscene,
      onComplete: () {
        Navigator.pop(context);
      },
    ),
  ),
);
```

## Integration Guide

### Adding to New Game Flow

When starting a new game, initialize the party:

```dart
void startNewGame(String playerName) {
  final partyManager = context.read<PartyManager>();
  partyManager.createStartingParty(playerName);
  
  final storyManager = context.read<StoryManager>();
  storyManager.setChapter(1);
  
  // Start first quest
  storyManager.startQuest(ExampleQuests.createFirstMainQuest());
}
```

### Save/Load Integration

All managers support JSON serialization:

```dart
// Saving
final saveData = {
  'story': storyManager.toJson(),
  'party': partyManager.toJson(),
  // ... other data
};

// Loading
storyManager.loadFromJson(saveData['story']);
partyManager.loadFromJson(saveData['party']);
```

### Dialogue Integration

Replace old dialogue system with new tree-based system:

```dart
// Old way (simple NPC dialogue)
final npc = NPCDatabase.createVillageElder();
showDialog(context, DialogueScreen(npc: npc, ...));

// New way (branching dialogue tree)
final tree = ExampleDialogueTrees.createElderIntroDialogue();
final dialogueManager = context.read<DialogueManager>();
dialogueManager.startDialogue(tree, storyManager.getAllFlags());
```

## Extensibility

### Adding New Quest Types

1. Define the quest using the Quest model
2. Add required flags if needed
3. Add rewards
4. Place in appropriate data file

### Creating New Dialogue Trees

1. Create DialogueTree with nodes
2. Define choices with tones
3. Add flag requirements and changes
4. Add actions if needed

### Character Relationship Events

Modify relationships based on story events:

```dart
// After a story event
partyManager.modifyRelationship(
  'kai',
  'ember',
  15,
  'Ember saved Kai from the tower collapse',
);
```

### Cutscene Creation

Build cutscene scripts event by event:

```dart
final events = [
  CutsceneEvent(
    id: 'intro',
    type: CutsceneEventType.fadeIn,
    duration: 1.0,
  ),
  CutsceneEvent(
    id: 'location',
    type: CutsceneEventType.showLocation,
    duration: 2.0,
    parameters: {'location': 'Venus Lighthouse'},
  ),
  CutsceneEvent(
    id: 'dialogue',
    type: CutsceneEventType.dialogue,
    duration: 4.0,
    parameters: {
      'speaker': 'Kai',
      'text': 'We\'re too late...',
    },
  ),
];
```

## Best Practices

### Story Flags

- Use descriptive flag names: `tower_venus_visited` not `flag1`
- Prefix by scope: `chapter_2_started`, `quest_main_01_complete`
- Use booleans for binary states, numbers for counts
- Document important flags in story documentation

### Quest Design

- Keep objectives clear and achievable
- Use optional objectives for exploration
- Provide meaningful rewards
- Chain quests with flags
- Test flag requirements carefully

### Dialogue Trees

- Keep nodes focused (one idea per node)
- Provide at least 2-3 choices when possible
- Use tones to track player personality
- Don't nest choices too deeply (3-4 levels max)
- Always provide an "end" node

### Relationship Management

- Small changes are better than large jumps (5-15 points typical)
- Provide clear reasons for changes
- Use relationships to gate special content
- Track major events in relationship history
- Balance positive and negative interactions

### Cutscene Design

- Keep cutscenes concise (30-120 seconds)
- Make them skippable unless critical
- Auto-save before important cutscenes
- Use dialogue sparingly
- Test timing on all events

## Future Enhancements

Planned improvements for Phase 3+:

1. **Visual Dialogue Editor** - Tool for creating dialogue trees
2. **Relationship Bonuses** - Combat/Psynergy bonuses from high relationships
3. **Advanced Cutscene Events** - More event types and transitions
4. **Quest Chains** - Linked quests with dependencies
5. **Dialogue History** - Track player's dialogue choices
6. **Character Voice** - Personality tracking based on choice tones
7. **Relationship Cutscenes** - Special scenes at relationship milestones

## Example Implementation

See `lib/data/example_content.dart` for complete working examples of:
- Main quest with objectives
- Character quest with relationship rewards
- Side quest with item collection
- Elder dialogue tree with branching choices
- Merchant dialogue tree with shop integration

## Troubleshooting

**Quest not showing in journal:**
- Check if quest is started via `storyManager.startQuest()`
- Verify required flags are set
- Check if quest is available with `quest.isAvailable()`

**Dialogue choice not appearing:**
- Verify choice's `requiredFlags` are met
- Check if choice is marked as available
- Ensure parent node is accessible

**Relationship not changing:**
- Confirm both characters are in party
- Check relationship key is correct (alphabetically sorted)
- Verify modifyRelationship is called with correct parameters

**Cutscene not playing:**
- Check if script has events
- Verify startNodeId exists in nodes
- Ensure CutsceneDirector is in provider tree
- Check if update() is being called in loop

## Testing

Test narrative systems with:

```dart
// Test quest system
final quest = ExampleQuests.createFirstMainQuest();
storyManager.startQuest(quest);
storyManager.updateObjectiveProgress(quest.id, 'talk_to_elder', true);

// Test dialogue system
final tree = ExampleDialogueTrees.createElderIntroDialogue();
dialogueManager.startDialogue(tree, {});

// Test party system
partyManager.addMember(testCharacter);
partyManager.modifyRelationship('char1', 'char2', 20, 'Test event');

// Test cutscene system
director.startCutscene(testCutscene);
director.update(0.016); // Simulate frame
```

## Support

For questions or issues:
1. Check this guide
2. Review example content
3. Check implementation plan
4. Open GitHub issue with details
