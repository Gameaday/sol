import '../../../models/quest.dart';
import '../../../models/dialogue_tree.dart';
import '../../../models/cutscene_script.dart';

/// Chapter 6: "Victory and Theft"
/// Party arrives in time at Jupiter and Mercury Sanctums, defeats Master Djinn,
/// collects all four spheres - then has three stolen
class Chapter6VictoryAndTheft {
  static const String chapterId = 'chapter_6';
  static const String chapterName = 'Victory and Theft';
  static const String chapterDescription = 
      'Learning from past mistakes, the party races ahead to the Jupiter Sky Sanctum '
      'and Mercury Frozen Abyss. They arrive in time, defeat the wild Master Djinn, '
      'and secure all four Elemental Spheres. But their victory is short-lived when '
      'three spheres are stolen in a daring heist.';

  /// Racing to Jupiter cutscene
  static CutsceneScript createRacingToJupiterCutscene() {
    return CutsceneScript(
      id: 'ch6_racing_to_jupiter',
      name: 'Racing Ahead',
      events: [
        CutsceneEvent(
          type: CutsceneEventType.fadeIn,
          duration: 1.5,
        ),
        CutsceneEvent(
          type: CutsceneEventType.showText,
          text: 'On the Road - Moving Fast',
          duration: 2.0,
        ),
        CutsceneEvent(
          type: CutsceneEventType.showDialogue,
          speaker: 'Ember',
          text: 'We\'ve been traveling for days without rest. Are we making it in time?',
          duration: 3.5,
        ),
        CutsceneEvent(
          type: CutsceneEventType.showDialogue,
          speaker: 'Zephyr',
          text: 'The winds tell me... yes. We\'re ahead of them for once.',
          duration: 3.5,
        ),
        CutsceneEvent(
          type: CutsceneEventType.showDialogue,
          speaker: 'Aria',
          text: 'The Jupiter Sky Sanctum is just beyond those clouds. We made it!',
          duration: 3.5,
        ),
        CutsceneEvent(
          type: CutsceneEventType.showDialogue,
          speaker: 'Kai',
          text: 'Finally, we beat them to one. Let\'s not waste this chance.',
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

  /// Jupiter Master Djinn encounter cutscene
  static CutsceneScript createJupiterDjinnEncounterCutscene() {
    return CutsceneScript(
      id: 'ch6_jupiter_djinn_encounter',
      name: 'Jupiter Master Djinn',
      events: [
        CutsceneEvent(
          type: CutsceneEventType.fadeIn,
          duration: 1.5,
        ),
        CutsceneEvent(
          type: CutsceneEventType.showText,
          text: 'Jupiter Sky Sanctum - Storm Chamber',
          duration: 2.5,
        ),
        CutsceneEvent(
          type: CutsceneEventType.playSound,
          soundId: 'thunder_crack',
          duration: 2.0,
        ),
        CutsceneEvent(
          type: CutsceneEventType.playAnimation,
          animationId: 'jupiter_djinn_appears',
          duration: 3.0,
        ),
        CutsceneEvent(
          type: CutsceneEventType.showDialogue,
          speaker: 'Zephyr',
          text: 'There! The Jupiter Master Djinn - Aeolus!',
          duration: 3.0,
        ),
        CutsceneEvent(
          type: CutsceneEventType.showDialogue,
          speaker: 'Aeolus',
          text: '*Shrieks with wind-like voice* WHO DARES ENTER MY DOMAIN?!',
          duration: 3.5,
        ),
        CutsceneEvent(
          type: CutsceneEventType.showDialogue,
          speaker: 'Kai',
          text: 'We\'re not here to capture you! Others are coming who would bind you!',
          duration: 3.5,
        ),
        CutsceneEvent(
          type: CutsceneEventType.showDialogue,
          speaker: 'Aeolus',
          text: 'LIES! ALL MORTALS SEEK TO CONTROL US!',
          duration: 3.0,
        ),
        CutsceneEvent(
          type: CutsceneEventType.playAnimation,
          animationId: 'lightning_attack',
          duration: 2.0,
        ),
        CutsceneEvent(
          type: CutsceneEventType.showDialogue,
          speaker: 'Aria',
          text: 'It won\'t listen! We\'ll have to subdue it!',
          duration: 3.0,
        ),
        CutsceneEvent(
          type: CutsceneEventType.showDialogue,
          speaker: 'Zephyr',
          text: 'We prove ourselves through strength, then earn its trust!',
          duration: 3.0,
        ),
        CutsceneEvent(
          type: CutsceneEventType.fadeOut,
          duration: 1.0,
        ),
      ],
      canSkip: false,  // Important boss encounter
    );
  }

  /// Jupiter Djinn defeated - earning trust cutscene
  static CutsceneScript createJupiterDjinnTrustCutscene() {
    return CutsceneScript(
      id: 'ch6_jupiter_djinn_trust',
      name: 'Earning Aeolus\'s Trust',
      events: [
        CutsceneEvent(
          type: CutsceneEventType.fadeIn,
          duration: 1.0,
        ),
        CutsceneEvent(
          type: CutsceneEventType.playAnimation,
          animationId: 'aeolus_calms',
          duration: 2.5,
        ),
        CutsceneEvent(
          type: CutsceneEventType.showDialogue,
          speaker: 'Aeolus',
          text: '*Breathing heavily* You... you are strong...',
          duration: 3.0,
        ),
        CutsceneEvent(
          type: CutsceneEventType.showDialogue,
          speaker: 'Zephyr',
          text: 'We don\'t want to bind you. We want to protect you - and the world.',
          duration: 4.0,
        ),
        CutsceneEvent(
          type: CutsceneEventType.showDialogue,
          speaker: 'Aeolus',
          text: 'Protect? The others who came before sought to capture me...',
          duration: 3.5,
        ),
        CutsceneEvent(
          type: CutsceneEventType.showDialogue,
          speaker: 'Kai',
          text: 'They already captured Venus and Mars Master Djinn. We\'re trying to stop them.',
          duration: 4.0,
        ),
        CutsceneEvent(
          type: CutsceneEventType.showDialogue,
          speaker: 'Aeolus',
          text: 'My brethren... captured? This cannot stand!',
          duration: 3.0,
        ),
        CutsceneEvent(
          type: CutsceneEventType.showDialogue,
          speaker: 'Aria',
          text: 'Will you help us? We need your cooperation to seal Alchemy and free your brethren.',
          duration: 4.5,
        ),
        CutsceneEvent(
          type: CutsceneEventType.showDialogue,
          speaker: 'Aeolus',
          text: 'You fight with honor. You bear the four elements. Yes... I will aid you.',
          duration: 4.0,
        ),
        CutsceneEvent(
          type: CutsceneEventType.playAnimation,
          animationId: 'aeolus_transforms_to_orb',
          duration: 3.0,
        ),
        CutsceneEvent(
          type: CutsceneEventType.showDialogue,
          speaker: 'Aeolus',
          text: 'Take my essence. When the time comes, I will awaken to help you.',
          duration: 4.0,
        ),
        CutsceneEvent(
          type: CutsceneEventType.showText,
          text: 'Obtained Aeolus - Jupiter Master Djinn!',
          duration: 3.0,
        ),
        CutsceneEvent(
          type: CutsceneEventType.showText,
          text: 'Obtained the Jupiter Elemental Sphere!',
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

  /// Journey to Mercury cutscene
  static CutsceneScript createJourneyToMercuryCutscene() {
    return CutsceneScript(
      id: 'ch6_journey_to_mercury',
      name: 'To Mercury Frozen Abyss',
      events: [
        CutsceneEvent(
          type: CutsceneEventType.fadeIn,
          duration: 1.5,
        ),
        CutsceneEvent(
          type: CutsceneEventType.showText,
          text: 'Several Days Later - Frozen Wastes',
          duration: 2.5,
        ),
        CutsceneEvent(
          type: CutsceneEventType.showDialogue,
          speaker: 'Ember',
          text: 'Three spheres now. And Aeolus is with us. We\'re doing it!',
          duration: 3.5,
        ),
        CutsceneEvent(
          type: CutsceneEventType.showDialogue,
          speaker: 'Aria',
          text: 'One more. Mercury\'s domain - the Frozen Abyss. My element.',
          duration: 3.5,
        ),
        CutsceneEvent(
          type: CutsceneEventType.showDialogue,
          speaker: 'Zephyr',
          text: 'The winds are calm. No sign of the council\'s forces yet.',
          duration: 3.5,
        ),
        CutsceneEvent(
          type: CutsceneEventType.showDialogue,
          speaker: 'Kai',
          text: 'We\'re still ahead. Let\'s keep it that way.',
          duration: 3.0,
        ),
        CutsceneEvent(
          type: CutsceneEventType.fadeOut,
          duration: 1.0,
        ),
      ],
      canSkip: true,
    );
  }

  /// Mercury Master Djinn encounter cutscene
  static CutsceneScript createMercuryDjinnEncounterCutscene() {
    return CutsceneScript(
      id: 'ch6_mercury_djinn_encounter',
      name: 'Mercury Master Djinn',
      events: [
        CutsceneEvent(
          type: CutsceneEventType.fadeIn,
          duration: 1.5,
        ),
        CutsceneEvent(
          type: CutsceneEventType.showText,
          text: 'Mercury Frozen Abyss - Crystal Heart',
          duration: 2.5,
        ),
        CutsceneEvent(
          type: CutsceneEventType.playAnimation,
          animationId: 'mercury_djinn_appears',
          duration: 3.0,
        ),
        CutsceneEvent(
          type: CutsceneEventType.showDialogue,
          speaker: 'Aria',
          text: 'The Mercury Master Djinn - Oceanus!',
          duration: 2.5,
        ),
        CutsceneEvent(
          type: CutsceneEventType.showDialogue,
          speaker: 'Oceanus',
          text: '*Voice like flowing water* So you have come. I sensed Aeolus\'s presence with you.',
          duration: 4.0,
        ),
        CutsceneEvent(
          type: CutsceneEventType.showDialogue,
          speaker: 'Kai',
          text: 'You know we\'re allies?',
          duration: 2.5,
        ),
        CutsceneEvent(
          type: CutsceneEventType.showDialogue,
          speaker: 'Oceanus',
          text: 'Aeolus and I are connected through ancient bonds. If they trust you, you must be worthy.',
          duration: 4.5,
        ),
        CutsceneEvent(
          type: CutsceneEventType.showDialogue,
          speaker: 'Oceanus',
          text: 'But I too must test your strength. The ritual demands it.',
          duration: 3.5,
        ),
        CutsceneEvent(
          type: CutsceneEventType.playAnimation,
          animationId: 'tidal_wave',
          duration: 2.0,
        ),
        CutsceneEvent(
          type: CutsceneEventType.showDialogue,
          speaker: 'Aria',
          text: 'We understand! Show us your power!',
          duration: 3.0,
        ),
        CutsceneEvent(
          type: CutsceneEventType.fadeOut,
          duration: 1.0,
        ),
      ],
      canSkip: false,  // Important boss encounter
    );
  }

  /// Mercury Djinn trust - all four spheres cutscene
  static CutsceneScript createAllFourSpheresCutscene() {
    return CutsceneScript(
      id: 'ch6_all_four_spheres',
      name: 'All Four Spheres United',
      events: [
        CutsceneEvent(
          type: CutsceneEventType.fadeIn,
          duration: 1.0,
        ),
        CutsceneEvent(
          type: CutsceneEventType.playAnimation,
          animationId: 'oceanus_transforms_to_orb',
          duration: 3.0,
        ),
        CutsceneEvent(
          type: CutsceneEventType.showDialogue,
          speaker: 'Oceanus',
          text: 'You are indeed worthy. Take my essence and the Mercury Sphere.',
          duration: 4.0,
        ),
        CutsceneEvent(
          type: CutsceneEventType.showText,
          text: 'Obtained Oceanus - Mercury Master Djinn!',
          duration: 3.0,
        ),
        CutsceneEvent(
          type: CutsceneEventType.showText,
          text: 'Obtained the Mercury Elemental Sphere!',
          duration: 3.0,
        ),
        CutsceneEvent(
          type: CutsceneEventType.playAnimation,
          animationId: 'four_spheres_resonate',
          duration: 4.0,
        ),
        CutsceneEvent(
          type: CutsceneEventType.showDialogue,
          speaker: 'Kai',
          text: 'All four Elemental Spheres! Venus, Mars, Jupiter, and Mercury!',
          duration: 4.0,
        ),
        CutsceneEvent(
          type: CutsceneEventType.showDialogue,
          speaker: 'Ember',
          text: 'We did it! The lighthouses can\'t be activated now!',
          duration: 3.5,
        ),
        CutsceneEvent(
          type: CutsceneEventType.showDialogue,
          speaker: 'Aria',
          text: 'And we have two of the four Master Djinn. We can complete the sealing ritual!',
          duration: 4.0,
        ),
        CutsceneEvent(
          type: CutsceneEventType.showDialogue,
          speaker: 'Zephyr',
          text: 'Now we just need to free the captured Djinn and reach Sol Sanctum...',
          duration: 4.0,
        ),
        CutsceneEvent(
          type: CutsceneEventType.playSound,
          soundId: 'ominous_rumble',
          duration: 2.0,
        ),
        CutsceneEvent(
          type: CutsceneEventType.showDialogue,
          speaker: 'Zephyr',
          text: 'Wait. Something\'s wrong.',
          duration: 2.5,
        ),
        CutsceneEvent(
          type: CutsceneEventType.fadeOut,
          duration: 1.0,
        ),
      },
      canSkip: true,
    );
  }

  /// The theft cutscene - dramatic heist
  static CutsceneScript createTheftCutscene() {
    return CutsceneScript(
      id: 'ch6_the_theft',
      name: 'The Theft',
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
          soundId: 'mysterious_footsteps',
          duration: 2.0,
        ),
        CutsceneEvent(
          type: CutsceneEventType.playAnimation,
          animationId: 'shadow_figures_approach',
          duration: 3.0,
        ),
        CutsceneEvent(
          type: CutsceneEventType.showDialogue,
          speaker: 'Kai',
          text: 'Who\'s there?!',
          duration: 2.0,
        ),
        CutsceneEvent(
          type: CutsceneEventType.playAnimation,
          animationId: 'binding_spell_cast',
          duration: 2.5,
        ),
        CutsceneEvent(
          type: CutsceneEventType.showDialogue,
          speaker: 'Ember',
          text: 'I can\'t move!',
          duration: 2.0,
        ),
        CutsceneEvent(
          type: CutsceneEventType.showDialogue,
          speaker: 'Thief Leader',
          text: 'Sleep well, heroes. We\'ll be taking those Spheres.',
          duration: 3.5,
        ),
        CutsceneEvent(
          type: CutsceneEventType.showDialogue,
          speaker: 'Aria',
          text: 'No! The spheres!',
          duration: 2.0,
        ),
        CutsceneEvent(
          type: CutsceneEventType.playAnimation,
          animationId: 'spheres_stolen',
          duration: 3.0,
        ),
        CutsceneEvent(
          type: CutsceneEventType.showDialogue,
          speaker: 'Zephyr',
          text: 'Wait... they only took three! Venus, Mars, and Mercury!',
          duration: 3.5,
        ),
        CutsceneEvent(
          type: CutsceneEventType.showDialogue,
          speaker: 'Thief Leader',
          text: 'We don\'t need all four. Three will do nicely for our purposes.',
          duration: 4.0,
        ),
        CutsceneEvent(
          type: CutsceneEventType.playSound,
          soundId: 'teleport_whoosh',
          duration: 2.0,
        ),
        CutsceneEvent(
          type: CutsceneEventType.showDialogue,
          speaker: 'Kai',
          text: 'They\'re gone...',
          duration: 2.5,
        ),
        CutsceneEvent(
          type: CutsceneEventType.fadeOut,
          duration: 2.0,
        ),
      ],
      canSkip: false,  // Critical plot twist
    );
  }

  /// Aftermath of theft cutscene
  static CutsceneScript createAftermathCutscene() {
    return CutsceneScript(
      id: 'ch6_aftermath',
      name: 'Aftermath',
      events: [
        CutsceneEvent(
          type: CutsceneEventType.fadeIn,
          duration: 1.0,
        ),
        CutsceneEvent(
          type: CutsceneEventType.showText,
          text: 'Morning',
          duration: 2.0,
        ),
        CutsceneEvent(
          type: CutsceneEventType.showDialogue,
          speaker: 'Ember',
          text: 'How could we be so careless? We had all four!',
          duration: 3.5,
        ),
        CutsceneEvent(
          type: CutsceneEventType.showDialogue,
          speaker: 'Kai',
          text: 'They used powerful binding magic. We couldn\'t have anticipated that.',
          duration: 4.0,
        ),
        CutsceneEvent(
          type: CutsceneEventType.showDialogue,
          speaker: 'Aria',
          text: 'But why leave the Jupiter Sphere? Why only take three?',
          duration: 3.5,
        ),
        CutsceneEvent(
          type: CutsceneEventType.showDialogue,
          speaker: 'Zephyr',
          text: 'I don\'t know. But we still have Jupiter, and we have Aeolus and Oceanus.',
          duration: 4.0,
        ),
        CutsceneEvent(
          type: CutsceneEventType.showDialogue,
          speaker: 'Aeolus',
          text: '*From orb form* The other spheres must be retrieved! The balance cannot be maintained with only one!',
          duration: 5.0,
        ),
        CutsceneEvent(
          type: CutsceneEventType.showDialogue,
          speaker: 'Kai',
          text: 'Then we go after them. To the lighthouses. We get those spheres back.',
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

  /// Main quest: Victory and Theft
  static Quest createMainQuest() {
    return Quest(
      id: 'ch6_main_victory_theft',
      name: 'Victory and Theft',
      description: 
          'Race to Jupiter Sky Sanctum and Mercury Frozen Abyss to secure the remaining '
          'Master Djinn and Elemental Spheres before the council. Victory turns to despair '
          'when three spheres are stolen.',
      type: QuestType.main,
      objectives: [
        QuestObjective(
          id: 'reach_jupiter_sanctum',
          description: 'Travel to Jupiter Sky Sanctum',
          type: ObjectiveType.reach,
          required: true,
          targetId: 'jupiter_sky_sanctum',
        ),
        QuestObjective(
          id: 'defeat_aeolus',
          description: 'Subdue Aeolus, the Jupiter Master Djinn',
          type: ObjectiveType.defeat,
          required: true,
          targetId: 'aeolus_boss',
        ),
        QuestObjective(
          id: 'earn_aeolus_trust',
          description: 'Earn Aeolus\'s cooperation',
          type: ObjectiveType.event,
          required: true,
        ),
        QuestObjective(
          id: 'obtain_jupiter_sphere',
          description: 'Obtain the Jupiter Elemental Sphere',
          type: ObjectiveType.collect,
          required: true,
          targetId: 'jupiter_sphere',
        ),
        QuestObjective(
          id: 'reach_mercury_abyss',
          description: 'Travel to Mercury Frozen Abyss',
          type: ObjectiveType.reach,
          required: true,
          targetId: 'mercury_frozen_abyss',
        ),
        QuestObjective(
          id: 'defeat_oceanus',
          description: 'Subdue Oceanus, the Mercury Master Djinn',
          type: ObjectiveType.defeat,
          required: true,
          targetId: 'oceanus_boss',
        ),
        QuestObjective(
          id: 'earn_oceanus_trust',
          description: 'Earn Oceanus\'s cooperation',
          type: ObjectiveType.event,
          required: true,
        ),
        QuestObjective(
          id: 'obtain_mercury_sphere',
          description: 'Obtain the Mercury Elemental Sphere',
          type: ObjectiveType.collect,
          required: true,
          targetId: 'mercury_sphere',
        ),
        QuestObjective(
          id: 'defend_against_theft',
          description: 'Defend the Elemental Spheres',
          type: ObjectiveType.event,
          required: true,
        ),
      ],
      reward: QuestReward(
        experience: 800,
        gold: 600,
        items: ['elixir', 'elixir', 'elixir', 'mythril_silver'],
      ),
      flagsToSetOnComplete: {
        'chapter_6_complete': true,
        'jupiter_sphere_obtained': true,
        'mercury_sphere_obtained': true,
        'aeolus_recruited': true,
        'oceanus_recruited': true,
        'all_four_spheres_obtained': true,
        'three_spheres_stolen': true,
        'only_jupiter_sphere_remains': true,
        'two_djinn_recruited': true,
      },
      requiredFlags: {
        'chapter_5_complete': true,
        'party_committed': true,
      },
    );
  }

  /// Side quest: Understanding the Djinn
  static Quest createSideQuestDjinnBonding() {
    return Quest(
      id: 'ch6_side_djinn_bonding',
      name: 'Understanding the Djinn',
      description: 
          'Spend time communicating with Aeolus and Oceanus to understand '
          'their nature and the ancient bonds between Master Djinn.',
      type: QuestType.side,
      objectives: [
        QuestObjective(
          id: 'talk_with_aeolus',
          description: 'Learn about Aeolus and Jupiter element',
          type: ObjectiveType.talk,
          required: true,
          targetId: 'aeolus',
        ),
        QuestObjective(
          id: 'talk_with_oceanus',
          description: 'Learn about Oceanus and Mercury element',
          type: ObjectiveType.talk,
          required: true,
          targetId: 'oceanus',
        ),
        QuestObjective(
          id: 'witness_djinn_communion',
          description: 'Observe the Djinn communicate with each other',
          type: ObjectiveType.event,
          required: true,
        ),
      ],
      reward: QuestReward(
        experience: 300,
        gold: 200,
        items: ['djinn_charm', 'psy_crystal', 'psy_crystal'],
      ),
      flagsToSetOnComplete: {
        'djinn_lore_learned': true,
        'djinn_bond_established': true,
      },
      requiredFlags: {
        'aeolus_recruited': true,
        'oceanus_recruited': true,
      },
    );
  }

  /// Side quest: Tracking the thieves
  static Quest createSideQuestTrackThieves() {
    return Quest(
      id: 'ch6_side_track_thieves',
      name: 'Trail of the Thieves',
      description: 'Investigate the theft scene and gather clues about where the thieves went.',
      type: QuestType.side,
      objectives: [
        QuestObjective(
          id: 'examine_campsite',
          description: 'Examine the theft scene for clues',
          type: ObjectiveType.reach,
          required: true,
          targetId: 'theft_campsite',
        ),
        QuestObjective(
          id: 'find_magical_residue',
          description: 'Analyze the binding spell residue',
          type: ObjectiveType.event,
          required: true,
        ),
        QuestObjective(
          id: 'track_teleport_signature',
          description: 'Trace the teleportation magic',
          type: ObjectiveType.event,
          required: true,
        ),
        QuestObjective(
          id: 'deduce_destination',
          description: 'Determine where the thieves went',
          type: ObjectiveType.event,
          required: true,
        ),
      ],
      reward: QuestReward(
        experience: 250,
        gold: 300,
        items: ['magic_shard', 'antidote'],
      ),
      flagsToSetOnComplete: {
        'thieves_tracked': true,
        'lighthouse_destinations_known': true,
      },
      requiredFlags: {
        'three_spheres_stolen': true,
      },
    );
  }

  /// Dialogue: Aeolus conversation
  static DialogueTree createAeolusDialogue() {
    return DialogueTree(
      id: 'ch6_aeolus_conversation',
      name: 'Aeolus\'s Wisdom',
      startNodeId: 'greeting',
      nodes: {
        'greeting': DialogueTreeNode(
          id: 'greeting',
          text: 'You wish to know about the Master Djinn?',
          speaker: 'Aeolus',
          nextNodeId: 'player_choice',
        ),
        'player_choice': DialogueTreeNode(
          id: 'player_choice',
          text: '[What do you ask?]',
          speaker: 'Narrator',
          choices: [
            DialogueTreeChoice(
              id: 'ask_origin',
              text: 'Where do Master Djinn come from?',
              nextNodeId: 'origin_story',
              tone: ChoiceTone.curious,
            ),
            DialogueTreeChoice(
              id: 'ask_connection',
              text: 'How are the four Djinn connected?',
              nextNodeId: 'connection_explanation',
              tone: ChoiceTone.curious,
            ),
            DialogueTreeChoice(
              id: 'ask_ritual',
              text: 'What will happen during the sealing?',
              nextNodeId: 'ritual_explanation',
              tone: ChoiceTone.pragmatic,
            ),
          ],
        ),
        'origin_story': DialogueTreeNode(
          id: 'origin_story',
          text: 'We were born from Alchemy itself, embodiments of the four elements in their purest form.',
          speaker: 'Aeolus',
          nextNodeId: 'origin_continuation',
        ),
        'origin_continuation': DialogueTreeNode(
          id: 'origin_continuation',
          text: 'We have existed since the world knew elemental power. We are both guardians and prisoners of that power.',
          speaker: 'Aeolus',
        ),
        'connection_explanation': DialogueTreeNode(
          id: 'connection_explanation',
          text: 'The four of us are linked. What affects one, echoes in the others.',
          speaker: 'Aeolus',
          nextNodeId: 'connection_detail',
        ),
        'connection_detail': DialogueTreeNode(
          id: 'connection_detail',
          text: 'When my siblings were captured, I felt their pain. That is why Oceanus was wary of you initially.',
          speaker: 'Aeolus',
        ),
        'ritual_explanation': DialogueTreeNode(
          id: 'ritual_explanation',
          text: 'The sealing will require all four Master Djinn to channel and contain Alchemy\'s full power.',
          speaker: 'Aeolus',
          nextNodeId: 'ritual_warning',
        ),
        'ritual_warning': DialogueTreeNode(
          id: 'ritual_warning',
          text: 'It will be... intense. The Wise One spoke truly about sacrifice. We Djinn understand this better than any.',
          speaker: 'Aeolus',
        ),
      },
    );
  }

  /// Dialogue: Post-theft discussion
  static DialogueTree createPostTheftDialogue() {
    return DialogueTree(
      id: 'ch6_post_theft_discussion',
      name: 'After the Theft',
      startNodeId: 'frustration',
      nodes: {
        'frustration': DialogueTreeNode(
          id: 'frustration',
          text: 'We had them all! How could we let them be stolen?!',
          speaker: 'Ember',
          nextNodeId: 'aria_analysis',
        ),
        'aria_analysis': DialogueTreeNode(
          id: 'aria_analysis',
          text: 'The binding spell was incredibly powerful. They must have planned this carefully.',
          speaker: 'Aria',
          nextNodeId: 'zephyr_observation',
        ),
        'zephyr_observation': DialogueTreeNode(
          id: 'zephyr_observation',
          text: 'They left Jupiter. That has to mean something.',
          speaker: 'Zephyr',
          nextNodeId: 'kai_response',
        ),
        'kai_response': DialogueTreeNode(
          id: 'kai_response',
          text: 'Maybe they can only activate three lighthouses? Or maybe they\'re setting a trap.',
          speaker: 'Kai',
          nextNodeId: 'oceanus_input',
        ),
        'oceanus_input': DialogueTreeNode(
          id: 'oceanus_input',
          text: 'Whatever their plan, you still have one sphere and two Djinn. That gives you leverage.',
          speaker: 'Oceanus',
          nextNodeId: 'determination',
        ),
        'determination': DialogueTreeNode(
          id: 'determination',
          text: 'Then we use it. We go to the lighthouses and take back what\'s ours.',
          speaker: 'Kai',
          action: DialogueAction(
            type: DialogueActionType.setFlag,
            parameters: {'flag': 'lighthouse_assault_planned', 'value': 'true'},
          ),
        ),
      },
    );
  }

  /// Get all chapter 6 content
  static Map<String, dynamic> getAllContent() {
    return {
      'chapter_id': chapterId,
      'chapter_name': chapterName,
      'chapter_description': chapterDescription,
      'cutscenes': {
        'racing_to_jupiter': createRacingToJupiterCutscene(),
        'jupiter_djinn_encounter': createJupiterDjinnEncounterCutscene(),
        'jupiter_djinn_trust': createJupiterDjinnTrustCutscene(),
        'journey_to_mercury': createJourneyToMercuryCutscene(),
        'mercury_djinn_encounter': createMercuryDjinnEncounterCutscene(),
        'all_four_spheres': createAllFourSpheresCutscene(),
        'the_theft': createTheftCutscene(),
        'aftermath': createAftermathCutscene(),
      },
      'quests': {
        'main': createMainQuest(),
        'side_djinn_bonding': createSideQuestDjinnBonding(),
        'side_track_thieves': createSideQuestTrackThieves(),
      },
      'dialogues': {
        'aeolus': createAeolusDialogue(),
        'post_theft': createPostTheftDialogue(),
      },
    };
  }
}
