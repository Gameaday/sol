import '../../models/npc.dart';
import '../../models/dialogue_tree.dart';

/// NPCs for the starting village in Chapter 1
/// Note: These NPCs use the simple dialogue structure.
/// For complex branching dialogues, use the DialogueTree system from lib/data/story/chapters/
class StartingVillageNPCs {
  /// Village Elder - Main quest giver
  /// For the full branching dialogue, see chapter1_the_awakening.dart
  static NPC createVillageElder() {
    return NPC(
      id: 'village_elder',
      name: 'Village Elder',
      x: 150,
      y: 200,
      mapId: 'starting_village',
      spriteId: 'elder',
      questId: 'ch1_main_the_call',
      dialogue: [
        DialogueNode(
          text: 'Kai. I saw what happened in the square. You have a kind heart.',
          speaker: 'Village Elder',
        ),
        DialogueNode(
          text: 'But kindness alone won\'t change what\'s happening to our world. We need brave souls to investigate the tower project.',
          speaker: 'Village Elder',
        ),
      ],
    );
  }

  /// Worried Mother - Side quest giver
  static NPC createWorriedMother() {
    return NPC(
      id: 'worried_mother',
      name: 'Worried Mother',
      x: 100,
      y: 150,
      mapId: 'starting_village',
      spriteId: 'villager_woman',
      questId: 'ch1_side_lost_child',
      dialogue: [
        DialogueNode(
          text: 'Oh, thank goodness someone stopped! My daughter won\'t go near the well anymore.',
          speaker: 'Worried Mother',
        ),
        DialogueNode(
          text: 'She saw the guards there earlier, pushing people around. Now she\'s too scared. Could you check if it\'s safe?',
          speaker: 'Worried Mother',
        ),
      ],
    );
  }

  /// Blacksmith - Shop keeper
  static NPC createBlacksmith() {
    return NPC(
      id: 'blacksmith',
      name: 'Gareth the Smith',
      x: 200,
      y: 180,
      mapId: 'starting_village',
      spriteId: 'blacksmith',
      shopId: 'village_blacksmith',
      dialogue: [
        DialogueNode(
          text: 'Ah, young Kai! Need any equipment? Times are tough, but I still have some quality goods.',
          speaker: 'Gareth the Smith',
          choices: [
            DialogueChoice(text: 'Let me see what you have.', nextNodeId: 'shop'),
            DialogueChoice(text: 'Just looking around.', nextNodeId: 'goodbye'),
          ],
        ),
      ],
    );
  }

  /// Innkeeper
  static NPC createInnkeeper() {
    return NPC(
      id: 'innkeeper',
      name: 'Mara',
      x: 120,
      y: 220,
      mapId: 'starting_village',
      spriteId: 'innkeeper',
      shopId: 'village_inn',
      dialogue: [
        DialogueNode(
          text: 'Welcome to the Restful Vale Inn! Rest here for 50 gold.',
          speaker: 'Mara',
          choices: [
            DialogueChoice(text: 'Rest (50g)', nextNodeId: 'rest'),
            DialogueChoice(text: 'Maybe later.', nextNodeId: 'goodbye'),
          ],
        ),
      ],
    );
  }

  /// Young villager - Lore speaker
  static NPC createYoungVillager() {
    return NPC(
      id: 'young_villager',
      name: 'Tom',
      x: 180,
      y: 140,
      mapId: 'starting_village',
      spriteId: 'boy',
      dialogue: [
        DialogueNode(
          text: 'Wow! You\'re an Adept, right? Can you show me some Psynergy?',
          speaker: 'Tom',
        ),
        DialogueNode(
          text: 'When I grow up, I want to be just like you!',
          speaker: 'Tom',
        ),
      ],
    );
  }

  /// Guard - Shows tension in the world
  static NPC createGuard() {
    return NPC(
      id: 'village_guard',
      name: 'Guard',
      x: 160,
      y: 100,
      mapId: 'starting_village',
      spriteId: 'guard',
      dialogue: [
        DialogueNode(
          text: 'Move along. I have orders to keep this area secure.',
          speaker: 'Guard',
        ),
      ],
    );
  }

  /// Merchant - Item shop
  static NPC createMerchant() {
    return NPC(
      id: 'merchant',
      name: 'Trader Finn',
      x: 140,
      y: 190,
      mapId: 'starting_village',
      spriteId: 'merchant',
      shopId: 'village_merchant',
      dialogue: [
        DialogueNode(
          text: 'Welcome, traveler! Looking to buy or sell?',
          speaker: 'Trader Finn',
          choices: [
            DialogueChoice(text: 'Let me see your wares.', nextNodeId: 'shop'),
            DialogueChoice(text: 'Just browsing.', nextNodeId: 'goodbye'),
          ],
        ),
      ],
    );
  }

  /// Old woman - Lore about old times
  static NPC createOldWoman() {
    return NPC(
      id: 'old_woman',
      name: 'Grandmother Elsa',
      x: 130,
      y: 210,
      mapId: 'starting_village',
      spriteId: 'old_woman',
      dialogue: [
        DialogueNode(
          text: 'Hello, dear. You remind me of someone from long ago...',
          speaker: 'Grandmother Elsa',
        ),
        DialogueNode(
          text: 'A young Adept who lived here many years ago. Strong, kind-hearted, determined to make the world better.',
          speaker: 'Grandmother Elsa',
        ),
        DialogueNode(
          text: 'Be safe on your journey, dear. The world needs more good people.',
          speaker: 'Grandmother Elsa',
        ),
      ],
    );
  }

  /// Get all starting village NPCs
  static List<NPC> getAllNPCs() {
    return [
      createVillageElder(),
      createWorriedMother(),
      createBlacksmith(),
      createInnkeeper(),
      createYoungVillager(),
      createGuard(),
      createMerchant(),
      createOldWoman(),
    ];
  }

}
