import '../../../models/quest.dart';
import '../../../models/dialogue_tree.dart';
import '../../../models/cutscene_script.dart';

/// Chapter 7: "The Lighthouses"
/// Assault on Jupiter and Mercury Lighthouses to reclaim the stolen spheres
class Chapter7TheLighthouses {
  static const String chapterId = 'chapter_7';
  static const String chapterName = 'The Lighthouses';
  static const String chapterDescription = 
      'With three Elemental Spheres stolen, the party must assault Jupiter and Mercury '
      'Lighthouses to reclaim them. Through cunning and strength, they prevent all four '
      'lighthouses from being activated and secure all the spheres once more.';

  /// Approaching Jupiter Lighthouse cutscene
  static CutsceneScript createJupiterLighthouseApproachCutscene() {
    return CutsceneScript(
      id: 'ch7_jupiter_approach',
      name: 'Jupiter Lighthouse',
      events: [
        CutsceneEvent(
          type: CutsceneEventType.fadeIn,
          duration: 1.5,
        ),
        CutsceneEvent(
          type: CutsceneEventType.showText,
          text: 'Jupiter Lighthouse - Base',
          duration: 2.5,
        ),
        CutsceneEvent(
          type: CutsceneEventType.showDialogue,
          speaker: 'Zephyr',
          text: 'This is it. Jupiter Lighthouse. They\'re already inside.',
          duration: 3.5,
        ),
        CutsceneEvent(
          type: CutsceneEventType.showDialogue,
          speaker: 'Aeolus',
          text: 'I can feel the beacon stirring. They\'re attempting to activate it!',
          duration: 4.0,
        ),
        CutsceneEvent(
          type: CutsceneEventType.showDialogue,
          speaker: 'Kai',
          text: 'Not if we stop them first. Everyone ready?',
          duration: 3.0,
        ),
        CutsceneEvent(
          type: CutsceneEventType.showDialogue,
          speaker: 'All',
          text: 'Ready!',
          duration: 2.0,
        ),
        CutsceneEvent(
          type: CutsceneEventType.fadeOut,
          duration: 1.0,
        ),
      ],
      canSkip: true,
    );
  }

  /// Jupiter Lighthouse retrieval cutscene
  static CutsceneScript createJupiterRetrievalCutscene() {
    return CutsceneScript(
      id: 'ch7_jupiter_retrieval',
      name: 'Retrieving the Key',
      events: [
        CutsceneEvent(
          type: CutsceneEventType.fadeIn,
          duration: 1.0,
        ),
        CutsceneEvent(
          type: CutsceneEventType.showText,
          text: 'Jupiter Lighthouse - Beacon Chamber',
          duration: 2.0,
        ),
        CutsceneEvent(
          type: CutsceneEventType.playAnimation,
          animationId: 'boss_defeated',
          duration: 2.0,
        ),
        CutsceneEvent(
          type: CutsceneEventType.showDialogue,
          speaker: 'Kai',
          text: 'The ritual is disrupted. They failed.',
          duration: 3.0,
        ),
        CutsceneEvent(
          type: CutsceneEventType.showDialogue,
          speaker: 'Aeolus',
          text: 'Look! The Lighthouse Key! It\'s the master key to all four lighthouses!',
          duration: 4.0,
        ),
        CutsceneEvent(
          type: CutsceneEventType.showText,
          text: 'Obtained the Lighthouse Master Key!',
          duration: 3.0,
        ),
        CutsceneEvent(
          type: CutsceneEventType.showDialogue,
          speaker: 'Aria',
          text: 'With this, we can access any lighthouse. But where are the stolen spheres?',
          duration: 4.0,
        ),
        CutsceneEvent(
          type: CutsceneEventType.showDialogue,
          speaker: 'Ember',
          text: 'If they tried to activate Jupiter without Jupiter Sphere... they must be at Mercury!',
          duration: 4.5,
        ),
        CutsceneEvent(
          type: CutsceneEventType.showDialogue,
          speaker: 'Zephyr',
          text: 'Mercury Lighthouse. They have all three stolen spheres there!',
          duration: 3.5,
        ),
        CutsceneEvent(
          type: CutsceneEventType.showDialogue,
          speaker: 'Kai',
          text: 'Then that\'s where we go. One final heist - to take back what\'s ours!',
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

  /// Mercury Lighthouse infiltration cutscene
  static CutsceneScript createMercuryInfiltrationCutscene() {
    return CutsceneScript(
      id: 'ch7_mercury_infiltration',
      name: 'The Epic Heist',
      events: [
        CutsceneEvent(
          type: CutsceneEventType.fadeIn,
          duration: 1.5,
        ),
        CutsceneEvent(
          type: CutsceneEventType.showText,
          text: 'Mercury Lighthouse - Outer Wall',
          duration: 2.5,
        ),
        CutsceneEvent(
          type: CutsceneEventType.showDialogue,
          speaker: 'Oceanus',
          text: 'This is my domain. I can sense the spheres - all three are in the treasure vault.',
          duration: 4.5,
        ),
        CutsceneEvent(
          type: CutsceneEventType.showDialogue,
          speaker: 'Aria',
          text: 'A treasure vault in a lighthouse? That\'s unusual.',
          duration: 3.5,
        ),
        CutsceneEvent(
          type: CutsceneEventType.showDialogue,
          speaker: 'Zephyr',
          text: 'They\'re using it as a stronghold. Guards everywhere.',
          duration: 3.5,
        ),
        CutsceneEvent(
          type: CutsceneEventType.showDialogue,
          speaker: 'Ember',
          text: 'Then we fight our way through. I\'m done with stealth.',
          duration: 3.5,
        ),
        CutsceneEvent(
          type: CutsceneEventType.showDialogue,
          speaker: 'Kai',
          text: 'No. This time we use strategy. Aria and I will create a distraction.',
          duration: 4.0,
        ),
        CutsceneEvent(
          type: CutsceneEventType.showDialogue,
          speaker: 'Kai',
          text: 'Ember and Zephyr - you two sneak to the vault and retrieve the spheres.',
          duration: 4.0,
        ),
        CutsceneEvent(
          type: CutsceneEventType.showDialogue,
          speaker: 'Zephyr',
          text: 'A two-pronged approach. Smart.',
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

  /// Vault heist cutscene
  static CutsceneScript createVaultHeistCutscene() {
    return CutsceneScript(
      id: 'ch7_vault_heist',
      name: 'The Vault',
      events: [
        CutsceneEvent(
          type: CutsceneEventType.fadeIn,
          duration: 1.0,
        ),
        CutsceneEvent(
          type: CutsceneEventType.showText,
          text: 'Mercury Lighthouse - Treasure Vault',
          duration: 2.0,
        ),
        CutsceneEvent(
          type: CutsceneEventType.showDialogue,
          speaker: 'Ember',
          text: '*Whispering* There they are! Venus, Mars, and Mercury Spheres!',
          duration: 3.5,
        ),
        CutsceneEvent(
          type: CutsceneEventType.showDialogue,
          speaker: 'Zephyr',
          text: '*Whispering* Guards patrolling. Wait for my signal...',
          duration: 3.0,
        ),
        CutsceneEvent(
          type: CutsceneEventType.playAnimation,
          animationId: 'wind_distraction',
          duration: 2.0,
        ),
        CutsceneEvent(
          type: CutsceneEventType.showDialogue,
          speaker: 'Zephyr',
          text: 'Now!',
          duration: 1.5,
        ),
        CutsceneEvent(
          type: CutsceneEventType.playAnimation,
          animationId: 'sphere_retrieval',
          duration: 3.0,
        ),
        CutsceneEvent(
          type: CutsceneEventType.showDialogue,
          speaker: 'Ember',
          text: 'Got them! All three!',
          duration: 2.5,
        ),
        CutsceneEvent(
          type: CutsceneEventType.playSound,
          soundId: 'alarm_sounds',
          duration: 2.0,
        ),
        CutsceneEvent(
          type: CutsceneEventType.showDialogue,
          speaker: 'Guard',
          text: 'Intruders! Stop them!',
          duration: 2.5,
        ),
        CutsceneEvent(
          type: CutsceneEventType.showDialogue,
          speaker: 'Zephyr',
          text: 'Time to run!',
          duration: 2.0,
        ),
        CutsceneEvent(
          type: CutsceneEventType.fadeOut,
          duration: 1.0,
        ),
      ],
      canSkip: true,
    );
  }

  /// Reunion and escape cutscene
  static CutsceneScript createReunionEscapeCutscene() {
    return CutsceneScript(
      id: 'ch7_reunion_escape',
      name: 'Reunion and Escape',
      events: [
        CutsceneEvent(
          type: CutsceneEventType.fadeIn,
          duration: 1.0,
        ),
        CutsceneEvent(
          type: CutsceneEventType.showText,
          text: 'Mercury Lighthouse - Central Hall',
          duration: 2.0,
        ),
        CutsceneEvent(
          type: CutsceneEventType.moveCharacter,
          characterId: 'ember',
          targetX: 300,
          targetY: 200,
          duration: 1.5,
        ),
        CutsceneEvent(
          type: CutsceneEventType.moveCharacter,
          characterId: 'zephyr',
          targetX: 320,
          targetY: 200,
          duration: 1.5,
        ),
        CutsceneEvent(
          type: CutsceneEventType.showDialogue,
          speaker: 'Ember',
          text: 'Kai! Aria! We got them!',
          duration: 2.5,
        ),
        CutsceneEvent(
          type: CutsceneEventType.showDialogue,
          speaker: 'Kai',
          text: 'Perfect timing! This way - the exit!',
          duration: 2.5,
        ),
        CutsceneEvent(
          type: CutsceneEventType.playAnimation,
          animationId: 'group_runs',
          duration: 2.0,
        ),
        CutsceneEvent(
          type: CutsceneEventType.showDialogue,
          speaker: 'Council Leader',
          text: 'You fools! You have no idea what you\'ve done!',
          duration: 3.0,
        ),
        CutsceneEvent(
          type: CutsceneEventType.showDialogue,
          speaker: 'Aria',
          text: 'We\'ve stopped you from dooming the world!',
          duration: 3.0,
        ),
        CutsceneEvent(
          type: CutsceneEventType.showDialogue,
          speaker: 'Council Leader',
          text: 'Dooming? We were going to elevate Adepts! Make us gods!',
          duration: 3.5,
        ),
        CutsceneEvent(
          type: CutsceneEventType.showDialogue,
          speaker: 'Kai',
          text: 'That\'s exactly the problem. Goodbye.',
          duration: 2.5,
        ),
        CutsceneEvent(
          type: CutsceneEventType.playAnimation,
          animationId: 'escape_teleport',
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

  /// Victory - all four spheres secured cutscene
  static CutsceneScript createAllSpheresFinalCutscene() {
    return CutsceneScript(
      id: 'ch7_all_spheres_final',
      name: 'All Four Secured',
      events: [
        CutsceneEvent(
          type: CutsceneEventType.fadeIn,
          duration: 1.0,
        ),
        CutsceneEvent(
          type: CutsceneEventType.showText,
          text: 'Safe Location',
          duration: 2.0,
        ),
        CutsceneEvent(
          type: CutsceneEventType.playAnimation,
          animationId: 'four_spheres_display',
          duration: 4.0,
        ),
        CutsceneEvent(
          type: CutsceneEventType.showDialogue,
          speaker: 'Kai',
          text: 'All four Elemental Spheres. Venus, Mars, Jupiter, Mercury.',
          duration: 4.0,
        ),
        CutsceneEvent(
          type: CutsceneEventType.showDialogue,
          speaker: 'Ember',
          text: 'And none of the lighthouses have been activated. We did it!',
          duration: 3.5,
        ),
        CutsceneEvent(
          type: CutsceneEventType.showDialogue,
          speaker: 'Aeolus',
          text: 'Well done, heroes. Now comes the truly difficult part.',
          duration: 3.5,
        ),
        CutsceneEvent(
          type: CutsceneEventType.showDialogue,
          speaker: 'Aria',
          text: 'Sol Sanctum. The sealing ritual.',
          duration: 3.0,
        ),
        CutsceneEvent(
          type: CutsceneEventType.showDialogue,
          speaker: 'Oceanus',
          text: 'First, we must retrieve our captured brethren - the Venus and Mars Master Djinn.',
          duration: 4.5,
        ),
        CutsceneEvent(
          type: CutsceneEventType.showDialogue,
          speaker: 'Zephyr',
          text: 'With all four spheres and the Lighthouse Key, we should be able to free them.',
          duration: 4.0,
        ),
        CutsceneEvent(
          type: CutsceneEventType.showDialogue,
          speaker: 'Kai',
          text: 'Then we know our path. Free the Djinn, travel to Sol Sanctum, perform the sealing.',
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

  /// Main quest: The Lighthouses
  static Quest createMainQuest() {
    return Quest(
      id: 'ch7_main_lighthouses',
      name: 'The Lighthouses',
      description: 
          'Assault Jupiter and Mercury Lighthouses to prevent activation and reclaim '
          'the three stolen Elemental Spheres through strategy and strength.',
      type: QuestType.main,
      objectives: [
        QuestObjective(
          id: 'reach_jupiter_lighthouse',
          description: 'Travel to Jupiter Lighthouse',
          type: ObjectiveType.reach,
          required: true,
          targetId: 'jupiter_lighthouse',
        ),
        QuestObjective(
          id: 'stop_jupiter_activation',
          description: 'Prevent Jupiter Lighthouse activation',
          type: ObjectiveType.defeat,
          required: true,
          targetId: 'jupiter_lighthouse_boss',
        ),
        QuestObjective(
          id: 'obtain_lighthouse_key',
          description: 'Obtain the Lighthouse Master Key',
          type: ObjectiveType.collect,
          required: true,
          targetId: 'lighthouse_master_key',
        ),
        QuestObjective(
          id: 'reach_mercury_lighthouse',
          description: 'Travel to Mercury Lighthouse',
          type: ObjectiveType.reach,
          required: true,
          targetId: 'mercury_lighthouse',
        ),
        QuestObjective(
          id: 'infiltrate_mercury',
          description: 'Infiltrate Mercury Lighthouse',
          type: ObjectiveType.event,
          required: true,
        ),
        QuestObjective(
          id: 'retrieve_stolen_spheres',
          description: 'Retrieve all three stolen Elemental Spheres',
          type: ObjectiveType.collect,
          required: true,
          targetId: 'stolen_spheres',
        ),
        QuestObjective(
          id: 'escape_mercury',
          description: 'Escape from Mercury Lighthouse',
          type: ObjectiveType.event,
          required: true,
        ),
        QuestObjective(
          id: 'secure_all_spheres',
          description: 'Secure all four Elemental Spheres',
          type: ObjectiveType.event,
          required: true,
        ),
      ],
      reward: QuestReward(
        experience: 1000,
        gold: 800,
        items: ['elixir', 'elixir', 'elixir', 'mythril_silver', 'orihalcon'],
      ),
      flagsToSetOnComplete: {
        'chapter_7_complete': true,
        'jupiter_lighthouse_saved': true,
        'mercury_lighthouse_saved': true,
        'all_lighthouses_saved': true,
        'lighthouse_master_key_obtained': true,
        'all_four_spheres_secured_final': true,
        'ready_for_sol_sanctum': true,
      },
      requiredFlags: {
        'chapter_6_complete': true,
        'three_spheres_stolen': true,
      },
    );
  }

  /// Side quest: Freeing captured Djinn
  static Quest createSideQuestFreeDjinn() {
    return Quest(
      id: 'ch7_side_free_djinn',
      name: 'Freeing the Captured',
      description: 
          'Use the Lighthouse Master Key and the Elemental Spheres to free '
          'the captured Venus and Mars Master Djinn from their binding orbs.',
      type: QuestType.side,
      objectives: [
        QuestObjective(
          id: 'locate_venus_djinn',
          description: 'Find the Venus Master Djinn containment',
          type: ObjectiveType.reach,
          required: true,
          targetId: 'venus_djinn_prison',
        ),
        QuestObjective(
          id: 'calm_venus_djinn',
          description: 'Calm the Venus Master Djinn\'s essence',
          type: ObjectiveType.event,
          required: true,
        ),
        QuestObjective(
          id: 'locate_mars_djinn',
          description: 'Find the Mars Master Djinn containment',
          type: ObjectiveType.reach,
          required: true,
          targetId: 'mars_djinn_prison',
        ),
        QuestObjective(
          id: 'calm_mars_djinn',
          description: 'Calm the Mars Master Djinn\'s essence',
          type: ObjectiveType.event,
          required: true,
        ),
      ],
      reward: QuestReward(
        experience: 400,
        gold: 500,
        items: ['earth_charm', 'fire_charm', 'psy_crystal', 'psy_crystal'],
      ),
      flagsToSetOnComplete: {
        'venus_djinn_freed': true,
        'mars_djinn_freed': true,
        'all_four_djinn_ready': true,
      },
      requiredFlags: {
        'all_four_spheres_secured_final': true,
        'lighthouse_master_key_obtained': true,
      },
    );
  }

  /// Side quest: Final preparations
  static Quest createSideQuestFinalPreparations() {
    return Quest(
      id: 'ch7_side_final_prep',
      name: 'Final Preparations',
      description: 
          'Prepare the party for the final journey to Sol Sanctum. '
          'Gather supplies, strengthen bonds, and steel your resolve.',
      type: QuestType.side,
      objectives: [
        QuestObjective(
          id: 'gather_supplies',
          description: 'Stock up on healing items and equipment',
          type: ObjectiveType.collect,
          required: true,
          targetId: 'final_supplies',
          targetCount: 10,
        ),
        QuestObjective(
          id: 'party_talks',
          description: 'Have a final conversation with each party member',
          type: ObjectiveType.talk,
          required: true,
          targetCount: 3,
        ),
        QuestObjective(
          id: 'djinn_communion',
          description: 'Commune with all four Master Djinn',
          type: ObjectiveType.talk,
          required: true,
          targetCount: 4,
        ),
        QuestObjective(
          id: 'final_rest',
          description: 'Rest before the final journey',
          type: ObjectiveType.event,
          required: true,
        ),
      ],
      reward: QuestReward(
        experience: 300,
        gold: 0,
        items: ['blessed_mace', 'guardian_amulet', 'mythril_shield', 'crystal_powder'],
      ),
      flagsToSetOnComplete: {
        'final_preparations_complete': true,
        'party_fully_prepared': true,
      },
      requiredFlags: {
        'all_four_djinn_ready': true,
      },
    );
  }

  /// Dialogue: Council leader confrontation
  static DialogueTree createCouncilConfrontationDialogue() {
    return DialogueTree(
      id: 'ch7_council_confrontation',
      name: 'Final Words',
      startNodeId: 'accusation',
      nodes: {
        'accusation': DialogueTreeNode(
          id: 'accusation',
          text: 'You don\'t understand what you\'re throwing away!',
          speaker: 'Council Leader',
          nextNodeId: 'player_choice',
        ),
        'player_choice': DialogueTreeNode(
          id: 'player_choice',
          text: '[How do you respond?]',
          speaker: 'Narrator',
          choices: [
            DialogueTreeChoice(
              id: 'explain_choice',
              text: 'We understand perfectly. That\'s why we\'re stopping you.',
              nextNodeId: 'kai_explains',
              tone: ChoiceTone.diplomatic,
            ),
            DialogueTreeChoice(
              id: 'accuse_back',
              text: 'You wanted to become tyrants. We\'re saving the world from you.',
              nextNodeId: 'kai_accuses',
              tone: ChoiceTone.aggressive,
            ),
            DialogueTreeChoice(
              id: 'express_sadness',
              text: 'I wish there was another way. But there isn\'t.',
              nextNodeId: 'kai_regrets',
              tone: ChoiceTone.pragmatic,
            ),
          ],
        ),
        'kai_explains': DialogueTreeNode(
          id: 'kai_explains',
          text: 'Power without balance leads to destruction. History has proven this.',
          speaker: 'Kai',
          action: DialogueAction(
            type: DialogueActionType.setFlag,
            parameters: {'flag': 'diplomatic_ending', 'value': 'true'},
          ),
        ),
        'kai_accuses': DialogueTreeNode(
          id: 'kai_accuses',
          text: 'You cared only for Adepts, not for the world. That makes you the villains.',
          speaker: 'Kai',
          action: DialogueAction(
            type: DialogueActionType.setFlag,
            parameters: {'flag': 'aggressive_ending', 'value': 'true'},
          ),
        ),
        'kai_regrets': DialogueTreeNode(
          id: 'kai_regrets',
          text: 'If sealing Alchemy also means giving up what makes us special... so be it.',
          speaker: 'Kai',
          action: DialogueAction(
            type: DialogueActionType.setFlag,
            parameters: {'flag': 'regretful_ending', 'value': 'true'},
          ),
        ),
      },
    );
  }

  /// Dialogue: Pre-finale party talk
  static DialogueTree createPreFinaleDialogue() {
    return DialogueTree(
      id: 'ch7_pre_finale',
      name: 'Before the End',
      startNodeId: 'ember_speaks',
      nodes: {
        'ember_speaks': DialogueTreeNode(
          id: 'ember_speaks',
          text: 'This is it. After Sol Sanctum... everything changes.',
          speaker: 'Ember',
          nextNodeId: 'aria_responds',
        ),
        'aria_responds': DialogueTreeNode(
          id: 'aria_responds',
          text: 'For the better. A world without the threat of Alchemy abuse.',
          speaker: 'Aria',
          nextNodeId: 'zephyr_vision',
        ),
        'zephyr_vision': DialogueTreeNode(
          id: 'zephyr_vision',
          text: 'I\'ve seen it. A peaceful future. But the price...',
          speaker: 'Zephyr',
          nextNodeId: 'kai_comfort',
        ),
        'kai_comfort': DialogueTreeNode(
          id: 'kai_comfort',
          text: 'Whatever happens, we face it together. That\'s all that matters.',
          speaker: 'Kai',
          action: DialogueAction(
            type: DialogueActionType.setFlag,
            parameters: {'flag': 'party_ready_for_end', 'value': 'true'},
          ),
        ),
      },
    );
  }

  /// Get all chapter 7 content
  static Map<String, dynamic> getAllContent() {
    return {
      'chapter_id': chapterId,
      'chapter_name': chapterName,
      'chapter_description': chapterDescription,
      'cutscenes': {
        'jupiter_approach': createJupiterLighthouseApproachCutscene(),
        'jupiter_retrieval': createJupiterRetrievalCutscene(),
        'mercury_infiltration': createMercuryInfiltrationCutscene(),
        'vault_heist': createVaultHeistCutscene(),
        'reunion_escape': createReunionEscapeCutscene(),
        'all_spheres_final': createAllSpheresFinalCutscene(),
      },
      'quests': {
        'main': createMainQuest(),
        'side_free_djinn': createSideQuestFreeDjinn(),
        'side_final_prep': createSideQuestFinalPreparations(),
      },
      'dialogues': {
        'council_confrontation': createCouncilConfrontationDialogue(),
        'pre_finale': createPreFinaleDialogue(),
      },
    };
  }
}
