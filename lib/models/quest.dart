/// Represents a quest in the game
class Quest {
  final String id;
  final String name;
  final String description;
  final QuestType type;
  final List<QuestObjective> objectives;
  final QuestReward? reward;
  final Map<String, dynamic>? requiredFlags;
  final Map<String, dynamic>? flagsToSetOnComplete;
  
  Quest({
    required this.id,
    required this.name,
    required this.description,
    required this.type,
    required this.objectives,
    this.reward,
    this.requiredFlags,
    this.flagsToSetOnComplete,
  });
  
  bool isAvailable(Map<String, dynamic> gameFlags) {
    if (requiredFlags == null) return true;
    
    for (final entry in requiredFlags!.entries) {
      if (gameFlags[entry.key] != entry.value) {
        return false;
      }
    }
    return true;
  }
  
  bool isComplete(Map<String, dynamic> objectiveProgress) {
    for (final objective in objectives) {
      if (objective.required && !objective.isComplete(objectiveProgress)) {
        return false;
      }
    }
    return true;
  }
  
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'type': type.toString().split('.').last,
      'objectives': objectives.map((o) => o.toJson()).toList(),
      if (reward != null) 'reward': reward!.toJson(),
      if (requiredFlags != null) 'requiredFlags': requiredFlags,
      if (flagsToSetOnComplete != null)
        'flagsToSetOnComplete': flagsToSetOnComplete,
    };
  }
  
  factory Quest.fromJson(Map<String, dynamic> json) {
    return Quest(
      id: json['id'] as String,
      name: json['name'] as String,
      description: json['description'] as String,
      type: QuestType.values.firstWhere(
        (e) => e.toString().split('.').last == json['type'],
      ),
      objectives: (json['objectives'] as List)
          .map((o) => QuestObjective.fromJson(o as Map<String, dynamic>))
          .toList(),
      reward: json['reward'] != null
          ? QuestReward.fromJson(json['reward'] as Map<String, dynamic>)
          : null,
      requiredFlags: json['requiredFlags'] as Map<String, dynamic>?,
      flagsToSetOnComplete: json['flagsToSetOnComplete'] as Map<String, dynamic>?,
    );
  }
}

/// Types of quests
enum QuestType {
  main,
  side,
  character,
  lore,
  collection,
}

/// Represents an objective within a quest
class QuestObjective {
  final String id;
  final String description;
  final ObjectiveType type;
  final bool required;
  final String? targetId;
  final int? targetCount;
  
  QuestObjective({
    required this.id,
    required this.description,
    required this.type,
    this.required = true,
    this.targetId,
    this.targetCount,
  });
  
  bool isComplete(Map<String, dynamic> progress) {
    final objectiveData = progress[id];
    if (objectiveData == null) return false;
    
    switch (type) {
      case ObjectiveType.talk:
      case ObjectiveType.event:
      case ObjectiveType.reach:
        return objectiveData == true;
      
      case ObjectiveType.collect:
      case ObjectiveType.defeat:
        if (targetCount == null) return objectiveData == true;
        return (objectiveData as int?) != null &&
            objectiveData >= targetCount!;
    }
  }
  
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'description': description,
      'type': type.toString().split('.').last,
      'required': required,
      if (targetId != null) 'targetId': targetId,
      if (targetCount != null) 'targetCount': targetCount,
    };
  }
  
  factory QuestObjective.fromJson(Map<String, dynamic> json) {
    return QuestObjective(
      id: json['id'] as String,
      description: json['description'] as String,
      type: ObjectiveType.values.firstWhere(
        (e) => e.toString().split('.').last == json['type'],
      ),
      required: json['required'] as bool? ?? true,
      targetId: json['targetId'] as String?,
      targetCount: json['targetCount'] as int?,
    );
  }
}

/// Types of objectives
enum ObjectiveType {
  talk,
  collect,
  defeat,
  reach,
  event,
}

/// Represents rewards for completing a quest
class QuestReward {
  final int? experience;
  final int? gold;
  final List<String>? items;
  final String? psynergy;
  final Map<String, int>? relationships;
  
  QuestReward({
    this.experience,
    this.gold,
    this.items,
    this.psynergy,
    this.relationships,
  });
  
  Map<String, dynamic> toJson() {
    return {
      if (experience != null) 'experience': experience,
      if (gold != null) 'gold': gold,
      if (items != null) 'items': items,
      if (psynergy != null) 'psynergy': psynergy,
      if (relationships != null) 'relationships': relationships,
    };
  }
  
  factory QuestReward.fromJson(Map<String, dynamic> json) {
    return QuestReward(
      experience: json['experience'] as int?,
      gold: json['gold'] as int?,
      items: json['items'] != null
          ? List<String>.from(json['items'] as List)
          : null,
      psynergy: json['psynergy'] as String?,
      relationships: json['relationships'] != null
          ? Map<String, int>.from(json['relationships'] as Map)
          : null,
    );
  }
}
