/// Represents an item in the game
class Item {
  final String id;
  final String name;
  final String description;
  final ItemType type;
  final int? healHp;
  final int? healPp;
  final int? attackBonus;
  final int? defenseBonus;
  final int value;
  final bool consumable;
  
  const Item({
    required this.id,
    required this.name,
    required this.description,
    required this.type,
    this.healHp,
    this.healPp,
    this.attackBonus,
    this.defenseBonus,
    required this.value,
    this.consumable = false,
  });
}

enum ItemType {
  consumable,  // Potions, food
  weapon,      // Swords, staves
  armor,       // Shields, helmets
  accessory,   // Rings, amulets
  keyItem,     // Quest items
  material,    // Crafting materials
}

/// Database of items
class ItemDatabase {
  static const Map<String, Item> items = {
    'potion': Item(
      id: 'potion',
      name: 'Potion',
      description: 'Restores 20 HP',
      type: ItemType.consumable,
      healHp: 20,
      value: 10,
      consumable: true,
    ),
    'ether': Item(
      id: 'ether',
      name: 'Psy Crystal',
      description: 'Restores 10 PP',
      type: ItemType.consumable,
      healPp: 10,
      value: 15,
      consumable: true,
    ),
    'elixir': Item(
      id: 'elixir',
      name: 'Elixir',
      description: 'Fully restores HP and PP',
      type: ItemType.consumable,
      healHp: 9999,
      healPp: 9999,
      value: 50,
      consumable: true,
    ),
    'bronze_sword': Item(
      id: 'bronze_sword',
      name: 'Bronze Sword',
      description: 'A basic sword made of bronze',
      type: ItemType.weapon,
      attackBonus: 5,
      value: 50,
    ),
    'iron_sword': Item(
      id: 'iron_sword',
      name: 'Iron Sword',
      description: 'A sturdy iron sword',
      type: ItemType.weapon,
      attackBonus: 10,
      value: 100,
    ),
    'steel_sword': Item(
      id: 'steel_sword',
      name: 'Steel Sword',
      description: 'A sharp steel blade',
      type: ItemType.weapon,
      attackBonus: 20,
      value: 200,
    ),
    'leather_armor': Item(
      id: 'leather_armor',
      name: 'Leather Armor',
      description: 'Basic protective armor',
      type: ItemType.armor,
      defenseBonus: 5,
      value: 40,
    ),
    'iron_armor': Item(
      id: 'iron_armor',
      name: 'Iron Armor',
      description: 'Strong iron plating',
      type: ItemType.armor,
      defenseBonus: 10,
      value: 80,
    ),
    'key_silver': Item(
      id: 'key_silver',
      name: 'Silver Key',
      description: 'Opens silver doors',
      type: ItemType.keyItem,
      value: 0,
    ),
    'key_gold': Item(
      id: 'key_gold',
      name: 'Gold Key',
      description: 'Opens gold doors',
      type: ItemType.keyItem,
      value: 0,
    ),
    'ancient_coin': Item(
      id: 'ancient_coin',
      name: 'Ancient Coin',
      description: 'A mysterious coin from a lost civilization',
      type: ItemType.keyItem,
      value: 0,
    ),
    'power_ring': Item(
      id: 'power_ring',
      name: 'Power Ring',
      description: 'Increases attack power',
      type: ItemType.accessory,
      attackBonus: 5,
      value: 150,
    ),
    'defense_ring': Item(
      id: 'defense_ring',
      name: 'Defense Ring',
      description: 'Increases defense',
      type: ItemType.accessory,
      defenseBonus: 5,
      value: 150,
    ),
  };
  
  static Item? getItem(String id) {
    return items[id];
  }
  
  static List<Item> getItemsByType(ItemType type) {
    return items.values.where((item) => item.type == type).toList();
  }
}
