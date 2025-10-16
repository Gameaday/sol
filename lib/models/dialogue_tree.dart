/// Represents a complete dialogue tree structure with branching paths
class DialogueTree {
  final String id;
  final String name;
  final Map<String, DialogueTreeNode> nodes;
  final String startNodeId;
  
  DialogueTree({
    required this.id,
    required this.name,
    required this.nodes,
    required this.startNodeId,
  });
  
  DialogueTreeNode? getNode(String nodeId) {
    return nodes[nodeId];
  }
  
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'nodes': nodes.map((key, value) => MapEntry(key, value.toJson())),
      'startNodeId': startNodeId,
    };
  }
  
  factory DialogueTree.fromJson(Map<String, dynamic> json) {
    return DialogueTree(
      id: json['id'] as String,
      name: json['name'] as String,
      nodes: (json['nodes'] as Map<String, dynamic>).map(
        (key, value) => MapEntry(
          key,
          DialogueTreeNode.fromJson(value as Map<String, dynamic>),
        ),
      ),
      startNodeId: json['startNodeId'] as String,
    );
  }
}

/// Represents a single node in a dialogue tree
class DialogueTreeNode {
  final String id;
  final String text;
  final String? speaker;
  final List<DialogueTreeChoice>? choices;
  final String? nextNodeId;
  final Map<String, dynamic>? flagsToSet;
  final Map<String, dynamic>? requiredFlags;
  final DialogueAction? action;
  
  DialogueTreeNode({
    required this.id,
    required this.text,
    this.speaker,
    this.choices,
    this.nextNodeId,
    this.flagsToSet,
    this.requiredFlags,
    this.action,
  });
  
  bool canAccess(Map<String, dynamic> gameFlags) {
    if (requiredFlags == null) return true;
    
    for (final entry in requiredFlags!.entries) {
      if (gameFlags[entry.key] != entry.value) {
        return false;
      }
    }
    return true;
  }
  
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'text': text,
      if (speaker != null) 'speaker': speaker,
      if (choices != null)
        'choices': choices!.map((c) => c.toJson()).toList(),
      if (nextNodeId != null) 'nextNodeId': nextNodeId,
      if (flagsToSet != null) 'flagsToSet': flagsToSet,
      if (requiredFlags != null) 'requiredFlags': requiredFlags,
      if (action != null) 'action': action!.toJson(),
    };
  }
  
  factory DialogueTreeNode.fromJson(Map<String, dynamic> json) {
    return DialogueTreeNode(
      id: json['id'] as String,
      text: json['text'] as String,
      speaker: json['speaker'] as String?,
      choices: json['choices'] != null
          ? (json['choices'] as List)
              .map((c) => DialogueTreeChoice.fromJson(c as Map<String, dynamic>))
              .toList()
          : null,
      nextNodeId: json['nextNodeId'] as String?,
      flagsToSet: json['flagsToSet'] as Map<String, dynamic>?,
      requiredFlags: json['requiredFlags'] as Map<String, dynamic>?,
      action: json['action'] != null
          ? DialogueAction.fromJson(json['action'] as Map<String, dynamic>)
          : null,
    );
  }
}

/// Represents a choice in a dialogue tree node
class DialogueTreeChoice {
  final String id;
  final String text;
  final String nextNodeId;
  final Map<String, dynamic>? requiredFlags;
  final Map<String, dynamic>? flagsToSet;
  final ChoiceTone? tone;
  
  DialogueTreeChoice({
    required this.id,
    required this.text,
    required this.nextNodeId,
    this.requiredFlags,
    this.flagsToSet,
    this.tone,
  });
  
  bool isAvailable(Map<String, dynamic> gameFlags) {
    if (requiredFlags == null) return true;
    
    for (final entry in requiredFlags!.entries) {
      if (gameFlags[entry.key] != entry.value) {
        return false;
      }
    }
    return true;
  }
  
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'text': text,
      'nextNodeId': nextNodeId,
      if (requiredFlags != null) 'requiredFlags': requiredFlags,
      if (flagsToSet != null) 'flagsToSet': flagsToSet,
      if (tone != null) 'tone': tone!.toString().split('.').last,
    };
  }
  
  factory DialogueTreeChoice.fromJson(Map<String, dynamic> json) {
    return DialogueTreeChoice(
      id: json['id'] as String,
      text: json['text'] as String,
      nextNodeId: json['nextNodeId'] as String,
      requiredFlags: json['requiredFlags'] as Map<String, dynamic>?,
      flagsToSet: json['flagsToSet'] as Map<String, dynamic>?,
      tone: json['tone'] != null
          ? ChoiceTone.values.firstWhere(
              (e) => e.toString().split('.').last == json['tone'],
              orElse: () => ChoiceTone.neutral,
            )
          : null,
    );
  }
}

/// Represents the tone/approach of a dialogue choice
enum ChoiceTone {
  aggressive,
  diplomatic,
  curious,
  compassionate,
  pragmatic,
  neutral,
}

/// Represents an action that occurs during dialogue
class DialogueAction {
  final DialogueActionType type;
  final Map<String, dynamic>? parameters;
  
  DialogueAction({
    required this.type,
    this.parameters,
  });
  
  Map<String, dynamic> toJson() {
    return {
      'type': type.toString().split('.').last,
      if (parameters != null) 'parameters': parameters,
    };
  }
  
  factory DialogueAction.fromJson(Map<String, dynamic> json) {
    return DialogueAction(
      type: DialogueActionType.values.firstWhere(
        (e) => e.toString().split('.').last == json['type'],
      ),
      parameters: json['parameters'] as Map<String, dynamic>?,
    );
  }
}

/// Types of actions that can occur during dialogue
enum DialogueActionType {
  giveItem,
  takeItem,
  giveGold,
  takeGold,
  startQuest,
  completeQuest,
  startBattle,
  playCutscene,
  changeRelationship,
  learnPsynergy,
  triggerEvent,
}
