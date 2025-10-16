import 'package:flutter/foundation.dart';
import '../models/cutscene_script.dart';

/// Manages cutscene playback and state
class CutsceneDirector extends ChangeNotifier {
  CutsceneScript? _currentScript;
  int _currentEventIndex = 0;
  bool _isPlaying = false;
  bool _isPaused = false;
  double _elapsedTime = 0;
  
  final Map<String, CutsceneCharacter> _characters = {};
  CutsceneCamera _camera = CutsceneCamera();
  
  /// Get the current cutscene script
  CutsceneScript? get currentScript => _currentScript;
  
  /// Get the current event index
  int get currentEventIndex => _currentEventIndex;
  
  /// Check if a cutscene is playing
  bool get isPlaying => _isPlaying;
  
  /// Check if the cutscene is paused
  bool get isPaused => _isPaused;
  
  /// Get elapsed time for current event
  double get elapsedTime => _elapsedTime;
  
  /// Get all characters in the cutscene
  Map<String, CutsceneCharacter> get characters => Map.unmodifiable(_characters);
  
  /// Get the camera
  CutsceneCamera get camera => _camera;
  
  /// Start a cutscene
  bool startCutscene(CutsceneScript script) {
    if (_isPlaying) return false;
    
    _currentScript = script;
    _currentEventIndex = 0;
    _elapsedTime = 0;
    _isPlaying = true;
    _isPaused = false;
    _characters.clear();
    _camera = CutsceneCamera();
    
    notifyListeners();
    return true;
  }
  
  /// Update the cutscene (called each frame)
  void update(double deltaTime) {
    if (!_isPlaying || _isPaused || _currentScript == null) return;
    
    _elapsedTime += deltaTime;
    
    // Check if current event is complete
    final currentEvent = getCurrentEvent();
    if (currentEvent != null && _elapsedTime >= currentEvent.duration) {
      advanceToNextEvent();
    }
    
    notifyListeners();
  }
  
  /// Get the current event
  CutsceneEvent? getCurrentEvent() {
    if (_currentScript == null) return null;
    if (_currentEventIndex >= _currentScript!.events.length) return null;
    return _currentScript!.events[_currentEventIndex];
  }
  
  /// Advance to the next event
  void advanceToNextEvent() {
    if (_currentScript == null) return;
    
    _currentEventIndex++;
    _elapsedTime = 0;
    
    // Check if cutscene is complete
    if (_currentEventIndex >= _currentScript!.events.length) {
      endCutscene();
    } else {
      notifyListeners();
    }
  }
  
  /// Skip to the next event
  void skipCurrentEvent() {
    if (!_isPlaying || _currentScript == null) return;
    
    final currentEvent = getCurrentEvent();
    if (currentEvent != null) {
      _elapsedTime = currentEvent.duration;
      advanceToNextEvent();
    }
  }
  
  /// Pause the cutscene
  void pause() {
    if (!_isPlaying) return;
    _isPaused = true;
    notifyListeners();
  }
  
  /// Resume the cutscene
  void resume() {
    if (!_isPlaying) return;
    _isPaused = false;
    notifyListeners();
  }
  
  /// Skip the entire cutscene
  void skip() {
    if (_currentScript?.skippable == false) return;
    endCutscene();
  }
  
  /// End the cutscene
  void endCutscene() {
    _currentScript = null;
    _currentEventIndex = 0;
    _elapsedTime = 0;
    _isPlaying = false;
    _isPaused = false;
    _characters.clear();
    _camera = CutsceneCamera();
    notifyListeners();
  }
  
  // Character Management
  
  /// Add or update a character in the cutscene
  void setCharacter(CutsceneCharacter character) {
    _characters[character.characterId] = character;
    notifyListeners();
  }
  
  /// Get a character by ID
  CutsceneCharacter? getCharacter(String characterId) {
    return _characters[characterId];
  }
  
  /// Show a character
  void showCharacter(String characterId) {
    final character = _characters[characterId];
    if (character != null) {
      character.visible = true;
      notifyListeners();
    }
  }
  
  /// Hide a character
  void hideCharacter(String characterId) {
    final character = _characters[characterId];
    if (character != null) {
      character.visible = false;
      notifyListeners();
    }
  }
  
  /// Move a character
  void moveCharacter(String characterId, double x, double y) {
    final character = _characters[characterId];
    if (character != null) {
      character.x = x;
      character.y = y;
      notifyListeners();
    }
  }
  
  // Camera Management
  
  /// Move the camera
  void moveCamera(double x, double y) {
    _camera.x = x;
    _camera.y = y;
    notifyListeners();
  }
  
  /// Zoom the camera
  void zoomCamera(double zoom) {
    _camera.zoom = zoom;
    notifyListeners();
  }
  
  /// Reset the camera
  void resetCamera() {
    _camera = CutsceneCamera();
    notifyListeners();
  }
  
  /// Get the progress percentage
  double getProgress() {
    if (_currentScript == null || _currentScript!.events.isEmpty) return 0;
    return _currentEventIndex / _currentScript!.events.length;
  }
}
