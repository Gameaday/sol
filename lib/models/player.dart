/// Represents a player character in the game
class Player {
  String name;
  int level;
  int currentHp;
  int maxHp;
  int currentMp;
  int maxMp;
  int attack;
  int defense;
  int speed;
  int experience;
  int gold;
  double x;
  double y;
  String mapId;
  List<String> inventory;
  Map<String, bool> flags;
  
  Player({
    required this.name,
    this.level = 1,
    this.currentHp = 20,
    this.maxHp = 20,
    this.currentMp = 10,
    this.maxMp = 10,
    this.attack = 5,
    this.defense = 3,
    this.speed = 5,
    this.experience = 0,
    this.gold = 0,
    this.x = 0,
    this.y = 0,
    this.mapId = 'starting_town',
    List<String>? inventory,
    Map<String, bool>? flags,
  })  : inventory = inventory ?? [],
        flags = flags ?? {};
  
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'level': level,
      'currentHp': currentHp,
      'maxHp': maxHp,
      'currentMp': currentMp,
      'maxMp': maxMp,
      'attack': attack,
      'defense': defense,
      'speed': speed,
      'experience': experience,
      'gold': gold,
      'x': x,
      'y': y,
      'mapId': mapId,
      'inventory': inventory,
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
      attack: json['attack'] as int,
      defense: json['defense'] as int,
      speed: json['speed'] as int,
      experience: json['experience'] as int,
      gold: json['gold'] as int,
      x: (json['x'] as num).toDouble(),
      y: (json['y'] as num).toDouble(),
      mapId: json['mapId'] as String,
      inventory: List<String>.from(json['inventory'] as List),
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
    attack += 2;
    defense += 1;
    speed += 1;
    currentHp = maxHp;
    currentMp = maxMp;
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
