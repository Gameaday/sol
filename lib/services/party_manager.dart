import 'package:flutter/foundation.dart';
import '../models/party.dart';
import '../models/player.dart';
import '../models/character_relationship.dart';

/// Manages the party of characters and their relationships
class PartyManager extends ChangeNotifier {
  Party _party;
  
  PartyManager({Party? initialParty})
      : _party = initialParty ?? Party();
  
  /// Get the party
  Party get party => _party;
  
  /// Get all party members
  List<Player> get members => _party.members;
  
  /// Get the party leader
  Player? get leader => _party.getLeader();
  
  /// Set the party leader
  void setLeader(String characterName) {
    _party.setLeader(characterName);
    notifyListeners();
  }
  
  /// Add a character to the party
  bool addMember(Player character) {
    final success = _party.addMember(character);
    if (success) {
      notifyListeners();
    }
    return success;
  }
  
  /// Remove a character from the party
  bool removeMember(String characterName) {
    final success = _party.removeMember(characterName);
    if (success) {
      notifyListeners();
    }
    return success;
  }
  
  /// Check if a character is in the party
  bool hasMember(String characterName) {
    return _party.hasMember(characterName);
  }
  
  /// Get a character by name
  Player? getMember(String characterName) {
    return _party.getMember(characterName);
  }
  
  /// Get all living party members
  List<Player> getAliveMembers() {
    return _party.getAliveMembers();
  }
  
  /// Check if entire party is defeated
  bool isPartyDefeated() {
    return _party.isDefeated();
  }
  
  // Relationship Management
  
  /// Get relationship between two characters
  CharacterRelationship? getRelationship(String char1, String char2) {
    return _party.getRelationship(char1, char2);
  }
  
  /// Modify relationship between two characters
  void modifyRelationship(String char1, String char2, int change, String reason) {
    _party.modifyRelationship(char1, char2, change, reason);
    notifyListeners();
  }
  
  /// Get all relationships
  Map<String, CharacterRelationship> getAllRelationships() {
    return Map.unmodifiable(_party.relationships);
  }
  
  /// Get relationship level between two characters
  RelationshipLevel? getRelationshipLevel(String char1, String char2) {
    final relationship = getRelationship(char1, char2);
    return relationship?.level;
  }
  
  /// Check if a relationship threshold has been reached
  bool hasRelationshipThreshold(String char1, String char2, int threshold) {
    final relationship = getRelationship(char1, char2);
    if (relationship == null) return false;
    return relationship.hasReachedThreshold(threshold);
  }
  
  // Gold Management
  
  /// Get total party gold
  int getTotalGold() {
    return _party.getTotalGold();
  }
  
  /// Add gold to the party
  void addGold(int amount) {
    _party.distributeGold(amount);
    notifyListeners();
  }
  
  /// Remove gold from the party
  bool removeGold(int amount) {
    final currentGold = getTotalGold();
    if (currentGold < amount) return false;
    
    _party.distributeGold(-amount);
    notifyListeners();
    return true;
  }
  
  // Party Actions
  
  /// Heal entire party to full HP/PP
  void healParty() {
    for (final member in members) {
      member.currentHp = member.maxHp;
      member.currentPp = member.maxPp;
    }
    notifyListeners();
  }
  
  /// Restore party HP/PP by percentage
  void restoreParty(double hpPercent, double ppPercent) {
    for (final member in members) {
      member.heal((member.maxHp * hpPercent).round());
      member.restorePp((member.maxPp * ppPercent).round());
    }
    notifyListeners();
  }
  
  /// Distribute experience to all party members
  void distributeExperience(int experience) {
    for (final member in members) {
      member.gainExperience(experience);
    }
    notifyListeners();
  }
  
  // Serialization
  
  Map<String, dynamic> toJson() {
    return _party.toJson();
  }
  
  void loadFromJson(Map<String, dynamic> json) {
    _party = Party.fromJson(json);
    notifyListeners();
  }
  
  /// Reset party state
  void reset() {
    _party = Party();
    notifyListeners();
  }
  
  /// Create a default starting party (for new game)
  void createStartingParty(String leaderName) {
    _party = Party();
    
    // Create the starting character
    final leader = Player(
      name: leaderName,
      level: 1,
      currentHp: 20,
      maxHp: 20,
      currentPp: 20,
      maxPp: 20,
      attack: 5,
      defense: 3,
      speed: 5,
      experience: 0,
      gold: 50,
    );
    
    // Learn starting Psynergy
    leader.learnPsynergy('move');
    leader.learnPsynergy('quake');
    
    addMember(leader);
    notifyListeners();
  }
}
