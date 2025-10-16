import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../services/audio_manager.dart';
import '../widgets/retro_button.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

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
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Header
                Row(
                  children: [
                    IconButton(
                      icon: const Icon(
                        Icons.arrow_back,
                        color: Color(0xFF9bbc0f),
                      ),
                      onPressed: () => Navigator.of(context).pop(),
                    ),
                    const Text(
                      'Settings',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF9bbc0f),
                        fontFamily: 'monospace',
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 32),

                // Music settings
                Consumer<AudioManager>(
                  builder: (context, audioManager, child) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Audio',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF9bbc0f),
                            fontFamily: 'monospace',
                          ),
                        ),
                        const SizedBox(height: 16),
                        
                        // Music toggle
                        Container(
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: const Color(0xFF8bac0f),
                              width: 2,
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                'Music',
                                style: TextStyle(
                                  color: Color(0xFF9bbc0f),
                                  fontFamily: 'monospace',
                                ),
                              ),
                              Switch(
                                value: audioManager.musicEnabled,
                                onChanged: (_) => audioManager.toggleMusic(),
                                activeColor: const Color(0xFF9bbc0f),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 8),
                        
                        // Music volume
                        Container(
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: const Color(0xFF8bac0f),
                              width: 2,
                            ),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Music Volume',
                                style: TextStyle(
                                  color: Color(0xFF9bbc0f),
                                  fontFamily: 'monospace',
                                ),
                              ),
                              Slider(
                                value: audioManager.musicVolume,
                                onChanged: audioManager.setMusicVolume,
                                activeColor: const Color(0xFF9bbc0f),
                                inactiveColor: const Color(0xFF306230),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 16),
                        
                        // SFX toggle
                        Container(
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: const Color(0xFF8bac0f),
                              width: 2,
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                'Sound Effects',
                                style: TextStyle(
                                  color: Color(0xFF9bbc0f),
                                  fontFamily: 'monospace',
                                ),
                              ),
                              Switch(
                                value: audioManager.sfxEnabled,
                                onChanged: (_) => audioManager.toggleSfx(),
                                activeColor: const Color(0xFF9bbc0f),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 8),
                        
                        // SFX volume
                        Container(
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: const Color(0xFF8bac0f),
                              width: 2,
                            ),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'SFX Volume',
                                style: TextStyle(
                                  color: Color(0xFF9bbc0f),
                                  fontFamily: 'monospace',
                                ),
                              ),
                              Slider(
                                value: audioManager.sfxVolume,
                                onChanged: audioManager.setSfxVolume,
                                activeColor: const Color(0xFF9bbc0f),
                                inactiveColor: const Color(0xFF306230),
                              ),
                            ],
                          ),
                        ),
                      ],
                    );
                  },
                ),
                
                const Spacer(),
                
                // Back button
                Center(
                  child: RetroButton(
                    text: 'Back',
                    onPressed: () => Navigator.of(context).pop(),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
