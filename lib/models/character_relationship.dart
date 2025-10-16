/// Represents the relationship between two characters
class CharacterRelationship {
  final String character1Id;
  final String character2Id;
  int value; // -100 (hostile) to 100 (close bond)
  final List<RelationshipEvent> history;
  
  CharacterRelationship({
    required this.character1Id,
    required this.character2Id,
    this.value = 0,
    List<RelationshipEvent>? history,
  }) : history = history ?? [];
  
  /// Get relationship level based on value
  RelationshipLevel get level {
    if (value >= 80) return RelationshipLevel.soulmate;
    if (value >= 60) return RelationshipLevel.trustedAlly;
    if (value >= 40) return RelationshipLevel.friend;
    if (value >= 20) return RelationshipLevel.friendly;
    if (value >= -20) return RelationshipLevel.neutral;
    if (value >= -40) return RelationshipLevel.tense;
    if (value >= -60) return RelationshipLevel.unfriendly;
    if (value >= -80) return RelationshipLevel.hostile;
    return RelationshipLevel.enemy;
  }
  
  /// Modify relationship value and record the event
  void modifyValue(int change, String reason) {
    final oldValue = value;
    value = (value + change).clamp(-100, 100);
    
    if (value != oldValue) {
      history.add(RelationshipEvent(
        timestamp: DateTime.now(),
        change: change,
        reason: reason,
        newValue: value,
      ));
    }
  }
  
  /// Check if a relationship threshold has been reached
  bool hasReachedThreshold(int threshold) {
    return value >= threshold;
  }
  
  /// Get the relationship key (consistent ordering)
  String getKey() {
    final ids = [character1Id, character2Id]..sort();
    return '${ids[0]}_${ids[1]}';
  }
  
  Map<String, dynamic> toJson() {
    return {
      'character1Id': character1Id,
      'character2Id': character2Id,
      'value': value,
      'history': history.map((e) => e.toJson()).toList(),
    };
  }
  
  factory CharacterRelationship.fromJson(Map<String, dynamic> json) {
    return CharacterRelationship(
      character1Id: json['character1Id'] as String,
      character2Id: json['character2Id'] as String,
      value: json['value'] as int,
      history: (json['history'] as List?)
              ?.map((e) => RelationshipEvent.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );
  }
}

/// Represents a relationship level
enum RelationshipLevel {
  enemy,
  hostile,
  unfriendly,
  tense,
  neutral,
  friendly,
  friend,
  trustedAlly,
  soulmate,
}

/// Represents an event that affected a relationship
class RelationshipEvent {
  final DateTime timestamp;
  final int change;
  final String reason;
  final int newValue;
  
  RelationshipEvent({
    required this.timestamp,
    required this.change,
    required this.reason,
    required this.newValue,
  });
  
  Map<String, dynamic> toJson() {
    return {
      'timestamp': timestamp.toIso8601String(),
      'change': change,
      'reason': reason,
      'newValue': newValue,
    };
  }
  
  factory RelationshipEvent.fromJson(Map<String, dynamic> json) {
    return RelationshipEvent(
      timestamp: DateTime.parse(json['timestamp'] as String),
      change: json['change'] as int,
      reason: json['reason'] as String,
      newValue: json['newValue'] as int,
    );
  }
}

/// Bonuses that can be unlocked through relationships
class RelationshipBonus {
  final RelationshipLevel requiredLevel;
  final RelationshipBonusType type;
  final int value;
  final String description;
  
  RelationshipBonus({
    required this.requiredLevel,
    required this.type,
    required this.value,
    required this.description,
  });
}

/// Types of bonuses from relationships
enum RelationshipBonusType {
  comboBonusDamage,
  comboBonusHealing,
  defenseBonus,
  criticalChance,
  unlockDialogue,
  unlockComboPsynergy,
}
