import '../../../models/quest.dart';
import '../../../models/dialogue_tree.dart';
import '../../../models/cutscene_script.dart';

/// Chapter 3: "Too Late"
/// Rush to Venus Sanctuary, arrive too late, Zephyr joins, full party complete
class Chapter3TooLate {
  static const String chapterId = 'chapter_3';
  static const String chapterName = 'Too Late';
  static const String chapterDescription = 
      'Racing to the Venus Elemental Sanctuary, the party arrives too late to prevent '
      'the Master Djinn\'s capture. At this moment of failure, Zephyr the Jupiter Sorcerer '
      'joins them, completing the four-hero party. They must pursue to Venus Lighthouse.';

  /// Urgent news cutscene
  static CutsceneScript createUrgentNewsCutscene() {
    return CutsceneScript(
      id: 'ch3_urgent_news',
      name: 'Urgent News',
      events: [
        CutsceneEvent(
          type: CutsceneEventType.fadeIn,
          duration: 1.0,
        ),
        CutsceneEvent(
          type: CutsceneEventType.playSound,
          soundId: 'running_footsteps',
          duration: 1.5,
        ),
        CutsceneEvent(
          type: CutsceneEventType.showDialogue,
          speaker: 'Messenger',
          text: 'Wait! Are you the group investigating the lighthouses?',
          duration: 3.0,
        ),
        CutsceneEvent(
          type: CutsceneEventType.showDialogue,
          speaker: 'Kai',
          text: 'Yes, what\'s wrong?',
          duration: 2.0,
        ),
        CutsceneEvent(
          type: CutsceneEventType.showDialogue,
          speaker: 'Messenger',
          text: 'The Venus Sanctuary! A group of Adepts was seen heading there yesterday!',
          duration: 3.5,
        ),
        CutsceneEvent(
          type: CutsceneEventType.showDialogue,
          speaker: 'Aria',
          text: 'The Sanctuary? That\'s where the Venus Master Djinn lives!',
          duration: 3.0,
        ),
        CutsceneEvent(
          type: CutsceneEventType.showDialogue,
          speaker: 'Ember',
          text: 'If they capture it... we have to go. Now!',
          duration: 3.0,
        ),
        CutsceneEvent(
          type: CutsceneEventType.showDialogue,
          speaker: 'Kai',
          text: 'Which way to the Sanctuary?',
          duration: 2.5,
        ),
        CutsceneEvent(
          type: CutsceneEventType.showDialogue,
          speaker: 'Messenger',
          text: 'Northeast, through the mountain pass. But be careful - it\'s dangerous!',
          duration: 3.5,
        ),
        CutsceneEvent(
          type: CutsceneEventType.fadeOut,
          duration: 1.0,
        ),
      ],
      canSkip: false,  // Critical story moment
    );
  }

  /// Arriving too late cutscene
  static CutsceneScript createArriveTooLateCutscene() {
    return CutsceneScript(
      id: 'ch3_arrive_too_late',
      name: 'Too Late',
      events: [
        CutsceneEvent(
          type: CutsceneEventType.fadeIn,
          duration: 1.5,
        ),
        CutsceneEvent(
          type: CutsceneEventType.showText,
          text: 'Venus Elemental Sanctuary - Inner Chamber',
          duration: 2.5,
        ),
        CutsceneEvent(
          type: CutsceneEventType.playSound,
          soundId: 'chamber_rumble',
          duration: 2.0,
        ),
        CutsceneEvent(
          type: CutsceneEventType.showDialogue,
          speaker: 'Kai',
          text: 'The chamber... it\'s empty!',
          duration: 2.5,
        ),
        CutsceneEvent(
          type: CutsceneEventType.showDialogue,
          speaker: 'Aria',
          text: 'Look at these markings. A powerful binding spell was used here recently.',
          duration: 3.5,
        ),
        CutsceneEvent(
          type: CutsceneEventType.showDialogue,
          speaker: 'Ember',
          text: 'We\'re too late. They already took the Master Djinn.',
          duration: 3.0,
        ),
        CutsceneEvent(
          type: CutsceneEventType.showDialogue,
          speaker: 'Kai',
          text: 'No... we failed.',
          duration: 2.5,
        ),
        CutsceneEvent(
          type: CutsceneEventType.playSound,
          soundId: 'footsteps_echo',
          duration: 1.5,
        ),
        CutsceneEvent(
          type: CutsceneEventType.showDialogue,
          speaker: 'Unknown Voice',
          text: 'Not entirely.',
          duration: 2.0,
        ),
        CutsceneEvent(
          type: CutsceneEventType.fadeOut,
          duration: 1.0,
        ),
      ],
      canSkip: false,  // Critical failure moment
    );
  }

  /// Zephyr introduction cutscene
  static CutsceneScript createZephyrIntroductionCutscene() {
    return CutsceneScript(
      id: 'ch3_zephyr_introduction',
      name: 'Meeting Zephyr',
      events: [
        CutsceneEvent(
          type: CutsceneEventType.fadeIn,
          duration: 1.0,
        ),
        CutsceneEvent(
          type: CutsceneEventType.moveCharacter,
          characterId: 'zephyr',
          targetX: 300,
          targetY: 180,
          duration: 2.0,
        ),
        CutsceneEvent(
          type: CutsceneEventType.showDialogue,
          speaker: 'Ember',
          text: 'Who are you?',
          duration: 2.0,
        ),
        CutsceneEvent(
          type: CutsceneEventType.showDialogue,
          speaker: 'Zephyr',
          text: 'My name is Zephyr. I\'ve been tracking the lighthouse conspiracy for months.',
          duration: 3.5,
        ),
        CutsceneEvent(
          type: CutsceneEventType.showDialogue,
          speaker: 'Kai',
          text: 'You said "not entirely." What did you mean?',
          duration: 2.5,
        ),
        CutsceneEvent(
          type: CutsceneEventType.showDialogue,
          speaker: 'Zephyr',
          text: 'You failed to save the Venus Master Djinn, yes. But they still need to activate the lighthouse.',
          duration: 4.0,
        ),
        CutsceneEvent(
          type: CutsceneEventType.showDialogue,
          speaker: 'Aria',
          text: 'Of course! They can\'t light the Venus Lighthouse without performing the ritual there!',
          duration: 3.5,
        ),
        CutsceneEvent(
          type: CutsceneEventType.showDialogue,
          speaker: 'Zephyr',
          text: 'Exactly. We can still stop the activation. And more importantly...',
          duration: 3.5,
        ),
        CutsceneEvent(
          type: CutsceneEventType.showDialogue,
          speaker: 'Zephyr',
          text: 'We can take the Elemental Sphere. Without it, the lighthouse is useless.',
          duration: 3.5,
        ),
        CutsceneEvent(
          type: CutsceneEventType.showDialogue,
          speaker: 'Ember',
          text: 'You seem to know a lot about this. Why should we trust you?',
          duration: 3.0,
        ),
        CutsceneEvent(
          type: CutsceneEventType.showDialogue,
          speaker: 'Zephyr',
          text: 'I\'ve seen what happens when Alchemy is abused. I have visions... of a world consumed by elemental chaos.',
          duration: 5.0,
        ),
        CutsceneEvent(
          type: CutsceneEventType.playAnimation,
          animationId: 'zephyr_wind_aura',
          duration: 2.0,
        ),
        CutsceneEvent(
          type: CutsceneEventType.showDialogue,
          speaker: 'Zephyr',
          text: 'I\'m a Jupiter Adept, a sorcerer who reads the winds. And the winds tell me our fates are intertwined.',
          duration: 4.5,
        ),
        CutsceneEvent(
          type: CutsceneEventType.showDialogue,
          speaker: 'Kai',
          text: 'Four of us now. One for each element.',
          duration: 3.0,
        ),
        CutsceneEvent(
          type: CutsceneEventType.showDialogue,
          speaker: 'Zephyr',
          text: 'Perhaps that\'s not a coincidence. Will you let me join you?',
          duration: 3.0,
        ),
        CutsceneEvent(
          type: CutsceneEventType.showDialogue,
          speaker: 'Kai',
          text: 'We need all the help we can get. Welcome, Zephyr.',
          duration: 3.0,
        ),
        CutsceneEvent(
          type: CutsceneEventType.showText,
          text: 'Zephyr joined the party!',
          duration: 3.0,
        ),
        CutsceneEvent(
          type: CutsceneEventType.showText,
          text: 'The four-hero party is now complete!',
          duration: 3.0,
        ),
        CutsceneEvent(
          type: CutsceneEventType.fadeOut,
          duration: 1.5,
        ),
      ],
      canSkip: false,  // Critical party member addition
    );
  }

  /// Venus Lighthouse approach cutscene
  static CutsceneScript createVenusLighthouseApproachCutscene() {
    return CutsceneScript(
      id: 'ch3_lighthouse_approach',
      name: 'Venus Lighthouse Approach',
      events: [
        CutsceneEvent(
          type: CutsceneEventType.fadeIn,
          duration: 1.5,
        ),
        CutsceneEvent(
          type: CutsceneEventType.showText,
          text: 'Venus Lighthouse - Base',
          duration: 2.5,
        ),
        CutsceneEvent(
          type: CutsceneEventType.showDialogue,
          speaker: 'Aria',
          text: 'It\'s massive... I\'ve only seen it in ancient texts.',
          duration: 3.0,
        ),
        CutsceneEvent(
          type: CutsceneEventType.showDialogue,
          speaker: 'Zephyr',
          text: 'They\'re already inside. I can sense the Master Djinn\'s distress.',
          duration: 3.5,
        ),
        CutsceneEvent(
          type: CutsceneEventType.showDialogue,
          speaker: 'Ember',
          text: 'Then let\'s move. We need to reach the beacon chamber before they complete the ritual.',
          duration: 4.0,
        ),
        CutsceneEvent(
          type: CutsceneEventType.showDialogue,
          speaker: 'Kai',
          text: 'Together. All four of us.',
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

  /// Venus Lighthouse victory cutscene
  static CutsceneScript createVenusLighthouseVictoryCutscene() {
    return CutsceneScript(
      id: 'ch3_lighthouse_victory',
      name: 'First Sphere Secured',
      events: [
        CutsceneEvent(
          type: CutsceneEventType.fadeIn,
          duration: 1.0,
        ),
        CutsceneEvent(
          type: CutsceneEventType.showText,
          text: 'Venus Lighthouse - Beacon Chamber',
          duration: 2.0,
        ),
        CutsceneEvent(
          type: CutsceneEventType.showDialogue,
          speaker: 'Enemy Leader',
          text: 'You... you stopped the ritual! Impossible!',
          duration: 3.0,
        ),
        CutsceneEvent(
          type: CutsceneEventType.showDialogue,
          speaker: 'Kai',
          text: 'Leave the Elemental Sphere and the Master Djinn. It\'s over.',
          duration: 3.0,
        ),
        CutsceneEvent(
          type: CutsceneEventType.showDialogue,
          speaker: 'Enemy Leader',
          text: 'Over? This is just one lighthouse. You can\'t stop all of them!',
          duration: 3.5,
        ),
        CutsceneEvent(
          type: CutsceneEventType.playAnimation,
          animationId: 'enemy_retreat',
          duration: 2.0,
        ),
        CutsceneEvent(
          type: CutsceneEventType.showDialogue,
          speaker: 'Ember',
          text: 'They fled. Cowards.',
          duration: 2.5,
        ),
        CutsceneEvent(
          type: CutsceneEventType.showDialogue,
          speaker: 'Zephyr',
          text: 'Look - the Venus Elemental Sphere!',
          duration: 2.5,
        ),
        CutsceneEvent(
          type: CutsceneEventType.playAnimation,
          animationId: 'sphere_glow',
          duration: 2.0,
        ),
        CutsceneEvent(
          type: CutsceneEventType.showDialogue,
          speaker: 'Aria',
          text: 'It\'s beautiful... and powerful. I can feel the earth energy radiating from it.',
          duration: 4.0,
        ),
        CutsceneEvent(
          type: CutsceneEventType.showDialogue,
          speaker: 'Kai',
          text: 'We\'ll keep it safe. They won\'t light this lighthouse.',
          duration: 3.0,
        ),
        CutsceneEvent(
          type: CutsceneEventType.showText,
          text: 'Obtained the Venus Elemental Sphere!',
          duration: 3.0,
        ),
        CutsceneEvent(
          type: CutsceneEventType.showDialogue,
          speaker: 'Zephyr',
          text: 'But the Master Djinn is still in their containment orb. We need to free it eventually.',
          duration: 4.0,
        ),
        CutsceneEvent(
          type: CutsceneEventType.showDialogue,
          speaker: 'Aria',
          text: 'One victory, but three lighthouses remain. And now they know we\'re coming.',
          duration: 4.0,
        ),
        CutsceneEvent(
          type: CutsceneEventType.showDialogue,
          speaker: 'Ember',
          text: 'Good. Let them fear us.',
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

  /// Main quest: Too Late
  static Quest createMainQuest() {
    return Quest(
      id: 'ch3_main_too_late',
      name: 'Too Late',
      description: 
          'Race to the Venus Elemental Sanctuary to prevent the capture of the Master Djinn. '
          'When you arrive too late, pursue the enemy to Venus Lighthouse to stop the activation.',
      type: QuestType.main,
      objectives: [
        QuestObjective(
          id: 'hear_urgent_news',
          description: 'Receive news about Venus Sanctuary',
          type: ObjectiveType.event,
          required: true,
        ),
        QuestObjective(
          id: 'travel_to_sanctuary',
          description: 'Travel to Venus Elemental Sanctuary',
          type: ObjectiveType.reach,
          required: true,
          targetId: 'venus_sanctuary',
        ),
        QuestObjective(
          id: 'explore_sanctuary',
          description: 'Search the Sanctuary for the Master Djinn',
          type: ObjectiveType.reach,
          required: true,
          targetId: 'venus_sanctuary_inner_chamber',
        ),
        QuestObjective(
          id: 'meet_zephyr',
          description: 'Discover what the stranger knows',
          type: ObjectiveType.event,
          required: true,
        ),
        QuestObjective(
          id: 'reach_venus_lighthouse',
          description: 'Travel to Venus Lighthouse',
          type: ObjectiveType.reach,
          required: true,
          targetId: 'venus_lighthouse',
        ),
        QuestObjective(
          id: 'climb_lighthouse',
          description: 'Ascend Venus Lighthouse to the beacon chamber',
          type: ObjectiveType.reach,
          required: true,
          targetId: 'venus_lighthouse_beacon',
        ),
        QuestObjective(
          id: 'stop_activation',
          description: 'Prevent the lighthouse activation',
          type: ObjectiveType.defeat,
          required: true,
          targetId: 'venus_lighthouse_boss',
        ),
        QuestObjective(
          id: 'secure_sphere',
          description: 'Obtain the Venus Elemental Sphere',
          type: ObjectiveType.collect,
          required: true,
          targetId: 'venus_sphere',
        ),
      ],
      reward: QuestReward(
        experience: 400,
        gold: 300,
        items: ['elixir', 'elixir', 'power_bread', 'lucky_pepper'],
      ),
      flagsToSetOnComplete: {
        'chapter_3_complete': true,
        'zephyr_joined': true,
        'full_party_complete': true,
        'venus_sphere_obtained': true,
        'venus_lighthouse_saved': true,
        'venus_master_djinn_captured': true,
      },
      requiredFlags: {
        'chapter_2_complete': true,
        'aria_joined': true,
      },
    );
  }

  /// Side quest: Sanctuary exploration
  static Quest createSideQuestSanctuarySecrets() {
    return Quest(
      id: 'ch3_side_sanctuary_secrets',
      name: 'Secrets of the Sanctuary',
      description: 
          'Explore the Venus Sanctuary to find ancient tablets that might '
          'explain the connection between Master Djinn and Elemental Spheres.',
      type: QuestType.side,
      objectives: [
        QuestObjective(
          id: 'find_tablet_1',
          description: 'Find the first ancient tablet',
          type: ObjectiveType.collect,
          required: true,
          targetId: 'sanctuary_tablet_1',
        ),
        QuestObjective(
          id: 'find_tablet_2',
          description: 'Find the second ancient tablet',
          type: ObjectiveType.collect,
          required: true,
          targetId: 'sanctuary_tablet_2',
        ),
        QuestObjective(
          id: 'find_tablet_3',
          description: 'Find the third ancient tablet',
          type: ObjectiveType.collect,
          required: true,
          targetId: 'sanctuary_tablet_3',
        ),
        QuestObjective(
          id: 'aria_translate',
          description: 'Have Aria translate the tablets',
          type: ObjectiveType.talk,
          required: true,
          targetId: 'aria',
        ),
      ],
      reward: QuestReward(
        experience: 150,
        gold: 100,
        items: ['psy_crystal', 'mint'],
      ),
      flagsToSetOnComplete: {
        'sanctuary_lore_discovered': true,
        'aria_relationship_2': true,
      },
      requiredFlags: {
        'aria_joined': true,
      },
    );
  }

  /// Side quest: Test the new party
  static Quest createSideQuestPartyCoordination() {
    return Quest(
      id: 'ch3_side_party_coordination',
      name: 'Strength in Unity',
      description: 
          'With all four elements represented in the party, test your coordination '
          'by defeating a series of elemental challenges.',
      type: QuestType.side,
      objectives: [
        QuestObjective(
          id: 'defeat_earth_trial',
          description: 'Complete the Earth Trial',
          type: ObjectiveType.defeat,
          required: true,
          targetId: 'earth_trial_guardian',
        ),
        QuestObjective(
          id: 'defeat_fire_trial',
          description: 'Complete the Fire Trial',
          type: ObjectiveType.defeat,
          required: true,
          targetId: 'fire_trial_guardian',
        ),
        QuestObjective(
          id: 'defeat_water_trial',
          description: 'Complete the Water Trial',
          type: ObjectiveType.defeat,
          required: true,
          targetId: 'water_trial_guardian',
        ),
        QuestObjective(
          id: 'defeat_wind_trial',
          description: 'Complete the Wind Trial',
          type: ObjectiveType.defeat,
          required: true,
          targetId: 'wind_trial_guardian',
        ),
      ],
      reward: QuestReward(
        experience: 200,
        gold: 250,
        items: ['psy_crystal', 'psy_crystal', 'elixir'],
      ),
      flagsToSetOnComplete: {
        'party_coordination_1': true,
        'all_relationships_bonus': true,
      },
      requiredFlags: {
        'full_party_complete': true,
      },
    );
  }

  /// Dialogue with Zephyr after joining
  static DialogueTree createZephyrJoinedDialogue() {
    return DialogueTree(
      id: 'ch3_zephyr_joined',
      name: 'Zephyr\'s Vision',
      startNodeId: 'vision_talk',
      nodes: {
        'vision_talk': DialogueTreeNode(
          id: 'vision_talk',
          text: 'I should explain about my visions. I\'ve had them since I was young.',
          speaker: 'Zephyr',
          nextNodeId: 'explanation',
        ),
        'explanation': DialogueTreeNode(
          id: 'explanation',
          text: 'The winds carry whispers of the future. Not certainties, but possibilities.',
          speaker: 'Zephyr',
          nextNodeId: 'choice_moment',
        ),
        'choice_moment': DialogueTreeNode(
          id: 'choice_moment',
          text: 'I\'ve seen glimpses of what happens if the lighthouses activate. It\'s... devastating.',
          speaker: 'Zephyr',
          choices: [
            DialogueTreeChoice(
              id: 'ask_details',
              text: 'What exactly did you see?',
              nextNodeId: 'vision_details',
              tone: ChoiceTone.curious,
            ),
            DialogueTreeChoice(
              id: 'express_confidence',
              text: 'Then we\'ll make sure that doesn\'t happen.',
              nextNodeId: 'confident_response',
              tone: ChoiceTone.diplomatic,
            ),
            DialogueTreeChoice(
              id: 'question_reliability',
              text: 'How accurate are these visions?',
              nextNodeId: 'accuracy_discussion',
              tone: ChoiceTone.pragmatic,
            ),
          ],
        ),
        'vision_details': DialogueTreeNode(
          id: 'vision_details',
          text: 'Elemental chaos unleashed. The world torn apart by storms, quakes, fires, and floods.',
          speaker: 'Zephyr',
          nextNodeId: 'grim_future',
        ),
        'grim_future': DialogueTreeNode(
          id: 'grim_future',
          text: 'But I also see another path. Us, together, preventing this catastrophe.',
          speaker: 'Zephyr',
          action: DialogueAction(
            type: DialogueActionType.modifyRelationship,
            parameters: {
              'character1': 'kai',
              'character2': 'zephyr',
              'change': '10',
            },
          ),
        ),
        'confident_response': DialogueTreeNode(
          id: 'confident_response',
          text: 'Your confidence is reassuring. Together, we can change fate.',
          speaker: 'Zephyr',
          action: DialogueAction(
            type: DialogueActionType.modifyRelationship,
            parameters: {
              'character1': 'kai',
              'character2': 'zephyr',
              'change': '10',
            },
          ),
        ),
        'accuracy_discussion': DialogueTreeNode(
          id: 'accuracy_discussion',
          text: 'They\'re not perfect. The future can be changed. But the visions show what\'s likely without intervention.',
          speaker: 'Zephyr',
          action: DialogueAction(
            type: DialogueActionType.modifyRelationship,
            parameters: {
              'character1': 'kai',
              'character2': 'zephyr',
              'change': '5',
            },
          ),
        ),
      },
    );
  }

  /// Dialogue about party dynamics with full team
  static DialogueTree createFullPartyDialogue() {
    return DialogueTree(
      id: 'ch3_full_party_dynamics',
      name: 'Four Elements United',
      startNodeId: 'kai_observation',
      nodes: {
        'kai_observation': DialogueTreeNode(
          id: 'kai_observation',
          text: 'Four of us now. Venus, Mars, Mercury, and Jupiter. All elements represented.',
          speaker: 'Kai',
          nextNodeId: 'ember_response',
        ),
        'ember_response': DialogueTreeNode(
          id: 'ember_response',
          text: 'Just like the four lighthouses. Maybe that\'s what we need to stop them.',
          speaker: 'Ember',
          nextNodeId: 'aria_insight',
        ),
        'aria_insight': DialogueTreeNode(
          id: 'aria_insight',
          text: 'The ancient texts mention "four guardians" in several places. I wonder if...',
          speaker: 'Aria',
          nextNodeId: 'zephyr_completion',
        ),
        'zephyr_completion': DialogueTreeNode(
          id: 'zephyr_completion',
          text: 'If we were meant to come together. Yes, I\'ve felt that too.',
          speaker: 'Zephyr',
          nextNodeId: 'reflection',
        ),
        'reflection': DialogueTreeNode(
          id: 'reflection',
          text: 'Whatever lies ahead, we face it as one.',
          speaker: 'Kai',
          action: DialogueAction(
            type: DialogueActionType.setFlag,
            parameters: {'flag': 'party_unity_established', 'value': 'true'},
          ),
        ),
      },
    );
  }

  /// Get all chapter 3 content
  static Map<String, dynamic> getAllContent() {
    return {
      'chapter_id': chapterId,
      'chapter_name': chapterName,
      'chapter_description': chapterDescription,
      'cutscenes': {
        'urgent_news': createUrgentNewsCutscene(),
        'arrive_too_late': createArriveTooLateCutscene(),
        'zephyr_introduction': createZephyrIntroductionCutscene(),
        'lighthouse_approach': createVenusLighthouseApproachCutscene(),
        'lighthouse_victory': createVenusLighthouseVictoryCutscene(),
      },
      'quests': {
        'main': createMainQuest(),
        'side_sanctuary_secrets': createSideQuestSanctuarySecrets(),
        'side_party_coordination': createSideQuestPartyCoordination(),
      },
      'dialogues': {
        'zephyr_joined': createZephyrJoinedDialogue(),
        'full_party': createFullPartyDialogue(),
      },
    };
  }
}
