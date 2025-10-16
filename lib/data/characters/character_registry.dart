import '../../models/player.dart';
import 'kai_venus.dart';
import 'ember_mars.dart';
import 'aria_mercury.dart';
import 'zephyr_jupiter.dart';

/// Character identifiers
enum CharacterId {
  kai,
  ember,
  aria,
  zephyr,
}

/// Character registry for creating and managing the four main characters
class CharacterRegistry {
  /// Create a character by ID
  static Player createCharacter(CharacterId id, {int? level}) {
    switch (id) {
      case CharacterId.kai:
        final kai = KaiVenus.create();
        if (level != null && level > 1) {
          _adjustLevel(kai, level, KaiVenus.getGrowthRates());
        }
        return kai;
      
      case CharacterId.ember:
        return EmberMars.create(level: level ?? 2);
      
      case CharacterId.aria:
        return AriaMercury.create(level: level ?? 5);
      
      case CharacterId.zephyr:
        return ZephyrJupiter.create(level: level ?? 7);
    }
  }

  /// Get character name by ID
  static String getCharacterName(CharacterId id) {
    switch (id) {
      case CharacterId.kai:
        return 'Kai';
      case CharacterId.ember:
        return 'Ember';
      case CharacterId.aria:
        return 'Aria';
      case CharacterId.zephyr:
        return 'Zephyr';
    }
  }

  /// Get character element by ID
  static String getCharacterElement(CharacterId id) {
    switch (id) {
      case CharacterId.kai:
        return 'Venus';
      case CharacterId.ember:
        return 'Mars';
      case CharacterId.aria:
        return 'Mercury';
      case CharacterId.zephyr:
        return 'Jupiter';
    }
  }

  /// Get character class by ID
  static String getCharacterClass(CharacterId id) {
    switch (id) {
      case CharacterId.kai:
        return 'Alchemist';
      case CharacterId.ember:
        return 'Alchemist';
      case CharacterId.aria:
        return 'Witch';
      case CharacterId.zephyr:
        return 'Sorcerer';
    }
  }

  /// Get character description by ID
  static String getCharacterDescription(CharacterId id) {
    switch (id) {
      case CharacterId.kai:
        return KaiVenus.getDescription();
      case CharacterId.ember:
        return EmberMars.getDescription();
      case CharacterId.aria:
        return AriaMercury.getDescription();
      case CharacterId.zephyr:
        return ZephyrJupiter.getDescription();
    }
  }

  /// Get character backstory by ID
  static String getCharacterBackstory(CharacterId id) {
    switch (id) {
      case CharacterId.kai:
        return KaiVenus.getBackstory();
      case CharacterId.ember:
        return EmberMars.getBackstory();
      case CharacterId.aria:
        return AriaMercury.getBackstory();
      case CharacterId.zephyr:
        return ZephyrJupiter.getBackstory();
    }
  }

  /// Get acquisition order (1-4)
  static int getAcquisitionOrder(CharacterId id) {
    switch (id) {
      case CharacterId.kai:
        return 1;  // Game start
      case CharacterId.ember:
        return 2;  // Tutorial/Starting Area
      case CharacterId.aria:
        return 3;  // Second Town
      case CharacterId.zephyr:
        return 4;  // Before First Lighthouse
    }
  }

  /// Get acquisition location description
  static String getAcquisitionLocation(CharacterId id) {
    switch (id) {
      case CharacterId.kai:
        return 'Chapter 1 - Game Start (Solo beginning)';
      case CharacterId.ember:
        return 'Tutorial/Starting Area (Teaches party mechanics)';
      case CharacterId.aria:
        return 'Second Town (Brings healing and support)';
      case CharacterId.zephyr:
        return 'Venus Sanctuary (Arrives after Master Djinn captured)';
    }
  }

  /// Get the suggested level for character when they join
  static int getJoinLevel(CharacterId id) {
    switch (id) {
      case CharacterId.kai:
        return 1;
      case CharacterId.ember:
        return 2;
      case CharacterId.aria:
        return 5;
      case CharacterId.zephyr:
        return 7;
    }
  }

  /// Check if character will sacrifice themselves
  static bool willSacrifice(CharacterId id) {
    return id == CharacterId.aria || id == CharacterId.zephyr;
  }

  /// Get all character IDs in acquisition order
  static List<CharacterId> getAllCharactersInOrder() {
    return [
      CharacterId.kai,
      CharacterId.ember,
      CharacterId.aria,
      CharacterId.zephyr,
    ];
  }

  /// Helper to adjust character level with growth rates
  static void _adjustLevel(Player character, int targetLevel, Map<String, double> growthRates) {
    while (character.level < targetLevel) {
      character.level++;
      character.maxHp += growthRates['hp']!.round();
      character.maxPp += growthRates['pp']!.round();
      character.attack += growthRates['attack']!.round();
      character.defense += growthRates['defense']!.round();
      character.speed += growthRates['speed']!.round();
      character.experience = character.level * 100;
    }
    character.currentHp = character.maxHp;
    character.currentPp = character.maxPp;
  }

  /// Create the starting party (just Kai)
  static List<Player> createStartingParty() {
    return [createCharacter(CharacterId.kai)];
  }

  /// Create party at tutorial complete (Kai + Ember)
  static List<Player> createTutorialParty(int averageLevel) {
    return [
      createCharacter(CharacterId.kai, level: averageLevel),
      createCharacter(CharacterId.ember, level: averageLevel),
    ];
  }

  /// Create party at second town (Kai + Ember + Aria)
  static List<Player> createMidGameParty(int averageLevel) {
    return [
      createCharacter(CharacterId.kai, level: averageLevel),
      createCharacter(CharacterId.ember, level: averageLevel),
      createCharacter(CharacterId.aria, level: averageLevel),
    ];
  }

  /// Create full party (all 4 characters)
  static List<Player> createFullParty(int averageLevel) {
    return [
      createCharacter(CharacterId.kai, level: averageLevel),
      createCharacter(CharacterId.ember, level: averageLevel),
      createCharacter(CharacterId.aria, level: averageLevel),
      createCharacter(CharacterId.zephyr, level: averageLevel),
    ];
  }
}
