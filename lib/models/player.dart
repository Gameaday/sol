/// Represents a player character in the game
class Player {
  String name;
  int level;
  int currentHp;
  int maxHp;
  int currentMp;
  int maxMp;
  int currentPp;  // Psynergy Points
  int maxPp;
  int attack;
  int defense;
  int speed;
  int experience;
  int gold;
  double x;
  double y;
  String mapId;
  List<String> inventory;
  List<String> learnedPsynergy;  // IDs of learned Psynergy
  Map<String, bool> flags;
  
  Player({
    required this.name,
    this.level = 1,
    this.currentHp = 20,
    this.maxHp = 20,
    this.currentMp = 10,
    this.maxMp = 10,
    this.currentPp = 20,
    this.maxPp = 20,
    this.attack = 5,
    this.defense = 3,
    this.speed = 5,
    this.experience = 0,
    this.gold = 0,
    this.x = 0,
    this.y = 0,
    this.mapId = 'starting_town',
    List<String>? inventory,
    List<String>? learnedPsynergy,
    Map<String, bool>? flags,
  })  : inventory = inventory ?? [],
        learnedPsynergy = learnedPsynergy ?? [],
        flags = flags ?? {};
  
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'level': level,
      'currentHp': currentHp,
      'maxHp': maxHp,
      'currentMp': currentMp,
      'maxMp': maxMp,
      'currentPp': currentPp,
      'maxPp': maxPp,
      'attack': attack,
      'defense': defense,
      'speed': speed,
      'experience': experience,
      'gold': gold,
      'x': x,
      'y': y,
      'mapId': mapId,
      'inventory': inventory,
      'learnedPsynergy': learnedPsynergy,
      'flags': flags,
    };
  }
  
  factory Player.fromJson(Map<String, dynamic> json) {
    return Player(
      name: json['name'] as String,
      level: json['level'] as int,
      currentHp: json['currentHp'] as int,
      maxHp: json['maxHp'] as int,
      currentMp: json['currentMp'] as int,
      maxMp: json['maxMp'] as int,
      currentPp: json['currentPp'] as int? ?? 20,
      maxPp: json['maxPp'] as int? ?? 20,
      attack: json['attack'] as int,
      defense: json['defense'] as int,
      speed: json['speed'] as int,
      experience: json['experience'] as int,
      gold: json['gold'] as int,
      x: (json['x'] as num).toDouble(),
      y: (json['y'] as num).toDouble(),
      mapId: json['mapId'] as String,
      inventory: List<String>.from(json['inventory'] as List),
      learnedPsynergy: json['learnedPsynergy'] != null 
          ? List<String>.from(json['learnedPsynergy'] as List)
          : [],
      flags: Map<String, bool>.from(json['flags'] as Map),
    );
  }
  
  void heal(int amount) {
    currentHp = (currentHp + amount).clamp(0, maxHp);
  }
  
  void takeDamage(int amount) {
    currentHp = (currentHp - amount).clamp(0, maxHp);
  }
  
  void restoreMp(int amount) {
    currentMp = (currentMp + amount).clamp(0, maxMp);
  }
  
  void useMp(int amount) {
    currentMp = (currentMp - amount).clamp(0, maxMp);
  }
  
  void restorePp(int amount) {
    currentPp = (currentPp + amount).clamp(0, maxPp);
  }
  
  void usePp(int amount) {
    currentPp = (currentPp - amount).clamp(0, maxPp);
  }
  
  bool canUsePsynergy(int ppCost) {
    return currentPp >= ppCost;
  }
  
  void gainExperience(int amount) {
    experience += amount;
    // Check for level up (simple formula)
    while (experience >= experienceForNextLevel()) {
      levelUp();
    }
  }
  
  int experienceForNextLevel() {
    return level * 100;
  }
  
  void levelUp() {
    level++;
    maxHp += 5;
    maxMp += 3;
    maxPp += 5;
    attack += 2;
    defense += 1;
    speed += 1;
    currentHp = maxHp;
    currentMp = maxMp;
    currentPp = maxPp;
    
    // Learn new Psynergy based on level
    _learnPsynergyAtLevel(level);
  }
  
  void _learnPsynergyAtLevel(int level) {
    // Auto-learn basic Psynergy
    if (level == 1 && !learnedPsynergy.contains('move')) {
      learnPsynergy('move');
      learnPsynergy('quake');
    }
    if (level == 2 && !learnedPsynergy.contains('frost')) {
      learnPsynergy('frost');
    }
    if (level == 3 && !learnedPsynergy.contains('spire')) {
      learnPsynergy('spire');
      learnPsynergy('reveal');
    }
    if (level == 4 && !learnedPsynergy.contains('cure')) {
      learnPsynergy('cure');
    }
    if (level == 5 && !learnedPsynergy.contains('fireball')) {
      learnPsynergy('fireball');
    }
  }
  
  void learnPsynergy(String psynergyId) {
    if (!learnedPsynergy.contains(psynergyId)) {
      learnedPsynergy.add(psynergyId);
    }
  }
  
  bool hasPsynergy(String psynergyId) {
    return learnedPsynergy.contains(psynergyId);
  }
  
  void addItem(String item) {
    inventory.add(item);
  }
  
  void removeItem(String item) {
    inventory.remove(item);
  }
  
  bool hasItem(String item) {
    return inventory.contains(item);
  }
}
