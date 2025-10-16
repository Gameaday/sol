import 'package:flutter/foundation.dart';

/// Manages audio playback for music and sound effects
class AudioManager extends ChangeNotifier {
  bool _musicEnabled = true;
  bool _sfxEnabled = true;
  double _musicVolume = 0.7;
  double _sfxVolume = 0.8;
  String? _currentMusic;
  
  bool get musicEnabled => _musicEnabled;
  bool get sfxEnabled => _sfxEnabled;
  double get musicVolume => _musicVolume;
  double get sfxVolume => _sfxVolume;
  String? get currentMusic => _currentMusic;
  
  void toggleMusic() {
    _musicEnabled = !_musicEnabled;
    if (!_musicEnabled) {
      stopMusic();
    }
    notifyListeners();
  }
  
  void toggleSfx() {
    _sfxEnabled = !_sfxEnabled;
    notifyListeners();
  }
  
  void setMusicVolume(double volume) {
    _musicVolume = volume.clamp(0.0, 1.0);
    notifyListeners();
  }
  
  void setSfxVolume(double volume) {
    _sfxVolume = volume.clamp(0.0, 1.0);
    notifyListeners();
  }
  
  void playMusic(String musicName) {
    if (!_musicEnabled) return;
    _currentMusic = musicName;
    // TODO: Implement actual audio playback with flame_audio
    notifyListeners();
  }
  
  void stopMusic() {
    _currentMusic = null;
    // TODO: Implement actual audio stop with flame_audio
    notifyListeners();
  }
  
  void playSfx(String sfxName) {
    if (!_sfxEnabled) return;
    // TODO: Implement actual sound effect playback with flame_audio
  }
}
