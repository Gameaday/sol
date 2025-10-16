import 'package:flutter/foundation.dart';
import '../models/story_flags.dart';
import '../models/quest.dart';

/// Manages the game's narrative state and story progression
class StoryManager extends ChangeNotifier {
  StoryFlags _storyFlags;
  final Map<String, Quest> _activeQuests = {};
  final Map<String, Quest> _completedQuests = {};
  final Map<String, Map<String, dynamic>> _questProgress = {};
  
  StoryManager({StoryFlags? initialFlags})
      : _storyFlags = initialFlags ?? StoryFlags();
  
  // Story Flags Management
  
  /// Get a story flag value
  dynamic getFlag(String key, {dynamic defaultValue}) {
    return _storyFlags.getFlag(key, defaultValue: defaultValue);
  }
  
  /// Set a story flag value
  void setFlag(String key, dynamic value) {
    _storyFlags.setFlag(key, value);
    notifyListeners();
  }
  
  /// Check if a flag exists
  bool hasFlag(String key) {
    return _storyFlags.hasFlag(key);
  }
  
  /// Get all story flags
  Map<String, dynamic> getAllFlags() {
    return _storyFlags.getAllFlags();
  }
  
  // Chapter Management
  
  /// Get the current chapter
  int getCurrentChapter() {
    return _storyFlags.getCurrentChapter();
  }
  
  /// Advance to the next chapter
  void advanceChapter() {
    final currentChapter = getCurrentChapter();
    setChapter(currentChapter + 1);
  }
  
  /// Set the current chapter
  void setChapter(int chapter) {
    _storyFlags.setCurrentChapter(chapter);
    notifyListeners();
  }
  
  // Milestone Management
  
  /// Add a story milestone
  void addMilestone(String id, String name, String description) {
    final milestone = StoryMilestone(
      id: id,
      name: name,
      description: description,
      chapter: getCurrentChapter(),
    );
    _storyFlags.addMilestone(milestone);
    notifyListeners();
  }
  
  /// Check if a milestone has been reached
  bool hasMilestone(String milestoneId) {
    return _storyFlags.hasMilestone(milestoneId);
  }
  
  /// Get all milestones
  List<StoryMilestone> getMilestones() {
    return _storyFlags.getMilestones();
  }
  
  // Quest Management
  
  /// Start a new quest
  bool startQuest(Quest quest) {
    if (_activeQuests.containsKey(quest.id)) return false;
    if (_completedQuests.containsKey(quest.id)) return false;
    if (!quest.isAvailable(_storyFlags.getAllFlags())) return false;
    
    _activeQuests[quest.id] = quest;
    _questProgress[quest.id] = {};
    notifyListeners();
    return true;
  }
  
  /// Update quest objective progress
  void updateObjectiveProgress(String questId, String objectiveId, dynamic value) {
    if (!_activeQuests.containsKey(questId)) return;
    
    final progress = _questProgress[questId];
    if (progress != null) {
      progress[objectiveId] = value;
      
      // Check if quest is complete
      final quest = _activeQuests[questId]!;
      if (quest.isComplete(progress)) {
        completeQuest(questId);
      } else {
        notifyListeners();
      }
    }
  }
  
  /// Complete a quest
  void completeQuest(String questId) {
    final quest = _activeQuests.remove(questId);
    if (quest == null) return;
    
    _completedQuests[quest.id] = quest;
    
    // Set completion flags
    if (quest.flagsToSetOnComplete != null) {
      for (final entry in quest.flagsToSetOnComplete!.entries) {
        setFlag(entry.key, entry.value);
      }
    }
    
    notifyListeners();
  }
  
  /// Get an active quest
  Quest? getActiveQuest(String questId) {
    return _activeQuests[questId];
  }
  
  /// Get all active quests
  List<Quest> getActiveQuests() {
    return _activeQuests.values.toList();
  }
  
  /// Get all completed quests
  List<Quest> getCompletedQuests() {
    return _completedQuests.values.toList();
  }
  
  /// Get quest progress
  Map<String, dynamic>? getQuestProgress(String questId) {
    return _questProgress[questId];
  }
  
  /// Check if a quest is active
  bool isQuestActive(String questId) {
    return _activeQuests.containsKey(questId);
  }
  
  /// Check if a quest is completed
  bool isQuestCompleted(String questId) {
    return _completedQuests.containsKey(questId);
  }
  
  // Serialization
  
  Map<String, dynamic> toJson() {
    return {
      'storyFlags': _storyFlags.toJson(),
      'activeQuests': _activeQuests.map((k, v) => MapEntry(k, v.toJson())),
      'completedQuests': _completedQuests.map((k, v) => MapEntry(k, v.toJson())),
      'questProgress': _questProgress,
    };
  }
  
  void loadFromJson(Map<String, dynamic> json) {
    _storyFlags = StoryFlags.fromJson(json['storyFlags'] as Map<String, dynamic>);
    
    _activeQuests.clear();
    final activeQuestsData = json['activeQuests'] as Map<String, dynamic>?;
    if (activeQuestsData != null) {
      for (final entry in activeQuestsData.entries) {
        _activeQuests[entry.key] = Quest.fromJson(entry.value as Map<String, dynamic>);
      }
    }
    
    _completedQuests.clear();
    final completedQuestsData = json['completedQuests'] as Map<String, dynamic>?;
    if (completedQuestsData != null) {
      for (final entry in completedQuestsData.entries) {
        _completedQuests[entry.key] = Quest.fromJson(entry.value as Map<String, dynamic>);
      }
    }
    
    _questProgress.clear();
    final questProgressData = json['questProgress'] as Map<String, dynamic>?;
    if (questProgressData != null) {
      for (final entry in questProgressData.entries) {
        _questProgress[entry.key] = entry.value as Map<String, dynamic>;
      }
    }
    
    notifyListeners();
  }
  
  /// Reset story state
  void reset() {
    _storyFlags = StoryFlags();
    _activeQuests.clear();
    _completedQuests.clear();
    _questProgress.clear();
    notifyListeners();
  }
}
