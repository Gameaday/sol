import 'package:flutter/foundation.dart';
import '../models/dialogue_tree.dart';

/// Manages dialogue trees and conversation state
class DialogueManager extends ChangeNotifier {
  DialogueTree? _currentTree;
  DialogueTreeNode? _currentNode;
  final Map<String, dynamic> _conversationState = {};
  final List<String> _choiceHistory = [];
  
  /// Get the current dialogue tree
  DialogueTree? get currentTree => _currentTree;
  
  /// Get the current dialogue node
  DialogueTreeNode? get currentNode => _currentNode;
  
  /// Get the conversation state
  Map<String, dynamic> get conversationState => Map.unmodifiable(_conversationState);
  
  /// Get the choice history
  List<String> get choiceHistory => List.unmodifiable(_choiceHistory);
  
  /// Start a dialogue tree
  bool startDialogue(DialogueTree tree, Map<String, dynamic> gameFlags) {
    _currentTree = tree;
    _conversationState.clear();
    _choiceHistory.clear();
    
    final startNode = tree.getNode(tree.startNodeId);
    if (startNode == null) return false;
    
    if (!startNode.canAccess(gameFlags)) return false;
    
    _currentNode = startNode;
    notifyListeners();
    return true;
  }
  
  /// Move to a specific node
  bool moveToNode(String nodeId, Map<String, dynamic> gameFlags) {
    if (_currentTree == null) return false;
    
    final node = _currentTree!.getNode(nodeId);
    if (node == null) return false;
    
    if (!node.canAccess(gameFlags)) return false;
    
    _currentNode = node;
    notifyListeners();
    return true;
  }
  
  /// Make a dialogue choice
  bool makeChoice(
    DialogueTreeChoice choice,
    Map<String, dynamic> gameFlags,
    Function(Map<String, dynamic>) onFlagsChanged,
  ) {
    if (_currentTree == null || _currentNode == null) return false;
    
    // Check if choice is available
    if (!choice.isAvailable(gameFlags)) return false;
    
    // Record choice
    _choiceHistory.add(choice.id);
    
    // Apply choice flags
    if (choice.flagsToSet != null) {
      onFlagsChanged(choice.flagsToSet!);
    }
    
    // Move to next node
    return moveToNode(choice.nextNodeId, gameFlags);
  }
  
  /// Advance to the next node (for nodes without choices)
  bool advance(Map<String, dynamic> gameFlags, Function(Map<String, dynamic>) onFlagsChanged) {
    if (_currentNode == null) return false;
    
    // Apply node flags
    if (_currentNode!.flagsToSet != null) {
      onFlagsChanged(_currentNode!.flagsToSet!);
    }
    
    // Check for next node
    final nextNodeId = _currentNode!.nextNodeId;
    if (nextNodeId == null) {
      return endDialogue();
    }
    
    return moveToNode(nextNodeId, gameFlags);
  }
  
  /// Get available choices for the current node
  List<DialogueTreeChoice> getAvailableChoices(Map<String, dynamic> gameFlags) {
    if (_currentNode?.choices == null) return [];
    
    return _currentNode!.choices!
        .where((choice) => choice.isAvailable(gameFlags))
        .toList();
  }
  
  /// Check if the current node has choices
  bool hasChoices(Map<String, dynamic> gameFlags) {
    return getAvailableChoices(gameFlags).isNotEmpty;
  }
  
  /// Execute an action from the current node
  void executeAction(
    Function(DialogueAction) onAction,
  ) {
    if (_currentNode?.action != null) {
      onAction(_currentNode!.action!);
    }
  }
  
  /// Set a conversation state variable
  void setConversationState(String key, dynamic value) {
    _conversationState[key] = value;
  }
  
  /// Get a conversation state variable
  dynamic getConversationState(String key, {dynamic defaultValue}) {
    return _conversationState[key] ?? defaultValue;
  }
  
  /// End the current dialogue
  bool endDialogue() {
    _currentTree = null;
    _currentNode = null;
    _conversationState.clear();
    _choiceHistory.clear();
    notifyListeners();
    return false;
  }
  
  /// Check if dialogue is active
  bool get isActive => _currentTree != null && _currentNode != null;
  
  /// Get the tone of the last choice made
  ChoiceTone? getLastChoiceTone() {
    if (_choiceHistory.isEmpty || _currentTree == null) return null;
    
    final lastChoiceId = _choiceHistory.last;
    
    // Search all nodes for the choice
    for (final node in _currentTree!.nodes.values) {
      if (node.choices != null) {
        for (final choice in node.choices!) {
          if (choice.id == lastChoiceId) {
            return choice.tone;
          }
        }
      }
    }
    
    return null;
  }
  
  /// Get the number of choices made with a specific tone
  int getChoiceCountByTone(ChoiceTone tone) {
    if (_currentTree == null) return 0;
    
    int count = 0;
    for (final choiceId in _choiceHistory) {
      for (final node in _currentTree!.nodes.values) {
        if (node.choices != null) {
          for (final choice in node.choices!) {
            if (choice.id == choiceId && choice.tone == tone) {
              count++;
              break;
            }
          }
        }
      }
    }
    
    return count;
  }
}
