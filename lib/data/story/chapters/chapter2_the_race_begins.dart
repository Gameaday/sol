import '../../../models/quest.dart';
import '../../../models/dialogue_tree.dart';
import '../../../models/cutscene_script.dart';

/// Chapter 2: "The Race Begins"
/// Travel to towns, investigation, and Aria joins as 3rd party member
class Chapter2TheRaceBegins {
  static const String chapterId = 'chapter_2';
  static const String chapterName = 'The Race Begins';
  static const String chapterDescription = 
      'Kai and Ember travel to investigate the tower project, gathering intelligence. '
      'In the second town, they meet Aria, a scholarly Mercury Witch who joins their cause.';

  /// Arrival at first town cutscene
  static CutsceneScript createFirstTownArrivalCutscene() {
    return CutsceneScript(
      id: 'ch2_first_town_arrival',
      name: 'First Town Arrival',
      events: [
        CutsceneEvent(
          type: CutsceneEventType.fadeIn,
          duration: 1.5,
        ),
        CutsceneEvent(
          type: CutsceneEventType.showText,
          text: 'Earthhaven - Gateway Town',
          duration: 2.5,
        ),
        CutsceneEvent(
          type: CutsceneEventType.showDialogue,
          speaker: 'Kai',
          text: 'This town is much larger than our village. We should be able to find information here.',
          duration: 3.5,
        ),
        CutsceneEvent(
          type: CutsceneEventType.showDialogue,
          speaker: 'Ember',
          text: 'Look at the crowd. Everyone seems on edge.',
          duration: 3.0,
        ),
        CutsceneEvent(
          type: CutsceneEventType.showDialogue,
          speaker: 'Kai',
          text: 'Let\'s split up and ask around. Meet back at the inn?',
          duration: 3.0,
        ),
        CutsceneEvent(
          type: CutsceneEventType.showDialogue,
          speaker: 'Ember',
          text: 'Agreed. Be careful.',
          duration: 2.5,
        ),
        CutsceneEvent(
          type: CutsceneEventType.fadeOut,
          duration: 1.5,
        ),
      ],
      canSkip: true,
    );
  }

  /// Investigation complete cutscene
  static CutsceneScript createInvestigationCompleteCutscene() {
    return CutsceneScript(
      id: 'ch2_investigation_complete',
      name: 'Investigation Complete',
      events: [
        CutsceneEvent(
          type: CutsceneEventType.fadeIn,
          duration: 1.0,
        ),
        CutsceneEvent(
          type: CutsceneEventType.showText,
          text: 'That Evening - The Inn',
          duration: 2.0,
        ),
        CutsceneEvent(
          type: CutsceneEventType.showDialogue,
          speaker: 'Ember',
          text: 'What did you learn?',
          duration: 2.5,
        ),
        CutsceneEvent(
          type: CutsceneEventType.showDialogue,
          speaker: 'Kai',
          text: 'The tower project is bigger than we thought. They\'re not just building one tower.',
          duration: 4.0,
        ),
        CutsceneEvent(
          type: CutsceneEventType.showDialogue,
          speaker: 'Ember',
          text: 'Multiple towers? That matches what I heard. Four of them, one for each element.',
          duration: 4.0,
        ),
        CutsceneEvent(
          type: CutsceneEventType.showDialogue,
          speaker: 'Kai',
          text: 'Four lighthouses... If they activate all of them, what would happen to the world?',
          duration: 4.5,
        ),
        CutsceneEvent(
          type: CutsceneEventType.showDialogue,
          speaker: 'Ember',
          text: 'Nothing good. We need to move faster. The next town might have more answers.',
          duration: 4.0,
        ),
        CutsceneEvent(
          type: CutsceneEventType.fadeOut,
          duration: 1.5,
        ),
      ],
      canSkip: true,
    );
  }

  /// Arrival at second town where Aria is
  static CutsceneScript createSecondTownArrivalCutscene() {
    return CutsceneScript(
      id: 'ch2_second_town_arrival',
      name: 'Crystalport Arrival',
      events: [
        CutsceneEvent(
          type: CutsceneEventType.fadeIn,
          duration: 1.5,
        ),
        CutsceneEvent(
          type: CutsceneEventType.showText,
          text: 'Crystalport - Coastal Town',
          duration: 2.5,
        ),
        CutsceneEvent(
          type: CutsceneEventType.showDialogue,
          speaker: 'Kai',
          text: 'A port town. Trade and travelers from all over must pass through here.',
          duration: 3.5,
        ),
        CutsceneEvent(
          type: CutsceneEventType.showDialogue,
          speaker: 'Ember',
          text: 'Perfect for gathering information. And... look at that library.',
          duration: 3.5,
        ),
        CutsceneEvent(
          type: CutsceneEventType.showDialogue,
          speaker: 'Kai',
          text: 'If anyone has records about the lighthouses, it would be there.',
          duration: 3.5,
        ),
        CutsceneEvent(
          type: CutsceneEventType.fadeOut,
          duration: 1.0,
        ),
      ],
      canSkip: true,
    );
  }

  /// Aria introduction cutscene at the library
  static CutsceneScript createAriaIntroductionCutscene() {
    return CutsceneScript(
      id: 'ch2_aria_introduction',
      name: 'Meeting Aria',
      events: [
        CutsceneEvent(
          type: CutsceneEventType.fadeIn,
          duration: 1.0,
        ),
        CutsceneEvent(
          type: CutsceneEventType.showText,
          text: 'Crystalport Grand Library',
          duration: 2.0,
        ),
        CutsceneEvent(
          type: CutsceneEventType.playSound,
          soundId: 'books_falling',
          duration: 1.0,
        ),
        CutsceneEvent(
          type: CutsceneEventType.showDialogue,
          speaker: 'Aria',
          text: 'Oh no, not again!',
          duration: 2.0,
        ),
        CutsceneEvent(
          type: CutsceneEventType.moveCharacter,
          characterId: 'kai',
          targetX: 250,
          targetY: 200,
          duration: 1.0,
        ),
        CutsceneEvent(
          type: CutsceneEventType.showDialogue,
          speaker: 'Kai',
          text: 'Are you alright? Here, let me help.',
          duration: 2.5,
        ),
        CutsceneEvent(
          type: CutsceneEventType.playAnimation,
          animationId: 'picking_up_books',
          duration: 1.5,
        ),
        CutsceneEvent(
          type: CutsceneEventType.showDialogue,
          speaker: 'Aria',
          text: 'Thank you! I was researching ancient structures and... wait.',
          duration: 3.0,
        ),
        CutsceneEvent(
          type: CutsceneEventType.showDialogue,
          speaker: 'Aria',
          text: 'These books you picked up - "Elemental Lighthouses", "The Alchemy Wells"...',
          duration: 3.5,
        ),
        CutsceneEvent(
          type: CutsceneEventType.showDialogue,
          speaker: 'Aria',
          text: 'You\'re researching the same thing I am!',
          duration: 2.5,
        ),
        CutsceneEvent(
          type: CutsceneEventType.showDialogue,
          speaker: 'Ember',
          text: 'You know about the lighthouse project?',
          duration: 2.5,
        ),
        CutsceneEvent(
          type: CutsceneEventType.showDialogue,
          speaker: 'Aria',
          text: 'Project? I\'m studying the ancient lighthouses as historical artifacts. But if someone is trying to reactivate them...',
          duration: 5.0,
        ),
        CutsceneEvent(
          type: CutsceneEventType.showDialogue,
          speaker: 'Aria',
          text: 'That would be catastrophic! The old texts warn against it.',
          duration: 3.5,
        ),
        CutsceneEvent(
          type: CutsceneEventType.showDialogue,
          speaker: 'Kai',
          text: 'Then we\'re on the same side. We\'re trying to stop them.',
          duration: 3.0,
        ),
        CutsceneEvent(
          type: CutsceneEventType.showDialogue,
          speaker: 'Aria',
          text: 'I... I want to help. My research could be valuable, and I can use Psynergy too.',
          duration: 4.0,
        ),
        CutsceneEvent(
          type: CutsceneEventType.showDialogue,
          speaker: 'Ember',
          text: 'Can you fight?',
          duration: 2.0,
        ),
        CutsceneEvent(
          type: CutsceneEventType.showDialogue,
          speaker: 'Aria',
          text: 'I\'m a Mercury Adept. I may be a scholar, but I can handle myself.',
          duration: 3.5,
        ),
        CutsceneEvent(
          type: CutsceneEventType.playAnimation,
          animationId: 'aria_water_splash',
          duration: 2.0,
        ),
        CutsceneEvent(
          type: CutsceneEventType.showDialogue,
          speaker: 'Kai',
          text: 'Welcome to the team, Aria.',
          duration: 2.5,
        ),
        CutsceneEvent(
          type: CutsceneEventType.showText,
          text: 'Aria joined the party!',
          duration: 3.0,
        ),
        CutsceneEvent(
          type: CutsceneEventType.fadeOut,
          duration: 1.5,
        ),
      ],
      canSkip: false,  // Important party member addition
    );
  }

  /// Main quest: Investigation
  static Quest createMainQuest() {
    return Quest(
      id: 'ch2_main_race_begins',
      name: 'The Race Against Time',
      description: 
          'Travel to nearby towns to investigate the lighthouse project. '
          'Gather information about the towers and those behind them.',
      type: QuestType.main,
      objectives: [
        QuestObjective(
          id: 'reach_first_town',
          description: 'Travel to Earthhaven',
          type: ObjectiveType.reach,
          required: true,
          targetId: 'earthhaven_town',
        ),
        QuestObjective(
          id: 'gather_intel_1',
          description: 'Talk to townspeople about the towers (0/3)',
          type: ObjectiveType.talk,
          required: true,
          targetCount: 3,
        ),
        QuestObjective(
          id: 'meet_at_inn',
          description: 'Meet Ember at the inn',
          type: ObjectiveType.reach,
          required: true,
          targetId: 'earthhaven_inn',
        ),
        QuestObjective(
          id: 'reach_second_town',
          description: 'Travel to Crystalport',
          type: ObjectiveType.reach,
          required: true,
          targetId: 'crystalport_town',
        ),
        QuestObjective(
          id: 'visit_library',
          description: 'Investigate the Grand Library',
          type: ObjectiveType.reach,
          required: true,
          targetId: 'crystalport_library',
        ),
        QuestObjective(
          id: 'recruit_aria',
          description: 'Find a scholar who can help',
          type: ObjectiveType.event,
          required: true,
        ),
      ],
      reward: QuestReward(
        experience: 250,
        gold: 200,
        items: ['elixir', 'herb', 'herb', 'antidote'],
      ),
      flagsToSetOnComplete: {
        'chapter_2_complete': true,
        'aria_joined': true,
        'knows_about_four_lighthouses': true,
        'visited_crystalport': true,
      },
      requiredFlags: {
        'chapter_1_complete': true,
      },
    );
  }

  /// Side quest: Help a merchant
  static Quest createSideQuestMerchantTrouble() {
    return Quest(
      id: 'ch2_side_merchant_trouble',
      name: 'Merchant\'s Trouble',
      description: 
          'A merchant in Earthhaven has been having trouble with bandits on the road. '
          'Help clear the path for safe travel.',
      type: QuestType.side,
      objectives: [
        QuestObjective(
          id: 'talk_to_merchant',
          description: 'Speak with the troubled merchant',
          type: ObjectiveType.talk,
          required: true,
          targetId: 'earthhaven_merchant',
        ),
        QuestObjective(
          id: 'clear_bandits',
          description: 'Defeat the bandits on the road',
          type: ObjectiveType.defeat,
          required: true,
          targetId: 'road_bandits',
          targetCount: 3,
        ),
        QuestObjective(
          id: 'return_to_merchant',
          description: 'Report back to the merchant',
          type: ObjectiveType.talk,
          required: true,
          targetId: 'earthhaven_merchant',
        ),
      ],
      reward: QuestReward(
        experience: 100,
        gold: 150,
        items: ['power_bread', 'herb'],
      ),
      requiredFlags: {
        'chapter_1_complete': true,
      },
    );
  }

  /// Side quest: Ancient text recovery
  static Quest createSideQuestAncientText() {
    return Quest(
      id: 'ch2_side_ancient_text',
      name: 'Lost Knowledge',
      description: 
          'Aria mentions that a valuable ancient text about the lighthouses '
          'is missing from the library. Help her find it.',
      type: QuestType.side,
      objectives: [
        QuestObjective(
          id: 'talk_to_librarian',
          description: 'Speak with the head librarian',
          type: ObjectiveType.talk,
          required: true,
          targetId: 'crystalport_librarian',
        ),
        QuestObjective(
          id: 'search_old_bookstore',
          description: 'Check the old bookstore in town',
          type: ObjectiveType.reach,
          required: true,
          targetId: 'old_bookstore',
        ),
        QuestObjective(
          id: 'retrieve_text',
          description: 'Retrieve the ancient text',
          type: ObjectiveType.collect,
          required: true,
          targetId: 'ancient_lighthouse_text',
        ),
        QuestObjective(
          id: 'return_to_aria',
          description: 'Return the text to Aria',
          type: ObjectiveType.talk,
          required: true,
          targetId: 'aria',
        ),
      ],
      reward: QuestReward(
        experience: 120,
        gold: 100,
        items: ['psy_crystal', 'water_of_life'],
      ),
      flagsToSetOnComplete: {
        'aria_relationship_1': true,
      },
      requiredFlags: {
        'aria_joined': true,
      },
    );
  }

  /// Dialogue with a townsperson about towers
  static DialogueTree createTownspersonDialogue() {
    return DialogueTree(
      id: 'ch2_townsperson_towers',
      name: 'Townsperson Discussion',
      startNodeId: 'greeting',
      nodes: {
        'greeting': DialogueTreeNode(
          id: 'greeting',
          text: 'Travelers? We don\'t get many these days. Not with all the commotion.',
          speaker: 'Townsperson',
          nextNodeId: 'concern',
        ),
        'concern': DialogueTreeNode(
          id: 'concern',
          text: 'The Adept Council has been recruiting workers for some big project.',
          speaker: 'Townsperson',
          choices: [
            DialogueTreeChoice(
              id: 'ask_project',
              text: 'What kind of project?',
              nextNodeId: 'explain_project',
              tone: ChoiceTone.curious,
            ),
            DialogueTreeChoice(
              id: 'ask_council',
              text: 'Who is on this council?',
              nextNodeId: 'explain_council',
              tone: ChoiceTone.curious,
            ),
            DialogueTreeChoice(
              id: 'express_concern',
              text: 'Is everyone okay with this?',
              nextNodeId: 'explain_division',
              tone: ChoiceTone.diplomatic,
            ),
          ],
        ),
        'explain_project': DialogueTreeNode(
          id: 'explain_project',
          text: 'They call them "Elemental Lighthouses." Supposed to harness the power of Alchemy itself.',
          speaker: 'Townsperson',
          nextNodeId: 'worry',
        ),
        'explain_council': DialogueTreeNode(
          id: 'explain_council',
          text: 'The most powerful Adepts from each element. They say it\'s for the good of all Adepts.',
          speaker: 'Townsperson',
          nextNodeId: 'worry',
        ),
        'explain_division': DialogueTreeNode(
          id: 'explain_division',
          text: 'Some folks think it\'s progress. Others... others are scared. Especially the non-Adepts.',
          speaker: 'Townsperson',
          nextNodeId: 'worry',
        ),
        'worry': DialogueTreeNode(
          id: 'worry',
          text: 'Me? I just hope they know what they\'re doing. Playing with that much power...',
          speaker: 'Townsperson',
          action: DialogueAction(
            type: DialogueActionType.setFlag,
            parameters: {'flag': 'learned_about_council', 'value': 'true'},
          ),
        ),
      },
    );
  }

  /// Dialogue with Aria after joining
  static DialogueTree createAriaJoinedDialogue() {
    return DialogueTree(
      id: 'ch2_aria_joined',
      name: 'Aria\'s Resolve',
      startNodeId: 'commitment',
      nodes: {
        'commitment': DialogueTreeNode(
          id: 'commitment',
          text: 'I know I\'m just a scholar, not a warrior like you two.',
          speaker: 'Aria',
          nextNodeId: 'determination',
        ),
        'determination': DialogueTreeNode(
          id: 'determination',
          text: 'But my research... everything I\'ve learned about the lighthouses says activating them would be disastrous.',
          speaker: 'Aria',
          nextNodeId: 'choice_moment',
        ),
        'choice_moment': DialogueTreeNode(
          id: 'choice_moment',
          text: 'I can\'t just sit in a library while the world is in danger.',
          speaker: 'Aria',
          choices: [
            DialogueTreeChoice(
              id: 'reassure',
              text: 'We\'re glad to have you with us.',
              nextNodeId: 'grateful',
              tone: ChoiceTone.diplomatic,
            ),
            DialogueTreeChoice(
              id: 'acknowledge_danger',
              text: 'It won\'t be easy. Are you ready for that?',
              nextNodeId: 'ready',
              tone: ChoiceTone.pragmatic,
            ),
            DialogueTreeChoice(
              id: 'value_knowledge',
              text: 'Your knowledge is as important as any weapon.',
              nextNodeId: 'valued',
              tone: ChoiceTone.curious,
            ),
          ],
        ),
        'grateful': DialogueTreeNode(
          id: 'grateful',
          text: 'Thank you. Together, we\'ll figure this out.',
          speaker: 'Aria',
          action: DialogueAction(
            type: DialogueActionType.modifyRelationship,
            parameters: {
              'character1': 'kai',
              'character2': 'aria',
              'change': '10',
            },
          ),
        ),
        'ready': DialogueTreeNode(
          id: 'ready',
          text: 'I am. Sometimes knowledge isn\'t enough - you have to act.',
          speaker: 'Aria',
          action: DialogueAction(
            type: DialogueActionType.modifyRelationship,
            parameters: {
              'character1': 'kai',
              'character2': 'aria',
              'change': '5',
            },
          ),
        ),
        'valued': DialogueTreeNode(
          id: 'valued',
          text: 'That means a lot. I\'ll do my best to guide us with what I know.',
          speaker: 'Aria',
          action: DialogueAction(
            type: DialogueActionType.modifyRelationship,
            parameters: {
              'character1': 'kai',
              'character2': 'aria',
              'change': '10',
            },
          ),
        ),
      },
    );
  }

  /// Dialogue with merchant (side quest giver)
  static DialogueTree createMerchantDialogue() {
    return DialogueTree(
      id: 'ch2_merchant_bandits',
      name: 'Merchant in Trouble',
      startNodeId: 'distress',
      nodes: {
        'distress': DialogueTreeNode(
          id: 'distress',
          text: 'Thank the spirits! You look like capable Adepts.',
          speaker: 'Merchant',
          nextNodeId: 'explain',
        ),
        'explain': DialogueTreeNode(
          id: 'explain',
          text: 'Bandits have been attacking travelers on the road. My goods are trapped at my warehouse!',
          speaker: 'Merchant',
          choices: [
            DialogueTreeChoice(
              id: 'offer_help',
              text: 'We can clear the road for you.',
              nextNodeId: 'grateful_accept',
              tone: ChoiceTone.diplomatic,
            ),
            DialogueTreeChoice(
              id: 'ask_reward',
              text: 'What\'s in it for us?',
              nextNodeId: 'offer_payment',
              tone: ChoiceTone.pragmatic,
            ),
            DialogueTreeChoice(
              id: 'decline',
              text: 'Sorry, we don\'t have time.',
              nextNodeId: 'disappointed',
              tone: ChoiceTone.aggressive,
            ),
          ],
        ),
        'grateful_accept': DialogueTreeNode(
          id: 'grateful_accept',
          text: 'Bless you! I\'ll make it worth your while, I promise!',
          speaker: 'Merchant',
          action: DialogueAction(
            type: DialogueActionType.startQuest,
            parameters: {'questId': 'ch2_side_merchant_trouble'},
          ),
        ),
        'offer_payment': DialogueTreeNode(
          id: 'offer_payment',
          text: 'Of course! I\'ll pay handsomely. Just help me get my business back on track.',
          speaker: 'Merchant',
          action: DialogueAction(
            type: DialogueActionType.startQuest,
            parameters: {'questId': 'ch2_side_merchant_trouble'},
          ),
        ),
        'disappointed': DialogueTreeNode(
          id: 'disappointed',
          text: 'I... understand. Good luck with your travels.',
          speaker: 'Merchant',
        ),
      },
    );
  }

  /// Get all chapter 2 content
  static Map<String, dynamic> getAllContent() {
    return {
      'chapter_id': chapterId,
      'chapter_name': chapterName,
      'chapter_description': chapterDescription,
      'cutscenes': {
        'first_town_arrival': createFirstTownArrivalCutscene(),
        'investigation_complete': createInvestigationCompleteCutscene(),
        'second_town_arrival': createSecondTownArrivalCutscene(),
        'aria_introduction': createAriaIntroductionCutscene(),
      },
      'quests': {
        'main': createMainQuest(),
        'side_merchant': createSideQuestMerchantTrouble(),
        'side_ancient_text': createSideQuestAncientText(),
      },
      'dialogues': {
        'townsperson': createTownspersonDialogue(),
        'aria_joined': createAriaJoinedDialogue(),
        'merchant': createMerchantDialogue(),
      },
    };
  }
}
