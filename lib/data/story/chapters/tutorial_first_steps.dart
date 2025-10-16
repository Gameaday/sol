import '../../../models/quest.dart';
import '../../../models/dialogue_tree.dart';
import '../../../models/cutscene_script.dart';

/// Tutorial: "First Steps"
/// Ember joins as the second party member and teaches party mechanics
class TutorialFirstSteps {
  static const String chapterId = 'tutorial';
  static const String chapterName = 'First Steps';
  static const String chapterDescription = 
      'Kai meets Ember, a former soldier who defected from the tower project. Together they learn to work as a team.';

  /// Ember introduction cutscene
  static CutsceneScript createEmberIntroductionCutscene() {
    return CutsceneScript(
      id: 'tutorial_ember_intro',
      name: 'Ember Introduction',
      events: [
        CutsceneEvent(
          type: CutsceneEventType.fadeIn,
          duration: 1.0,
        ),
        CutsceneEvent(
          type: CutsceneEventType.showText,
          text: 'Training Grounds - Northern Path',
          duration: 2.0,
        ),
        CutsceneEvent(
          type: CutsceneEventType.playAnimation,
          animationId: 'kai_walking',
          duration: 2.0,
        ),
        CutsceneEvent(
          type: CutsceneEventType.playSound,
          soundId: 'combat_sounds',
          duration: 1.0,
        ),
        CutsceneEvent(
          type: CutsceneEventType.showDialogue,
          speaker: 'Kai',
          text: 'What\'s that sound?',
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
          type: CutsceneEventType.playAnimation,
          animationId: 'ember_flare',
          duration: 1.5,
        ),
        CutsceneEvent(
          type: CutsceneEventType.showDialogue,
          speaker: 'Ember',
          text: 'Stand back!',
          duration: 2.0,
        ),
        CutsceneEvent(
          type: CutsceneEventType.playAnimation,
          animationId: 'monster_defeated',
          duration: 2.0,
        ),
        CutsceneEvent(
          type: CutsceneEventType.showDialogue,
          speaker: 'Kai',
          text: 'That was... impressive.',
          duration: 2.5,
        ),
        CutsceneEvent(
          type: CutsceneEventType.showDialogue,
          speaker: 'Ember',
          text: 'You\'re an Adept. What are you doing here alone?',
          duration: 3.0,
        ),
        CutsceneEvent(
          type: CutsceneEventType.fadeOut,
          duration: 1.5,
        ),
      ],
      canSkip: false,
    );
  }

  /// Party formation tutorial cutscene
  static CutsceneScript createPartyTutorialCutscene() {
    return CutsceneScript(
      id: 'tutorial_party_formation',
      name: 'Party Formation Tutorial',
      events: [
        CutsceneEvent(
          type: CutsceneEventType.showText,
          text: 'Party System Tutorial',
          duration: 2.0,
        ),
        CutsceneEvent(
          type: CutsceneEventType.showText,
          text: 'You now have two party members! You can switch between them in the menu.',
          duration: 4.0,
        ),
        CutsceneEvent(
          type: CutsceneEventType.showText,
          text: 'In battle, both characters will participate. Use their unique abilities strategically!',
          duration: 4.0,
        ),
        CutsceneEvent(
          type: CutsceneEventType.showText,
          text: 'Kai specializes in Earth Psynergy, while Ember wields Fire.',
          duration: 4.0,
        ),
      ],
      canSkip: true,
    );
  }

  /// Main quest: First Ally
  static Quest createMainQuest() {
    return Quest(
      id: 'tutorial_first_ally',
      name: 'First Ally',
      description: 
          'After meeting Ember at the training grounds, work together to clear the dungeon '
          'and learn how to function as a team.',
      type: QuestType.main,
      objectives: [
        QuestObjective(
          id: 'meet_ember',
          description: 'Meet the mysterious fighter',
          type: ObjectiveType.event,
          required: true,
        ),
        QuestObjective(
          id: 'talk_to_ember',
          description: 'Speak with Ember',
          type: ObjectiveType.talk,
          required: true,
          targetId: 'ember',
        ),
        QuestObjective(
          id: 'form_party',
          description: 'Form a party with Ember',
          type: ObjectiveType.event,
          required: true,
        ),
        QuestObjective(
          id: 'clear_training_dungeon',
          description: 'Clear the training dungeon together',
          type: ObjectiveType.reach,
          required: true,
          targetId: 'dungeon_exit',
        ),
        QuestObjective(
          id: 'defeat_dungeon_boss',
          description: 'Defeat the guardian creature',
          type: ObjectiveType.battle,
          required: true,
          targetId: 'training_guardian',
        ),
      ],
      reward: QuestReward(
        experience: 200,
        gold: 150,
        items: ['potion', 'potion', 'nut'],
        relationships: {
          'kai_ember': 15,  // Significant bond formed
        },
      ),
      requiredFlags: {
        'chapter_1_complete': true,
      },
      flagsToSetOnComplete: {
        'tutorial_complete': true,
        'ember_joined': true,
        'knows_party_mechanics': true,
      },
    );
  }

  /// Side quest: Cooperative Psynergy
  static Quest createPsynergyPuzzleQuest() {
    return Quest(
      id: 'tutorial_psynergy_puzzle',
      name: 'Combined Power',
      description: 
          'Learn to use cooperative Psynergy to solve environmental puzzles.',
      type: QuestType.side,
      objectives: [
        QuestObjective(
          id: 'find_locked_door',
          description: 'Find the sealed chamber',
          type: ObjectiveType.reach,
          required: true,
          targetId: 'sealed_chamber',
        ),
        QuestObjective(
          id: 'use_move_psynergy',
          description: 'Use Move Psynergy on the boulder (Kai)',
          type: ObjectiveType.event,
          required: true,
        ),
        QuestObjective(
          id: 'use_blaze_psynergy',
          description: 'Use Blaze Psynergy on the torches (Ember)',
          type: ObjectiveType.event,
          required: true,
        ),
        QuestObjective(
          id: 'open_chamber',
          description: 'Enter the opened chamber',
          type: ObjectiveType.reach,
          required: true,
          targetId: 'chamber_interior',
        ),
      ],
      reward: QuestReward(
        experience: 100,
        items: ['power_bread', 'guardian_ring'],
      ),
    );
  }

  /// Dialogue: First conversation with Ember
  static DialogueTree createEmberFirstDialogue() {
    return DialogueTree(
      id: 'tutorial_ember_first',
      name: 'Meeting Ember',
      startNodeId: 'suspicion',
      nodes: {
        'suspicion': DialogueTreeNode(
          id: 'suspicion',
          text: 'You\'re traveling alone? That\'s dangerous, especially these days.',
          speaker: 'Ember',
          choices: [
            DialogueTreeChoice(
              id: 'explain_mission',
              text: 'I\'m investigating the tower project.',
              nextNodeId: 'recognition',
              tone: ChoiceTone.diplomatic,
            ),
            DialogueTreeChoice(
              id: 'ask_who',
              text: 'Who are you?',
              nextNodeId: 'introduction',
              tone: ChoiceTone.curious,
            ),
            DialogueTreeChoice(
              id: 'defensive',
              text: 'I can handle myself.',
              nextNodeId: 'respect',
              tone: ChoiceTone.aggressive,
            ),
          ],
        ),
        'recognition': DialogueTreeNode(
          id: 'recognition',
          text: 'The towers... I know about them. I used to work on that project.',
          speaker: 'Ember',
          nextNodeId: 'confession',
        ),
        'introduction': DialogueTreeNode(
          id: 'introduction',
          text: 'My name is Ember. I\'m... well, I\'m trying to make up for past mistakes.',
          speaker: 'Ember',
          nextNodeId: 'ask_about_past',
        ),
        'respect': DialogueTreeNode(
          id: 'respect',
          text: 'I can see that. You have skill. But even skilled warriors need allies.',
          speaker: 'Ember',
          nextNodeId: 'introduction',
        ),
        'confession': DialogueTreeNode(
          id: 'confession',
          text: 'I was a soldier. I helped build those towers before I learned what they were really for.',
          speaker: 'Ember',
          nextNodeId: 'guilt',
        ),
        'guilt': DialogueTreeNode(
          id: 'guilt',
          text: 'Now I\'m trying to stop what I helped create.',
          speaker: 'Ember',
          choices: [
            DialogueTreeChoice(
              id: 'accept',
              text: 'Then we\'re on the same side.',
              nextNodeId: 'relief',
              tone: ChoiceTone.diplomatic,
            ),
            DialogueTreeChoice(
              id: 'suspicious',
              text: 'How do I know I can trust you?',
              nextNodeId: 'understanding',
              tone: ChoiceTone.pragmatic,
            ),
            DialogueTreeChoice(
              id: 'angry',
              text: 'You helped build them?!',
              nextNodeId: 'acknowledge_anger',
              tone: ChoiceTone.aggressive,
            ),
          ],
        ),
        'ask_about_past': DialogueTreeNode(
          id: 'ask_about_past',
          text: 'What kind of mistakes?',
          speaker: 'Kai',
          nextNodeId: 'confession',
        ),
        'relief': DialogueTreeNode(
          id: 'relief',
          text: 'Thank you. I promise you won\'t regret this.',
          speaker: 'Ember',
          nextNodeId: 'propose_team',
        ),
        'understanding': DialogueTreeNode(
          id: 'understanding',
          text: 'You can\'t. Not yet. But I hope to earn your trust through actions.',
          speaker: 'Ember',
          nextNodeId: 'propose_team',
        ),
        'acknowledge_anger': DialogueTreeNode(
          id: 'acknowledge_anger',
          text: 'I know. I\'ll carry that guilt forever. But I\'m trying to make it right.',
          speaker: 'Ember',
          nextNodeId: 'propose_team',
        ),
        'propose_team': DialogueTreeNode(
          id: 'propose_team',
          text: 'This dungeon is dangerous. We should work together.',
          speaker: 'Ember',
          choices: [
            DialogueTreeChoice(
              id: 'agree',
              text: 'Alright. Let\'s do this together.',
              nextNodeId: 'accepted',
              tone: ChoiceTone.diplomatic,
            ),
            DialogueTreeChoice(
              id: 'practical',
              text: 'Fine. But prove yourself.',
              nextNodeId: 'accepted',
              tone: ChoiceTone.pragmatic,
            ),
          ],
        ),
        'accepted': DialogueTreeNode(
          id: 'accepted',
          text: 'Good. Stay close and watch each other\'s backs.',
          speaker: 'Ember',
          flagsToSet: {
            'ember_trust_begin': true,
          },
          action: DialogueAction(
            type: DialogueActionType.triggerEvent,
            parameters: {
              'event': 'ember_joins_party',
            },
          ),
        ),
      },
    );
  }

  /// Dialogue: After clearing dungeon
  static DialogueTree createPostDungeonDialogue() {
    return DialogueTree(
      id: 'tutorial_post_dungeon',
      name: 'After the Dungeon',
      startNodeId: 'success',
      nodes: {
        'success': DialogueTreeNode(
          id: 'success',
          text: 'We make a good team.',
          speaker: 'Ember',
          nextNodeId: 'kai_agrees',
        ),
        'kai_agrees': DialogueTreeNode(
          id: 'kai_agrees',
          text: 'We do. Your combat experience really showed.',
          speaker: 'Kai',
          nextNodeId: 'ember_compliment',
        ),
        'ember_compliment': DialogueTreeNode(
          id: 'ember_compliment',
          text: 'And your Psynergy control is impressive. You have natural talent.',
          speaker: 'Ember',
          nextNodeId: 'plan',
        ),
        'plan': DialogueTreeNode(
          id: 'plan',
          text: 'So, where do we go from here?',
          speaker: 'Ember',
          choices: [
            DialogueTreeChoice(
              id: 'determined',
              text: 'To stop the towers. Together.',
              nextNodeId: 'partnership',
              tone: ChoiceTone.aggressive,
            ),
            DialogueTreeChoice(
              id: 'thoughtful',
              text: 'We need more information first.',
              nextNodeId: 'partnership',
              tone: ChoiceTone.pragmatic,
            ),
          ],
        ),
        'partnership': DialogueTreeNode(
          id: 'partnership',
          text: 'Together. I like the sound of that.',
          speaker: 'Ember',
          flagsToSet: {
            'ember_partnership_formed': true,
          },
        ),
      },
    );
  }

  /// Get all tutorial content
  static Map<String, dynamic> getAllContent() {
    return {
      'chapter_id': chapterId,
      'chapter_name': chapterName,
      'chapter_description': chapterDescription,
      'cutscenes': {
        'ember_intro': createEmberIntroductionCutscene(),
        'party_tutorial': createPartyTutorialCutscene(),
      },
      'quests': {
        'main': createMainQuest(),
        'psynergy_puzzle': createPsynergyPuzzleQuest(),
      },
      'dialogues': {
        'ember_first': createEmberFirstDialogue(),
        'post_dungeon': createPostDungeonDialogue(),
      },
    };
  }
}
