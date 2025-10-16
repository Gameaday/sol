/// Represents a monster/enemy in the game
class Monster {
  final String id;
  final String name;
  final int level;
  int currentHp;
  final int maxHp;
  final int attack;
  final int defense;
  final int speed;
  final int experienceReward;
  final int goldReward;
  final String spriteId;
  
  Monster({
    required this.id,
    required this.name,
    required this.level,
    required this.maxHp,
    required this.attack,
    required this.defense,
    required this.speed,
    required this.experienceReward,
    required this.goldReward,
    required this.spriteId,
  }) : currentHp = maxHp;
  
  void takeDamage(int damage) {
    currentHp = (currentHp - damage).clamp(0, maxHp);
  }
  
  bool isDefeated() {
    return currentHp <= 0;
  }
  
  int calculateDamage(int targetDefense) {
    final baseDamage = attack - (targetDefense ~/ 2);
    return baseDamage.clamp(1, baseDamage);
  }
}

// Predefined monsters
class MonsterDatabase {
  static Monster createSlime(int level) {
    return Monster(
      id: 'slime',
      name: 'Slime',
      level: level,
      maxHp: 10 + (level * 3),
      attack: 3 + level,
      defense: 2 + (level ~/ 2),
      speed: 2 + level,
      experienceReward: 5 + (level * 2),
      goldReward: 3 + level,
      spriteId: 'slime',
    );
  }
  
  static Monster createGoblin(int level) {
    return Monster(
      id: 'goblin',
      name: 'Goblin',
      level: level,
      maxHp: 15 + (level * 4),
      attack: 5 + (level * 2),
      defense: 3 + level,
      speed: 4 + level,
      experienceReward: 10 + (level * 3),
      goldReward: 5 + (level * 2),
      spriteId: 'goblin',
    );
  }
  
  static Monster createWolf(int level) {
    return Monster(
      id: 'wolf',
      name: 'Wolf',
      level: level,
      maxHp: 12 + (level * 3),
      attack: 6 + (level * 2),
      defense: 2 + (level ~/ 2),
      speed: 6 + (level * 2),
      experienceReward: 8 + (level * 2),
      goldReward: 4 + level,
      spriteId: 'wolf',
    );
  }
  
  static Monster getRandomMonster(int playerLevel) {
    final monsterLevel = (playerLevel + (-2 + (playerLevel % 3))).clamp(1, 99);
    final monsterType = DateTime.now().millisecondsSinceEpoch % 3;
    
    switch (monsterType) {
      case 0:
        return createSlime(monsterLevel);
      case 1:
        return createGoblin(monsterLevel);
      case 2:
        return createWolf(monsterLevel);
      default:
        return createSlime(monsterLevel);
    }
  }
}
