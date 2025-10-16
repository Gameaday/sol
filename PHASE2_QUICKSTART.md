# Phase 2 Quick Start Guide

Get started with the Phase 2 narrative systems in 5 minutes.

## Overview

Phase 2 adds:
- 📖 **Story Manager** - Track narrative state and quests
- 💬 **Dialogue Manager** - Branching conversations
- 👥 **Party Manager** - 4 characters with relationships
- 🎬 **Cutscene Director** - Story sequences

## Quick Setup

### 1. Access Services

All services are available via Provider:

```dart
import 'package:provider/provider.dart';

// In your widget
final storyManager = context.read<StoryManager>();
final dialogueManager = context.read<DialogueManager>();
final partyManager = context.read<PartyManager>();
final cutsceneDirector = context.read<CutsceneDirector>();
```

### 2. Start a New Game

Initialize the party and story:

```dart
void startNewGame(String playerName) {
  // Create party
  final partyManager = context.read<PartyManager>();
  partyManager.createStartingParty(playerName);
  
  // Set initial story state
  final storyManager = context.read<StoryManager>();
  storyManager.setChapter(1);
  
  // Start first quest
  final firstQuest = ExampleQuests.createFirstMainQuest();
  storyManager.startQuest(firstQuest);
}
```

### 3. Show Quest Journal

Display the quest journal screen:

```dart
import 'package:sol/screens/quest_journal_screen.dart';

// Show quest journal
Navigator.push(
  context,
  MaterialPageRoute(
    builder: (context) => const QuestJournalScreen(),
  ),
);
```

### 4. Start a Dialogue

Use dialogue trees for conversations:

```dart
import 'package:sol/data/example_content.dart';

void startConversation() {
  final dialogueManager = context.read<DialogueManager>();
  final storyManager = context.read<StoryManager>();
  
  // Load dialogue tree
  final tree = ExampleDialogueTrees.createElderIntroDialogue();
  
  // Start dialogue with current game flags
  dialogueManager.startDialogue(
    tree,
    storyManager.getAllFlags(),
  );
  
  // Your dialogue screen will show the current node
  // and available choices from dialogueManager
}
```

### 5. Play a Cutscene

Create and play cutscenes:

```dart
import 'package:sol/screens/cutscene_player_screen.dart';
import 'package:sol/models/cutscene_script.dart';

void playCutscene() {
  final script = CutsceneScript(
    id: 'intro',
    name: 'Opening Scene',
    events: [
      CutsceneEvent(
        id: 'fade_in',
        type: CutsceneEventType.fadeIn,
        duration: 2.0,
      ),
      CutsceneEvent(
        id: 'location',
        type: CutsceneEventType.showLocation,
        duration: 3.0,
        parameters: {'location': 'Sol Sanctum'},
      ),
      CutsceneEvent(
        id: 'dialogue',
        type: CutsceneEventType.dialogue,
        duration: 5.0,
        parameters: {
          'speaker': 'Narrator',
          'text': 'Long ago, Alchemy flowed freely...',
        },
      ),
    ],
  );
  
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => CutscenePlayerScreen(
        script: script,
        onComplete: () => Navigator.pop(context),
      ),
    ),
  );
}
```

## Common Tasks

### Check Story Flags

```dart
if (storyManager.getFlag('met_wise_one', defaultValue: false)) {
  // Show special dialogue
}
```

### Set Story Flags

```dart
storyManager.setFlag('tower_discovered', true);
storyManager.setFlag('towers_lit', 2);
```

### Track Quest Progress

```dart
// Update objective
storyManager.updateObjectiveProgress(
  'main_01_the_call',
  'talk_to_elder',
  true,
);

// Check if quest is complete
if (storyManager.isQuestCompleted('main_01_the_call')) {
  // Give rewards
}
```

### Manage Party

```dart
// Add member
final newCharacter = Player(name: 'Ember', ...);
partyManager.addMember(newCharacter);

// Set leader
partyManager.setLeader('Kai');

// Get party members
final members = partyManager.members;
final leader = partyManager.leader;
```

### Track Relationships

```dart
// Modify relationship
partyManager.modifyRelationship(
  'Kai',
  'Ember',
  10,
  'Fought together in battle',
);

// Get relationship
final relationship = partyManager.getRelationship('Kai', 'Ember');
print('Level: ${relationship?.level}'); // e.g., RelationshipLevel.friend
```

### Handle Dialogue Choices

```dart
// Get current node
final node = dialogueManager.currentNode;

// Get available choices
final choices = dialogueManager.getAvailableChoices(
  storyManager.getAllFlags(),
);

// Make a choice
dialogueManager.makeChoice(
  selectedChoice,
  storyManager.getAllFlags(),
  (flags) {
    // Update story flags
    for (final entry in flags.entries) {
      storyManager.setFlag(entry.key, entry.value);
    }
  },
);
```

## Creating Content

### Create a Quest

```dart
final quest = Quest(
  id: 'my_quest',
  name: 'My First Quest',
  description: 'Do something cool',
  type: QuestType.side,
  objectives: [
    QuestObjective(
      id: 'objective_1',
      description: 'Talk to NPC',
      type: ObjectiveType.talk,
      required: true,
    ),
  ],
  reward: QuestReward(
    experience: 50,
    gold: 25,
    items: ['potion'],
  ),
);

// Start the quest
storyManager.startQuest(quest);
```

### Create a Dialogue Tree

```dart
final dialogue = DialogueTree(
  id: 'my_dialogue',
  name: 'My Dialogue',
  startNodeId: 'start',
  nodes: {
    'start': DialogueTreeNode(
      id: 'start',
      text: 'Hello!',
      speaker: 'NPC',
      choices: [
        DialogueTreeChoice(
          id: 'greet',
          text: 'Hello there!',
          nextNodeId: 'greeting',
        ),
      ],
    ),
    'greeting': DialogueTreeNode(
      id: 'greeting',
      text: 'Nice to meet you!',
      speaker: 'NPC',
    ),
  },
);
```

## Save and Load

### Save Game

```dart
// Collect all data
final saveData = {
  'story': storyManager.toJson(),
  'party': partyManager.toJson(),
  // ... other data
};

// Save via SaveManager
saveManager.saveGame(slotNumber, saveData);
```

### Load Game

```dart
// Load data
final saveData = await saveManager.loadGame(slotNumber);

// Restore state
storyManager.loadFromJson(saveData['story']);
partyManager.loadFromJson(saveData['party']);
```

## Next Steps

### Learn More
- **PHASE2_GUIDE.md** - Comprehensive documentation
- **lib/data/README.md** - Content creation guide
- **lib/data/example_content.dart** - Working examples

### Implement Story Content
1. Create the 4 main characters
2. Write Chapter 1 quests
3. Create dialogue trees for NPCs
4. Build opening cutscene
5. Add relationship events

### Add Features
1. Implement quest rewards
2. Add dialogue actions
3. Create relationship bonuses
4. Build quest chains
5. Add more cutscene events

## Examples

See `lib/data/example_content.dart` for complete examples:

- **Main Quest** - Multi-objective quest with rewards
- **Character Quest** - Personal quest with relationship reward
- **Side Quest** - Collection quest
- **Elder Dialogue** - Branching conversation with choices
- **Merchant Dialogue** - Simple shop interaction

## Troubleshooting

**Quest not appearing?**
- Check `quest.isAvailable(storyManager.getAllFlags())`
- Verify `storyManager.startQuest()` was called
- Check required flags are set

**Dialogue choice missing?**
- Verify `choice.isAvailable(storyManager.getAllFlags())`
- Check requiredFlags on choice
- Ensure parent node is accessible

**Relationship not changing?**
- Confirm both characters in party
- Check character names match exactly
- Verify `modifyRelationship()` parameters

**Cutscene not playing?**
- Check script has events
- Verify CutsceneDirector in provider tree
- Ensure `update()` is called in animation loop

## Support

- Check **PHASE2_GUIDE.md** for detailed documentation
- Review **example_content.dart** for working code
- See **IMPLEMENTATION_PLAN.md** for overall roadmap
- Open GitHub issue for bugs or questions

---

**You're ready to start creating story content!** 🎮
