import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../services/audio_manager.dart';
import '../services/theme_manager.dart';
import '../widgets/retro_button.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final themeManager = context.watch<ThemeManager>();
    
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              themeManager.darkest,
              themeManager.dark,
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
                      icon: Icon(
                        Icons.arrow_back,
                        color: themeManager.text,
                      ),
                      onPressed: () => Navigator.of(context).pop(),
                    ),
                    Text(
                      'Settings',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: themeManager.text,
                        fontFamily: 'monospace',
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 32),

                // Appearance settings
                Text(
                  'Appearance',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: themeManager.text,
                    fontFamily: 'monospace',
                  ),
                ),
                const SizedBox(height: 16),
                
                // Palette mode selector
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: themeManager.light,
                      width: 2,
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Color Palette',
                        style: TextStyle(
                          color: themeManager.text,
                          fontFamily: 'monospace',
                        ),
                      ),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          Expanded(
                            child: _buildPaletteOption(
                              context,
                              PaletteMode.gbc,
                              'GBC',
                              'GameBoy Color',
                              themeManager,
                            ),
                          ),
                          const SizedBox(width: 8),
                          Expanded(
                            child: _buildPaletteOption(
                              context,
                              PaletteMode.gba,
                              'GBA',
                              'GameBoy Advance',
                              themeManager,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                
                const SizedBox(height: 32),

                // Audio settings
                Consumer<AudioManager>(
                  builder: (context, audioManager, child) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Audio',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: themeManager.text,
                            fontFamily: 'monospace',
                          ),
                        ),
                        const SizedBox(height: 16),
                        
                        // Music toggle
                        Container(
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: themeManager.light,
                              width: 2,
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Music',
                                style: TextStyle(
                                  color: themeManager.text,
                                  fontFamily: 'monospace',
                                ),
                              ),
                              Switch(
                                value: audioManager.musicEnabled,
                                onChanged: (_) => audioManager.toggleMusic(),
                                activeColor: themeManager.lightest,
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
                              color: themeManager.light,
                              width: 2,
                            ),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Music Volume',
                                style: TextStyle(
                                  color: themeManager.text,
                                  fontFamily: 'monospace',
                                ),
                              ),
                              Slider(
                                value: audioManager.musicVolume,
                                onChanged: audioManager.setMusicVolume,
                                activeColor: themeManager.lightest,
                                inactiveColor: themeManager.dark,
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
                              color: themeManager.light,
                              width: 2,
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Sound Effects',
                                style: TextStyle(
                                  color: themeManager.text,
                                  fontFamily: 'monospace',
                                ),
                              ),
                              Switch(
                                value: audioManager.sfxEnabled,
                                onChanged: (_) => audioManager.toggleSfx(),
                                activeColor: themeManager.lightest,
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
                              color: themeManager.light,
                              width: 2,
                            ),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'SFX Volume',
                                style: TextStyle(
                                  color: themeManager.text,
                                  fontFamily: 'monospace',
                                ),
                              ),
                              Slider(
                                value: audioManager.sfxVolume,
                                onChanged: audioManager.setSfxVolume,
                                activeColor: themeManager.lightest,
                                inactiveColor: themeManager.dark,
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
  
  Widget _buildPaletteOption(
    BuildContext context,
    PaletteMode mode,
    String label,
    String description,
    ThemeManager themeManager,
  ) {
    final isSelected = themeManager.paletteMode == mode;
    
    return GestureDetector(
      onTap: () => themeManager.setPaletteMode(mode),
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: isSelected ? themeManager.dark : themeManager.darkest,
          border: Border.all(
            color: isSelected ? themeManager.lightest : themeManager.light,
            width: isSelected ? 3 : 2,
          ),
        ),
        child: Column(
          children: [
            Text(
              label,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: isSelected ? themeManager.lightest : themeManager.light,
                fontFamily: 'monospace',
              ),
            ),
            const SizedBox(height: 4),
            Text(
              description,
              style: TextStyle(
                fontSize: 10,
                color: isSelected ? themeManager.light : themeManager.dark,
                fontFamily: 'monospace',
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
