import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../services/save_manager.dart';
import '../services/audio_manager.dart';
import '../widgets/retro_button.dart';
import '../widgets/retro_dialog.dart';
import 'game_screen.dart';
import 'settings_screen.dart';

class MainMenuScreen extends StatefulWidget {
  const MainMenuScreen({super.key});

  @override
  State<MainMenuScreen> createState() => _MainMenuScreenState();
}

class _MainMenuScreenState extends State<MainMenuScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 1500),
      vsync: this,
    );
    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(_controller);
    _controller.forward();
    
    // Initialize save manager
    Future.microtask(() {
      context.read<SaveManager>().initialize();
      context.read<AudioManager>().playMusic('main_theme');
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _startNewGame() {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (context) => const GameScreen(isNewGame: true),
      ),
    );
  }

  void _continueGame() async {
    final saveManager = context.read<SaveManager>();
    
    // Show load dialog
    showDialog(
      context: context,
      builder: (context) => RetroDialog(
        title: 'Load Game',
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            for (int slot = 1; slot <= SaveManager.maxSaveSlots; slot++)
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 4.0),
                child: RetroButton(
                  text: saveManager.hasSave(slot)
                      ? 'Slot $slot - ${_formatTimestamp(saveManager.getSaveTimestamp(slot))}'
                      : 'Slot $slot - Empty',
                  onPressed: saveManager.hasSave(slot)
                      ? () async {
                          Navigator.of(context).pop();
                          final saveData = await saveManager.loadGame(slot);
                          if (saveData != null && mounted) {
                            Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                builder: (context) => GameScreen(
                                  isNewGame: false,
                                  saveData: saveData,
                                ),
                              ),
                            );
                          }
                        }
                      : null,
                ),
              ),
          ],
        ),
      ),
    );
  }

  String _formatTimestamp(String? timestamp) {
    if (timestamp == null) return 'Empty';
    try {
      final date = DateTime.parse(timestamp);
      return '${date.month}/${date.day} ${date.hour}:${date.minute.toString().padLeft(2, '0')}';
    } catch (e) {
      return 'Unknown';
    }
  }

  void _showSettings() {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (context) => const SettingsScreen()),
    );
  }

  void _showAbout() {
    showDialog(
      context: context,
      builder: (context) => const RetroDialog(
        title: 'About',
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Sol',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Color(0xFF9bbc0f),
              ),
            ),
            SizedBox(height: 8),
            Text(
              'A retro 8-bit RPG',
              style: TextStyle(color: Color(0xFF8bac0f)),
            ),
            SizedBox(height: 16),
            Text(
              'Inspired by Golden Sun',
              style: TextStyle(fontSize: 12, color: Color(0xFF306230)),
            ),
            SizedBox(height: 8),
            Text(
              'Version 1.0.0',
              style: TextStyle(fontSize: 10, color: Color(0xFF306230)),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFF0f380f),
              Color(0xFF306230),
            ],
          ),
        ),
        child: SafeArea(
          child: FadeTransition(
            opacity: _fadeAnimation,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Title
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: const Color(0xFF9bbc0f),
                        width: 3,
                      ),
                    ),
                    child: const Text(
                      'SOL',
                      style: TextStyle(
                        fontSize: 48,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF9bbc0f),
                        letterSpacing: 8,
                        fontFamily: 'monospace',
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'A Retro RPG Adventure',
                    style: TextStyle(
                      fontSize: 14,
                      color: Color(0xFF8bac0f),
                      fontFamily: 'monospace',
                    ),
                  ),
                  const SizedBox(height: 48),
                  
                  // Menu buttons
                  RetroButton(
                    text: 'New Game',
                    onPressed: _startNewGame,
                  ),
                  const SizedBox(height: 16),
                  RetroButton(
                    text: 'Continue',
                    onPressed: _continueGame,
                  ),
                  const SizedBox(height: 16),
                  RetroButton(
                    text: 'Settings',
                    onPressed: _showSettings,
                  ),
                  const SizedBox(height: 16),
                  RetroButton(
                    text: 'About',
                    onPressed: _showAbout,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
