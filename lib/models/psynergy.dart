/// Psynergy types
enum PsynergyType {
  offensive,    // Damage-dealing abilities
  defensive,    // Buffs, shields
  healing,      // HP/status restoration
  utility,      // Battle utility (stat changes, etc.)
  field,        // Overworld abilities
}

/// Psynergy elements (aligned with Golden Sun)
enum PsynergyElement {
  venus,    // Earth
  mars,     // Fire
  jupiter,  // Wind
  mercury,  // Water
  neutral,  // Non-elemental
}

/// Field effects for overworld Psynergy
enum FieldEffect {
  move,       // Move objects
  lift,       // Lift heavy objects
  frost,      // Freeze water/create ice pillars
  growth,     // Grow plants/vines
  whirlwind,  // Create whirlwinds
  reveal,     // Reveal hidden objects
  teleport,   // Teleport to locations
  scoop,      // Dig/excavate
  carry,      // Pick up and carry objects
  pound,      // Pound stakes
  cyclone,    // Create tornados
  douse,      // Put out fires
  lash,       // Pull objects with vine
  sand,       // Create sand pillars
}

/// Psynergy ability definition
class Psynergy {
  final String id;
  final String name;
  final String description;
  final PsynergyType type;
  final PsynergyElement element;
  final int ppCost;
  final int? power;           // Damage or healing power
  final int? range;           // 1=single, 3=3 enemies, 5=all enemies
  final FieldEffect? fieldEffect;
  final bool learnedByDefault;
  final int levelRequired;
  
  const Psynergy({
    required this.id,
    required this.name,
    required this.description,
    required this.type,
    required this.element,
    required this.ppCost,
    this.power,
    this.range = 1,
    this.fieldEffect,
    this.learnedByDefault = false,
    this.levelRequired = 1,
  });
  
  bool isFieldPsynergy() => fieldEffect != null;
  bool isBattlePsynergy() => type != PsynergyType.field;
  
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'type': type.toString(),
      'element': element.toString(),
      'ppCost': ppCost,
      'power': power,
      'range': range,
      'fieldEffect': fieldEffect?.toString(),
      'learnedByDefault': learnedByDefault,
      'levelRequired': levelRequired,
    };
  }
}

/// Psynergy database with Golden Sun-inspired abilities
class PsynergyDatabase {
  // Venus (Earth) Psynergy
  static const Psynergy quake = Psynergy(
    id: 'quake',
    name: 'Quake',
    description: 'Strike foes with the earth\'s fury',
    type: PsynergyType.offensive,
    element: PsynergyElement.venus,
    ppCost: 4,
    power: 30,
    range: 3,
    learnedByDefault: true,
  );
  
  static const Psynergy spire = Psynergy(
    id: 'spire',
    name: 'Spire',
    description: 'Impale one enemy with stone spikes',
    type: PsynergyType.offensive,
    element: PsynergyElement.venus,
    ppCost: 5,
    power: 45,
    range: 1,
    levelRequired: 3,
  );
  
  static const Psynergy move = Psynergy(
    id: 'move',
    name: 'Move',
    description: 'Move objects from afar',
    type: PsynergyType.field,
    element: PsynergyElement.venus,
    ppCost: 2,
    fieldEffect: FieldEffect.move,
    learnedByDefault: true,
  );
  
  // Mars (Fire) Psynergy
  static const Psynergy flare = Psynergy(
    id: 'flare',
    name: 'Flare',
    description: 'Attack with a blast of fire',
    type: PsynergyType.offensive,
    element: PsynergyElement.mars,
    ppCost: 4,
    power: 35,
    range: 1,
    learnedByDefault: true,
  );
  
  static const Psynergy fireball = Psynergy(
    id: 'fireball',
    name: 'Fireball',
    description: 'Blast foes with explosive flames',
    type: PsynergyType.offensive,
    element: PsynergyElement.mars,
    ppCost: 6,
    power: 50,
    range: 3,
    levelRequired: 5,
  );
  
  static const Psynergy blaze = Psynergy(
    id: 'blaze',
    name: 'Blaze',
    description: 'Small fire for torches and kindling',
    type: PsynergyType.field,
    element: PsynergyElement.mars,
    ppCost: 1,
    fieldEffect: FieldEffect.douse,
    learnedByDefault: true,
  );
  
  // Jupiter (Wind) Psynergy
  static const Psynergy gust = Psynergy(
    id: 'gust',
    name: 'Gust',
    description: 'Attack with a powerful gust',
    type: PsynergyType.offensive,
    element: PsynergyElement.jupiter,
    ppCost: 3,
    power: 25,
    range: 1,
    learnedByDefault: true,
  );
  
  static const Psynergy whirlwind = Psynergy(
    id: 'whirlwind',
    name: 'Whirlwind',
    description: 'Strike foes with a mighty whirlwind',
    type: PsynergyType.offensive,
    element: PsynergyElement.jupiter,
    ppCost: 5,
    power: 40,
    range: 3,
    levelRequired: 4,
  );
  
  static const Psynergy whirlwindField = Psynergy(
    id: 'whirlwind_field',
    name: 'Whirlwind',
    description: 'Create controllable whirlwinds',
    type: PsynergyType.field,
    element: PsynergyElement.jupiter,
    ppCost: 2,
    fieldEffect: FieldEffect.whirlwind,
    levelRequired: 3,
  );
  
  // Mercury (Water) Psynergy
  static const Psynergy drizzle = Psynergy(
    id: 'drizzle',
    name: 'Drizzle',
    description: 'Attack with water droplets',
    type: PsynergyType.offensive,
    element: PsynergyElement.mercury,
    ppCost: 3,
    power: 28,
    range: 1,
    learnedByDefault: true,
  );
  
  static const Psynergy cure = Psynergy(
    id: 'cure',
    name: 'Cure',
    description: 'Restore HP to one ally',
    type: PsynergyType.healing,
    element: PsynergyElement.mercury,
    ppCost: 4,
    power: 40,
    range: 1,
    learnedByDefault: true,
  );
  
  static const Psynergy frost = Psynergy(
    id: 'frost',
    name: 'Frost',
    description: 'Freeze water and create ice pillars',
    type: PsynergyType.field,
    element: PsynergyElement.mercury,
    ppCost: 3,
    fieldEffect: FieldEffect.frost,
    levelRequired: 2,
  );
  
  // Utility Psynergy
  static const Psynergy reveal = Psynergy(
    id: 'reveal',
    name: 'Reveal',
    description: 'Reveal hidden objects and paths',
    type: PsynergyType.field,
    element: PsynergyElement.neutral,
    ppCost: 1,
    fieldEffect: FieldEffect.reveal,
    levelRequired: 3,
  );
  
  static const Map<String, Psynergy> allPsynergy = {
    'quake': quake,
    'spire': spire,
    'move': move,
    'flare': flare,
    'fireball': fireball,
    'blaze': blaze,
    'gust': gust,
    'whirlwind': whirlwind,
    'whirlwind_field': whirlwindField,
    'drizzle': drizzle,
    'cure': cure,
    'frost': frost,
    'reveal': reveal,
  };
  
  static Psynergy? getPsynergy(String id) {
    return allPsynergy[id];
  }
  
  static List<Psynergy> getByElement(PsynergyElement element) {
    return allPsynergy.values
        .where((p) => p.element == element)
        .toList();
  }
  
  static List<Psynergy> getFieldPsynergy() {
    return allPsynergy.values
        .where((p) => p.isFieldPsynergy())
        .toList();
  }
  
  static List<Psynergy> getBattlePsynergy() {
    return allPsynergy.values
        .where((p) => p.isBattlePsynergy())
        .toList();
  }
  
  static List<Psynergy> getLearnableAtLevel(int level) {
    return allPsynergy.values
        .where((p) => p.levelRequired <= level)
        .toList();
  }
}
