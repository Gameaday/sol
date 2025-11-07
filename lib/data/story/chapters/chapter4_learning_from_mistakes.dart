import '../../../models/quest.dart';
import '../../../models/dialogue_tree.dart';
import '../../../models/cutscene_script.dart';

/// Chapter 4: "Learning from Mistakes"
/// Travel to Mars region, arrive late again at Mars Forge, pursue to Mars Lighthouse
class Chapter4LearningFromMistakes {
  static const String chapterId = 'chapter_4';
  static const String chapterName = 'Learning from Mistakes';
  static const String chapterDescription = 
      'The party travels to the Mars region, hoping to prevent another capture. '
      'Despite their best efforts, they arrive too late at the Mars Elemental Forge. '
      'They secure the Mars Sphere at the lighthouse but realize they need a new strategy.';

  /// Journey to Mars region cutscene
  static CutsceneScript createMarsJourneyCutscene() {
    return CutsceneScript(
      id: 'ch4_mars_journey',
      name: 'Journey to Mars Region',
      events: [
        CutsceneEvent(
          type: CutsceneEventType.fadeIn,
          duration: 1.5,
        ),
        CutsceneEvent(
          type: CutsceneEventType.showText,
          text: 'Several Days Later - On the Road',
          duration: 2.5,
        ),
        CutsceneEvent(
          type: CutsceneEventType.showDialogue,
          speaker: 'Ember',
          text: 'The Mars Forge should be just beyond these mountains. We\'re making good time.',
          duration: 3.5,
        ),
        CutsceneEvent(
          type: CutsceneEventType.showDialogue,
          speaker: 'Zephyr',
          text: 'Better than last time, but... I sense we may still be too late.',
          duration: 3.5,
        ),
        CutsceneEvent(
          type: CutsceneEventType.showDialogue,
          speaker: 'Kai',
          text: 'Your visions again?',
          duration: 2.0,
        ),
        CutsceneEvent(
          type: CutsceneEventType.showDialogue,
          speaker: 'Zephyr',
          text: 'Not visions. The wind carries news. There was activity at the Forge days ago.',
          duration: 4.0,
        ),
        CutsceneEvent(
          type: CutsceneEventType.showDialogue,
          speaker: 'Aria',
          text: 'Days? Then they might already have the Mars Master Djinn too.',
          duration: 3.5,
        ),
        CutsceneEvent(
          type: CutsceneEventType.showDialogue,
          speaker: 'Ember',
          text: 'We can still stop the lighthouse activation. We proved that at Venus.',
          duration: 3.5,
        ),
        CutsceneEvent(
          type: CutsceneEventType.showDialogue,
          speaker: 'Kai',
          text: 'But they\'re always one step ahead. We need to change our approach.',
          duration: 3.5,
        ),
        CutsceneEvent(
          type: CutsceneEventType.fadeOut,
          duration: 1.5,
        ),
      ],
      canSkip: true,
    );
  }

  /// Mars Forge arrival - too late again
  static CutsceneScript createMarsForgeTooLateCutscene() {
    return CutsceneScript(
      id: 'ch4_mars_forge_too_late',
      name: 'Mars Forge - Too Late',
      events: [
        CutsceneEvent(
          type: CutsceneEventType.fadeIn,
          duration: 1.5,
        ),
        CutsceneEvent(
          type: CutsceneEventType.showText,
          text: 'Mars Elemental Forge - Heart Chamber',
          duration: 2.5,
        ),
        CutsceneEvent(
          type: CutsceneEventType.playSound,
          soundId: 'forge_cooling',
          duration: 2.0,
        ),
        CutsceneEvent(
          type: CutsceneEventType.showDialogue,
          speaker: 'Ember',
          text: 'The flames have dimmed. The chamber is cold.',
          duration: 3.0,
        ),
        CutsceneEvent(
          type: CutsceneEventType.showDialogue,
          speaker: 'Aria',
          text: 'More binding spell residue. The same signature as at Venus Sanctuary.',
          duration: 3.5,
        ),
        CutsceneEvent(
          type: CutsceneEventType.showDialogue,
          speaker: 'Kai',
          text: 'Damn it! We failed again!',
          duration: 2.5,
        ),
        CutsceneEvent(
          type: CutsceneEventType.playAnimation,
          animationId: 'kai_frustrated',
          duration: 1.5,
        ),
        CutsceneEvent(
          type: CutsceneEventType.showDialogue,
          speaker: 'Zephyr',
          text: 'This was never about the Master Djinn. Not anymore.',
          duration: 3.0,
        ),
        CutsceneEvent(
          type: CutsceneEventType.showDialogue,
          speaker: 'Zephyr',
          text: 'They\'ve planned this for months, maybe years. They knew where to strike first.',
          duration: 4.0,
        ),
        CutsceneEvent(
          type: CutsceneEventType.showDialogue,
          speaker: 'Aria',
          text: 'Then what do we do? Keep chasing them to each lighthouse?',
          duration: 3.5,
        ),
        CutsceneEvent(
          type: CutsceneEventType.showDialogue,
          speaker: 'Ember',
          text: 'Yes. Because even if we can\'t save the Djinn, we can take the Spheres.',
          duration: 4.0,
        ),
        CutsceneEvent(
          type: CutsceneEventType.showDialogue,
          speaker: 'Ember',
          text: 'Without the Spheres, the lighthouses can\'t be used. That\'s our mission now.',
          duration: 4.0,
        ),
        CutsceneEvent(
          type: CutsceneEventType.fadeOut,
          duration: 1.5,
        ),
      ],
      canSkip: false,  // Important realization moment
    );
  }

  /// Mars Lighthouse assault cutscene
  static CutsceneScript createMarsLighthouseAssaultCutscene() {
    return CutsceneScript(
      id: 'ch4_mars_lighthouse_assault',
      name: 'Mars Lighthouse Assault',
      events: [
        CutsceneEvent(
          type: CutsceneEventType.fadeIn,
          duration: 1.5,
        ),
        CutsceneEvent(
          type: CutsceneEventType.showText,
          text: 'Mars Lighthouse - Entrance',
          duration: 2.5,
        ),
        CutsceneEvent(
          type: CutsceneEventType.playSound,
          soundId: 'fire_crackling',
          duration: 1.5,
        ),
        CutsceneEvent(
          type: CutsceneEventType.showDialogue,
          speaker: 'Ember',
          text: 'This lighthouse... I trained here once. Before I knew what it was really for.',
          duration: 4.0,
        ),
        CutsceneEvent(
          type: CutsceneEventType.showDialogue,
          speaker: 'Kai',
          text: 'You were part of this project?',
          duration: 2.5,
        ),
        CutsceneEvent(
          type: CutsceneEventType.showDialogue,
          speaker: 'Ember',
          text: 'A long time ago. Before I learned the truth about what they planned.',
          duration: 3.5,
        ),
        CutsceneEvent(
          type: CutsceneEventType.showDialogue,
          speaker: 'Zephyr',
          text: 'Your knowledge will help us. You know the layout.',
          duration: 3.0,
        ),
        CutsceneEvent(
          type: CutsceneEventType.showDialogue,
          speaker: 'Ember',
          text: 'I do. Follow me. And be ready for a fight.',
          duration: 3.0,
        ),
        CutsceneEvent(
          type: CutsceneEventType.fadeOut,
          duration: 1.5,
        ),
      ],
      canSkip: true,
    );
  }

  /// Mars Lighthouse victory and sphere secured
  static CutsceneScript createMarsLighthouseVictoryCutscene() {
    return CutsceneScript(
      id: 'ch4_mars_lighthouse_victory',
      name: 'Second Sphere Secured',
      events: [
        CutsceneEvent(
          type: CutsceneEventType.fadeIn,
          duration: 1.0,
        ),
        CutsceneEvent(
          type: CutsceneEventType.showText,
          text: 'Mars Lighthouse - Beacon Chamber',
          duration: 2.0,
        ),
        CutsceneEvent(
          type: CutsceneEventType.playAnimation,
          animationId: 'boss_defeated',
          duration: 2.0,
        ),
        CutsceneEvent(
          type: CutsceneEventType.showDialogue,
          speaker: 'Ember',
          text: 'It\'s done. The ritual is interrupted.',
          duration: 3.0,
        ),
        CutsceneEvent(
          type: CutsceneEventType.playAnimation,
          animationId: 'mars_sphere_reveal',
          duration: 2.5,
        ),
        CutsceneEvent(
          type: CutsceneEventType.showDialogue,
          speaker: 'Aria',
          text: 'The Mars Elemental Sphere. Two down, two to go.',
          duration: 3.0,
        ),
        CutsceneEvent(
          type: CutsceneEventType.showText,
          text: 'Obtained the Mars Elemental Sphere!',
          duration: 3.0,
        ),
        CutsceneEvent(
          type: CutsceneEventType.showDialogue,
          speaker: 'Kai',
          text: 'We\'re getting better at this. But we\'re still reactive, not proactive.',
          duration: 3.5,
        ),
        CutsceneEvent(
          type: CutsceneEventType.showDialogue,
          speaker: 'Zephyr',
          text: 'The pattern is clear now. Venus and Mars are captured. Jupiter and Mercury remain.',
          duration: 4.0,
        ),
        CutsceneEvent(
          type: CutsceneEventType.showDialogue,
          speaker: 'Aria',
          text: 'If we can reach the Jupiter or Mercury Sanctuaries before they do...',
          duration: 3.5,
        ),
        CutsceneEvent(
          type: CutsceneEventType.showDialogue,
          speaker: 'Ember',
          text: 'We could protect the Master Djinn. Maybe even recruit them to our cause.',
          duration: 4.0,
        ),
        CutsceneEvent(
          type: CutsceneEventType.showDialogue,
          speaker: 'Kai',
          text: 'That\'s the plan then. We race ahead instead of behind.',
          duration: 3.5,
        ),
        CutsceneEvent(
          type: CutsceneEventType.fadeOut,
          duration: 1.5,
        ),
      ],
      canSkip: true,
    );
  }

  /// Reflection cutscene - strategy discussion
  static CutsceneScript createStrategyReflectionCutscene() {
    return CutsceneScript(
      id: 'ch4_strategy_reflection',
      name: 'A New Strategy',
      events: [
        CutsceneEvent(
          type: CutsceneEventType.fadeIn,
          duration: 1.0,
        ),
        CutsceneEvent(
          type: CutsceneEventType.showText,
          text: 'That Night - Camp',
          duration: 2.0,
        ),
        CutsceneEvent(
          type: CutsceneEventType.playSound,
          soundId: 'campfire_crackling',
          duration: 1.5,
        ),
        CutsceneEvent(
          type: CutsceneEventType.showDialogue,
          speaker: 'Aria',
          text: 'Two Spheres secured, but two Master Djinn lost. Is this victory or defeat?',
          duration: 4.0,
        ),
        CutsceneEvent(
          type: CutsceneEventType.showDialogue,
          speaker: 'Ember',
          text: 'Both. We\'ve prevented two lighthouse activations, but they have the Djinn.',
          duration: 4.0,
        ),
        CutsceneEvent(
          type: CutsceneEventType.showDialogue,
          speaker: 'Zephyr',
          text: 'The Djinn are powerful, but the Spheres are essential. Without both, they can\'t complete their plan.',
          duration: 4.5,
        ),
        CutsceneEvent(
          type: CutsceneEventType.showDialogue,
          speaker: 'Kai',
          text: 'So we need to be faster. Smarter. Get to the remaining Sanctuaries first.',
          duration: 4.0,
        ),
        CutsceneEvent(
          type: CutsceneEventType.showDialogue,
          speaker: 'Aria',
          text: 'But which one? Jupiter Sky Sanctum or Mercury Frozen Abyss?',
          duration: 3.5,
        ),
        CutsceneEvent(
          type: CutsceneEventType.showDialogue,
          speaker: 'Ember',
          text: 'We need information. And maybe... help.',
          duration: 3.0,
        ),
        CutsceneEvent(
          type: CutsceneEventType.showDialogue,
          speaker: 'Zephyr',
          text: 'I\'ve heard rumors of a wise being who knows about Alchemy and the old ways.',
          duration: 4.0,
        ),
        CutsceneEvent(
          type: CutsceneEventType.showDialogue,
          speaker: 'Kai',
          text: 'Then that\'s our next destination. We need guidance.',
          duration: 3.0,
        ),
        CutsceneEvent(
          type: CutsceneEventType.fadeOut,
          duration: 2.0,
        ),
      ],
      canSkip: true,
    );
  }

  /// Main quest: Learning from Mistakes
  static Quest createMainQuest() {
    return Quest(
      id: 'ch4_main_learning_mistakes',
      name: 'Learning from Mistakes',
      description: 
          'Travel to the Mars region and attempt to prevent the capture of the Mars Master Djinn. '
          'When arriving too late again, secure the Mars Sphere and develop a new strategy.',
      type: QuestType.main,
      objectives: [
        QuestObjective(
          id: 'travel_to_mars_region',
          description: 'Journey to the Mars volcanic region',
          type: ObjectiveType.reach,
          required: true,
          targetId: 'mars_region',
        ),
        QuestObjective(
          id: 'reach_mars_forge',
          description: 'Find the Mars Elemental Forge',
          type: ObjectiveType.reach,
          required: true,
          targetId: 'mars_forge',
        ),
        QuestObjective(
          id: 'investigate_forge',
          description: 'Search the Forge for the Master Djinn',
          type: ObjectiveType.reach,
          required: true,
          targetId: 'mars_forge_heart_chamber',
        ),
        QuestObjective(
          id: 'reach_mars_lighthouse',
          description: 'Travel to Mars Lighthouse',
          type: ObjectiveType.reach,
          required: true,
          targetId: 'mars_lighthouse',
        ),
        QuestObjective(
          id: 'climb_mars_lighthouse',
          description: 'Ascend Mars Lighthouse to the beacon chamber',
          type: ObjectiveType.reach,
          required: true,
          targetId: 'mars_lighthouse_beacon',
        ),
        QuestObjective(
          id: 'stop_mars_activation',
          description: 'Prevent the Mars Lighthouse activation',
          type: ObjectiveType.defeat,
          required: true,
          targetId: 'mars_lighthouse_boss',
        ),
        QuestObjective(
          id: 'secure_mars_sphere',
          description: 'Obtain the Mars Elemental Sphere',
          type: ObjectiveType.collect,
          required: true,
          targetId: 'mars_sphere',
        ),
        QuestObjective(
          id: 'discuss_new_strategy',
          description: 'Regroup and plan next steps',
          type: ObjectiveType.event,
          required: true,
        ),
      ],
      reward: QuestReward(
        experience: 500,
        gold: 400,
        items: ['elixir', 'elixir', 'dragon_scales', 'psy_crystal'],
      ),
      flagsToSetOnComplete: {
        'chapter_4_complete': true,
        'mars_sphere_obtained': true,
        'mars_lighthouse_saved': true,
        'mars_master_djinn_captured': true,
        'need_new_strategy': true,
        'two_spheres_secured': true,
      },
      requiredFlags: {
        'chapter_3_complete': true,
        'full_party_complete': true,
      },
    );
  }

  /// Side quest: Ember's past
  static Quest createSideQuestEmberPast() {
    return Quest(
      id: 'ch4_side_ember_past',
      name: 'Echoes of the Past',
      description: 
          'Ember encounters her former commander at Mars Lighthouse. '
          'Confront the past and understand why she left the project.',
      type: QuestType.side,
      objectives: [
        QuestObjective(
          id: 'encounter_commander',
          description: 'Meet Ember\'s former commander',
          type: ObjectiveType.event,
          required: true,
        ),
        QuestObjective(
          id: 'dialogue_with_commander',
          description: 'Speak with the commander',
          type: ObjectiveType.talk,
          required: true,
          targetId: 'ember_former_commander',
        ),
        QuestObjective(
          id: 'support_ember',
          description: 'Support Ember through the confrontation',
          type: ObjectiveType.event,
          required: true,
        ),
      ],
      reward: QuestReward(
        experience: 180,
        gold: 150,
        items: ['tear_stone', 'psy_crystal'],
      ),
      flagsToSetOnComplete: {
        'ember_past_confronted': true,
        'ember_relationship_2': true,
      },
      requiredFlags: {
        'full_party_complete': true,
      },
    );
  }

  /// Side quest: Volcanic trials
  static Quest createSideQuestVolcanicTrials() {
    return Quest(
      id: 'ch4_side_volcanic_trials',
      name: 'Trial by Fire',
      description: 
          'Test the party\'s strength and coordination in the volcanic caverns '
          'beneath the Mars Forge.',
      type: QuestType.side,
      objectives: [
        QuestObjective(
          id: 'find_trial_entrance',
          description: 'Discover the entrance to the volcanic trials',
          type: ObjectiveType.reach,
          required: true,
          targetId: 'volcanic_trial_entrance',
        ),
        QuestObjective(
          id: 'complete_trial_1',
          description: 'Complete Trial of Endurance',
          type: ObjectiveType.defeat,
          required: true,
          targetId: 'trial_endurance_boss',
        ),
        QuestObjective(
          id: 'complete_trial_2',
          description: 'Complete Trial of Cooperation',
          type: ObjectiveType.event,
          required: true,
        ),
        QuestObjective(
          id: 'complete_trial_3',
          description: 'Complete Trial of Wisdom',
          type: ObjectiveType.event,
          required: true,
        ),
        QuestObjective(
          id: 'claim_reward',
          description: 'Claim the trial rewards',
          type: ObjectiveType.collect,
          required: true,
          targetId: 'volcanic_trial_treasure',
        ),
      ],
      reward: QuestReward(
        experience: 250,
        gold: 300,
        items: ['flame_circlet', 'elixir', 'mythril_silver'],
      ),
      requiredFlags: {
        'full_party_complete': true,
      },
    );
  }

  /// Dialogue: Ember confronting her past
  static DialogueTree createEmberPastDialogue() {
    return DialogueTree(
      id: 'ch4_ember_past_confrontation',
      name: 'Ember\'s Past',
      startNodeId: 'commander_greeting',
      nodes: {
        'commander_greeting': DialogueTreeNode(
          id: 'commander_greeting',
          text: 'Ember. I wondered if you\'d show up here.',
          speaker: 'Former Commander',
          nextNodeId: 'ember_response',
        ),
        'ember_response': DialogueTreeNode(
          id: 'ember_response',
          text: 'Commander Thorne. I\'m not here for a reunion.',
          speaker: 'Ember',
          nextNodeId: 'thorne_disappointment',
        ),
        'thorne_disappointment': DialogueTreeNode(
          id: 'thorne_disappointment',
          text: 'You were our best soldier. Then you threw it all away for what? Sentiment?',
          speaker: 'Former Commander',
          nextNodeId: 'player_choice',
        ),
        'player_choice': DialogueTreeNode(
          id: 'player_choice',
          text: '[Ember looks to you for support]',
          speaker: 'Narrator',
          choices: [
            DialogueTreeChoice(
              id: 'defend_ember',
              text: 'She chose the right path.',
              nextNodeId: 'kai_defends',
              tone: ChoiceTone.diplomatic,
            ),
            DialogueTreeChoice(
              id: 'question_thorne',
              text: 'What were you willing to do for power?',
              nextNodeId: 'kai_challenges',
              tone: ChoiceTone.aggressive,
            ),
            DialogueTreeChoice(
              id: 'stay_silent',
              text: '[Let Ember handle this]',
              nextNodeId: 'ember_stands_alone',
              tone: ChoiceTone.pragmatic,
            ),
          ],
        ),
        'kai_defends': DialogueTreeNode(
          id: 'kai_defends',
          text: 'Ember fights for what\'s right, not what\'s easy.',
          speaker: 'Kai',
          nextNodeId: 'ember_grateful',
        ),
        'ember_grateful': DialogueTreeNode(
          id: 'ember_grateful',
          text: 'Thank you. Yes, I chose conscience over orders. I\'d make that choice again.',
          speaker: 'Ember',
          action: DialogueAction(
            type: DialogueActionType.modifyRelationship,
            parameters: {
              'character1': 'kai',
              'character2': 'ember',
              'change': '15',
            },
          ),
        ),
        'kai_challenges': DialogueTreeNode(
          id: 'kai_challenges',
          text: 'How many innocents have you hurt in the name of this project?',
          speaker: 'Kai',
          nextNodeId: 'thorne_anger',
        ),
        'thorne_anger': DialogueTreeNode(
          id: 'thorne_anger',
          text: 'You know nothing of sacrifice! The lighthouse project will save Adepts!',
          speaker: 'Former Commander',
          nextNodeId: 'ember_realization',
        ),
        'ember_realization': DialogueTreeNode(
          id: 'ember_realization',
          text: 'At the cost of everyone else. I see clearly now why I left.',
          speaker: 'Ember',
          action: DialogueAction(
            type: DialogueActionType.setFlag,
            parameters: {'flag': 'ember_closure', 'value': 'true'},
          ),
        ),
        'ember_stands_alone': DialogueTreeNode(
          id: 'ember_stands_alone',
          text: 'I don\'t need anyone\'s validation. I know what I saw, what you were willing to do.',
          speaker: 'Ember',
          nextNodeId: 'ember_resolute',
        ),
        'ember_resolute': DialogueTreeNode(
          id: 'ember_resolute',
          text: 'I\'m stopping this project, Commander. With or without your understanding.',
          speaker: 'Ember',
          action: DialogueAction(
            type: DialogueActionType.modifyRelationship,
            parameters: {
              'character1': 'kai',
              'character2': 'ember',
              'change': '10',
            },
          ),
        ),
      },
    );
  }

  /// Dialogue: Strategy discussion
  static DialogueTree createStrategyDialogue() {
    return DialogueTree(
      id: 'ch4_strategy_discussion',
      name: 'Planning Ahead',
      startNodeId: 'assessment',
      nodes: {
        'assessment': DialogueTreeNode(
          id: 'assessment',
          text: 'We have two Spheres. They have two Master Djinn. It\'s a stalemate.',
          speaker: 'Zephyr',
          nextNodeId: 'aria_analysis',
        ),
        'aria_analysis': DialogueTreeNode(
          id: 'aria_analysis',
          text: 'Not quite. According to the texts, both the Sphere AND the Djinn are needed to activate a lighthouse.',
          speaker: 'Aria',
          nextNodeId: 'ember_insight',
        ),
        'ember_insight': DialogueTreeNode(
          id: 'ember_insight',
          text: 'So even with the Djinn, they can\'t light Venus or Mars Lighthouses without the Spheres we took.',
          speaker: 'Ember',
          nextNodeId: 'kai_conclusion',
        ),
        'kai_conclusion': DialogueTreeNode(
          id: 'kai_conclusion',
          text: 'And if we get the Jupiter and Mercury Spheres before they get those Djinn...',
          speaker: 'Kai',
          nextNodeId: 'all_agree',
        ),
        'all_agree': DialogueTreeNode(
          id: 'all_agree',
          text: 'Then none of the four lighthouses can be activated. The plan is clear.',
          speaker: 'Zephyr',
          action: DialogueAction(
            type: DialogueActionType.setFlag,
            parameters: {'flag': 'strategy_established', 'value': 'true'},
          ),
        ),
      },
    );
  }

  /// Get all chapter 4 content
  static Map<String, dynamic> getAllContent() {
    return {
      'chapter_id': chapterId,
      'chapter_name': chapterName,
      'chapter_description': chapterDescription,
      'cutscenes': {
        'mars_journey': createMarsJourneyCutscene(),
        'mars_forge_too_late': createMarsForgeTooLateCutscene(),
        'mars_lighthouse_assault': createMarsLighthouseAssaultCutscene(),
        'mars_lighthouse_victory': createMarsLighthouseVictoryCutscene(),
        'strategy_reflection': createStrategyReflectionCutscene(),
      },
      'quests': {
        'main': createMainQuest(),
        'side_ember_past': createSideQuestEmberPast(),
        'side_volcanic_trials': createSideQuestVolcanicTrials(),
      },
      'dialogues': {
        'ember_past': createEmberPastDialogue(),
        'strategy': createStrategyDialogue(),
      },
    };
  }
}
