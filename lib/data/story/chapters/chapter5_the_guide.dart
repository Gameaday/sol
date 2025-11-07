import '../../../models/quest.dart';
import '../../../models/dialogue_tree.dart';
import '../../../models/cutscene_script.dart';

/// Chapter 5: "The Guide"
/// Meeting the Wise One and learning the truth about sealing Alchemy
class Chapter5TheGuide {
  static const String chapterId = 'chapter_5';
  static const String chapterName = 'The Guide';
  static const String chapterDescription = 
      'Seeking guidance, the party encounters the Wise One, an ancient being '
      'who reveals the true nature of Alchemy and the path to sealing it. '
      'They learn what must be done and the sacrifices that may be required.';

  /// Journey to the Wise One cutscene
  static CutsceneScript createJourneyToWiseOneCutscene() {
    return CutsceneScript(
      id: 'ch5_journey_to_wise_one',
      name: 'Seeking the Wise One',
      events: [
        CutsceneEvent(
          type: CutsceneEventType.fadeIn,
          duration: 1.5,
        ),
        CutsceneEvent(
          type: CutsceneEventType.showText,
          text: 'The Sacred Grove - Ancient Forest',
          duration: 2.5,
        ),
        CutsceneEvent(
          type: CutsceneEventType.showDialogue,
          speaker: 'Aria',
          text: 'These trees... they\'re ancient beyond measure. This place feels timeless.',
          duration: 4.0,
        ),
        CutsceneEvent(
          type: CutsceneEventType.showDialogue,
          speaker: 'Zephyr',
          text: 'The winds are calm here. Peaceful. As if the world holds its breath.',
          duration: 4.0,
        ),
        CutsceneEvent(
          type: CutsceneEventType.showDialogue,
          speaker: 'Ember',
          text: 'Are you sure this Wise One will even see us?',
          duration: 3.0,
        ),
        CutsceneEvent(
          type: CutsceneEventType.playSound,
          soundId: 'mysterious_chime',
          duration: 2.0,
        ),
        CutsceneEvent(
          type: CutsceneEventType.showDialogue,
          speaker: 'Wise One',
          text: 'I have been expecting you, young heroes.',
          duration: 3.0,
        ),
        CutsceneEvent(
          type: CutsceneEventType.fadeOut,
          duration: 1.0,
        ),
      ],
      canSkip: false,  // Critical story moment
    );
  }

  /// Meeting the Wise One cutscene
  static CutsceneScript createWiseOneMeetingCutscene() {
    return CutsceneScript(
      id: 'ch5_wise_one_meeting',
      name: 'The Wise One Appears',
      events: [
        CutsceneEvent(
          type: CutsceneEventType.fadeIn,
          duration: 1.5,
        ),
        CutsceneEvent(
          type: CutsceneEventType.playAnimation,
          animationId: 'wise_one_appears',
          duration: 3.0,
        ),
        CutsceneEvent(
          type: CutsceneEventType.showDialogue,
          speaker: 'Kai',
          text: 'You... you\'re the Wise One?',
          duration: 2.5,
        ),
        CutsceneEvent(
          type: CutsceneEventType.showDialogue,
          speaker: 'Wise One',
          text: 'I am known by many names. Guardian. Keeper. Observer of the balance.',
          duration: 4.0,
        ),
        CutsceneEvent(
          type: CutsceneEventType.showDialogue,
          speaker: 'Wise One',
          text: 'You seek to stop the lighthouse project. But do you understand what you truly face?',
          duration: 4.5,
        ),
        CutsceneEvent(
          type: CutsceneEventType.showDialogue,
          speaker: 'Aria',
          text: 'The activation of the four lighthouses would release tremendous Alchemical energy.',
          duration: 4.0,
        ),
        CutsceneEvent(
          type: CutsceneEventType.showDialogue,
          speaker: 'Wise One',
          text: 'More than that. It would return Alchemy to the world in full force.',
          duration: 3.5,
        ),
        CutsceneEvent(
          type: CutsceneEventType.showDialogue,
          speaker: 'Zephyr',
          text: 'Isn\'t Alchemy already in the world? We use Psynergy every day.',
          duration: 3.5,
        ),
        CutsceneEvent(
          type: CutsceneEventType.showDialogue,
          speaker: 'Wise One',
          text: 'What you access is but an echo. A fraction of true Alchemy.',
          duration: 3.5,
        ),
        CutsceneEvent(
          type: CutsceneEventType.showDialogue,
          speaker: 'Wise One',
          text: 'Long ago, Alchemy was sealed to prevent catastrophe. The lighthouses are the key to that seal.',
          duration: 5.0,
        ),
        CutsceneEvent(
          type: CutsceneEventType.showDialogue,
          speaker: 'Ember',
          text: 'Then the council wants to break the seal? Release full Alchemy?',
          duration: 3.5,
        ),
        CutsceneEvent(
          type: CutsceneEventType.showDialogue,
          speaker: 'Wise One',
          text: 'They believe it will empower Adepts. Make them gods among mortals.',
          duration: 4.0,
        ),
        CutsceneEvent(
          type: CutsceneEventType.showDialogue,
          speaker: 'Wise One',
          text: 'They do not see the danger. Power without wisdom breeds only destruction.',
          duration: 4.0,
        ),
        CutsceneEvent(
          type: CutsceneEventType.fadeOut,
          duration: 1.5,
        ),
      ],
      canSkip: false,  // Critical lore reveal
    );
  }

  /// Learning about the sealing cutscene
  static CutsceneScript createSealingRevelationCutscene() {
    return CutsceneScript(
      id: 'ch5_sealing_revelation',
      name: 'The Path to Sealing',
      events: [
        CutsceneEvent(
          type: CutsceneEventType.fadeIn,
          duration: 1.0,
        ),
        CutsceneEvent(
          type: CutsceneEventType.showDialogue,
          speaker: 'Kai',
          text: 'How do we stop them permanently? We can\'t just keep stealing Spheres.',
          duration: 4.0,
        ),
        CutsceneEvent(
          type: CutsceneEventType.showDialogue,
          speaker: 'Wise One',
          text: 'You must do more than prevent activation. You must strengthen the seal.',
          duration: 4.0,
        ),
        CutsceneEvent(
          type: CutsceneEventType.showDialogue,
          speaker: 'Aria',
          text: 'Strengthen the seal? How?',
          duration: 2.5,
        ),
        CutsceneEvent(
          type: CutsceneEventType.showDialogue,
          speaker: 'Wise One',
          text: 'At the heart of Mount Aleph lies Sol Sanctum, where Alchemy was first sealed.',
          duration: 4.5,
        ),
        CutsceneEvent(
          type: CutsceneEventType.showDialogue,
          speaker: 'Wise One',
          text: 'With all four Elemental Spheres and the cooperation of the Master Djinn, you can reinforce the seal.',
          duration: 5.0,
        ),
        CutsceneEvent(
          type: CutsceneEventType.showDialogue,
          speaker: 'Zephyr',
          text: 'But Venus and Mars Master Djinn are already captured.',
          duration: 3.0,
        ),
        CutsceneEvent(
          type: CutsceneEventType.showDialogue,
          speaker: 'Wise One',
          text: 'You must retrieve them. Or calm their essences even while contained.',
          duration: 4.0,
        ),
        CutsceneEvent(
          type: CutsceneEventType.showDialogue,
          speaker: 'Ember',
          text: 'And the Jupiter and Mercury Djinn?',
          duration: 2.5,
        ),
        CutsceneEvent(
          type: CutsceneEventType.showDialogue,
          speaker: 'Wise One',
          text: 'Reach them first. Earn their trust. They are wild but noble.',
          duration: 3.5,
        ),
        CutsceneEvent(
          type: CutsceneEventType.showDialogue,
          speaker: 'Wise One',
          text: 'Four heroes. Four elements. Four Spheres. Four Djinn. The balance must be complete.',
          duration: 5.0,
        ),
        CutsceneEvent(
          type: CutsceneEventType.fadeOut,
          duration: 1.5,
        ),
      ],
      canSkip: false,  // Critical quest information
    );
  }

  /// Warning about sacrifice cutscene
  static CutsceneScript createSacrificeWarningCutscene() {
    return CutsceneScript(
      id: 'ch5_sacrifice_warning',
      name: 'The Cost of Sealing',
      events: [
        CutsceneEvent(
          type: CutsceneEventType.fadeIn,
          duration: 1.0,
        ),
        CutsceneEvent(
          type: CutsceneEventType.showDialogue,
          speaker: 'Kai',
          text: 'If we do this... seal Alchemy permanently... what happens to Adepts?',
          duration: 4.0,
        ),
        CutsceneEvent(
          type: CutsceneEventType.showDialogue,
          speaker: 'Wise One',
          text: 'Psynergy will fade over generations. Adepts will become as others.',
          duration: 4.0,
        ),
        CutsceneEvent(
          type: CutsceneEventType.showDialogue,
          speaker: 'Ember',
          text: 'We\'d be ending our own kind. Giving up what makes us special.',
          duration: 3.5,
        ),
        CutsceneEvent(
          type: CutsceneEventType.showDialogue,
          speaker: 'Wise One',
          text: 'You would be choosing equality over supremacy. Preventing tyranny.',
          duration: 4.0,
        ),
        CutsceneEvent(
          type: CutsceneEventType.showDialogue,
          speaker: 'Aria',
          text: 'And the ritual itself... what does it require?',
          duration: 3.0,
        ),
        CutsceneEvent(
          type: CutsceneEventType.showDialogue,
          speaker: 'Wise One',
          text: '...',
          duration: 2.0,
        ),
        CutsceneEvent(
          type: CutsceneEventType.showDialogue,
          speaker: 'Zephyr',
          text: 'You hesitate. What aren\'t you telling us?',
          duration: 3.0,
        ),
        CutsceneEvent(
          type: CutsceneEventType.showDialogue,
          speaker: 'Wise One',
          text: 'The sealing requires a tremendous sacrifice. Those who perform it...',
          duration: 4.0,
        ),
        CutsceneEvent(
          type: CutsceneEventType.showDialogue,
          speaker: 'Wise One',
          text: 'May not survive the ritual. Their essence becomes part of the seal.',
          duration: 4.0,
        ),
        CutsceneEvent(
          type: CutsceneEventType.playSound,
          soundId: 'solemn_wind',
          duration: 2.0,
        ),
        CutsceneEvent(
          type: CutsceneEventType.showDialogue,
          speaker: 'Kai',
          text: 'So we\'d be sacrificing ourselves?',
          duration: 2.5,
        ),
        CutsceneEvent(
          type: CutsceneEventType.showDialogue,
          speaker: 'Wise One',
          text: 'Perhaps. Perhaps not all. The ritual is ancient and dangerous.',
          duration: 4.0,
        ),
        CutsceneEvent(
          type: CutsceneEventType.showDialogue,
          speaker: 'Wise One',
          text: 'This is why I offer you a choice. You need not walk this path.',
          duration: 4.0,
        ),
        CutsceneEvent(
          type: CutsceneEventType.fadeOut,
          duration: 1.5,
        ),
      ],
      canSkip: false,  // Critical warning
    );
  }

  /// Party debate and resolve cutscene
  static CutsceneScript createPartyResolveCutscene() {
    return CutsceneScript(
      id: 'ch5_party_resolve',
      name: 'The Decision',
      events: [
        CutsceneEvent(
          type: CutsceneEventType.fadeIn,
          duration: 1.0,
        ),
        CutsceneEvent(
          type: CutsceneEventType.showText,
          text: 'After the Wise One Departs',
          duration: 2.0,
        ),
        CutsceneEvent(
          type: CutsceneEventType.showDialogue,
          speaker: 'Ember',
          text: 'We knew this wouldn\'t be easy, but... sacrifice?',
          duration: 3.5,
        ),
        CutsceneEvent(
          type: CutsceneEventType.showDialogue,
          speaker: 'Aria',
          text: 'My research never mentioned this. The cost is... enormous.',
          duration: 3.5,
        ),
        CutsceneEvent(
          type: CutsceneEventType.showDialogue,
          speaker: 'Zephyr',
          text: 'I\'ve seen visions of both futures. One where we act, one where we don\'t.',
          duration: 4.0,
        ),
        CutsceneEvent(
          type: CutsceneEventType.showDialogue,
          speaker: 'Zephyr',
          text: 'The world that results from inaction is... unbearable.',
          duration: 3.5,
        ),
        CutsceneEvent(
          type: CutsceneEventType.showDialogue,
          speaker: 'Kai',
          text: 'Then we continue. We knew from the start this was bigger than us.',
          duration: 3.5,
        ),
        CutsceneEvent(
          type: CutsceneEventType.showDialogue,
          speaker: 'Aria',
          text: 'If it means saving countless lives... preventing eternal tyranny...',
          duration: 3.5,
        ),
        CutsceneEvent(
          type: CutsceneEventType.showDialogue,
          speaker: 'Ember',
          text: 'I left my old life to fight for what\'s right. I won\'t turn back now.',
          duration: 3.5,
        ),
        CutsceneEvent(
          type: CutsceneEventType.showDialogue,
          speaker: 'Kai',
          text: 'Then it\'s decided. We get the remaining Spheres, protect the Djinn, and reach Sol Sanctum.',
          duration: 4.5,
        ),
        CutsceneEvent(
          type: CutsceneEventType.showDialogue,
          speaker: 'All',
          text: 'Together.',
          duration: 2.0,
        ),
        CutsceneEvent(
          type: CutsceneEventType.fadeOut,
          duration: 2.0,
        ),
      ],
      canSkip: true,
    );
  }

  /// Main quest: The Guide
  static Quest createMainQuest() {
    return Quest(
      id: 'ch5_main_the_guide',
      name: 'The Guide',
      description: 
          'Seek out the Wise One in the Sacred Grove to learn the truth about Alchemy '
          'and discover the path to permanently sealing it.',
      type: QuestType.main,
      objectives: [
        QuestObjective(
          id: 'find_sacred_grove',
          description: 'Journey to the Sacred Grove',
          type: ObjectiveType.reach,
          required: true,
          targetId: 'sacred_grove',
        ),
        QuestObjective(
          id: 'meet_wise_one',
          description: 'Encounter the Wise One',
          type: ObjectiveType.event,
          required: true,
        ),
        QuestObjective(
          id: 'learn_about_alchemy',
          description: 'Learn the truth about Alchemy and the seal',
          type: ObjectiveType.event,
          required: true,
        ),
        QuestObjective(
          id: 'discover_sealing_method',
          description: 'Discover how to strengthen the seal',
          type: ObjectiveType.event,
          required: true,
        ),
        QuestObjective(
          id: 'hear_sacrifice_warning',
          description: 'Learn about the cost of sealing',
          type: ObjectiveType.event,
          required: true,
        ),
        QuestObjective(
          id: 'party_decision',
          description: 'Decide on the path forward',
          type: ObjectiveType.event,
          required: true,
        ),
      ],
      reward: QuestReward(
        experience: 600,
        gold: 500,
        items: ['mystic_draught', 'psy_crystal', 'psy_crystal', 'holy_robe'],
      ),
      flagsToSetOnComplete: {
        'chapter_5_complete': true,
        'met_wise_one': true,
        'knows_sealing_method': true,
        'knows_about_sacrifice': true,
        'party_committed': true,
        'need_all_spheres': true,
        'need_all_djinn': true,
      },
      requiredFlags: {
        'chapter_4_complete': true,
        'need_new_strategy': true,
      },
    );
  }

  /// Side quest: Character bonding
  static Quest createSideQuestCharacterBonding() {
    return Quest(
      id: 'ch5_side_bonding',
      name: 'Bonds of Friendship',
      description: 
          'In light of the Wise One\'s warning, the party takes time to strengthen '
          'their bonds and understand each other better.',
      type: QuestType.side,
      objectives: [
        QuestObjective(
          id: 'kai_ember_talk',
          description: 'Have a heart-to-heart with Ember',
          type: ObjectiveType.talk,
          required: true,
          targetId: 'ember',
        ),
        QuestObjective(
          id: 'kai_aria_talk',
          description: 'Share knowledge with Aria',
          type: ObjectiveType.talk,
          required: true,
          targetId: 'aria',
        ),
        QuestObjective(
          id: 'kai_zephyr_talk',
          description: 'Discuss visions with Zephyr',
          type: ObjectiveType.talk,
          required: true,
          targetId: 'zephyr',
        ),
        QuestObjective(
          id: 'group_reflection',
          description: 'Reflect together as a group',
          type: ObjectiveType.event,
          required: true,
        ),
      ],
      reward: QuestReward(
        experience: 200,
        gold: 200,
        items: ['tear_stone', 'cookie', 'lucky_medal'],
      ),
      flagsToSetOnComplete: {
        'kai_ember_bond_3': true,
        'kai_aria_bond_3': true,
        'kai_zephyr_bond_3': true,
        'party_unity_maximum': true,
      },
      requiredFlags: {
        'party_committed': true,
      },
    );
  }

  /// Side quest: Testing resolve
  static Quest createSideQuestTestingResolve() {
    return Quest(
      id: 'ch5_side_resolve_test',
      name: 'Test of Resolve',
      description: 
          'The Wise One offers a trial to test whether the party truly has '
          'the strength to see their mission through.',
      type: QuestType.side,
      objectives: [
        QuestObjective(
          id: 'accept_trial',
          description: 'Accept the Wise One\'s trial',
          type: ObjectiveType.talk,
          required: true,
          targetId: 'wise_one',
        ),
        QuestObjective(
          id: 'trial_of_earth',
          description: 'Face the Trial of Earth',
          type: ObjectiveType.defeat,
          required: true,
          targetId: 'earth_trial_phantom',
        ),
        QuestObjective(
          id: 'trial_of_fire',
          description: 'Face the Trial of Fire',
          type: ObjectiveType.defeat,
          required: true,
          targetId: 'fire_trial_phantom',
        ),
        QuestObjective(
          id: 'trial_of_water',
          description: 'Face the Trial of Water',
          type: ObjectiveType.defeat,
          required: true,
          targetId: 'water_trial_phantom',
        ),
        QuestObjective(
          id: 'trial_of_wind',
          description: 'Face the Trial of Wind',
          type: ObjectiveType.defeat,
          required: true,
          targetId: 'wind_trial_phantom',
        ),
        QuestObjective(
          id: 'receive_blessing',
          description: 'Receive the Wise One\'s blessing',
          type: ObjectiveType.talk,
          required: true,
          targetId: 'wise_one',
        ),
      ],
      reward: QuestReward(
        experience: 400,
        gold: 0,
        items: ['blessed_mace', 'blessed_ankh', 'psychic_circlet', 'guardian_ring'],
      ),
      flagsToSetOnComplete: {
        'wise_one_blessing': true,
        'resolve_proven': true,
      },
      requiredFlags: {
        'party_committed': true,
      },
    );
  }

  /// Dialogue: Wise One's wisdom
  static DialogueTree createWiseOneWisdomDialogue() {
    return DialogueTree(
      id: 'ch5_wise_one_wisdom',
      name: 'The Wise One\'s Counsel',
      startNodeId: 'opening',
      nodes: {
        'opening': DialogueTreeNode(
          id: 'opening',
          text: 'You have questions. I will answer what I can.',
          speaker: 'Wise One',
          nextNodeId: 'player_choice',
        ),
        'player_choice': DialogueTreeNode(
          id: 'player_choice',
          text: '[What do you ask?]',
          speaker: 'Narrator',
          choices: [
            DialogueTreeChoice(
              id: 'ask_about_alchemy',
              text: 'Why was Alchemy sealed in the first place?',
              nextNodeId: 'alchemy_history',
              tone: ChoiceTone.curious,
            ),
            DialogueTreeChoice(
              id: 'ask_about_council',
              text: 'Who leads the lighthouse council?',
              nextNodeId: 'council_info',
              tone: ChoiceTone.pragmatic,
            ),
            DialogueTreeChoice(
              id: 'ask_about_future',
              text: 'What will happen if we succeed?',
              nextNodeId: 'future_vision',
              tone: ChoiceTone.diplomatic,
            ),
          ],
        ),
        'alchemy_history': DialogueTreeNode(
          id: 'alchemy_history',
          text: 'Alchemy gave mortals the power of gods. And like gods, they became destructive and cruel.',
          speaker: 'Wise One',
          nextNodeId: 'history_continuation',
        ),
        'history_continuation': DialogueTreeNode(
          id: 'history_continuation',
          text: 'War ravaged the world. Entire civilizations crumbled. The seal was necessary for survival.',
          speaker: 'Wise One',
        ),
        'council_info': DialogueTreeNode(
          id: 'council_info',
          text: 'Four powerful Adepts, one from each element. They believe themselves saviors.',
          speaker: 'Wise One',
          nextNodeId: 'council_warning',
        ),
        'council_warning': DialogueTreeNode(
          id: 'council_warning',
          text: 'But power corrupts even the well-intentioned. They have become the very tyrants they claim to oppose.',
          speaker: 'Wise One',
        ),
        'future_vision': DialogueTreeNode(
          id: 'future_vision',
          text: 'If you succeed, Alchemy will fade slowly. The world will find balance without supernatural power.',
          speaker: 'Wise One',
          nextNodeId: 'future_hope',
        ),
        'future_hope': DialogueTreeNode(
          id: 'future_hope',
          text: 'Mortals will grow through wisdom rather than might. It will be a better world.',
          speaker: 'Wise One',
        ),
      },
    );
  }

  /// Dialogue: Party member fears
  static DialogueTree createPartyFearsDialogue() {
    return DialogueTree(
      id: 'ch5_party_fears',
      name: 'Sharing Fears',
      startNodeId: 'aria_speaks',
      nodes: {
        'aria_speaks': DialogueTreeNode(
          id: 'aria_speaks',
          text: 'Can I be honest? The thought of sacrifice... it terrifies me.',
          speaker: 'Aria',
          nextNodeId: 'ember_responds',
        ),
        'ember_responds': DialogueTreeNode(
          id: 'ember_responds',
          text: 'Me too. I\'ve faced death in battle, but this feels different.',
          speaker: 'Ember',
          nextNodeId: 'zephyr_insight',
        ),
        'zephyr_insight': DialogueTreeNode(
          id: 'zephyr_insight',
          text: 'Because in battle, you can fight back. This... we go willingly into darkness.',
          speaker: 'Zephyr',
          nextNodeId: 'kai_choice',
        ),
        'kai_choice': DialogueTreeNode(
          id: 'kai_choice',
          text: '[How do you respond?]',
          speaker: 'Narrator',
          choices: [
            DialogueTreeChoice(
              id: 'reassure',
              text: 'We face it together. That\'s our strength.',
              nextNodeId: 'kai_reassures',
              tone: ChoiceTone.diplomatic,
            ),
            DialogueTreeChoice(
              id: 'acknowledge',
              text: 'Fear is natural. But we can\'t let it stop us.',
              nextNodeId: 'kai_acknowledges',
              tone: ChoiceTone.pragmatic,
            ),
            DialogueTreeChoice(
              id: 'defiant',
              text: 'We\'re not dead yet. Let\'s fight for every moment.',
              nextNodeId: 'kai_defiant',
              tone: ChoiceTone.aggressive,
            ),
          ],
        ),
        'kai_reassures': DialogueTreeNode(
          id: 'kai_reassures',
          text: 'Whatever happens, we won\'t be alone. We have each other.',
          speaker: 'Kai',
          action: DialogueAction(
            type: DialogueActionType.setFlag,
            parameters: {'flag': 'party_comforted', 'value': 'true'},
          ),
        ),
        'kai_acknowledges': DialogueTreeNode(
          id: 'kai_acknowledges',
          text: 'The fear proves we\'re doing something that matters. Something worth the risk.',
          speaker: 'Kai',
          action: DialogueAction(
            type: DialogueActionType.setFlag,
            parameters: {'flag': 'party_resolved', 'value': 'true'},
          ),
        ),
        'kai_defiant': DialogueTreeNode(
          id: 'kai_defiant',
          text: 'The Wise One said "may not survive." That means we have a chance. I\'ll take those odds.',
          speaker: 'Kai',
          action: DialogueAction(
            type: DialogueActionType.setFlag,
            parameters: {'flag': 'party_determined', 'value': 'true'},
          ),
        ),
      },
    );
  }

  /// Get all chapter 5 content
  static Map<String, dynamic> getAllContent() {
    return {
      'chapter_id': chapterId,
      'chapter_name': chapterName,
      'chapter_description': chapterDescription,
      'cutscenes': {
        'journey_to_wise_one': createJourneyToWiseOneCutscene(),
        'wise_one_meeting': createWiseOneMeetingCutscene(),
        'sealing_revelation': createSealingRevelationCutscene(),
        'sacrifice_warning': createSacrificeWarningCutscene(),
        'party_resolve': createPartyResolveCutscene(),
      },
      'quests': {
        'main': createMainQuest(),
        'side_bonding': createSideQuestCharacterBonding(),
        'side_resolve_test': createSideQuestTestingResolve(),
      },
      'dialogues': {
        'wise_one_wisdom': createWiseOneWisdomDialogue(),
        'party_fears': createPartyFearsDialogue(),
      },
    };
  }
}
