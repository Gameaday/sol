import 'package:flame/components.dart';
import 'package:flutter/material.dart';
import '../../models/player.dart';

class PlayerComponent extends PositionComponent {
  final Player player;
  static const double moveSpeed = 80.0;
  static const double tileSize = 16.0;
  
  Vector2 velocity = Vector2.zero();
  String currentDirection = 'down';
  
  PlayerComponent({required this.player})
      : super(
          size: Vector2.all(tileSize),
          anchor: Anchor.center,
        );

  @override
  Future<void> onLoad() async {
    await super.onLoad();
    position = Vector2(player.x, player.y);
  }

  void moveUp() {
    velocity.y = -moveSpeed;
    currentDirection = 'up';
  }

  void moveDown() {
    velocity.y = moveSpeed;
    currentDirection = 'down';
  }

  void moveLeft() {
    velocity.x = -moveSpeed;
    currentDirection = 'left';
  }

  void moveRight() {
    velocity.x = moveSpeed;
    currentDirection = 'right';
  }

  void stop() {
    velocity = Vector2.zero();
  }

  @override
  void update(double dt) {
    super.update(dt);
    
    if (velocity.length > 0) {
      position += velocity * dt;
      velocity = Vector2.zero(); // Reset velocity after movement
      
      // Update player model position
      player.x = position.x;
      player.y = position.y;
    }
  }

  @override
  void render(Canvas canvas) {
    super.render(canvas);
    
    // Draw a simple retro character (8x8 pixel style)
    final paint = Paint()..color = const Color(0xFF9bbc0f);
    
    // Head
    canvas.drawRect(
      Rect.fromLTWH(4, 2, 8, 6),
      paint,
    );
    
    // Body
    canvas.drawRect(
      Rect.fromLTWH(5, 8, 6, 4),
      paint,
    );
    
    // Legs
    canvas.drawRect(
      Rect.fromLTWH(5, 12, 2, 4),
      paint,
    );
    canvas.drawRect(
      Rect.fromLTWH(9, 12, 2, 4),
      paint,
    );
  }
}
