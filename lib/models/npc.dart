/// Represents an NPC (Non-Player Character) in the game
class NPC {
  final String id;
  final String name;
  final String spriteId;
  final double x;
  final double y;
  final String mapId;
  final List<DialogueNode> dialogue;
  final Map<String, List<DialogueNode>>? conditionalDialogue;
  final String? shopId;
  final String? questId;
  
  NPC({
    required this.id,
    required this.name,
    required this.spriteId,
    required this.x,
    required this.y,
    required this.mapId,
    required this.dialogue,
    this.conditionalDialogue,
    this.shopId,
    this.questId,
  });
  
  List<DialogueNode> getDialogue(Map<String, dynamic> gameFlags) {
    // Check for conditional dialogue based on game flags
    if (conditionalDialogue != null) {
      for (final entry in conditionalDialogue!.entries) {
        if (gameFlags[entry.key] == true) {
          return entry.value;
        }
      }
    }
    return dialogue;
  }
}

/// Represents a single dialogue node
class DialogueNode {
  final String text;
  final String? speaker;
  final List<DialogueChoice>? choices;
  final String? nextNodeId;
  final Map<String, dynamic>? flagsToSet;
  
  DialogueNode({
    required this.text,
    this.speaker,
    this.choices,
    this.nextNodeId,
    this.flagsToSet,
  });
}

/// Represents a dialogue choice
class DialogueChoice {
  final String text;
  final String nextNodeId;
  final Map<String, dynamic>? requiredFlags;
  
  DialogueChoice({
    required this.text,
    required this.nextNodeId,
    this.requiredFlags,
  });
}

/// Database of NPCs
class NPCDatabase {
  static NPC createVillageElder() {
    return NPC(
      id: 'village_elder',
      name: 'Village Elder',
      spriteId: 'elder',
      x: 320,
      y: 240,
      mapId: 'starting_town',
      dialogue: [
        DialogueNode(
          text: 'Welcome, young traveler! Our village has been peaceful for many years, but recently strange creatures have appeared in the forest.',
          speaker: 'Elder',
        ),
        DialogueNode(
          text: 'Please, be careful on your journey. And remember, the old temple to the north holds many secrets.',
          speaker: 'Elder',
        ),
      ],
      conditionalDialogue: {
        'defeated_forest_boss': [
          DialogueNode(
            text: 'You did it! You defeated the creature threatening our village. You are a true hero!',
            speaker: 'Elder',
            flagsToSet: {'elder_rewarded': true},
          ),
        ],
      },
    );
  }
  
  static NPC createShopkeeper() {
    return NPC(
      id: 'shopkeeper',
      name: 'Shopkeeper',
      spriteId: 'merchant',
      x: 400,
      y: 240,
      mapId: 'starting_town',
      shopId: 'general_store',
      dialogue: [
        DialogueNode(
          text: 'Welcome to my shop! Take a look at what I have to offer.',
          speaker: 'Shopkeeper',
          choices: [
            DialogueChoice(text: 'Show me your wares', nextNodeId: 'open_shop'),
            DialogueChoice(text: 'Maybe later', nextNodeId: 'goodbye'),
          ],
        ),
      ],
    );
  }
  
  static NPC createMysteriousStranger() {
    return NPC(
      id: 'mysterious_stranger',
      name: '???',
      spriteId: 'cloaked_figure',
      x: 480,
      y: 320,
      mapId: 'starting_town',
      dialogue: [
        DialogueNode(
          text: 'The path ahead is fraught with danger, young one. But I sense great potential within you...',
          speaker: '???',
        ),
        DialogueNode(
          text: 'Seek the three ancient crystals. Only then will the truth be revealed.',
          speaker: '???',
          flagsToSet: {'crystal_quest_started': true},
        ),
      ],
    );
  }
  
  static NPC createInnkeeper() {
    return NPC(
      id: 'innkeeper',
      name: 'Innkeeper',
      spriteId: 'innkeeper',
      x: 360,
      y: 280,
      mapId: 'starting_town',
      dialogue: [
        DialogueNode(
          text: 'A weary traveler, eh? Rest here for the night - only 20 gold!',
          speaker: 'Innkeeper',
          choices: [
            DialogueChoice(text: 'Rest (20g)', nextNodeId: 'rest'),
            DialogueChoice(text: 'No thanks', nextNodeId: 'goodbye'),
          ],
        ),
      ],
    );
  }
}
