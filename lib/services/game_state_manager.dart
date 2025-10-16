import 'package:flutter/foundation.dart';

/// Manages the overall game state and progression
class GameStateManager extends ChangeNotifier {
  String _currentScene = 'overworld';
  bool _isInBattle = false;
  bool _isPaused = false;
  Map<String, dynamic> _gameFlags = {};
  
  String get currentScene => _currentScene;
  bool get isInBattle => _isInBattle;
  bool get isPaused => _isPaused;
  Map<String, dynamic> get gameFlags => Map.unmodifiable(_gameFlags);
  
  void changeScene(String sceneName) {
    _currentScene = sceneName;
    notifyListeners();
  }
  
  void startBattle() {
    _isInBattle = true;
    notifyListeners();
  }
  
  void endBattle() {
    _isInBattle = false;
    notifyListeners();
  }
  
  void togglePause() {
    _isPaused = !_isPaused;
    notifyListeners();
  }
  
  void setGameFlag(String key, dynamic value) {
    _gameFlags[key] = value;
    notifyListeners();
  }
  
  dynamic getGameFlag(String key, {dynamic defaultValue}) {
    return _gameFlags[key] ?? defaultValue;
  }
  
  void resetGameState() {
    _currentScene = 'overworld';
    _isInBattle = false;
    _isPaused = false;
    _gameFlags = {};
    notifyListeners();
  }
}
