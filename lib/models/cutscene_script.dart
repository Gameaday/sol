/// Represents a cutscene script
class CutsceneScript {
  final String id;
  final String name;
  final List<CutsceneEvent> events;
  final bool skippable;
  final bool autoSaveBeforeStart;
  
  CutsceneScript({
    required this.id,
    required this.name,
    required this.events,
    this.skippable = true,
    this.autoSaveBeforeStart = true,
  });
  
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'events': events.map((e) => e.toJson()).toList(),
      'skippable': skippable,
      'autoSaveBeforeStart': autoSaveBeforeStart,
    };
  }
  
  factory CutsceneScript.fromJson(Map<String, dynamic> json) {
    return CutsceneScript(
      id: json['id'] as String,
      name: json['name'] as String,
      events: (json['events'] as List)
          .map((e) => CutsceneEvent.fromJson(e as Map<String, dynamic>))
          .toList(),
      skippable: json['skippable'] as bool? ?? true,
      autoSaveBeforeStart: json['autoSaveBeforeStart'] as bool? ?? true,
    );
  }
}

/// Represents a single event within a cutscene
class CutsceneEvent {
  final String id;
  final CutsceneEventType type;
  final double duration;
  final Map<String, dynamic>? parameters;
  
  CutsceneEvent({
    required this.id,
    required this.type,
    required this.duration,
    this.parameters,
  });
  
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'type': type.toString().split('.').last,
      'duration': duration,
      if (parameters != null) 'parameters': parameters,
    };
  }
  
  factory CutsceneEvent.fromJson(Map<String, dynamic> json) {
    return CutsceneEvent(
      id: json['id'] as String,
      type: CutsceneEventType.values.firstWhere(
        (e) => e.toString().split('.').last == json['type'],
      ),
      duration: (json['duration'] as num).toDouble(),
      parameters: json['parameters'] as Map<String, dynamic>?,
    );
  }
}

/// Types of cutscene events
enum CutsceneEventType {
  fadeIn,
  fadeOut,
  showLocation,
  hideLocation,
  dialogue,
  moveCharacter,
  showCharacter,
  hideCharacter,
  playAnimation,
  showObject,
  hideObject,
  playSound,
  playMusic,
  stopMusic,
  cameraMove,
  cameraZoom,
  screenShake,
  wait,
  setFlag,
  startBattle,
  giveItem,
  parallel,
}

/// Represents camera settings for a cutscene
class CutsceneCamera {
  double x;
  double y;
  double zoom;
  
  CutsceneCamera({
    this.x = 0,
    this.y = 0,
    this.zoom = 1.0,
  });
  
  Map<String, dynamic> toJson() {
    return {
      'x': x,
      'y': y,
      'zoom': zoom,
    };
  }
  
  factory CutsceneCamera.fromJson(Map<String, dynamic> json) {
    return CutsceneCamera(
      x: (json['x'] as num).toDouble(),
      y: (json['y'] as num).toDouble(),
      zoom: (json['zoom'] as num).toDouble(),
    );
  }
}

/// Represents a character's position and state in a cutscene
class CutsceneCharacter {
  final String characterId;
  double x;
  double y;
  String? animation;
  bool visible;
  
  CutsceneCharacter({
    required this.characterId,
    required this.x,
    required this.y,
    this.animation,
    this.visible = true,
  });
  
  Map<String, dynamic> toJson() {
    return {
      'characterId': characterId,
      'x': x,
      'y': y,
      if (animation != null) 'animation': animation,
      'visible': visible,
    };
  }
  
  factory CutsceneCharacter.fromJson(Map<String, dynamic> json) {
    return CutsceneCharacter(
      characterId: json['characterId'] as String,
      x: (json['x'] as num).toDouble(),
      y: (json['y'] as num).toDouble(),
      animation: json['animation'] as String?,
      visible: json['visible'] as bool? ?? true,
    );
  }
}
