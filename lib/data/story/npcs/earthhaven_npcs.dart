import '../../../models/npc.dart';
import '../../../models/dialogue_tree.dart';

/// NPCs for Earthhaven (First major town in Chapter 2)
class EarthavenNPCs {
  /// Create the merchant who gives the bandit quest
  static NPC createTroubledMerchant() {
    return NPC(
      id: 'earthhaven_merchant',
      name: 'Marcus',
      description: 'A merchant troubled by bandits on the trade roads',
      dialogue: _createMerchantDialogue(),
      location: 'Earthhaven Market',
    );
  }

  static DialogueTree _createMerchantDialogue() {
    return DialogueTree(
      id: 'earthhaven_merchant_dialogue',
      name: 'Marcus the Merchant',
      startNodeId: 'greeting',
      nodes: {
        'greeting': DialogueTreeNode(
          id: 'greeting',
          text: 'Welcome to Earthhaven! Though I wish it were under better circumstances.',
          speaker: 'Marcus',
          nextNodeId: 'troubles',
        ),
        'troubles': DialogueTreeNode(
          id: 'troubles',
          text: 'Bandits have been plaguing the roads. My business is suffering greatly.',
          speaker: 'Marcus',
          choices: [
            DialogueTreeChoice(
              id: 'offer_help',
              text: 'Perhaps we can help with the bandits.',
              nextNodeId: 'grateful',
              tone: ChoiceTone.diplomatic,
            ),
            DialogueTreeChoice(
              id: 'ask_more',
              text: 'Tell me more about these bandits.',
              nextNodeId: 'details',
              tone: ChoiceTone.curious,
            ),
          ],
        ),
        'grateful': DialogueTreeNode(
          id: 'grateful',
          text: 'You would? That\'s wonderful! I can offer a reward for your trouble.',
          speaker: 'Marcus',
        ),
        'details': DialogueTreeNode(
          id: 'details',
          text: 'They strike at night, taking goods and gold. No one knows where they hide.',
          speaker: 'Marcus',
        ),
      },
    );
  }

  /// Create the innkeeper
  static NPC createInnkeeper() {
    return NPC(
      id: 'earthhaven_innkeeper',
      name: 'Helena',
      description: 'The warm and welcoming innkeeper of Earthhaven',
      dialogue: _createInnkeeperDialogue(),
      location: 'Earthhaven Inn',
    );
  }

  static DialogueTree _createInnkeeperDialogue() {
    return DialogueTree(
      id: 'earthhaven_innkeeper_dialogue',
      name: 'Helena the Innkeeper',
      startNodeId: 'welcome',
      nodes: {
        'welcome': DialogueTreeNode(
          id: 'welcome',
          text: 'Welcome to the Silver Moon Inn! You look like you\'ve traveled far.',
          speaker: 'Helena',
          choices: [
            DialogueTreeChoice(
              id: 'rest',
              text: 'We need rooms for the night.',
              nextNodeId: 'rooms',
              tone: ChoiceTone.pragmatic,
            ),
            DialogueTreeChoice(
              id: 'info',
              text: 'What news of the town?',
              nextNodeId: 'news',
              tone: ChoiceTone.curious,
            ),
          ],
        ),
        'rooms': DialogueTreeNode(
          id: 'rooms',
          text: 'Of course! Two rooms available upstairs. Rest well, travelers.',
          speaker: 'Helena',
        ),
        'news': DialogueTreeNode(
          id: 'news',
          text: 'Lots of worried folks these days. Talk of towers and strange happenings at the old sanctuaries.',
          speaker: 'Helena',
        ),
      },
    );
  }

  /// Create a town guard
  static NPC createTownGuard() {
    return NPC(
      id: 'earthhaven_guard',
      name: 'Guard Captain Rowan',
      description: 'The stern but fair captain of the Earthhaven guard',
      dialogue: _createGuardDialogue(),
      location: 'Earthhaven Gate',
    );
  }

  static DialogueTree _createGuardDialogue() {
    return DialogueTree(
      id: 'earthhaven_guard_dialogue',
      name: 'Guard Captain Rowan',
      startNodeId: 'challenge',
      nodes: {
        'challenge': DialogueTreeNode(
          id: 'challenge',
          text: 'Halt! State your business in Earthhaven.',
          speaker: 'Guard Captain Rowan',
          choices: [
            DialogueTreeChoice(
              id: 'passing_through',
              text: 'We\'re just passing through.',
              nextNodeId: 'suspicious',
              tone: ChoiceTone.pragmatic,
            ),
            DialogueTreeChoice(
              id: 'investigating',
              text: 'We\'re investigating the tower project.',
              nextNodeId: 'interested',
              tone: ChoiceTone.diplomatic,
            ),
          ],
        ),
        'suspicious': DialogueTreeNode(
          id: 'suspicious',
          text: 'Very well. Keep to the main roads and cause no trouble.',
          speaker: 'Guard Captain Rowan',
        ),
        'interested': DialogueTreeNode(
          id: 'interested',
          text: 'The towers? Many have come asking questions. Be careful what you uncover.',
          speaker: 'Guard Captain Rowan',
        ),
      },
    );
  }

  /// Create a local scholar
  static NPC createScholar() {
    return NPC(
      id: 'earthhaven_scholar',
      name: 'Scholar Aldric',
      description: 'An elderly scholar studying ancient Alchemy',
      dialogue: _createScholarDialogue(),
      location: 'Earthhaven Library',
    );
  }

  static DialogueTree _createScholarDialogue() {
    return DialogueTree(
      id: 'earthhaven_scholar_dialogue',
      name: 'Scholar Aldric',
      startNodeId: 'absorbed',
      nodes: {
        'absorbed': DialogueTreeNode(
          id: 'absorbed',
          text: 'Hmm? Oh, visitors. I don\'t get many these days.',
          speaker: 'Scholar Aldric',
          nextNodeId: 'interest',
        ),
        'interest': DialogueTreeNode(
          id: 'interest',
          text: 'I\'ve been researching the ancient sealing of Alchemy. Fascinating, if troubling.',
          speaker: 'Scholar Aldric',
          choices: [
            DialogueTreeChoice(
              id: 'ask_sealing',
              text: 'Tell me about the sealing.',
              nextNodeId: 'explanation',
              tone: ChoiceTone.curious,
            ),
            DialogueTreeChoice(
              id: 'ask_towers',
              text: 'What about the towers being built?',
              nextNodeId: 'towers',
              tone: ChoiceTone.curious,
            ),
          ],
        ),
        'explanation': DialogueTreeNode(
          id: 'explanation',
          text: 'Long ago, Alchemy was sealed to prevent catastrophe. The lighthouses hold the key.',
          speaker: 'Scholar Aldric',
        ),
        'towers': DialogueTreeNode(
          id: 'towers',
          text: 'If they\'re rebuilding the lighthouses... it could undo the ancient seal. Dangerous.',
          speaker: 'Scholar Aldric',
        ),
      },
    );
  }

  /// Create a worried citizen
  static NPC createWorriedCitizen() {
    return NPC(
      id: 'earthhaven_citizen',
      name: 'Mira',
      description: 'A citizen worried about her family',
      dialogue: _createCitizenDialogue(),
      location: 'Earthhaven Square',
    );
  }

  static DialogueTree _createCitizenDialogue() {
    return DialogueTree(
      id: 'earthhaven_citizen_dialogue',
      name: 'Mira',
      startNodeId: 'worry',
      nodes: {
        'worry': DialogueTreeNode(
          id: 'worry',
          text: 'My husband was recruited for the tower project. I haven\'t heard from him in weeks.',
          speaker: 'Mira',
          choices: [
            DialogueTreeChoice(
              id: 'comfort',
              text: 'I\'m sure he\'s alright.',
              nextNodeId: 'hope',
              tone: ChoiceTone.diplomatic,
            ),
            DialogueTreeChoice(
              id: 'investigate',
              text: 'We could try to find information.',
              nextNodeId: 'grateful',
              tone: ChoiceTone.diplomatic,
            ),
          ],
        ),
        'hope': DialogueTreeNode(
          id: 'hope',
          text: 'I hope you\'re right. The waiting is the hardest part.',
          speaker: 'Mira',
        ),
        'grateful': DialogueTreeNode(
          id: 'grateful',
          text: 'Would you? Oh, thank you! Any news would be a comfort.',
          speaker: 'Mira',
        ),
      },
    );
  }

  /// Get all Earthhaven NPCs
  static List<NPC> getAllNPCs() {
    return [
      createTroubledMerchant(),
      createInnkeeper(),
      createTownGuard(),
      createScholar(),
      createWorriedCitizen(),
    ];
  }
}
