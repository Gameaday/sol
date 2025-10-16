import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

/// Manages game save/load functionality
class SaveManager extends ChangeNotifier {
  static const String _saveKeyPrefix = 'save_slot_';
  static const int maxSaveSlots = 3;
  
  Map<int, Map<String, dynamic>> _saveSlots = {};
  
  Map<int, Map<String, dynamic>> get saveSlots => Map.unmodifiable(_saveSlots);
  
  Future<void> initialize() async {
    await loadAllSaves();
  }
  
  Future<void> loadAllSaves() async {
    final prefs = await SharedPreferences.getInstance();
    _saveSlots.clear();
    
    for (int i = 1; i <= maxSaveSlots; i++) {
      final saveData = prefs.getString('$_saveKeyPrefix$i');
      if (saveData != null) {
        try {
          _saveSlots[i] = jsonDecode(saveData) as Map<String, dynamic>;
        } catch (e) {
          debugPrint('Error loading save slot $i: $e');
        }
      }
    }
    notifyListeners();
  }
  
  Future<bool> saveGame(int slot, Map<String, dynamic> gameData) async {
    if (slot < 1 || slot > maxSaveSlots) return false;
    
    try {
      final prefs = await SharedPreferences.getInstance();
      gameData['timestamp'] = DateTime.now().toIso8601String();
      gameData['slot'] = slot;
      
      final saveData = jsonEncode(gameData);
      await prefs.setString('$_saveKeyPrefix$slot', saveData);
      
      _saveSlots[slot] = gameData;
      notifyListeners();
      return true;
    } catch (e) {
      debugPrint('Error saving game to slot $slot: $e');
      return false;
    }
  }
  
  Future<Map<String, dynamic>?> loadGame(int slot) async {
    if (slot < 1 || slot > maxSaveSlots) return null;
    
    try {
      final prefs = await SharedPreferences.getInstance();
      final saveData = prefs.getString('$_saveKeyPrefix$slot');
      
      if (saveData != null) {
        return jsonDecode(saveData) as Map<String, dynamic>;
      }
    } catch (e) {
      debugPrint('Error loading game from slot $slot: $e');
    }
    return null;
  }
  
  Future<bool> deleteSave(int slot) async {
    if (slot < 1 || slot > maxSaveSlots) return false;
    
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.remove('$_saveKeyPrefix$slot');
      _saveSlots.remove(slot);
      notifyListeners();
      return true;
    } catch (e) {
      debugPrint('Error deleting save slot $slot: $e');
      return false;
    }
  }
  
  bool hasSave(int slot) {
    return _saveSlots.containsKey(slot);
  }
  
  String? getSaveTimestamp(int slot) {
    return _saveSlots[slot]?['timestamp'] as String?;
  }
}
