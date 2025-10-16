import '../../models/player.dart';
import '../../models/monster.dart';

class EncounterSystem {
  final Player player;
  double encounterTimer = 0;
  double encounterRate = 5.0; // Seconds between potential encounters
  
  EncounterSystem({required this.player});
  
  void update(double dt) {
    encounterTimer += dt;
    
    if (encounterTimer >= encounterRate) {
      encounterTimer = 0;
      _checkForEncounter();
    }
  }
  
  void _checkForEncounter() {
    // 20% chance of encounter when timer triggers
    if (DateTime.now().millisecondsSinceEpoch % 5 == 0) {
      _triggerEncounter();
    }
  }
  
  void _triggerEncounter() {
    final monster = MonsterDatabase.getRandomMonster(player.level);
    // TODO: Trigger battle screen with this monster
    // This would show a battle UI and handle the combat
  }
}
