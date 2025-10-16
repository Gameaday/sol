import '../../models/player.dart';
import '../../models/psynergy.dart';

/// Ember - Mars (Fire) Alchemist
/// The second character to join the party
/// Acquisition: Tutorial/Starting Area (joins early to teach party mechanics)
class EmberMars {
  /// Create Ember with starting stats
  static Player create({int level = 2}) {
    return Player(
      name: 'Ember',
      level: level,
      maxHp: 25,
      currentHp: 25,
      maxPp: 15,
      currentPp: 15,
      attack: 8,
      defense: 4,
      speed: 6,
      experience: level > 1 ? (level - 1) * 100 : 0,
      gold: 50,
      inventory: ['potion'],
      learnedPsynergy: _getPsynergyForLevel(level),
      flags: {
        'is_ember': true,
        'element': 'mars',
        'class': 'alchemist',
        'former_soldier': true,
      },
    );
  }

  /// Get Psynergy list for a given level
  static List<String> _getPsynergyForLevel(int level) {
    final psynergy = <String>['flare', 'blaze'];
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

  /// Ember's character-specific Psynergy progression
  static Map<int, List<String>> getPsynergyByLevel() {
    return {
      1: ['flare', 'blaze'],          // Starting abilities
      4: ['fireball'],                // Area fire attack
      6: ['torch'],                   // Field utility for lighting
      8: ['volcano'],                 // Strong area attack
      11: ['eruption'],               // Powerful single-target
      14: ['flame_burst'],            // Multi-hit fire attack
      17: ['inferno'],                // High-power area damage
      21: ['blast'],                  // Single target devastation
      26: ['meteor'],                 // Ultimate Mars Psynergy
      29: ['phoenix_fire'],           // Revive with fire (late game)
    };
  }

  /// Get character description for UI/story
  static String getDescription() {
    return 'A former soldier who defected from the tower project after witnessing its true purpose. '
        'Ember brings combat experience and tactical knowledge. '
        'Specializes in fire-based Psynergy and provides aggressive offensive power.';
  }

  /// Get character backstory
  static String getBackstory() {
    return 'Once a decorated soldier in the forces building the elemental towers, '
        'Ember discovered the horrifying truth behind the project. Unable to continue '
        'serving a cause that would harm the world, Ember deserted and now fights '
        'to stop the very project once sworn to protect. Haunted by past actions, '
        'seeks redemption through justice.';
  }

  /// Character traits for dialogue system
  static Map<String, int> getPersonalityTraits() {
    return {
      'justice': 75,        // Strong but tempered by experience
      'courage': 90,        // Battle-hardened bravery
      'empathy': 70,        // Learned through hardship
      'pragmatism': 85,     // Military training shows
      'curiosity': 50,      // More action-oriented
    };
  }

  /// Initial relationship values with other characters
  static Map<String, int> getInitialRelationships() {
    return {
      'kai': 10,      // Immediate respect for idealism
      'aria': 0,      // Will meet later, contrasting personalities
      'zephyr': 0,    // Will meet late, complementary skills
    };
  }

  /// Equipment slots and starting equipment
  static Map<String, String?> getStartingEquipment() {
    return {
      'weapon': 'steel_blade',      // Better equipment from military service
      'armor': 'chain_mail',
      'helm': 'iron_helm',
      'shield': null,               // Two-handed fighter style
      'accessory': 'warrior_ring',
    };
  }

  /// Character growth stats per level
  static Map<String, double> getGrowthRates() {
    return {
      'hp': 4.8,        // Good HP, less than Kai
      'pp': 3.2,        // High PP growth for offensive spells
      'attack': 2.5,    // Highest attack growth
      'defense': 1.5,   // Lower defense (aggressive style)
      'speed': 2.0,     // Good speed
    };
  }
}
