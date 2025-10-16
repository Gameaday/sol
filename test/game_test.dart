import 'package:flutter_test/flutter_test.dart';
import 'package:sol/models/player.dart';
import 'package:sol/models/monster.dart';
import 'package:sol/models/item.dart';

void main() {
  group('Player Tests', () {
    test('Player creation with default values', () {
      final player = Player(name: 'TestHero');
      
      expect(player.name, 'TestHero');
      expect(player.level, 1);
      expect(player.currentHp, 20);
      expect(player.maxHp, 20);
      expect(player.gold, 0);
    });

    test('Player takes damage correctly', () {
      final player = Player(name: 'TestHero');
      player.takeDamage(5);
      
      expect(player.currentHp, 15);
    });

    test('Player heals correctly', () {
      final player = Player(name: 'TestHero');
      player.takeDamage(10);
      player.heal(5);
      
      expect(player.currentHp, 15);
    });

    test('Player cannot heal above max HP', () {
      final player = Player(name: 'TestHero');
      player.heal(50);
      
      expect(player.currentHp, player.maxHp);
    });

    test('Player gains experience and levels up', () {
      final player = Player(name: 'TestHero');
      final initialLevel = player.level;
      
      player.gainExperience(100);
      
      expect(player.level, initialLevel + 1);
      expect(player.maxHp, greaterThan(20));
    });

    test('Player inventory management', () {
      final player = Player(name: 'TestHero');
      
      player.addItem('potion');
      expect(player.hasItem('potion'), true);
      
      player.removeItem('potion');
      expect(player.hasItem('potion'), false);
    });

    test('Player JSON serialization', () {
      final player = Player(name: 'TestHero', gold: 50);
      player.addItem('potion');
      
      final json = player.toJson();
      final restored = Player.fromJson(json);
      
      expect(restored.name, player.name);
      expect(restored.gold, player.gold);
      expect(restored.inventory, player.inventory);
    });
  });

  group('Monster Tests', () {
    test('Monster creation', () {
      final monster = MonsterDatabase.createSlime(1);
      
      expect(monster.name, 'Slime');
      expect(monster.level, 1);
      expect(monster.currentHp, monster.maxHp);
    });

    test('Monster takes damage', () {
      final monster = MonsterDatabase.createSlime(1);
      final initialHp = monster.currentHp;
      
      monster.takeDamage(5);
      
      expect(monster.currentHp, initialHp - 5);
    });

    test('Monster is defeated when HP reaches 0', () {
      final monster = MonsterDatabase.createSlime(1);
      
      monster.takeDamage(monster.maxHp);
      
      expect(monster.isDefeated(), true);
    });

    test('Monster scales with level', () {
      final level1 = MonsterDatabase.createGoblin(1);
      final level5 = MonsterDatabase.createGoblin(5);
      
      expect(level5.maxHp, greaterThan(level1.maxHp));
      expect(level5.attack, greaterThan(level1.attack));
    });
  });

  group('Item Tests', () {
    test('Item database contains expected items', () {
      final potion = ItemDatabase.getItem('potion');
      
      expect(potion, isNotNull);
      expect(potion!.name, 'Potion');
      expect(potion.healHp, 20);
    });

    test('Item filtering by type', () {
      final consumables = ItemDatabase.getItemsByType(ItemType.consumable);
      
      expect(consumables.isNotEmpty, true);
      expect(consumables.every((item) => item.type == ItemType.consumable), true);
    });

    test('Weapon items have attack bonus', () {
      final sword = ItemDatabase.getItem('bronze_sword');
      
      expect(sword, isNotNull);
      expect(sword!.attackBonus, greaterThan(0));
    });

    test('Armor items have defense bonus', () {
      final armor = ItemDatabase.getItem('leather_armor');
      
      expect(armor, isNotNull);
      expect(armor!.defenseBonus, greaterThan(0));
    });
  });

  group('Game Logic Tests', () {
    test('Player experience calculation for next level', () {
      final player = Player(name: 'TestHero');
      
      final expNeeded = player.experienceForNextLevel();
      expect(expNeeded, player.level * 100);
    });

    test('Combat damage calculation', () {
      final player = Player(name: 'TestHero', attack: 10, defense: 3);
      final monster = MonsterDatabase.createSlime(1);
      
      final damage = monster.calculateDamage(player.defense);
      expect(damage, greaterThan(0));
    });
  });
}
