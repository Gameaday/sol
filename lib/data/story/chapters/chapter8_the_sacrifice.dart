import '../../../models/quest.dart';
import '../../../models/dialogue_tree.dart';
import '../../../models/cutscene_script.dart';

/// Chapter 8: "The Sacrifice"
/// The final chapter - Journey to Sol Sanctum, the sealing ritual, sacrifices, and epilogue
class Chapter8TheSacrifice {
  static const String chapterId = 'chapter_8';
  static const String chapterName = 'The Sacrifice';
  static const String chapterDescription = 
      'The heroes journey to Sol Sanctum at the heart of Mount Aleph to perform '
      'the sealing ritual. Facing the tower leaders in a final battle, they succeed '
      'in sealing Alchemy - but at a tremendous cost. Aria and Zephyr sacrifice themselves '
      'to complete the ritual, leaving Kai and Ember to found Vale and bridge to Golden Sun.';

  /// Journey to Sol Sanctum cutscene
  static CutsceneScript createJourneyToSolSanctumCutscene() {
    return CutsceneScript(
      id: 'ch8_journey_sol_sanctum',
      name: 'Journey to Sol Sanctum',
      events: [
        CutsceneEvent(
          type: CutsceneEventType.fadeIn,
          duration: 1.5,
        ),
        CutsceneEvent(
          type: CutsceneEventType.showText,
          text: 'Mount Aleph - The Sacred Mountain',
          duration: 2.5,
        ),
        CutsceneEvent(
          type: CutsceneEventType.showDialogue,
          speaker: 'Kai',
          text: 'There it is. Mount Aleph. Where it all began.',
          duration: 3.5,
        ),
        CutsceneEvent(
          type: CutsceneEventType.showDialogue,
          speaker: 'Aeolus',
          text: 'And where it will end. The seal originated here, and here it shall be renewed.',
          duration: 4.5,
        ),
        CutsceneEvent(
          type: CutsceneEventType.showDialogue,
          speaker: 'Aria',
          text: 'Sol Sanctum lies within. The most sacred place in all the world.',
          duration: 4.0,
        ),
        CutsceneEvent(
          type: CutsceneEventType.showDialogue,
          speaker: 'Ember',
          text: 'Then let\'s not keep history waiting.',
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

  /// Entering Sol Sanctum cutscene
  static CutsceneScript createEnteringSolSanctumCutscene() {
    return CutsceneScript(
      id: 'ch8_entering_sol_sanctum',
      name: 'Sol Sanctum Entrance',
      events: [
        CutsceneEvent(
          type: CutsceneEventType.fadeIn,
          duration: 1.5,
        ),
        CutsceneEvent(
          type: CutsceneEventType.showText,
          text: 'Sol Sanctum - Inner Chamber',
          duration: 2.5,
        ),
        CutsceneEvent(
          type: CutsceneEventType.playAnimation,
          animationId: 'ancient_chamber_glow',
          duration: 3.0,
        ),
        CutsceneEvent(
          type: CutsceneEventType.showDialogue,
          speaker: 'Zephyr',
          text: 'The power here... it\'s overwhelming. I can feel centuries of Alchemy saturating the air.',
          duration: 5.0,
        ),
        CutsceneEvent(
          type: CutsceneEventType.showDialogue,
          speaker: 'Oceanus',
          text: 'This is where the original sealing took place. The residual energy remains.',
          duration: 4.5,
        ),
        CutsceneEvent(
          type: CutsceneEventType.playSound,
          soundId: 'ominous_footsteps',
          duration: 2.0,
        ),
        CutsceneEvent(
          type: CutsceneEventType.showDialogue,
          speaker: 'Unknown Voice',
          text: 'So you made it after all.',
          duration: 2.5,
        ),
        CutsceneEvent(
          type: CutsceneEventType.fadeOut,
          duration: 1.0,
        ),
      },
      canSkip: false,  // Critical moment
    );
  }

  /// Final boss confrontation cutscene
  static CutsceneScript createFinalBossCutscene() {
    return CutsceneScript(
      id: 'ch8_final_boss',
      name: 'The Tower Leaders',
      events: [
        CutsceneEvent(
          type: CutsceneEventType.fadeIn,
          duration: 1.0,
        ),
        CutsceneEvent(
          type: CutsceneEventType.playAnimation,
          animationId: 'tower_leaders_appear',
          duration: 3.0,
        ),
        CutsceneEvent(
          type: CutsceneEventType.showDialogue,
          speaker: 'Tower Leader',
          text: 'The four who stole our destiny. You think you can just walk in here?',
          duration: 4.0,
        ),
        CutsceneEvent(
          type: CutsceneEventType.showDialogue,
          speaker: 'Kai',
          text: 'We\'re here to finish this. Stand aside or face us.',
          duration: 3.5,
        ),
        CutsceneEvent(
          type: CutsceneEventType.showDialogue,
          speaker: 'Tower Leader',
          text: 'You would seal Alchemy forever! Condemn future generations to weakness!',
          duration: 4.0,
        ),
        CutsceneEvent(
          type: CutsceneEventType.showDialogue,
          speaker: 'Aria',
          text: 'We condemn no one. We save everyone - from tyranny, from war, from destruction.',
          duration: 4.5,
        ),
        CutsceneEvent(
          type: CutsceneEventType.showDialogue,
          speaker: 'Tower Leader',
          text: 'Then you are our enemy! We will take back the Spheres by force!',
          duration: 4.0,
        ),
        CutsceneEvent(
          type: CutsceneEventType.playAnimation,
          animationId: 'battle_ready',
          duration: 2.0,
        ),
        CutsceneEvent(
          type: CutsceneEventType.showDialogue,
          speaker: 'Ember',
          text: 'So be it. Let\'s end this!',
          duration: 2.5,
        ),
        CutsceneEvent(
          type: CutsceneEventType.fadeOut,
          duration: 1.0,
        ),
      ],
      canSkip: false,  // Final boss encounter
    );
  }

  /// Post-battle - preparing the ritual cutscene
  static CutsceneScript createPreparingRitualCutscene() {
    return CutsceneScript(
      id: 'ch8_preparing_ritual',
      name: 'Preparing the Ritual',
      events: [
        CutsceneEvent(
          type: CutsceneEventType.fadeIn,
          duration: 1.0,
        ),
        CutsceneEvent(
          type: CutsceneEventType.playAnimation,
          animationId: 'boss_defeated',
          duration: 2.0,
        ),
        CutsceneEvent(
          type: CutsceneEventType.showDialogue,
          speaker: 'Kai',
          text: 'It\'s done. They\'re defeated.',
          duration: 2.5,
        ),
        CutsceneEvent(
          type: CutsceneEventType.showDialogue,
          speaker: 'Aeolus',
          text: 'Now comes the moment we\'ve prepared for. The sealing ritual.',
          duration: 4.0,
        ),
        CutsceneEvent(
          type: CutsceneEventType.playAnimation,
          animationId: 'four_spheres_place',
          duration: 3.0,
        ),
        CutsceneEvent(
          type: CutsceneEventType.showDialogue,
          speaker: 'Oceanus',
          text: 'Place the four Elemental Spheres in their positions. Venus, Mars, Jupiter, Mercury.',
          duration: 5.0,
        ),
        CutsceneEvent(
          type: CutsceneEventType.playAnimation,
          animationId: 'spheres_resonate',
          duration: 3.0,
        ),
        CutsceneEvent(
          type: CutsceneEventType.showDialogue,
          speaker: 'Aria',
          text: 'The spheres are in place. Now the Master Djinn must channel Alchemy...',
          duration: 4.0,
        ),
        CutsceneEvent(
          type: CutsceneEventType.showDialogue,
          speaker: 'Aeolus',
          text: 'And the ritual requires conductors. Four souls to bind the seal.',
          duration: 4.0,
        ),
        CutsceneEvent(
          type: CutsceneEventType.showDialogue,
          speaker: 'Zephyr',
          text: 'The sacrifice the Wise One warned us about.',
          duration: 3.0,
        ),
        CutsceneEvent(
          type: CutsceneEventType.fadeOut,
          duration: 1.5,
        ),
      ],
      canSkip: false,  // Critical ritual setup
    );
  }

  /// Aria's sacrifice cutscene
  static CutsceneScript createAriaSacrificeCutscene() {
    return CutsceneScript(
      id: 'ch8_aria_sacrifice',
      name: 'Aria\'s Choice',
      events: [
        CutsceneEvent(
          type: CutsceneEventType.fadeIn,
          duration: 1.0,
        ),
        CutsceneEvent(
          type: CutsceneEventType.showDialogue,
          speaker: 'Aria',
          text: 'I\'ll go first.',
          duration: 2.5,
        ),
        CutsceneEvent(
          type: CutsceneEventType.showDialogue,
          speaker: 'Kai',
          text: 'Aria, wait—',
          duration: 2.0,
        ),
        CutsceneEvent(
          type: CutsceneEventType.showDialogue,
          speaker: 'Aria',
          text: 'I\'ve always been a scholar, Kai. I studied the old texts, but I never truly lived.',
          duration: 4.5,
        ),
        CutsceneEvent(
          type: CutsceneEventType.showDialogue,
          speaker: 'Aria',
          text: 'Until I met you three. You showed me what it means to fight for something greater.',
          duration: 4.5,
        ),
        CutsceneEvent(
          type: CutsceneEventType.showDialogue,
          speaker: 'Ember',
          text: 'Aria, please... there has to be another way.',
          duration: 3.0,
        ),
        CutsceneEvent(
          type: CutsceneEventType.showDialogue,
          speaker: 'Aria',
          text: 'There isn\'t. And I make this choice freely. For the future. For everyone.',
          duration: 4.5,
        ),
        CutsceneEvent(
          type: CutsceneEventType.playAnimation,
          animationId: 'aria_approaches_seal',
          duration: 2.5,
        ),
        CutsceneEvent(
          type: CutsceneEventType.showDialogue,
          speaker: 'Aria',
          text: 'Thank you all. For everything. Remember me.',
          duration: 3.5,
        ),
        CutsceneEvent(
          type: CutsceneEventType.playAnimation,
          animationId: 'aria_becomes_seal',
          duration: 5.0,
        ),
        CutsceneEvent(
          type: CutsceneEventType.playSound,
          soundId: 'seal_activation',
          duration: 3.0,
        ),
        CutsceneEvent(
          type: CutsceneEventType.showText,
          text: 'Mercury seal activated...',
          duration: 3.0,
        ),
        CutsceneEvent(
          type: CutsceneEventType.fadeOut,
          duration: 2.0,
        ),
      ],
      canSkip: false,  // Critical emotional moment
    );
  }

  /// Zephyr's sacrifice cutscene
  static CutsceneScript createZephyrSacrificeCutscene() {
    return CutsceneScript(
      id: 'ch8_zephyr_sacrifice',
      name: 'Zephyr\'s Vision',
      events: [
        CutsceneEvent(
          type: CutsceneEventType.fadeIn,
          duration: 1.0,
        ),
        CutsceneEvent(
          type: CutsceneEventType.showDialogue,
          speaker: 'Zephyr',
          text: 'I saw this moment in my visions. Many times.',
          duration: 3.5,
        ),
        CutsceneEvent(
          type: CutsceneEventType.showDialogue,
          speaker: 'Kai',
          text: 'Zephyr... you knew?',
          duration: 2.5,
        ),
        CutsceneEvent(
          type: CutsceneEventType.showDialogue,
          speaker: 'Zephyr',
          text: 'I knew one of the possible futures. And I chose to walk this path anyway.',
          duration: 4.5,
        ),
        CutsceneEvent(
          type: CutsceneEventType.showDialogue,
          speaker: 'Zephyr',
          text: 'Because I also saw what comes after. The peace. The harmony. The world we\'re creating.',
          duration: 5.0,
        ),
        CutsceneEvent(
          type: CutsceneEventType.showDialogue,
          speaker: 'Ember',
          text: 'This isn\'t fair! First Aria, now you!',
          duration: 3.0,
        ),
        CutsceneEvent(
          type: CutsceneEventType.showDialogue,
          speaker: 'Zephyr',
          text: 'Life rarely is. But we can make it better for those who come after.',
          duration: 4.0,
        ),
        CutsceneEvent(
          type: CutsceneEventType.showDialogue,
          speaker: 'Zephyr',
          text: 'Kai, Ember... you two will survive this. Build something good. Build... a village. Vale.',
          duration: 5.0,
        ),
        CutsceneEvent(
          type: CutsceneEventType.showDialogue,
          speaker: 'Kai',
          text: 'Vale...?',
          duration: 2.0,
        ),
        CutsceneEvent(
          type: CutsceneEventType.showDialogue,
          speaker: 'Zephyr',
          text: 'I\'ve seen it in the winds. Your legacy. Farewell, my friends.',
          duration: 4.0,
        ),
        CutsceneEvent(
          type: CutsceneEventType.playAnimation,
          animationId: 'zephyr_becomes_seal',
          duration: 5.0,
        ),
        CutsceneEvent(
          type: CutsceneEventType.playSound,
          soundId: 'seal_activation',
          duration: 3.0,
        ),
        CutsceneEvent(
          type: CutsceneEventType.showText,
          text: 'Jupiter seal activated...',
          duration: 3.0,
        ),
        CutsceneEvent(
          type: CutsceneEventType.fadeOut,
          duration: 2.0,
        ),
      ],
      canSkip: false,  // Critical emotional moment
    );
  }

  /// The sealing completion cutscene
  static CutsceneScript createSealingCompletionCutscene() {
    return CutsceneScript(
      id: 'ch8_sealing_completion',
      name: 'The Sealing',
      events: [
        CutsceneEvent(
          type: CutsceneEventType.fadeIn,
          duration: 1.0,
        ),
        CutsceneEvent(
          type: CutsceneEventType.showDialogue,
          speaker: 'Aeolus',
          text: 'Two seals are active. Kai, Ember - the final two seals require your essence as well.',
          duration: 5.0,
        ),
        CutsceneEvent(
          type: CutsceneEventType.showDialogue,
          speaker: 'Kai',
          text: 'We\'re ready.',
          duration: 2.0,
        ),
        CutsceneEvent(
          type: CutsceneEventType.showDialogue,
          speaker: 'Oceanus',
          text: 'Wait. The ritual can be completed with the Master Djinn themselves providing the final bonds.',
          duration: 5.0,
        ),
        CutsceneEvent(
          type: CutsceneEventType.showDialogue,
          speaker: 'Aeolus',
          text: 'We four Djinn can complete the seal. You two need not perish.',
          duration: 4.0,
        ),
        CutsceneEvent(
          type: CutsceneEventType.showDialogue,
          speaker: 'Ember',
          text: 'But... Aria and Zephyr already...',
          duration: 3.0,
        ),
        CutsceneEvent(
          type: CutsceneEventType.showDialogue,
          speaker: 'Oceanus',
          text: 'Their sacrifice was noble and necessary. But it need not be total. We can preserve you.',
          duration: 5.0,
        ),
        CutsceneEvent(
          type: CutsceneEventType.playAnimation,
          animationId: 'djinn_seal_activation',
          duration: 6.0,
        ),
        CutsceneEvent(
          type: CutsceneEventType.showText,
          text: 'Venus seal activated...',
          duration: 3.0,
        ),
        CutsceneEvent(
          type: CutsceneEventType.showText,
          text: 'Mars seal activated...',
          duration: 3.0,
        ),
        CutsceneEvent(
          type: CutsceneEventType.playAnimation,
          animationId: 'full_seal_complete',
          duration: 7.0,
        ),
        CutsceneEvent(
          type: CutsceneEventType.showText,
          text: 'The seal is complete!',
          duration: 4.0,
        ),
        CutsceneEvent(
          type: CutsceneEventType.showText,
          text: 'Alchemy has been sealed!',
          duration: 4.0,
        ),
        CutsceneEvent(
          type: CutsceneEventType.fadeOut,
          duration: 2.0,
        ),
      ],
      canSkip: false,  // Critical completion
    );
  }

  /// Epilogue - Vale foundation cutscene
  static CutsceneScript createValeFoundationCutscene() {
    return CutsceneScript(
      id: 'ch8_vale_foundation',
      name: 'Vale\'s Beginning',
      events: [
        CutsceneEvent(
          type: CutsceneEventType.fadeIn,
          duration: 2.0,
        ),
        CutsceneEvent(
          type: CutsceneEventType.showText,
          text: 'Many Years Later...',
          duration: 3.0,
        ),
        CutsceneEvent(
          type: CutsceneEventType.showText,
          text: 'At the Foot of Mount Aleph',
          duration: 3.0,
        ),
        CutsceneEvent(
          type: CutsceneEventType.playAnimation,
          animationId: 'village_established',
          duration: 4.0,
        ),
        CutsceneEvent(
          type: CutsceneEventType.showDialogue,
          speaker: 'Ember',
          text: 'It\'s grown so much. Our little village.',
          duration: 3.5,
        ),
        CutsceneEvent(
          type: CutsceneEventType.showDialogue,
          speaker: 'Kai',
          text: 'Vale. Just as Zephyr foretold. A home for those who remember.',
          duration: 4.0,
        ),
        CutsceneEvent(
          type: CutsceneEventType.showDialogue,
          speaker: 'Ember',
          text: 'Do you ever regret it? Sealing Alchemy?',
          duration: 3.0,
        ),
        CutsceneEvent(
          type: CutsceneEventType.showDialogue,
          speaker: 'Kai',
          text: 'Never. We did what was right. Aria and Zephyr knew that too.',
          duration: 4.0,
        ),
        CutsceneEvent(
          type: CutsceneEventType.showDialogue,
          speaker: 'Ember',
          text: 'Their sacrifice gave us this peace. We have to protect it.',
          duration: 4.0,
        ),
        CutsceneEvent(
          type: CutsceneEventType.showDialogue,
          speaker: 'Kai',
          text: 'We will. And Vale will stand as a reminder of why the seal must never be broken.',
          duration: 4.5,
        ),
        CutsceneEvent(
          type: CutsceneEventType.fadeOut,
          duration: 2.0,
        ),
      },
      canSkip: true,
    );
  }

  /// Final cutscene - Bridge to Golden Sun
  static CutsceneScript createBridgeToGoldenSunCutscene() {
    return CutsceneScript(
      id: 'ch8_bridge_golden_sun',
      name: 'The Legacy',
      events: [
        CutsceneEvent(
          type: CutsceneEventType.fadeIn,
          duration: 2.0,
        ),
        CutsceneEvent(
          type: CutsceneEventType.showText,
          text: 'Sol Sanctum - Present Day',
          duration: 3.0,
        ),
        CutsceneEvent(
          type: CutsceneEventType.playAnimation,
          animationId: 'sol_sanctum_exterior',
          duration: 3.0,
        ),
        CutsceneEvent(
          type: CutsceneEventType.showText,
          text: 'The seal has held for generations...',
          duration: 3.5,
        ),
        CutsceneEvent(
          type: CutsceneEventType.showText,
          text: 'Vale has prospered in the shadow of Mount Aleph...',
          duration: 3.5,
        ),
        CutsceneEvent(
          type: CutsceneEventType.showText,
          text: 'The story of four heroes has become legend...',
          duration: 3.5,
        ),
        CutsceneEvent(
          type: CutsceneEventType.playSound,
          soundId: 'mysterious_rumble',
          duration: 2.0,
        ),
        CutsceneEvent(
          type: CutsceneEventType.showText,
          text: 'But seals, like all things, can weaken with time...',
          duration: 4.0,
        ),
        CutsceneEvent(
          type: CutsceneEventType.showText,
          text: 'And new heroes will rise when they are needed most...',
          duration: 4.0,
        ),
        CutsceneEvent(
          type: CutsceneEventType.playAnimation,
          animationId: 'golden_sun_teaser',
          duration: 4.0,
        ),
        CutsceneEvent(
          type: CutsceneEventType.showText,
          text: 'Their story... is just beginning.',
          duration: 4.0,
        ),
        CutsceneEvent(
          type: CutsceneEventType.fadeOut,
          duration: 3.0,
        ),
      ],
      canSkip: false,  // Final story moment
    );
  }

  /// Main quest: The Sacrifice
  static Quest createMainQuest() {
    return Quest(
      id: 'ch8_main_sacrifice',
      name: 'The Sacrifice',
      description: 
          'Journey to Sol Sanctum and perform the sealing ritual to lock away Alchemy forever. '
          'Face the tower leaders, make the ultimate sacrifice, and ensure a peaceful future.',
      type: QuestType.main,
      objectives: [
        QuestObjective(
          id: 'reach_mount_aleph',
          description: 'Travel to Mount Aleph',
          type: ObjectiveType.reach,
          required: true,
          targetId: 'mount_aleph',
        ),
        QuestObjective(
          id: 'enter_sol_sanctum',
          description: 'Enter Sol Sanctum',
          type: ObjectiveType.reach,
          required: true,
          targetId: 'sol_sanctum',
        ),
        QuestObjective(
          id: 'defeat_tower_leaders',
          description: 'Defeat the Tower Leaders',
          type: ObjectiveType.defeat,
          required: true,
          targetId: 'tower_leaders_boss',
        ),
        QuestObjective(
          id: 'place_spheres',
          description: 'Place all four Elemental Spheres',
          type: ObjectiveType.event,
          required: true,
        ),
        QuestObjective(
          id: 'complete_ritual',
          description: 'Complete the sealing ritual',
          type: ObjectiveType.event,
          required: true,
        ),
        QuestObjective(
          id: 'witness_sacrifice',
          description: 'Witness the sacrifice of Aria and Zephyr',
          type: ObjectiveType.event,
          required: true,
        ),
        QuestObjective(
          id: 'seal_alchemy',
          description: 'Seal Alchemy forever',
          type: ObjectiveType.event,
          required: true,
        ),
        QuestObjective(
          id: 'found_vale',
          description: 'Establish the village of Vale',
          type: ObjectiveType.event,
          required: true,
        ),
      ],
      reward: QuestReward(
        experience: 2000,
        gold: 0,
        items: [],  // The reward is completing the story
      ),
      flagsToSetOnComplete: {
        'chapter_8_complete': true,
        'game_complete': true,
        'alchemy_sealed': true,
        'aria_sacrificed': true,
        'zephyr_sacrificed': true,
        'vale_founded': true,
        'bridge_to_golden_sun': true,
      },
      requiredFlags: {
        'chapter_7_complete': true,
        'all_four_djinn_ready': true,
      },
    );
  }

  /// Side quest: Memorializing the fallen
  static Quest createSideQuestMemorial() {
    return Quest(
      id: 'ch8_side_memorial',
      name: 'Eternal Remembrance',
      description: 
          'Create memorials for Aria and Zephyr in Vale so their sacrifice '
          'will never be forgotten.',
      type: QuestType.side,
      objectives: [
        QuestObjective(
          id: 'gather_memorial_materials',
          description: 'Gather materials for the memorials',
          type: ObjectiveType.collect,
          required: true,
          targetId: 'memorial_materials',
          targetCount: 8,
        ),
        QuestObjective(
          id: 'choose_memorial_location',
          description: 'Choose a location in Vale for the memorials',
          type: ObjectiveType.reach,
          required: true,
          targetId: 'memorial_site',
        ),
        QuestObjective(
          id: 'construct_aria_memorial',
          description: 'Construct Aria\'s memorial',
          type: ObjectiveType.event,
          required: true,
        ),
        QuestObjective(
          id: 'construct_zephyr_memorial',
          description: 'Construct Zephyr\'s memorial',
          type: ObjectiveType.event,
          required: true,
        ),
        QuestObjective(
          id: 'dedication_ceremony',
          description: 'Hold a dedication ceremony',
          type: ObjectiveType.event,
          required: true,
        ),
      ],
      reward: QuestReward(
        experience: 500,
        gold: 0,
        items: ['memory_crystal', 'eternal_flame'],
      ),
      flagsToSetOnComplete: {
        'memorials_created': true,
        'aria_remembered': true,
        'zephyr_remembered': true,
      },
      requiredFlags: {
        'vale_founded': true,
      },
    );
  }

  /// Dialogue: Final moments with Aria
  static DialogueTree createAriaFinalDialogue() {
    return DialogueTree(
      id: 'ch8_aria_final_words',
      name: 'Aria\'s Final Words',
      startNodeId: 'before_sacrifice',
      nodes: {
        'before_sacrifice': DialogueTreeNode(
          id: 'before_sacrifice',
          text: 'Kai, before I go... I need you to know something.',
          speaker: 'Aria',
          nextNodeId: 'confession',
        ),
        'confession': DialogueTreeNode(
          id: 'confession',
          text: 'When I joined you in that library, I was just looking for an adventure. A story for my books.',
          speaker: 'Aria',
          nextNodeId: 'realization',
        ),
        'realization': DialogueTreeNode(
          id: 'realization',
          text: 'But you three gave me more than that. You gave me a purpose. A family.',
          speaker: 'Aria',
          nextNodeId: 'gratitude',
        ),
        'gratitude': DialogueTreeNode(
          id: 'gratitude',
          text: 'Thank you for showing me what truly matters. Knowledge is important, but people... people are everything.',
          speaker: 'Aria',
          action: DialogueAction(
            type: DialogueActionType.setFlag,
            parameters: {'flag': 'aria_final_words_heard', 'value': 'true'},
          ),
        ),
      },
    );
  }

  /// Dialogue: Final moments with Zephyr
  static DialogueTree createZephyrFinalDialogue() {
    return DialogueTree(
      id: 'ch8_zephyr_final_words',
      name: 'Zephyr\'s Final Vision',
      startNodeId: 'prophecy',
      nodes: {
        'prophecy': DialogueTreeNode(
          id: 'prophecy',
          text: 'I see it clearly now. The future.',
          speaker: 'Zephyr',
          nextNodeId: 'future_vision',
        ),
        'future_vision': DialogueTreeNode(
          id: 'future_vision',
          text: 'Vale will thrive. Children will play without fear. The world will know peace.',
          speaker: 'Zephyr',
          nextNodeId: 'distant_future',
        ),
        'distant_future': DialogueTreeNode(
          id: 'distant_future',
          text: 'And far in the future, when the seal weakens, new heroes will rise. Your descendants, perhaps.',
          speaker: 'Zephyr',
          nextNodeId: 'blessing',
        ),
        'blessing': DialogueTreeNode(
          id: 'blessing',
          text: 'May the winds always guide them, as they guided us. Goodbye, my friends.',
          speaker: 'Zephyr',
          action: DialogueAction(
            type: DialogueActionType.setFlag,
            parameters: {'flag': 'zephyr_final_words_heard', 'value': 'true'},
          ),
        ),
      },
    );
  }

  /// Get all chapter 8 content
  static Map<String, dynamic> getAllContent() {
    return {
      'chapter_id': chapterId,
      'chapter_name': chapterName,
      'chapter_description': chapterDescription,
      'cutscenes': {
        'journey_sol_sanctum': createJourneyToSolSanctumCutscene(),
        'entering_sol_sanctum': createEnteringSolSanctumCutscene(),
        'final_boss': createFinalBossCutscene(),
        'preparing_ritual': createPreparingRitualCutscene(),
        'aria_sacrifice': createAriaSacrificeCutscene(),
        'zephyr_sacrifice': createZephyrSacrificeCutscene(),
        'sealing_completion': createSealingCompletionCutscene(),
        'vale_foundation': createValeFoundationCutscene(),
        'bridge_golden_sun': createBridgeToGoldenSunCutscene(),
      },
      'quests': {
        'main': createMainQuest(),
        'side_memorial': createSideQuestMemorial(),
      },
      'dialogues': {
        'aria_final': createAriaFinalDialogue(),
        'zephyr_final': createZephyrFinalDialogue(),
      },
    };
  }
}
