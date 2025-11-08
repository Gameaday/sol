import 'chapters/chapter1_the_awakening.dart';
import 'chapters/tutorial_first_steps.dart';
import 'chapters/chapter2_the_race_begins.dart';
import 'chapters/chapter3_too_late.dart';
import 'chapters/chapter4_learning_from_mistakes.dart';
import 'chapters/chapter5_the_guide.dart';
import 'chapters/chapter6_victory_and_theft.dart';
import 'chapters/chapter7_the_lighthouses.dart';
import 'chapters/chapter8_the_sacrifice.dart';

/// Registry for all story content in the game
/// Provides centralized access to chapters, cutscenes, quests, and dialogues
class StoryContentRegistry {
  // Singleton pattern
  static final StoryContentRegistry _instance = StoryContentRegistry._internal();
  factory StoryContentRegistry() => _instance;
  StoryContentRegistry._internal();

  /// Map of all chapters by ID
  final Map<String, Map<String, dynamic>> _chapters = {};

  /// Initialize the registry with all chapter content
  void initialize() {
    if (_chapters.isNotEmpty) return; // Already initialized

    // Register all chapters
    _registerChapter(Chapter1TheAwakening.getAllContent());
    _registerChapter(TutorialFirstSteps.getAllContent());
    _registerChapter(Chapter2TheRaceBegins.getAllContent());
    _registerChapter(Chapter3TooLate.getAllContent());
    _registerChapter(Chapter4LearningFromMistakes.getAllContent());
    _registerChapter(Chapter5TheGuide.getAllContent());
    _registerChapter(Chapter6VictoryAndTheft.getAllContent());
    _registerChapter(Chapter7TheLighthouses.getAllContent());
    _registerChapter(Chapter8TheSacrifice.getAllContent());
  }

  void _registerChapter(Map<String, dynamic> chapterContent) {
    final chapterId = chapterContent['chapter_id'] as String;
    _chapters[chapterId] = chapterContent;
  }

  /// Get all chapter IDs in order
  List<String> getChapterIds() {
    return [
      'chapter_1',
      'tutorial',
      'chapter_2',
      'chapter_3',
      'chapter_4',
      'chapter_5',
      'chapter_6',
      'chapter_7',
      'chapter_8',
    ];
  }

  /// Get chapter content by ID
  Map<String, dynamic>? getChapter(String chapterId) {
    return _chapters[chapterId];
  }

  /// Get all chapters
  Map<String, Map<String, dynamic>> getAllChapters() {
    return Map.unmodifiable(_chapters);
  }

  /// Get a specific cutscene from a chapter
  dynamic getCutscene(String chapterId, String cutsceneId) {
    final chapter = getChapter(chapterId);
    if (chapter == null) return null;

    final cutscenes = chapter['cutscenes'] as Map<String, dynamic>?;
    return cutscenes?[cutsceneId];
  }

  /// Get a specific quest from a chapter
  dynamic getQuest(String chapterId, String questId) {
    final chapter = getChapter(chapterId);
    if (chapter == null) return null;

    final quests = chapter['quests'] as Map<String, dynamic>?;
    return quests?[questId];
  }

  /// Get a specific dialogue from a chapter
  dynamic getDialogue(String chapterId, String dialogueId) {
    final chapter = getChapter(chapterId);
    if (chapter == null) return null;

    final dialogues = chapter['dialogues'] as Map<String, dynamic>?;
    return dialogues?[dialogueId];
  }

  /// Get the main quest for a chapter
  dynamic getMainQuest(String chapterId) {
    return getQuest(chapterId, 'main');
  }

  /// Get all quests for a chapter
  Map<String, dynamic> getChapterQuests(String chapterId) {
    final chapter = getChapter(chapterId);
    if (chapter == null) return {};

    return (chapter['quests'] as Map<String, dynamic>?) ?? {};
  }

  /// Get all cutscenes for a chapter
  Map<String, dynamic> getChapterCutscenes(String chapterId) {
    final chapter = getChapter(chapterId);
    if (chapter == null) return {};

    return (chapter['cutscenes'] as Map<String, dynamic>?) ?? {};
  }

  /// Get all dialogues for a chapter
  Map<String, dynamic> getChapterDialogues(String chapterId) {
    final chapter = getChapter(chapterId);
    if (chapter == null) return {};

    return (chapter['dialogues'] as Map<String, dynamic>?) ?? {};
  }

  /// Get chapter metadata
  Map<String, String> getChapterMetadata(String chapterId) {
    final chapter = getChapter(chapterId);
    if (chapter == null) return {};

    return {
      'id': chapter['chapter_id'] as String? ?? '',
      'name': chapter['chapter_name'] as String? ?? '',
      'description': chapter['chapter_description'] as String? ?? '',
    };
  }

  /// Validate that all chapters are properly loaded
  bool validateRegistry() {
    final expectedChapters = getChapterIds();
    for (final chapterId in expectedChapters) {
      if (!_chapters.containsKey(chapterId)) {
        return false;
      }
    }
    return true;
  }

  /// Get statistics about the story content
  Map<String, int> getContentStatistics() {
    int totalCutscenes = 0;
    int totalQuests = 0;
    int totalDialogues = 0;

    for (final chapter in _chapters.values) {
      final cutscenes = chapter['cutscenes'] as Map<String, dynamic>?;
      final quests = chapter['quests'] as Map<String, dynamic>?;
      final dialogues = chapter['dialogues'] as Map<String, dynamic>?;

      totalCutscenes += cutscenes?.length ?? 0;
      totalQuests += quests?.length ?? 0;
      totalDialogues += dialogues?.length ?? 0;
    }

    return {
      'chapters': _chapters.length,
      'cutscenes': totalCutscenes,
      'quests': totalQuests,
      'dialogues': totalDialogues,
    };
  }

  /// Clear the registry (useful for testing)
  void clear() {
    _chapters.clear();
  }
}
