# NPCs - Non-Player Characters

This directory contains NPC definitions for all towns in the Sol game.

## Structure

Each town has its own NPC file that exports a class with static factory methods:

```dart
class TownNameNPCs {
  static NPC createNPCName() { ... }
  static List<NPC> getAllNPCs() { ... }
}
```

## Current Town NPCs

### Starting Village NPCs
**File:** See separate directory for starting village NPCs
**NPCs:** 8 total
- Village Elder (quest giver)
- Worried Mother (side quest)
- Gareth the Smith (blacksmith)
- Mara (innkeeper)
- Tom (young villager)
- Guard (world tension)
- Trader Finn (merchant)
- Grandmother Elsa (lore)

### Earthhaven NPCs
**File:** `earthhaven_npcs.dart`
**NPCs:** 5 total
- **Marcus** - Troubled Merchant (gives bandit quest)
- **Helena** - Innkeeper of Silver Moon Inn
- **Guard Captain Rowan** - Town guard captain
- **Scholar Aldric** - Elderly scholar researching Alchemy
- **Mira** - Worried citizen whose husband was recruited

### Crystalport NPCs
**File:** `crystalport_npcs.dart`
**NPCs:** 5 total
- **Librarian Thaddeus** - Head librarian of Grand Library
- **Dockworker Cole** - Port worker with gossip
- **Silas** - Old bookstore owner
- **Captain Marina** - Sea captain with tales
- **Town Crier** - Voice of the Council

## Usage

### Loading NPCs for a Town

```dart
import 'package:sol/data/story/npcs/earthhaven_npcs.dart';

// Get all NPCs for the town
final npcs = EarthavenNPCs.getAllNPCs();

// Load NPCs into game world
for (final npc in npcs) {
  gameWorld.addNPC(npc);
}
```

### Creating Individual NPCs

```dart
// Create a specific NPC
final merchant = EarthavenNPCs.createTroubledMerchant();

// Access NPC properties
print(merchant.name); // "Marcus"
print(merchant.location); // "Earthhaven Market"

// Start dialogue with NPC
dialogueManager.startDialogue(merchant.dialogue);
```

## NPC Properties

Each NPC has:
- **id**: Unique identifier
- **name**: Display name
- **description**: Brief description of the NPC
- **dialogue**: DialogueTree for conversations
- **location**: Where the NPC is found

## Dialogue Structure

All NPC dialogues follow the DialogueTree pattern:
- **Greeting node**: Initial conversation
- **Choice nodes**: Player can choose responses
- **Information nodes**: NPC provides lore/quest info
- **Action nodes**: May trigger quests or events

## Adding New Town NPCs

1. Create a new file: `town_name_npcs.dart`
2. Follow the naming pattern: `TownNameNPCs`
3. Implement static factory methods for each NPC
4. Include a `getAllNPCs()` method
5. Document in this README

### Template

```dart
import '../../../models/npc.dart';
import '../../../models/dialogue_tree.dart';

class NewTownNPCs {
  static NPC createNPCName() {
    return NPC(
      id: 'town_npc_id',
      name: 'NPC Name',
      description: 'Brief description',
      dialogue: _createNPCDialogue(),
      location: 'Location in Town',
    );
  }

  static DialogueTree _createNPCDialogue() {
    return DialogueTree(
      id: 'town_npc_dialogue',
      name: 'NPC Name',
      startNodeId: 'greeting',
      nodes: {
        'greeting': DialogueTreeNode(
          id: 'greeting',
          text: 'NPC greeting text',
          speaker: 'NPC Name',
          choices: [
            // Add dialogue choices
          ],
        ),
      },
    );
  }

  static List<NPC> getAllNPCs() {
    return [
      createNPCName(),
      // Add all NPCs
    ];
  }
}
```

## Future Towns

Towns that need NPC implementations:
- Venus Territory Town
- Mars Territory Town  
- Jupiter Territory Town
- Mercury Territory Town
- Neutral Town
- Research City
- Proto-Vale

Each town should have 5-8 NPCs including:
- Innkeeper
- Merchant/Shopkeeper
- Quest giver(s)
- Lore NPCs
- Atmospheric NPCs (guards, citizens, etc.)

## Best Practices

1. **Consistent Naming**: Use descriptive IDs like `town_role_name`
2. **Balanced Dialogue**: Keep conversations concise (2-3 exchanges)
3. **Multiple Paths**: Offer 2-3 dialogue choices when appropriate
4. **Character Voice**: Give each NPC distinct personality
5. **World Building**: Use dialogue to reveal lore and story
6. **Quest Integration**: Connect NPCs to side quests where appropriate

## Integration with Story

NPCs should reference story events and flags:
- React to current chapter progress
- Acknowledge major story events
- Provide hints about main quests
- Offer side quests that complement main story

Example flag usage:
```dart
if (storyManager.getFlag('chapter_2_complete')) {
  // Different dialogue after Chapter 2
}
```
