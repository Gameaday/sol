import 'package:flame/components.dart';
import 'package:flutter/material.dart';
import 'dart:math';

class TilemapComponent extends PositionComponent {
  static const double tileSize = 16.0;
  static const int mapWidth = 40;
  static const int mapHeight = 30;
  
  late List<List<int>> tiles;
  final Random random = Random();
  
  TilemapComponent()
      : super(
          size: Vector2(mapWidth * tileSize, mapHeight * tileSize),
        );

  @override
  Future<void> onLoad() async {
    await super.onLoad();
    _generateMap();
  }

  void _generateMap() {
    // Generate a simple procedural map
    tiles = List.generate(
      mapHeight,
      (y) => List.generate(mapWidth, (x) => _getTileType(x, y)),
    );
  }

  int _getTileType(int x, int y) {
    // Create a simple pattern: grass, dirt, water
    // 0 = grass, 1 = dirt path, 2 = water, 3 = tree
    
    // Create paths
    if (x == mapWidth ~/ 2 || y == mapHeight ~/ 2) {
      return 1; // Dirt path
    }
    
    // Add some water at edges
    if (x < 2 || y < 2 || x >= mapWidth - 2 || y >= mapHeight - 2) {
      return 2; // Water
    }
    
    // Random trees
    if (random.nextDouble() < 0.05) {
      return 3; // Tree
    }
    
    return 0; // Default grass
  }

  @override
  void render(Canvas canvas) {
    super.render(canvas);
    
    for (int y = 0; y < mapHeight; y++) {
      for (int x = 0; x < mapWidth; x++) {
        _renderTile(canvas, x, y, tiles[y][x]);
      }
    }
  }

  void _renderTile(Canvas canvas, int x, int y, int tileType) {
    final rect = Rect.fromLTWH(
      x * tileSize,
      y * tileSize,
      tileSize,
      tileSize,
    );
    
    Paint paint = Paint();
    
    switch (tileType) {
      case 0: // Grass
        paint.color = const Color(0xFF306230);
        break;
      case 1: // Dirt path
        paint.color = const Color(0xFF8b6914);
        break;
      case 2: // Water
        paint.color = const Color(0xFF1e3a8a);
        break;
      case 3: // Tree
        paint.color = const Color(0xFF0f380f);
        break;
      default:
        paint.color = const Color(0xFF306230);
    }
    
    canvas.drawRect(rect, paint);
    
    // Add some texture/pattern
    if (tileType == 0) {
      // Add grass dots
      paint.color = const Color(0xFF9bbc0f);
      canvas.drawRect(
        Rect.fromLTWH(
          x * tileSize + 2,
          y * tileSize + 2,
          2,
          2,
        ),
        paint,
      );
    } else if (tileType == 3) {
      // Draw simple tree
      paint.color = const Color(0xFF8bac0f);
      canvas.drawRect(
        Rect.fromLTWH(
          x * tileSize + 4,
          y * tileSize + 2,
          8,
          12,
        ),
        paint,
      );
    }
  }
}
