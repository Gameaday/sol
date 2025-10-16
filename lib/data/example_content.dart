import '../models/quest.dart';
import '../models/dialogue_tree.dart';

/// Example quests for testing and demonstration
class ExampleQuests {
  /// First main quest - tutorial introduction
  static Quest createFirstMainQuest() {
    return Quest(
      id: 'main_01_the_call',
      name: 'The Call to Adventure',
      description: 'Investigate the strange rumors about a tower project that threatens the balance of Alchemy.',
      type: QuestType.main,
      objectives: [
        QuestObjective(
          id: 'talk_to_elder',
          description: 'Speak with the village elder',
          type: ObjectiveType.talk,
          required: true,
          targetId: 'village_elder',
        ),
        QuestObjective(
          id: 'gather_information',
          description: 'Talk to villagers (0/3)',
          type: ObjectiveType.talk,
          required: false,
          targetCount: 3,
        ),
        QuestObjective(
          id: 'meet_first_ally',
          description: 'Meet your first ally',
          type: ObjectiveType.event,
          required: true,
        ),
      ],
      reward: QuestReward(
        experience: 100,
        gold: 50,
        items: ['potion', 'herb'],
      ),
      flagsToSetOnComplete: {
        'chapter_1_started': true,
        'knows_about_towers': true,
      },
    );
  }

  /// Character quest - exploring personal history
  static Quest createCharacterQuest() {
    return Quest(
      id: 'char_venus_prejudice',
      name: 'Facing Prejudice',
      description: 'Kai must confront the prejudice from his own people.',
      type: QuestType.character,
      objectives: [
        QuestObjective(
          id: 'return_to_hometown',
          description: 'Return to your hometown',
          type: ObjectiveType.reach,
          required: true,
          targetId: 'venus_town',
        ),
        QuestObjective(
          id: 'confront_elder',
          description: 'Confront the town elder',
          type: ObjectiveType.talk,
          required: true,
        ),
      ],
      reward: QuestReward(
        experience: 200,
        psynergy: 'earthquake',
        relationships: {
          'kai_ember': 10,
        },
      ),
      requiredFlags: {
        'chapter_2_started': true,
      },
      flagsToSetOnComplete: {
        'kai_personal_quest_complete': true,
      },
    );
  }

  /// Side quest - helping villagers
  static Quest createSideQuest() {
    return Quest(
      id: 'side_01_lost_items',
      name: 'Lost and Found',
      description: 'Help the villagers recover items lost in the chaos.',
      type: QuestType.side,
      objectives: [
        QuestObjective(
          id: 'find_items',
          description: 'Find lost items (0/5)',
          type: ObjectiveType.collect,
          required: true,
          targetCount: 5,
        ),
        QuestObjective(
          id: 'return_items',
          description: 'Return items to their owners',
          type: ObjectiveType.event,
          required: true,
        ),
      ],
      reward: QuestReward(
        experience: 50,
        gold: 100,
      ),
    );
  }
}

/// Example dialogue trees for testing and demonstration
class ExampleDialogueTrees {
  /// Opening conversation with village elder
  static DialogueTree createElderIntroDialogue() {
    return DialogueTree(
      id: 'elder_intro',
      name: 'Elder Introduction',
      startNodeId: 'start',
      nodes: {
        'start': DialogueTreeNode(
          id: 'start',
          text: 'Ah, you\'ve come. I\'m glad you\'re here. There are dark times ahead, and we need brave souls like you.',
          speaker: 'Village Elder',
          nextNodeId: 'explain',
        ),
        'explain': DialogueTreeNode(
          id: 'explain',
          text: 'There are rumors of a massive project - towers being built across the land. They seek to control Alchemy itself.',
          speaker: 'Village Elder',
          nextNodeId: 'ask_help',
        ),
        'ask_help': DialogueTreeNode(
          id: 'ask_help',
          text: 'We need someone to investigate. Will you help us?',
          speaker: 'Village Elder',
          choices: [
            DialogueTreeChoice(
              id: 'accept_heroic',
              text: 'Of course! I\'ll stop them!',
              nextNodeId: 'accepted_heroic',
              tone: ChoiceTone.aggressive,
              flagsToSet: {'accepted_with_confidence': true},
            ),
            DialogueTreeChoice(
              id: 'accept_cautious',
              text: 'I\'ll look into it carefully.',
              nextNodeId: 'accepted_cautious',
              tone: ChoiceTone.pragmatic,
            ),
            DialogueTreeChoice(
              id: 'ask_more',
              text: 'Tell me more about these towers.',
              nextNodeId: 'more_info',
              tone: ChoiceTone.curious,
            ),
          ],
        ),
        'accepted_heroic': DialogueTreeNode(
          id: 'accepted_heroic',
          text: 'Your courage is admirable! But be careful - this enemy is powerful.',
          speaker: 'Village Elder',
          nextNodeId: 'end',
          flagsToSet: {'quest_accepted': true},
        ),
        'accepted_cautious': DialogueTreeNode(
          id: 'accepted_cautious',
          text: 'Wise words. Caution will serve you well on this journey.',
          speaker: 'Village Elder',
          nextNodeId: 'end',
          flagsToSet: {'quest_accepted': true},
        ),
        'more_info': DialogueTreeNode(
          id: 'more_info',
          text: 'They call them Elemental Lighthouses. Four towers, one for each element. If all four are activated...',
          speaker: 'Village Elder',
          nextNodeId: 'more_info_2',
        ),
        'more_info_2': DialogueTreeNode(
          id: 'more_info_2',
          text: 'Well, let\'s just say it would give someone immense power over Alchemy. Will you help us?',
          speaker: 'Village Elder',
          choices: [
            DialogueTreeChoice(
              id: 'accept_informed',
              text: 'Now I understand. I\'ll help.',
              nextNodeId: 'accepted_cautious',
              tone: ChoiceTone.diplomatic,
            ),
            DialogueTreeChoice(
              id: 'decline',
              text: 'This sounds too dangerous.',
              nextNodeId: 'declined',
              tone: ChoiceTone.pragmatic,
            ),
          ],
        ),
        'declined': DialogueTreeNode(
          id: 'declined',
          text: 'I understand your fear. But if no one acts, we\'ll all be in danger. Please, reconsider.',
          speaker: 'Village Elder',
          nextNodeId: 'ask_help',
        ),
        'end': DialogueTreeNode(
          id: 'end',
          text: 'Thank you. May the elements guide you.',
          speaker: 'Village Elder',
          action: DialogueAction(
            type: DialogueActionType.startQuest,
            parameters: {'questId': 'main_01_the_call'},
          ),
        ),
      },
    );
  }

  /// Simple merchant conversation
  static DialogueTree createMerchantDialogue() {
    return DialogueTree(
      id: 'merchant_shop',
      name: 'Merchant Conversation',
      startNodeId: 'greeting',
      nodes: {
        'greeting': DialogueTreeNode(
          id: 'greeting',
          text: 'Welcome, traveler! Looking to buy or sell?',
          speaker: 'Merchant',
          choices: [
            DialogueTreeChoice(
              id: 'browse',
              text: 'Let me see your wares.',
              nextNodeId: 'open_shop',
            ),
            DialogueTreeChoice(
              id: 'ask_rumors',
              text: 'Heard any interesting rumors?',
              nextNodeId: 'rumors',
              tone: ChoiceTone.curious,
            ),
            DialogueTreeChoice(
              id: 'leave',
              text: 'Just browsing, thanks.',
              nextNodeId: 'farewell',
            ),
          ],
        ),
        'open_shop': DialogueTreeNode(
          id: 'open_shop',
          text: 'Of course! Take your time.',
          speaker: 'Merchant',
          action: DialogueAction(
            type: DialogueActionType.triggerEvent,
            parameters: {'event': 'open_shop'},
          ),
        ),
        'rumors': DialogueTreeNode(
          id: 'rumors',
          text: 'Well, there\'s talk of strange lights to the north. Some say it\'s related to those tower projects.',
          speaker: 'Merchant',
          nextNodeId: 'rumors_2',
        ),
        'rumors_2': DialogueTreeNode(
          id: 'rumors_2',
          text: 'I stay out of politics myself, but it\'s got folks worried. Need anything else?',
          speaker: 'Merchant',
          nextNodeId: 'greeting',
        ),
        'farewell': DialogueTreeNode(
          id: 'farewell',
          text: 'Come back anytime!',
          speaker: 'Merchant',
        ),
      },
    );
  }
}

/// Example story events for the journal system
class ExampleStoryEvents {
  /// Creates example story events to demonstrate the journal
  static List<Map<String, dynamic>> getExampleEvents() {
    return [
      {
        'id': 'story_awakening',
        'title': 'The Awakening',
        'summary': 'Kai witnesses the cruel treatment of non-adepts in his village, sparking a determination to change the world.',
        'type': 'story',
      },
      {
        'id': 'character_ember_joins',
        'title': 'A Kindred Spirit',
        'summary': 'Ember, a former soldier who defected from the tower project, joins Kai in the quest to stop the towers.',
        'type': 'character',
      },
      {
        'id': 'location_first_town',
        'title': 'Journey to the First Town',
        'summary': 'Arrived at the first major settlement, learning more about the scope of the tower project.',
        'type': 'location',
      },
      {
        'id': 'character_aria_joins',
        'title': 'The Scholar\'s Wisdom',
        'summary': 'Aria, a Mercury scholar with knowledge of ancient warnings, joins the party to prevent the catastrophe she has researched.',
        'type': 'character',
      },
      {
        'id': 'story_too_late',
        'title': 'Too Late',
        'summary': 'The party arrives at the Venus Elemental Sanctuary only to find the Master Djinn has already been captured.',
        'type': 'story',
      },
      {
        'id': 'character_zephyr_joins',
        'title': 'The Vision Bearer',
        'summary': 'At the moment of despair, Zephyr appears with visions from the Wise One, completing the party of four.',
        'type': 'character',
      },
      {
        'id': 'battle_venus_lighthouse',
        'title': 'Battle at Venus Lighthouse',
        'summary': 'Successfully prevented the activation of Venus Lighthouse and retrieved the Venus elemental sphere.',
        'type': 'battle',
      },
      {
        'id': 'discovery_lighthouse_key',
        'title': 'The Lighthouse Key',
        'summary': 'Discovered a mysterious key in the Jupiter Sky Sanctum that will prove crucial for accessing the sealed Mercury Lighthouse.',
        'type': 'discovery',
      },
    ];
  }
}
