# Story Journal System

## Overview

The Story Journal system provides players with a way to review their adventure's history and track their current objectives. It automatically records important events as they occur throughout the game, preventing players from forgetting what they've been working on or what has happened in the past.

## Features

### Current Objective Tip
- Displayed prominently at the top of the journal
- Shows the most recent story event as a reminder
- Helps players remember what they were doing
- Includes chapter information

### Chronological Event Log
- Lists all past events in reverse chronological order (newest first)
- Each event includes:
  - **Title**: A clear, memorable name for the event
  - **Summary**: A short description of what happened
  - **Chapter**: Which chapter the event occurred in
  - **Timestamp**: When the event was recorded
  - **Type Icon**: Visual indicator of event type

## Event Types

The journal tracks six types of events:

1. **Story** (📖): Main story progression events
2. **Quest** (✓): Quest completions and major quest milestones
3. **Character** (👤): Party members joining or character-specific events
4. **Location** (📍): Arriving at new or significant locations
5. **Battle** (🛡️): Major battles and victories
6. **Discovery** (💡): Finding important items, secrets, or information

## Usage

### For Players

Access the Story Journal from the pause menu during gameplay:
1. Press pause/menu button
2. Select "Story Journal"
3. Review current objective and past events
4. Use back/close to return to game

### For Developers

#### Adding Story Events

Use the `StoryManager` service to add events:

```dart
// Get the story manager
final storyManager = context.read<StoryManager>();

// Add a story event
storyManager.addStoryEvent(
  'story_awakening',           // Unique ID
  'The Awakening',             // Title
  'Kai witnesses injustice',   // Summary
  EventType.story,             // Event type
);
```

#### Event Types

```dart
EventType.story      // Main story events
EventType.quest      // Quest-related (auto-added on quest completion)
EventType.character  // Character joining or character moments
EventType.location   // New locations discovered
EventType.battle     // Major battles won
EventType.discovery  // Items/secrets found
```

#### Automatic Quest Events

Quest completions are automatically added to the journal:

```dart
// When a quest is completed, an event is automatically added
storyManager.completeQuest('quest_id');
// Adds: "Quest Completed: [Quest Name]"
```

#### Best Practices

1. **Be Concise**: Keep summaries short and memorable (1-2 sentences)
2. **Use Clear Titles**: Make event titles immediately recognizable
3. **Choose Appropriate Types**: Use the most relevant event type
4. **Major Events Only**: Don't log every small action, focus on memorable moments
5. **Chronological Order**: Events are automatically ordered by timestamp

#### Example Events

```dart
// Character joins party
storyManager.addStoryEvent(
  'character_ember_joins',
  'A Kindred Spirit',
  'Ember, a former soldier, joins Kai in stopping the towers.',
  EventType.character,
);

// Major location reached
storyManager.addStoryEvent(
  'location_venus_sanctuary',
  'Venus Elemental Sanctuary',
  'Discovered the ancient sanctuary of the Venus Master Djinn.',
  EventType.location,
);

// Important battle
storyManager.addStoryEvent(
  'battle_venus_lighthouse',
  'Battle at Venus Lighthouse',
  'Prevented activation and retrieved the Venus sphere.',
  EventType.battle,
);

// Key discovery
storyManager.addStoryEvent(
  'discovery_lighthouse_key',
  'The Lighthouse Key',
  'Found a key that will unlock the sealed Mercury Lighthouse.',
  EventType.discovery,
);
```

## Integration with Game Flow

### Progressive Party Formation

The journal system works seamlessly with the progressive party formation:

**Chapter 1 (Solo Start)**
```dart
// First event - solo
storyManager.addStoryEvent(
  'story_awakening',
  'The Awakening',
  'Kai begins his journey alone, witnessing injustice.',
  EventType.story,
);
```

**Tutorial Area (2-Character Party)**
```dart
// Ember joins
storyManager.addStoryEvent(
  'character_ember_joins',
  'A Kindred Spirit',
  'Ember joins as the first companion.',
  EventType.character,
);
```

**Second Town (3-Character Party)**
```dart
// Aria joins
storyManager.addStoryEvent(
  'character_aria_joins',
  'The Scholar\'s Wisdom',
  'Aria joins with knowledge of the ancient warnings.',
  EventType.character,
);
```

**Before 1st Lighthouse (Full Party)**
```dart
// Zephyr joins
storyManager.addStoryEvent(
  'character_zephyr_joins',
  'The Vision Bearer',
  'Zephyr completes the party at a critical moment.',
  EventType.character,
);
```

## Technical Details

### Data Model

```dart
class StoryEvent {
  final String id;           // Unique identifier
  final String title;        // Display title
  final String summary;      // Short description
  final DateTime timestamp;  // When it occurred
  final int chapter;         // Chapter number
  final EventType type;      // Event category
}
```

### Storage

- Events are stored in `StoryFlags` model
- Automatically saved with game state
- Persists across game sessions
- Full JSON serialization support

### UI Components

- **StoryJournalScreen**: Main journal display
- **Current Tip Section**: Highlighted current objective
- **Event List**: Scrollable chronological log
- **Event Cards**: Individual event display with icons

## Example Content

See `lib/data/example_content.dart` for example story events:

```dart
ExampleStoryEvents.getExampleEvents()
```

## Future Enhancements

Potential additions for future versions:

- [ ] Filter events by type
- [ ] Search events by keyword
- [ ] Bookmark important events
- [ ] Export journal as text
- [ ] Detailed event pages with more information
- [ ] Character-specific event filtering
- [ ] Chapter-based navigation
- [ ] Event replay (if cutscene data available)

## Related Systems

- **Quest Journal**: Tracks active and completed quests
- **Story Manager**: Central narrative state management
- **Save System**: Persists journal data
- **Party Manager**: Tracks character additions
