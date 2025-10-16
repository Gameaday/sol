import '../../models/player.dart';
import '../../models/psynergy.dart';

/// Kai - Venus (Earth) Alchemist
/// The first character, player's main protagonist
/// Acquisition: Game start (Chapter 1 - Solo beginning)
class KaiVenus {
  /// Create Kai with starting stats
  static Player create() {
    return Player(
      name: 'Kai',
      level: 1,
      maxHp: 28,
      currentHp: 28,
      maxPp: 12,
      currentPp: 12,
      attack: 7,
      defense: 5,
      speed: 4,
      experience: 0,
      gold: 50,
      inventory: ['herb', 'herb'],
      learnedPsynergy: ['move', 'quake'],
      flags: {
        'is_kai': true,
        'element': 'venus',
        'class': 'alchemist',
      },
    );
  }

  /// Kai's character-specific Psynergy progression
  static Map<int, List<String>> getPsynergyByLevel() {
    return {
      1: ['move', 'quake'],           // Starting abilities
      3: ['spire'],                   // Single-target Venus attack
      5: ['cure_well'],               // Minor healing (learned through experience)
      7: ['quake_sphere'],            // Upgraded area attack
      10: ['tremor'],                 // Strong single-target
      13: ['mighty_press'],           // Heavy single-target damage
      16: ['earthquake'],             // Powerful area attack
      20: ['stone_spire'],            // Very strong single-target
      25: ['gaia'],                   // Ultimate Venus Psynergy
      28: ['revive'],                 // Resurrection ability (late game)
    };
  }

  /// Get character description for UI/story
  static String getDescription() {
    return 'A young Venus Alchemist who witnessed the cruel treatment of non-adepts. '
        'Determined to change the world, Kai sets out to stop the tower project. '
        'Specializes in earth-based Psynergy and has a strong sense of justice.';
  }

  /// Get character backstory
  static String getBackstory() {
    return 'Raised in a village on the edge of Venus territory, Kai grew up seeing '
        'the divide between Adepts and non-Adepts. When the tower project began '
        'threatening the balance of Alchemy itself, Kai could no longer stand by. '
        'Though young and inexperienced, determination burns bright within.';
  }

  /// Character traits for dialogue system
  static Map<String, int> getPersonalityTraits() {
    return {
      'justice': 85,        // Strong sense of right and wrong
      'courage': 80,        // Brave but not reckless
      'empathy': 75,        // Cares about others
      'pragmatism': 60,     // Idealistic but learning
      'curiosity': 70,      // Wants to understand the world
    };
  }

  /// Initial relationship values with other characters
  static Map<String, int> getInitialRelationships() {
    return {
      'ember': 0,    // Will meet early, bonds through shared goals
      'aria': 0,     // Will meet later, mutual respect
      'zephyr': 0,   // Will meet late, complementary personalities
    };
  }

  /// Equipment slots and starting equipment
  static Map<String, String?> getStartingEquipment() {
    return {
      'weapon': 'bronze_sword',
      'armor': 'leather_armor',
      'helm': null,
      'shield': 'wooden_shield',
      'accessory': null,
    };
  }

  /// Character growth stats per level
  static Map<String, double> getGrowthRates() {
    return {
      'hp': 5.2,        // Solid HP growth
      'pp': 2.8,        // Good PP growth for Psynergy
      'attack': 2.1,    // Balanced physical
      'defense': 1.8,   // Good defense
      'speed': 1.5,     // Moderate speed
    };
  }
}
