import '../../models/quest.dart';
import '../../models/dialogue_tree.dart';
import '../../models/cutscene_script.dart';

/// Helper class for validating story content integrity
class StoryValidationHelper {
  /// Validate a quest has all required fields
  static List<String> validateQuest(Quest quest) {
    final errors = <String>[];

    if (quest.id.isEmpty) {
      errors.add('Quest missing ID');
    }

    if (quest.name.isEmpty) {
      errors.add('Quest "${quest.id}" missing name');
    }

    if (quest.description.isEmpty) {
      errors.add('Quest "${quest.id}" missing description');
    }

    if (quest.objectives.isEmpty) {
      errors.add('Quest "${quest.id}" has no objectives');
    }

    // Validate objectives
    for (int i = 0; i < quest.objectives.length; i++) {
      final objective = quest.objectives[i];
      if (objective.id.isEmpty) {
        errors.add('Quest "${quest.id}" objective $i missing ID');
      }
      if (objective.description.isEmpty) {
        errors.add('Quest "${quest.id}" objective "${objective.id}" missing description');
      }
    }

    return errors;
  }

  /// Validate a dialogue tree structure
  static List<String> validateDialogueTree(DialogueTree tree) {
    final errors = <String>[];

    if (tree.id.isEmpty) {
      errors.add('DialogueTree missing ID');
    }

    if (tree.startNodeId.isEmpty) {
      errors.add('DialogueTree "${tree.id}" missing startNodeId');
    }

    if (tree.nodes.isEmpty) {
      errors.add('DialogueTree "${tree.id}" has no nodes');
    }

    // Check if start node exists
    if (!tree.nodes.containsKey(tree.startNodeId)) {
      errors.add('DialogueTree "${tree.id}" start node "${tree.startNodeId}" not found');
    }

    // Validate each node
    for (final entry in tree.nodes.entries) {
      final nodeId = entry.key;
      final node = entry.value;

      if (node.text.isEmpty) {
        errors.add('DialogueTree "${tree.id}" node "$nodeId" has empty text');
      }

      // Check if nextNodeId exists (if specified)
      if (node.nextNodeId != null && !tree.nodes.containsKey(node.nextNodeId)) {
        errors.add('DialogueTree "${tree.id}" node "$nodeId" references non-existent node "${node.nextNodeId}"');
      }

      // Validate choices
      for (final choice in node.choices) {
        if (choice.text.isEmpty) {
          errors.add('DialogueTree "${tree.id}" node "$nodeId" has choice with empty text');
        }
        if (!tree.nodes.containsKey(choice.nextNodeId)) {
          errors.add('DialogueTree "${tree.id}" node "$nodeId" choice "${choice.id}" references non-existent node "${choice.nextNodeId}"');
        }
      }
    }

    return errors;
  }

  /// Validate a cutscene script
  static List<String> validateCutsceneScript(CutsceneScript script) {
    final errors = <String>[];

    if (script.id.isEmpty) {
      errors.add('CutsceneScript missing ID');
    }

    if (script.name.isEmpty) {
      errors.add('CutsceneScript "${script.id}" missing name');
    }

    if (script.events.isEmpty) {
      errors.add('CutsceneScript "${script.id}" has no events');
    }

    // Validate events
    for (int i = 0; i < script.events.length; i++) {
      final event = script.events[i];
      
      // Check for reasonable durations
      if (event.duration != null && event.duration! < 0) {
        errors.add('CutsceneScript "${script.id}" event $i has negative duration');
      }
      if (event.duration != null && event.duration! > 30) {
        errors.add('CutsceneScript "${script.id}" event $i has very long duration (${event.duration}s)');
      }

      // Validate dialogue events have text
      if (event.type == CutsceneEventType.showDialogue && 
          (event.text == null || event.text!.isEmpty)) {
        errors.add('CutsceneScript "${script.id}" event $i is dialogue but has no text');
      }

      // Validate text events have text
      if (event.type == CutsceneEventType.showText && 
          (event.text == null || event.text!.isEmpty)) {
        errors.add('CutsceneScript "${script.id}" event $i is text but has no text');
      }
    }

    return errors;
  }

  /// Validate an entire chapter's content
  static Map<String, List<String>> validateChapterContent(Map<String, dynamic> chapterContent) {
    final allErrors = <String, List<String>>{};

    // Validate metadata
    if (!chapterContent.containsKey('chapter_id') || chapterContent['chapter_id'].toString().isEmpty) {
      allErrors['metadata'] = ['Chapter missing chapter_id'];
    }
    if (!chapterContent.containsKey('chapter_name') || chapterContent['chapter_name'].toString().isEmpty) {
      allErrors['metadata'] = (allErrors['metadata'] ?? [])..add('Chapter missing chapter_name');
    }

    // Validate cutscenes
    final cutscenes = chapterContent['cutscenes'] as Map<String, dynamic>?;
    if (cutscenes != null) {
      for (final entry in cutscenes.entries) {
        final cutsceneId = entry.key;
        if (entry.value is CutsceneScript) {
          final errors = validateCutsceneScript(entry.value as CutsceneScript);
          if (errors.isNotEmpty) {
            allErrors['cutscene_$cutsceneId'] = errors;
          }
        }
      }
    }

    // Validate quests
    final quests = chapterContent['quests'] as Map<String, dynamic>?;
    if (quests != null) {
      for (final entry in quests.entries) {
        final questId = entry.key;
        if (entry.value is Quest) {
          final errors = validateQuest(entry.value as Quest);
          if (errors.isNotEmpty) {
            allErrors['quest_$questId'] = errors;
          }
        }
      }
    }

    // Validate dialogues
    final dialogues = chapterContent['dialogues'] as Map<String, dynamic>?;
    if (dialogues != null) {
      for (final entry in dialogues.entries) {
        final dialogueId = entry.key;
        if (entry.value is DialogueTree) {
          final errors = validateDialogueTree(entry.value as DialogueTree);
          if (errors.isNotEmpty) {
            allErrors['dialogue_$dialogueId'] = errors;
          }
        }
      }
    }

    return allErrors;
  }

  /// Generate a validation report for all chapters
  static String generateValidationReport(Map<String, Map<String, List<String>>> allChapterErrors) {
    final buffer = StringBuffer();
    buffer.writeln('Story Content Validation Report');
    buffer.writeln('=' * 50);
    buffer.writeln();

    int totalErrors = 0;
    int chaptersWithErrors = 0;

    for (final entry in allChapterErrors.entries) {
      final chapterId = entry.key;
      final errors = entry.value;

      if (errors.isEmpty) continue;

      chaptersWithErrors++;
      buffer.writeln('Chapter: $chapterId');
      buffer.writeln('-' * 30);

      for (final errorEntry in errors.entries) {
        final contentType = errorEntry.key;
        final contentErrors = errorEntry.value;
        totalErrors += contentErrors.length;

        buffer.writeln('  $contentType:');
        for (final error in contentErrors) {
          buffer.writeln('    - $error');
        }
        buffer.writeln();
      }
    }

    buffer.writeln();
    buffer.writeln('Summary:');
    buffer.writeln('  Total Errors: $totalErrors');
    buffer.writeln('  Chapters with Errors: $chaptersWithErrors');

    if (totalErrors == 0) {
      buffer.writeln('\n✓ All story content validated successfully!');
    }

    return buffer.toString();
  }

  /// Quick check if content is valid
  static bool isContentValid(Map<String, dynamic> chapterContent) {
    final errors = validateChapterContent(chapterContent);
    return errors.isEmpty;
  }
}
