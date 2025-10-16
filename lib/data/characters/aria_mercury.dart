import '../../models/player.dart';
import '../../models/psynergy.dart';

/// Aria - Mercury (Water) Witch
/// The third character to join the party
/// Acquisition: Second Town (mid-game addition, brings healing and support)
class AriaMercury {
  /// Create Aria with starting stats
  static Player create({int level = 5}) {
    return Player(
      name: 'Aria',
      level: level,
      maxHp: 22,
      currentHp: 22,
      maxPp: 20,
      currentPp: 20,
      attack: 5,
      defense: 6,
      speed: 5,
      experience: level > 1 ? (level - 1) * 100 : 0,
      gold: 50,
      inventory: ['herb', 'antidote', 'potion'],
      learnedPsynergy: _getPsynergyForLevel(level),
      flags: {
        'is_aria': true,
        'element': 'mercury',
        'class': 'witch',
        'scholar': true,
        'will_sacrifice': true,  // Foreshadowing her fate
      },
    );
  }

  /// Get Psynergy list for a given level
  static List<String> _getPsynergyForLevel(int level) {
    final psynergy = <String>['drizzle', 'cure', 'frost'];
    final progression = getPsynergyByLevel();
    
    for (final entry in progression.entries) {
      if (level >= entry.key) {
        for (final p in entry.value) {
          if (!psynergy.contains(p)) {
            psynergy.add(p);
          }
        }
      }
    }
    
    return psynergy;
  }

  /// Aria's character-specific Psynergy progression
  static Map<int, List<String>> getPsynergyByLevel() {
    return {
      1: ['drizzle', 'cure', 'frost'],  // Starting abilities
      5: ['ply'],                       // Better healing
      7: ['ice_horn'],                  // Single-target ice attack
      9: ['cure_well'],                 // Enhanced group healing
      12: ['wish'],                     // Party-wide healing
      15: ['ice_missile'],              // Strong single-target
      18: ['tundra'],                   // Area water attack
      22: ['pure_wish'],                // Full party healing
      27: ['diamond_dust'],             // Ultimate Mercury attack
      30: ['crystal_powder'],           // Full party status cure
    };
  }

  /// Get character description for UI/story
  static String getDescription() {
    return 'A Mercury scholar who has researched ancient warnings about the towers. '
        'Aria joins to prevent the catastrophe she has studied. '
        'Specializes in water-based Psynergy, healing, and support magic. '
        'Her sacrifice will be remembered forever.';
  }

  /// Get character backstory
  static String getBackstory() {
    return 'Raised in academic circles, Aria dedicated her life to studying ancient texts '
        'and prophecies. Her research uncovered warnings about the Elemental Lighthouses '
        'and the danger they pose if activated. Knowing what\'s at stake, she leaves her '
        'comfortable scholarly life to join the fight. Wise beyond her years, she carries '
        'the weight of knowledge that foretells her ultimate sacrifice.';
  }

  /// Character traits for dialogue system
  static Map<String, int> getPersonalityTraits() {
    return {
      'justice': 70,        // Driven by knowledge of consequences
      'courage': 85,        // Brave despite knowing her fate
      'empathy': 90,        // Deeply cares for others
      'pragmatism': 75,     // Scholarly and analytical
      'curiosity': 95,      // Scholar at heart
    };
  }

  /// Initial relationship values with other characters
  static Map<String, int> getInitialRelationships() {
    return {
      'kai': 15,      // Admires his determination
      'ember': 5,     // Cautious of military background
      'zephyr': 0,    // Will meet later, intellectual connection
    };
  }

  /// Equipment slots and starting equipment
  static Map<String, String?> getStartingEquipment() {
    return {
      'weapon': 'staff',            // Scholar's weapon
      'armor': 'silk_robe',
      'helm': 'circlet',
      'shield': null,
      'accessory': 'wisdom_ring',
    };
  }

  /// Character growth stats per level
  static Map<String, double> getGrowthRates() {
    return {
      'hp': 4.0,        // Lowest HP growth (support role)
      'pp': 4.5,        // Highest PP growth for healing/support
      'attack': 1.5,    // Lowest attack (not a fighter)
      'defense': 2.0,   // Higher defense through positioning
      'speed': 1.8,     // Moderate speed
    };
  }

  /// Special note about character's fate
  static String getFateNote() {
    return 'Aria will sacrifice herself during the final sealing ritual at Sol Sanctum. '
        'Her sacrifice, along with Zephyr\'s, will enable Kai and Ember to complete '
        'the seal and found Vale. This should be subtly foreshadowed through dialogue '
        'and her scholarly understanding of what must be done.';
  }
}
