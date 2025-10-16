import '../../models/player.dart';
import '../../models/psynergy.dart';

/// Zephyr - Jupiter (Wind) Sorcerer
/// The fourth and final character to join the party
/// Acquisition: Before First Lighthouse (arrives when party reaches Venus Sanctuary, having received visions from the Wise One)
class ZephyrJupiter {
  /// Create Zephyr with starting stats
  static Player create({int level = 7}) {
    return Player(
      name: 'Zephyr',
      level: level,
      maxHp: 24,
      currentHp: 24,
      maxPp: 18,
      currentPp: 18,
      attack: 6,
      defense: 5,
      speed: 8,
      experience: level > 1 ? (level - 1) * 100 : 0,
      gold: 50,
      inventory: ['nut', 'potion', 'antidote'],
      learnedPsynergy: _getPsynergyForLevel(level),
      flags: {
        'is_zephyr': true,
        'element': 'jupiter',
        'class': 'sorcerer',
        'visionary': true,
        'wise_one_chosen': true,
        'will_sacrifice': true,  // Foreshadowing his fate
      },
    );
  }

  /// Get Psynergy list for a given level
  static List<String> _getPsynergyForLevel(int level) {
    final psynergy = <String>['gust', 'whirlwind', 'whirlwind_field'];
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

  /// Zephyr's character-specific Psynergy progression
  static Map<int, List<String>> getPsynergyByLevel() {
    return {
      1: ['gust', 'whirlwind', 'whirlwind_field'],  // Starting abilities
      6: ['ray'],                         // Lightning-based attack
      8: ['slash'],                       // Wind blade attack
      10: ['plasma'],                     // Electric damage
      13: ['spark_plasma'],               // Enhanced electric attack
      16: ['thunderclap'],                // Area lightning damage
      19: ['tempest'],                    // Powerful wind storm
      23: ['lightning_plasma'],           // Strong lightning strike
      28: ['destruct_ray'],               // Devastating single-target
      31: ['storm_ray'],                  // Ultimate Jupiter Psynergy
    };
  }

  /// Get character description for UI/story
  static String getDescription() {
    return 'A Jupiter sorcerer who received visions from the Wise One about the tower crisis. '
        'Zephyr arrives at a critical moment to complete the party. '
        'Specializes in wind and lightning Psynergy with incredible speed. '
        'His sacrifice alongside Aria will enable the sealing.';
  }

  /// Get character backstory
  static String getBackstory() {
    return 'A wandering sorcerer blessed (or cursed) with visions of the future, Zephyr '
        'has always felt disconnected from others due to his gift. The Wise One reached '
        'out to him in visions, showing him the catastrophe that would unfold if the towers '
        'are activated. Guided by these visions, he arrives precisely when needed, having '
        'seen glimpses of his own fate. Despite knowing what awaits, he accepts his role '
        'in the sealing with quiet determination.';
  }

  /// Character traits for dialogue system
  static Map<String, int> getPersonalityTraits() {
    return {
      'justice': 65,        // Believes in fate and necessity
      'courage': 80,        // Brave despite knowing his fate
      'empathy': 80,        // Understands others through visions
      'pragmatism': 90,     // Accepts what must be done
      'curiosity': 85,      // Seeks to understand his visions
    };
  }

  /// Initial relationship values with other characters
  static Map<String, int> getInitialRelationships() {
    return {
      'kai': 10,      // Respects the leader's conviction
      'ember': 5,     // Cautious mutual respect
      'aria': 20,     // Immediate intellectual and spiritual connection
    };
  }

  /// Equipment slots and starting equipment
  static Map<String, String?> getStartingEquipment() {
    return {
      'weapon': 'mystic_wand',
      'armor': 'travelers_cloak',
      'helm': 'feathered_cap',
      'shield': null,
      'accessory': 'prophets_amulet',
    };
  }

  /// Character growth stats per level
  static Map<String, double> getGrowthRates() {
    return {
      'hp': 4.5,        // Moderate HP growth
      'pp': 3.8,        // High PP growth for spellcasting
      'attack': 1.8,    // Low-moderate attack
      'defense': 1.6,   // Lower defense (evasion-based)
      'speed': 2.5,     // Highest speed growth
    };
  }

  /// Special note about character's fate
  static String getFateNote() {
    return 'Zephyr will sacrifice himself during the final sealing ritual at Sol Sanctum. '
        'His sacrifice, along with Aria\'s, will enable Kai and Ember to complete '
        'the seal and found Vale. His visions have shown him this fate from the beginning, '
        'and he accepts it with grace. This should be subtly foreshadowed through his '
        'cryptic comments about "seeing how this ends" and his melancholic acceptance.';
  }

  /// Zephyr's visions - can be used for story/dialogue triggers
  static List<Map<String, String>> getVisions() {
    return [
      {
        'id': 'vision_meeting',
        'description': 'Saw himself meeting the party at Venus Sanctuary',
        'timing': 'Before joining',
      },
      {
        'id': 'vision_aria_bond',
        'description': 'Foresaw a deep connection with Aria',
        'timing': 'Upon meeting Aria',
      },
      {
        'id': 'vision_theft',
        'description': 'Glimpsed the theft of the elemental spheres',
        'timing': 'After collecting first spheres',
      },
      {
        'id': 'vision_sacrifice',
        'description': 'Knows his fate at Sol Sanctum',
        'timing': 'From the beginning',
      },
      {
        'id': 'vision_vale',
        'description': 'Sees Vale being founded by survivors',
        'timing': 'Near the end',
      },
    ];
  }
}
