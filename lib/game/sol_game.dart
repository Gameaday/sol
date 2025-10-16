import 'package:flame/game.dart';
import 'package:flame/components.dart';
import 'package:flame/input.dart';
import 'package:flutter/services.dart';
import '../models/player.dart';
import 'components/player_component.dart';
import 'components/tilemap_component.dart';
import 'systems/encounter_system.dart';

class SolGameWorld extends FlameGame with KeyboardEvents, HasCollisionDetection {
  final Player player;
  late PlayerComponent playerComponent;
  late TilemapComponent tilemapComponent;
  late EncounterSystem encounterSystem;
  
  SolGameWorld({required this.player});

  @override
  Future<void> onLoad() async {
    await super.onLoad();
    
    // Set camera bounds
    camera.viewport = FixedResolutionViewport(Vector2(320, 240));
    
    // Create tilemap (overworld)
    tilemapComponent = TilemapComponent();
    await add(tilemapComponent);
    
    // Create player component
    playerComponent = PlayerComponent(player: player);
    await add(playerComponent);
    
    // Initialize encounter system
    encounterSystem = EncounterSystem(player: player);
    
    // Set camera to follow player
    camera.followComponent(playerComponent);
  }

  @override
  KeyEventResult onKeyEvent(
    RawKeyEvent event,
    Set<LogicalKeyboardKey> keysPressed,
  ) {
    // Handle keyboard input for player movement
    if (event is RawKeyDownEvent) {
      if (keysPressed.contains(LogicalKeyboardKey.arrowUp) ||
          keysPressed.contains(LogicalKeyboardKey.keyW)) {
        playerComponent.moveUp();
      }
      if (keysPressed.contains(LogicalKeyboardKey.arrowDown) ||
          keysPressed.contains(LogicalKeyboardKey.keyS)) {
        playerComponent.moveDown();
      }
      if (keysPressed.contains(LogicalKeyboardKey.arrowLeft) ||
          keysPressed.contains(LogicalKeyboardKey.keyA)) {
        playerComponent.moveLeft();
      }
      if (keysPressed.contains(LogicalKeyboardKey.arrowRight) ||
          keysPressed.contains(LogicalKeyboardKey.keyD)) {
        playerComponent.moveRight();
      }
    }
    
    return KeyEventResult.handled;
  }

  @override
  void update(double dt) {
    super.update(dt);
    
    // Check for random encounters
    encounterSystem.update(dt);
  }
}
