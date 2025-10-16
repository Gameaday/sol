import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../game/sol_game.dart';
import '../services/game_state_manager.dart';
import '../services/save_manager.dart';
import '../models/player.dart';
import '../models/item.dart';
import '../widgets/game_hud.dart';
import 'inventory_screen.dart';
import 'package:flame/game.dart';

class GameScreen extends StatefulWidget {
  final bool isNewGame;
  final Map<String, dynamic>? saveData;

  const GameScreen({
    super.key,
    required this.isNewGame,
    this.saveData,
  });

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  late SolGameWorld gameWorld;
  Player? player;

  @override
  void initState() {
    super.initState();
    _initializeGame();
  }

  void _initializeGame() {
    if (widget.isNewGame) {
      player = Player(name: 'Hero');
      // Give starting items
      player!.addItem('potion');
      player!.addItem('potion');
      player!.addItem('ether');
      player!.gold = 100;
    } else if (widget.saveData != null) {
      player = Player.fromJson(widget.saveData!['player'] as Map<String, dynamic>);
    }
    
    gameWorld = SolGameWorld(player: player!);
  }

  void _showPauseMenu() {
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (context) => Dialog(
        backgroundColor: Colors.transparent,
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: const Color(0xFF0f380f),
            border: Border.all(
              color: const Color(0xFF9bbc0f),
              width: 3,
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                'Paused',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF9bbc0f),
                  fontFamily: 'monospace',
                ),
              ),
              const SizedBox(height: 24),
              _buildMenuButton('Resume', () => Navigator.of(context).pop()),
              const SizedBox(height: 12),
              _buildMenuButton('Inventory', _openInventory),
              const SizedBox(height: 12),
              _buildMenuButton('Save Game', _saveGame),
              const SizedBox(height: 12),
              _buildMenuButton('Main Menu', _returnToMainMenu),
            ],
          ),
        ),
      ),
    );
  }

  void _openInventory() {
    Navigator.of(context).pop(); // Close pause menu
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => InventoryScreen(
          player: player!,
          onItemUse: (itemId) {
            final item = ItemDatabase.getItem(itemId);
            if (item != null) {
              if (item.healHp != null) {
                setState(() {
                  player!.heal(item.healHp!);
                });
              }
              if (item.healMp != null) {
                setState(() {
                  player!.restoreMp(item.healMp!);
                });
              }
              // Remove item from inventory
              player!.removeItem(itemId);
            }
          },
        ),
      ),
    );
  }

  Widget _buildMenuButton(String text, VoidCallback onPressed) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: 200,
        padding: const EdgeInsets.symmetric(vertical: 12),
        decoration: BoxDecoration(
          border: Border.all(
            color: const Color(0xFF9bbc0f),
            width: 2,
          ),
        ),
        child: Center(
          child: Text(
            text,
            style: const TextStyle(
              fontSize: 16,
              color: Color(0xFF9bbc0f),
              fontFamily: 'monospace',
            ),
          ),
        ),
      ),
    );
  }

  void _saveGame() async {
    Navigator.of(context).pop(); // Close pause menu
    
    final saveManager = context.read<SaveManager>();
    final gameData = {
      'player': player!.toJson(),
      'gameFlags': context.read<GameStateManager>().gameFlags,
    };
    
    // Show save slot selection
    showDialog(
      context: context,
      builder: (context) => Dialog(
        backgroundColor: Colors.transparent,
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: const Color(0xFF0f380f),
            border: Border.all(
              color: const Color(0xFF9bbc0f),
              width: 3,
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                'Select Save Slot',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF9bbc0f),
                  fontFamily: 'monospace',
                ),
              ),
              const SizedBox(height: 16),
              for (int slot = 1; slot <= SaveManager.maxSaveSlots; slot++)
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4.0),
                  child: _buildMenuButton(
                    'Slot $slot',
                    () async {
                      await saveManager.saveGame(slot, gameData);
                      if (mounted) {
                        Navigator.of(context).pop();
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Game Saved!'),
                            backgroundColor: Color(0xFF306230),
                          ),
                        );
                      }
                    },
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }

  void _returnToMainMenu() {
    Navigator.of(context).pop(); // Close pause menu
    Navigator.of(context).pop(); // Return to main menu
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Game world
          GameWidget(
            game: gameWorld,
          ),
          
          // HUD overlay
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: SafeArea(
              child: GameHud(player: player!),
            ),
          ),
          
          // Inventory button
          Positioned(
            top: 8,
            left: 8,
            child: SafeArea(
              child: IconButton(
                icon: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: const Color(0xFF0f380f).withOpacity(0.8),
                    border: Border.all(
                      color: const Color(0xFF9bbc0f),
                      width: 2,
                    ),
                  ),
                  child: const Icon(
                    Icons.backpack,
                    color: Color(0xFF9bbc0f),
                  ),
                ),
                onPressed: _openInventory,
              ),
            ),
          ),
          
          // Pause button
          Positioned(
            top: 8,
            right: 8,
            child: SafeArea(
              child: IconButton(
                icon: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: const Color(0xFF0f380f).withOpacity(0.8),
                    border: Border.all(
                      color: const Color(0xFF9bbc0f),
                      width: 2,
                    ),
                  ),
                  child: const Icon(
                    Icons.menu,
                    color: Color(0xFF9bbc0f),
                  ),
                ),
                onPressed: _showPauseMenu,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
