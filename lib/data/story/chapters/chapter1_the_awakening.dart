import '../../../models/quest.dart';
import '../../../models/dialogue_tree.dart';
import '../../../models/cutscene_script.dart';

/// Chapter 1: "The Awakening"
/// Solo start with Kai witnessing injustice and deciding to act
class Chapter1TheAwakening {
  static const String chapterId = 'chapter_1';
  static const String chapterName = 'The Awakening';
  static const String chapterDescription = 
      'Kai witnesses the cruel treatment of non-adepts and decides to take action against the tower project.';

  /// Chapter 1 opening cutscene
  static CutsceneScript createOpeningCutscene() {
    return CutsceneScript(
      id: 'ch1_opening',
      name: 'Chapter 1 Opening',
      events: [
        CutsceneEvent(
          type: CutsceneEventType.fadeIn,
          duration: 2.0,
        ),
        CutsceneEvent(
          type: CutsceneEventType.showText,
          text: 'Long ago, in an age when Alchemy flowed freely...',
          duration: 4.0,
        ),
        CutsceneEvent(
          type: CutsceneEventType.fadeOut,
          duration: 1.0,
        ),
        CutsceneEvent(
          type: CutsceneEventType.fadeIn,
          duration: 1.5,
        ),
        CutsceneEvent(
          type: CutsceneEventType.showText,
          text: 'The world was divided between those blessed with power and those without.',
          duration: 4.0,
        ),
        CutsceneEvent(
          type: CutsceneEventType.showText,
          text: 'Adepts wielded the elements through Psynergy, shaping the world to their will.',
          duration: 4.0,
        ),
        CutsceneEvent(
          type: CutsceneEventType.showText,
          text: 'But power breeds corruption, and corruption breeds suffering.',
          duration: 4.0,
        ),
        CutsceneEvent(
          type: CutsceneEventType.fadeOut,
          duration: 1.5,
        ),
        CutsceneEvent(
          type: CutsceneEventType.fadeIn,
          duration: 1.5,
        ),
        CutsceneEvent(
          type: CutsceneEventType.showText,
          text: 'This is the story of four heroes who sought to seal away Alchemy itself...',
          duration: 5.0,
        ),
        CutsceneEvent(
          type: CutsceneEventType.showText,
          text: 'To save the world from those who would abuse its power.',
          duration: 4.0,
        ),
        CutsceneEvent(
          type: CutsceneEventType.fadeOut,
          duration: 2.0,
        ),
      ],
      canSkip: true,
    );
  }

  /// Witnessing injustice cutscene
  static CutsceneScript createInjusticeCutscene() {
    return CutsceneScript(
      id: 'ch1_injustice',
      name: 'Witness Injustice',
      events: [
        CutsceneEvent(
          type: CutsceneEventType.fadeIn,
          duration: 1.0,
        ),
        CutsceneEvent(
          type: CutsceneEventType.showDialogue,
          speaker: 'Guard',
          text: 'Out of the way, non-adept! This area is for your betters.',
          duration: 3.0,
        ),
        CutsceneEvent(
          type: CutsceneEventType.showDialogue,
          speaker: 'Villager',
          text: 'But my family lives here! I just want to—',
          duration: 2.5,
        ),
        CutsceneEvent(
          type: CutsceneEventType.showDialogue,
          speaker: 'Guard',
          text: 'I said MOVE!',
          duration: 2.0,
        ),
        CutsceneEvent(
          type: CutsceneEventType.playAnimation,
          animationId: 'guard_shove',
          duration: 1.5,
        ),
        CutsceneEvent(
          type: CutsceneEventType.showDialogue,
          speaker: 'Kai',
          text: '...This isn\'t right.',
          duration: 2.5,
        ),
        CutsceneEvent(
          type: CutsceneEventType.showDialogue,
          speaker: 'Kai',
          text: 'Something has to change.',
          duration: 2.5,
        ),
        CutsceneEvent(
          type: CutsceneEventType.fadeOut,
          duration: 1.5,
        ),
      ],
      canSkip: false,  // Important story moment
    );
  }

  /// Main quest: The Call to Adventure
  static Quest createMainQuest() {
    return Quest(
      id: 'ch1_main_the_call',
      name: 'The Call to Adventure',
      description: 
          'After witnessing the abuse of non-adepts, Kai decides to investigate rumors '
          'about a tower project that threatens the balance of Alchemy.',
      type: QuestType.main,
      objectives: [
        QuestObjective(
          id: 'witness_injustice',
          description: 'Witness the treatment of non-adepts',
          type: ObjectiveType.event,
          required: true,
        ),
        QuestObjective(
          id: 'talk_to_elder',
          description: 'Speak with the village elder about the towers',
          type: ObjectiveType.talk,
          required: true,
          targetId: 'village_elder',
        ),
        QuestObjective(
          id: 'explore_town',
          description: 'Explore the village and talk to residents (0/3)',
          type: ObjectiveType.talk,
          required: false,
          targetCount: 3,
        ),
        QuestObjective(
          id: 'leave_village',
          description: 'Leave the village to seek answers',
          type: ObjectiveType.reach,
          required: true,
          targetId: 'village_exit',
        ),
      ],
      reward: QuestReward(
        experience: 150,
        gold: 100,
        items: ['herb', 'herb', 'antidote'],
      ),
      flagsToSetOnComplete: {
        'chapter_1_complete': true,
        'knows_about_towers': true,
        'left_starting_village': true,
      },
    );
  }

  /// Side quest: Helping a villager
  static Quest createSideQuestHelpVillager() {
    return Quest(
      id: 'ch1_side_lost_child',
      name: 'A Child\'s Fear',
      description: 
          'A villager\'s child is afraid to go near the well after seeing guards there. '
          'Help restore their peace of mind.',
      type: QuestType.side,
      objectives: [
        QuestObjective(
          id: 'talk_to_mother',
          description: 'Speak with the worried mother',
          type: ObjectiveType.talk,
          required: true,
          targetId: 'worried_mother',
        ),
        QuestObjective(
          id: 'investigate_well',
          description: 'Investigate the well area',
          type: ObjectiveType.reach,
          required: true,
          targetId: 'village_well',
        ),
        QuestObjective(
          id: 'return_to_mother',
          description: 'Return to the mother',
          type: ObjectiveType.talk,
          required: true,
          targetId: 'worried_mother',
        ),
      ],
      reward: QuestReward(
        experience: 50,
        gold: 30,
        items: ['cookie'],
      ),
    );
  }

  /// Dialogue with village elder
  static DialogueTree createElderDialogue() {
    return DialogueTree(
      id: 'ch1_elder_main',
      name: 'Elder Discussion',
      startNodeId: 'greeting',
      nodes: {
        'greeting': DialogueTreeNode(
          id: 'greeting',
          text: 'Kai. I saw what happened in the square. You have a kind heart.',
          speaker: 'Village Elder',
          nextNodeId: 'concern',
        ),
        'concern': DialogueTreeNode(
          id: 'concern',
          text: 'But kindness alone won\'t change what\'s happening to our world.',
          speaker: 'Village Elder',
          choices: [
            DialogueTreeChoice(
              id: 'ask_what_happening',
              text: 'What is happening? Those guards...',
              nextNodeId: 'explain_towers',
              tone: ChoiceTone.curious,
            ),
            DialogueTreeChoice(
              id: 'express_anger',
              text: 'Someone needs to stop them!',
              nextNodeId: 'channel_anger',
              tone: ChoiceTone.aggressive,
            ),
            DialogueTreeChoice(
              id: 'express_fear',
              text: 'I\'m not sure what I can do...',
              nextNodeId: 'encouragement',
              tone: ChoiceTone.pragmatic,
            ),
          ],
        ),
        'explain_towers': DialogueTreeNode(
          id: 'explain_towers',
          text: 'There\'s a massive project underway - four towers being built at locations of great elemental power.',
          speaker: 'Village Elder',
          nextNodeId: 'explain_purpose',
        ),
        'explain_purpose': DialogueTreeNode(
          id: 'explain_purpose',
          text: 'They call them Elemental Lighthouses. If all four are activated, someone could control Alchemy itself.',
          speaker: 'Village Elder',
          nextNodeId: 'ask_help',
        ),
        'channel_anger': DialogueTreeNode(
          id: 'channel_anger',
          text: 'Your anger is justified, but it must be channeled wisely.',
          speaker: 'Village Elder',
          nextNodeId: 'explain_towers',
        ),
        'encouragement': DialogueTreeNode(
          id: 'encouragement',
          text: 'You have more strength than you know, young one. Listen...',
          speaker: 'Village Elder',
          nextNodeId: 'explain_towers',
        ),
        'ask_help': DialogueTreeNode(
          id: 'ask_help',
          text: 'I need someone brave enough to investigate. Will you help?',
          speaker: 'Village Elder',
          choices: [
            DialogueTreeChoice(
              id: 'accept_determined',
              text: 'I\'ll do whatever it takes to stop this.',
              nextNodeId: 'accepted',
              tone: ChoiceTone.aggressive,
              flagsToSet: {
                'accepted_with_determination': true,
              },
            ),
            DialogueTreeChoice(
              id: 'accept_careful',
              text: 'I\'ll investigate carefully.',
              nextNodeId: 'accepted',
              tone: ChoiceTone.pragmatic,
            ),
            DialogueTreeChoice(
              id: 'ask_more',
              text: 'Tell me more about these towers first.',
              nextNodeId: 'more_info',
              tone: ChoiceTone.curious,
            ),
          ],
        ),
        'more_info': DialogueTreeNode(
          id: 'more_info',
          text: 'The towers are at the four corners of the world. Venus, Mars, Jupiter, and Mercury.',
          speaker: 'Village Elder',
          nextNodeId: 'more_info_2',
        ),
        'more_info_2': DialogueTreeNode(
          id: 'more_info_2',
          text: 'Each is guarded by powerful forces. But if someone reaches them all and activates them...',
          speaker: 'Village Elder',
          nextNodeId: 'more_info_3',
        ),
        'more_info_3': DialogueTreeNode(
          id: 'more_info_3',
          text: 'They would wield power beyond imagination. And from what I\'ve seen, power corrupts.',
          speaker: 'Village Elder',
          choices: [
            DialogueTreeChoice(
              id: 'accept_informed',
              text: 'Then I must stop them.',
              nextNodeId: 'accepted',
              tone: ChoiceTone.diplomatic,
            ),
          ],
        ),
        'accepted': DialogueTreeNode(
          id: 'accepted',
          text: 'Thank you, Kai. I knew I could count on you.',
          speaker: 'Village Elder',
          nextNodeId: 'advice',
          flagsToSet: {
            'quest_accepted': true,
          },
        ),
        'advice': DialogueTreeNode(
          id: 'advice',
          text: 'Start by heading north to the training grounds. You\'ll need to prepare for the journey ahead.',
          speaker: 'Village Elder',
          nextNodeId: 'blessing',
        ),
        'blessing': DialogueTreeNode(
          id: 'blessing',
          text: 'May the spirits of Venus guide you.',
          speaker: 'Village Elder',
          action: DialogueAction(
            type: DialogueActionType.startQuest,
            parameters: {'questId': 'ch1_main_the_call'},
          ),
        ),
      },
    );
  }

  /// Dialogue with worried mother (side quest)
  static DialogueTree createWorriedMotherDialogue() {
    return DialogueTree(
      id: 'ch1_worried_mother',
      name: 'Worried Mother',
      startNodeId: 'plea',
      nodes: {
        'plea': DialogueTreeNode(
          id: 'plea',
          text: 'Oh, thank goodness someone stopped! My daughter won\'t go near the well anymore.',
          speaker: 'Worried Mother',
          nextNodeId: 'explain',
        ),
        'explain': DialogueTreeNode(
          id: 'explain',
          text: 'She saw the guards there earlier, pushing people around. Now she\'s too scared.',
          speaker: 'Worried Mother',
          choices: [
            DialogueTreeChoice(
              id: 'help_offer',
              text: 'I\'ll check the well area.',
              nextNodeId: 'grateful',
              tone: ChoiceTone.diplomatic,
            ),
            DialogueTreeChoice(
              id: 'angry_response',
              text: 'Those guards will answer for this.',
              nextNodeId: 'grateful_careful',
              tone: ChoiceTone.aggressive,
            ),
          ],
        ),
        'grateful': DialogueTreeNode(
          id: 'grateful',
          text: 'Oh, thank you! Please, just see if it\'s safe.',
          speaker: 'Worried Mother',
          action: DialogueAction(
            type: DialogueActionType.startQuest,
            parameters: {'questId': 'ch1_side_lost_child'},
          ),
        ),
        'grateful_careful': DialogueTreeNode(
          id: 'grateful_careful',
          text: 'Please be careful! I don\'t want anyone else to get hurt.',
          speaker: 'Worried Mother',
          action: DialogueAction(
            type: DialogueActionType.startQuest,
            parameters: {'questId': 'ch1_side_lost_child'},
          ),
        ),
      },
    );
  }

  /// Get all chapter 1 content
  static Map<String, dynamic> getAllContent() {
    return {
      'chapter_id': chapterId,
      'chapter_name': chapterName,
      'chapter_description': chapterDescription,
      'cutscenes': {
        'opening': createOpeningCutscene(),
        'injustice': createInjusticeCutscene(),
      },
      'quests': {
        'main': createMainQuest(),
        'side_lost_child': createSideQuestHelpVillager(),
      },
      'dialogues': {
        'elder': createElderDialogue(),
        'worried_mother': createWorriedMotherDialogue(),
      },
    };
  }
}
