# Character Definitions

This directory contains the definitions for the four main playable characters in Sol.

## The Four Heroes

### 1. Kai - Venus (Earth) Alchemist
- **Element:** Venus (Earth)
- **Class:** Alchemist
- **Joins:** Chapter 1 - Game Start (Solo beginning)
- **Join Level:** 1
- **Role:** Main protagonist, balanced fighter
- **Fate:** Survives to found Vale
- **File:** `kai_venus.dart`

Kai is the player's main character and the first hero. He witnesses the cruel treatment of non-adepts and sets out to stop the tower project. Specializes in earth-based Psynergy with solid HP and balanced stats.

### 2. Ember - Mars (Fire) Alchemist
- **Element:** Mars (Fire)
- **Class:** Alchemist
- **Joins:** Tutorial/Starting Area (Early game)
- **Join Level:** 2
- **Role:** Offensive powerhouse, former soldier
- **Fate:** Survives to found Vale
- **File:** `ember_mars.dart`

Ember is a former soldier who defected from the tower project. Brings combat experience and aggressive fire-based Psynergy. Has the highest attack growth and specializes in dealing damage.

### 3. Aria - Mercury (Water) Witch
- **Element:** Mercury (Water)
- **Class:** Witch
- **Joins:** Second Town (Mid-game)
- **Join Level:** 5
- **Role:** Healer and support, scholar
- **Fate:** Sacrifices herself at Sol Sanctum
- **File:** `aria_mercury.dart`

Aria is a scholar who researched ancient warnings about the towers. Specializes in healing and water-based Psynergy. Has the highest PP growth for extensive support capabilities.

### 4. Zephyr - Jupiter (Wind) Sorcerer
- **Element:** Jupiter (Wind)
- **Class:** Sorcerer
- **Joins:** Venus Sanctuary (After Master Djinn captured)
- **Join Level:** 7
- **Role:** Fast spellcaster, visionary
- **Fate:** Sacrifices himself at Sol Sanctum
- **File:** `zephyr_jupiter.dart`

Zephyr is a sorcerer guided by visions from the Wise One. Arrives at a critical moment to complete the party. Specializes in wind and lightning Psynergy with the highest speed growth.

## Character Registry

The `character_registry.dart` file provides a centralized way to create and manage characters.

### Usage Examples

#### Creating Individual Characters

```dart
import 'package:sol/data/characters/character_registry.dart';

// Create Kai at level 1 (starting level)
final kai = CharacterRegistry.createCharacter(CharacterId.kai);

// Create Ember at level 5
final ember = CharacterRegistry.createCharacter(CharacterId.ember, level: 5);

// Create Aria at default join level (5)
final aria = CharacterRegistry.createCharacter(CharacterId.aria);

// Create Zephyr at level 10
final zephyr = CharacterRegistry.createCharacter(CharacterId.zephyr, level: 10);
```

#### Creating Party Compositions

```dart
// Starting party (just Kai)
final startingParty = CharacterRegistry.createStartingParty();

// Tutorial party (Kai + Ember)
final tutorialParty = CharacterRegistry.createTutorialParty(3);

// Mid-game party (Kai + Ember + Aria)
final midGameParty = CharacterRegistry.createMidGameParty(6);

// Full party (all 4 characters)
final fullParty = CharacterRegistry.createFullParty(10);
```

#### Getting Character Information

```dart
// Get character name
final name = CharacterRegistry.getCharacterName(CharacterId.kai);  // "Kai"

// Get character element
final element = CharacterRegistry.getCharacterElement(CharacterId.ember);  // "Mars"

// Get character description
final desc = CharacterRegistry.getCharacterDescription(CharacterId.aria);

// Check if character sacrifices themselves
final sacrifices = CharacterRegistry.willSacrifice(CharacterId.zephyr);  // true

// Get acquisition order
final order = CharacterRegistry.getAcquisitionOrder(CharacterId.aria);  // 3
```

## Character Structure

Each character file follows this structure:

### 1. Create Method
Returns a `Player` object with starting stats and equipment.

```dart
static Player create({int? level}) {
  return Player(
    name: 'CharacterName',
    level: level ?? defaultLevel,
    // ... stats ...
  );
}
```

### 2. Psynergy Progression
Defines which Psynergy abilities are learned at each level.

```dart
static Map<int, List<String>> getPsynergyByLevel() {
  return {
    1: ['ability1', 'ability2'],
    5: ['ability3'],
    // ...
  };
}
```

### 3. Character Information
Provides descriptions, backstory, and personality traits.

```dart
static String getDescription() { ... }
static String getBackstory() { ... }
static Map<String, int> getPersonalityTraits() { ... }
```

### 4. Relationships
Initial relationship values with other characters.

```dart
static Map<String, int> getInitialRelationships() {
  return {
    'other_character': value,  // -100 to 100
  };
}
```

### 5. Equipment
Starting equipment and equipment slots.

```dart
static Map<String, String?> getStartingEquipment() {
  return {
    'weapon': 'item_id',
    'armor': 'item_id',
    // ...
  };
}
```

### 6. Growth Rates
Stat growth per level.

```dart
static Map<String, double> getGrowthRates() {
  return {
    'hp': 5.0,
    'pp': 3.0,
    'attack': 2.0,
    'defense': 1.5,
    'speed': 1.8,
  };
}
```

## Progressive Party Formation

The party is acquired progressively throughout the story:

1. **Chapter 1 (Solo):** Player controls only Kai
   - Learn basic mechanics without party complexity
   - Solo tutorial and combat

2. **Tutorial Area (2-Party):** Ember joins
   - Introduction to party mechanics
   - Learn formation and tactics
   - First cooperative Psynergy puzzles

3. **Second Town (3-Party):** Aria joins
   - Healing and support strategies
   - More complex party dynamics
   - Relationship system becomes relevant

4. **Venus Sanctuary (4-Party):** Zephyr joins
   - Full tactical depth unlocked
   - Complete elemental coverage
   - All relationship combinations

## Integration with Game Systems

### With Story Manager
```dart
// Track character joining
storyManager.addStoryEvent(
  'character_ember_joins',
  'A Kindred Spirit',
  'Ember joins the party.',
  EventType.character,
);
```

### With Party Manager
```dart
// Add character to party
final ember = CharacterRegistry.createCharacter(CharacterId.ember, level: 2);
partyManager.addMember(ember);
```

### With Dialogue System
Use personality traits to determine dialogue choices and responses:

```dart
final traits = KaiVenus.getPersonalityTraits();
if (traits['justice']! > 80) {
  // Show justice-oriented dialogue option
}
```

### With Save System
Characters are saved through the Party model which handles serialization:

```dart
final party = Party(members: [kai, ember]);
final json = party.toJson();  // Save to file
```

## Character Balance

### Stats Overview

| Character | HP Growth | PP Growth | ATK Growth | DEF Growth | SPD Growth | Role |
|-----------|-----------|-----------|------------|------------|------------|------|
| Kai       | 5.2       | 2.8       | 2.1        | 1.8        | 1.5        | Balanced Tank |
| Ember     | 4.8       | 3.2       | 2.5        | 1.5        | 2.0        | Physical DPS |
| Aria      | 4.0       | 4.5       | 1.5        | 2.0        | 1.8        | Healer/Support |
| Zephyr    | 4.5       | 3.8       | 1.8        | 1.6        | 2.5        | Fast Mage |

### Elemental Coverage

- **Venus (Kai):** Earth attacks, defensive abilities
- **Mars (Ember):** Fire attacks, offensive power
- **Mercury (Aria):** Water attacks, healing
- **Jupiter (Zephyr):** Wind/lightning attacks, speed

## Story Integration

### Foreshadowing Sacrifices

Both Aria and Zephyr will sacrifice themselves at Sol Sanctum. This should be subtly foreshadowed:

**Aria:**
- Scholarly knowledge of "what must be done"
- Calm acceptance when discussing dangers
- Focus on ensuring others survive

**Zephyr:**
- Cryptic comments about "seeing how this ends"
- Melancholic acceptance of fate
- Visions that hint at his destiny

### Character Arcs

1. **Kai:** From idealistic youth to leader who understands sacrifice
2. **Ember:** From guilt-ridden deserter to redeemed protector
3. **Aria:** From scholar to martyr who acts on knowledge
4. **Zephyr:** From lonely visionary to accepted friend who embraces fate

## Future Enhancements

Potential additions to character system:

1. **Class System:** Djinn-based class changes
2. **Character-Specific Quests:** Personal story missions
3. **Combination Psynergy:** Team-up abilities
4. **Character Portraits:** Visual assets for UI
5. **Voice Lines:** Audio clips for key moments
6. **Relationship Bonuses:** Combat benefits from strong bonds
7. **Ending Variations:** Different epilogues based on relationships

## See Also

- `IMPLEMENTATION_PLAN.md` - Overall project roadmap
- `STORY_AND_LORE.md` - Character backgrounds and story details
- `lib/models/player.dart` - Player/Character data model
- `lib/models/party.dart` - Party management model
- `lib/services/party_manager.dart` - Party service
