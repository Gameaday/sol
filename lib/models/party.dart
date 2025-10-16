import 'player.dart';
import 'character_relationship.dart';

/// Represents the party of characters (up to 4)
class Party {
  final List<Player> members;
  final Map<String, CharacterRelationship> relationships;
  String? leaderId;
  
  Party({
    List<Player>? members,
    Map<String, CharacterRelationship>? relationships,
    this.leaderId,
  })  : members = members ?? [],
        relationships = relationships ?? {};
  
  /// Get the party leader
  Player? getLeader() {
    if (leaderId == null || members.isEmpty) return null;
    return members.firstWhere(
      (m) => m.name == leaderId,
      orElse: () => members.first,
    );
  }
  
  /// Set the party leader
  void setLeader(String characterName) {
    if (members.any((m) => m.name == characterName)) {
      leaderId = characterName;
    }
  }
  
  /// Add a character to the party
  bool addMember(Player character) {
    if (members.length >= 4) return false;
    if (hasMember(character.name)) return false;
    
    members.add(character);
    
    // Initialize relationships with existing members
    for (final existingMember in members) {
      if (existingMember.name != character.name) {
        _initializeRelationship(character.name, existingMember.name);
      }
    }
    
    // Set as leader if first member
    if (members.length == 1) {
      leaderId = character.name;
    }
    
    return true;
  }
  
  /// Remove a character from the party
  bool removeMember(String characterName) {
    final index = members.indexWhere((m) => m.name == characterName);
    if (index == -1) return false;
    
    members.removeAt(index);
    
    // Update leader if necessary
    if (leaderId == characterName) {
      leaderId = members.isNotEmpty ? members.first.name : null;
    }
    
    return true;
  }
  
  /// Check if a character is in the party
  bool hasMember(String characterName) {
    return members.any((m) => m.name == characterName);
  }
  
  /// Get a character by name
  Player? getMember(String characterName) {
    try {
      return members.firstWhere((m) => m.name == characterName);
    } catch (_) {
      return null;
    }
  }
  
  /// Get relationship between two characters
  CharacterRelationship? getRelationship(String char1, String char2) {
    final key = _getRelationshipKey(char1, char2);
    return relationships[key];
  }
  
  /// Modify relationship between two characters
  void modifyRelationship(String char1, String char2, int change, String reason) {
    final key = _getRelationshipKey(char1, char2);
    final relationship = relationships[key];
    
    if (relationship != null) {
      relationship.modifyValue(change, reason);
    }
  }
  
  /// Initialize a relationship between two characters
  void _initializeRelationship(String char1, String char2) {
    final key = _getRelationshipKey(char1, char2);
    if (!relationships.containsKey(key)) {
      relationships[key] = CharacterRelationship(
        character1Id: char1,
        character2Id: char2,
      );
    }
  }
  
  /// Get relationship key (consistent ordering)
  String _getRelationshipKey(String char1, String char2) {
    final ids = [char1, char2]..sort();
    return '${ids[0]}_${ids[1]}';
  }
  
  /// Get all living party members
  List<Player> getAliveMembers() {
    return members.where((m) => m.currentHp > 0).toList();
  }
  
  /// Check if entire party is defeated
  bool isDefeated() {
    return members.every((m) => m.currentHp <= 0);
  }
  
  /// Get total party gold (shared pool)
  int getTotalGold() {
    return members.isNotEmpty ? members.first.gold : 0;
  }
  
  /// Distribute gold to party (updates all members)
  void distributeGold(int amount) {
    for (final member in members) {
      member.gold = (member.gold + amount).clamp(0, 999999);
    }
  }
  
  Map<String, dynamic> toJson() {
    return {
      'members': members.map((m) => m.toJson()).toList(),
      'relationships': relationships.map((k, v) => MapEntry(k, v.toJson())),
      if (leaderId != null) 'leaderId': leaderId,
    };
  }
  
  factory Party.fromJson(Map<String, dynamic> json) {
    return Party(
      members: (json['members'] as List)
          .map((m) => Player.fromJson(m as Map<String, dynamic>))
          .toList(),
      relationships: (json['relationships'] as Map<String, dynamic>).map(
        (k, v) => MapEntry(
          k,
          CharacterRelationship.fromJson(v as Map<String, dynamic>),
        ),
      ),
      leaderId: json['leaderId'] as String?,
    );
  }
}
