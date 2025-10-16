/// Manages story flags and narrative state
class StoryFlags {
  final Map<String, dynamic> _flags;
  final List<StoryMilestone> _milestones;
  final List<StoryEvent> _events;
  
  StoryFlags({
    Map<String, dynamic>? flags,
    List<StoryMilestone>? milestones,
    List<StoryEvent>? events,
  })  : _flags = flags ?? {},
        _milestones = milestones ?? [],
        _events = events ?? [];
  
  /// Get a flag value
  dynamic getFlag(String key, {dynamic defaultValue}) {
    return _flags[key] ?? defaultValue;
  }
  
  /// Set a flag value
  void setFlag(String key, dynamic value) {
    _flags[key] = value;
  }
  
  /// Check if a flag exists
  bool hasFlag(String key) {
    return _flags.containsKey(key);
  }
  
  /// Remove a flag
  void removeFlag(String key) {
    _flags.remove(key);
  }
  
  /// Get all flags
  Map<String, dynamic> getAllFlags() {
    return Map.unmodifiable(_flags);
  }
  
  /// Add a story milestone
  void addMilestone(StoryMilestone milestone) {
    _milestones.add(milestone);
  }
  
  /// Get all milestones
  List<StoryMilestone> getMilestones() {
    return List.unmodifiable(_milestones);
  }
  
  /// Check if a milestone has been reached
  bool hasMilestone(String milestoneId) {
    return _milestones.any((m) => m.id == milestoneId);
  }
  
  /// Add a story event
  void addEvent(StoryEvent event) {
    _events.add(event);
  }
  
  /// Get all story events
  List<StoryEvent> getEvents() {
    return List.unmodifiable(_events);
  }
  
  /// Get story events in chronological order
  List<StoryEvent> getEventsChronological() {
    final sorted = List<StoryEvent>.from(_events);
    sorted.sort((a, b) => a.timestamp.compareTo(b.timestamp));
    return sorted;
  }
  
  /// Get the current chapter
  int getCurrentChapter() {
    return getFlag('current_chapter', defaultValue: 1) as int;
  }
  
  /// Set the current chapter
  void setCurrentChapter(int chapter) {
    setFlag('current_chapter', chapter);
  }
  
  Map<String, dynamic> toJson() {
    return {
      'flags': _flags,
      'milestones': _milestones.map((m) => m.toJson()).toList(),
      'events': _events.map((e) => e.toJson()).toList(),
    };
  }
  
  factory StoryFlags.fromJson(Map<String, dynamic> json) {
    return StoryFlags(
      flags: json['flags'] as Map<String, dynamic>?,
      milestones: (json['milestones'] as List?)
          ?.map((m) => StoryMilestone.fromJson(m as Map<String, dynamic>))
          .toList(),
      events: (json['events'] as List?)
          ?.map((e) => StoryEvent.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }
}

/// Represents a major story milestone
class StoryMilestone {
  final String id;
  final String name;
  final String description;
  final DateTime timestamp;
  final int chapter;
  
  StoryMilestone({
    required this.id,
    required this.name,
    required this.description,
    required this.chapter,
    DateTime? timestamp,
  }) : timestamp = timestamp ?? DateTime.now();
  
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'timestamp': timestamp.toIso8601String(),
      'chapter': chapter,
    };
  }
  
  factory StoryMilestone.fromJson(Map<String, dynamic> json) {
    return StoryMilestone(
      id: json['id'] as String,
      name: json['name'] as String,
      description: json['description'] as String,
      chapter: json['chapter'] as int,
      timestamp: DateTime.parse(json['timestamp'] as String),
    );
  }
}

/// Represents a story event for the journal/log system
class StoryEvent {
  final String id;
  final String title;
  final String summary;
  final DateTime timestamp;
  final int chapter;
  final EventType type;
  
  StoryEvent({
    required this.id,
    required this.title,
    required this.summary,
    required this.chapter,
    required this.type,
    DateTime? timestamp,
  }) : timestamp = timestamp ?? DateTime.now();
  
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'summary': summary,
      'timestamp': timestamp.toIso8601String(),
      'chapter': chapter,
      'type': type.toString().split('.').last,
    };
  }
  
  factory StoryEvent.fromJson(Map<String, dynamic> json) {
    return StoryEvent(
      id: json['id'] as String,
      title: json['title'] as String,
      summary: json['summary'] as String,
      chapter: json['chapter'] as int,
      timestamp: DateTime.parse(json['timestamp'] as String),
      type: EventType.values.firstWhere(
        (e) => e.toString().split('.').last == json['type'],
        orElse: () => EventType.story,
      ),
    );
  }
}

/// Types of story events
enum EventType {
  story,        // Main story events
  quest,        // Quest completions
  character,    // Character joining or character-specific events
  location,     // Arriving at new locations
  battle,       // Major battles
  discovery,    // Finding important items or information
}
