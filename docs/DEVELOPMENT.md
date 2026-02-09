# Development Guide for Sol

## Project Overview

Sol is a 2D retro-style RPG built with Flutter and Flame, inspired by Golden Sun. This guide will help you understand the project structure and how to develop and extend the game.

## Prerequisites

- Flutter SDK 3.0.0 or higher
- Dart SDK 3.0.0 or higher
- Android Studio or Xcode (for mobile development)
- Git

## Setup

1. **Clone the repository:**
   ```bash
   git clone https://github.com/Gameaday/sol.git
   cd sol
   ```

2. **Install dependencies:**
   ```bash
   flutter pub get
   ```

3. **Run the app:**
   ```bash
   flutter run
   ```

## Project Structure

### Core Directories

- `lib/` - Main application code
  - `main.dart` - Application entry point
  - `models/` - Data models and game entities
  - `screens/` - UI screens and views
  - `services/` - Business logic and managers
  - `widgets/` - Reusable UI components
  - `game/` - Flame game engine components

### Models

- **Player** (`models/player.dart`): Character stats, inventory, progression
- **Monster** (`models/monster.dart`): Enemy types and database
- **Item** (`models/item.dart`): Items, equipment, consumables
- **NPC** (`models/npc.dart`): Non-player characters and dialogue
- **Puzzle** (`models/puzzle.dart`): Overworld puzzles and logic

### Services

- **GameStateManager** (`services/game_state_manager.dart`): Global game state
- **AudioManager** (`services/audio_manager.dart`): Music and sound effects
- **SaveManager** (`services/save_manager.dart`): Save/load functionality
- **IAPManager** (`services/iap_manager.dart`): In-app purchases

### Screens

- **MainMenuScreen**: Entry point with New Game, Continue, Settings
- **GameScreen**: Main gameplay with Flame integration
- **BattleScreen**: Turn-based combat system
- **InventoryScreen**: Item management
- **ShopScreen**: Buy items from merchants
- **DialogueScreen**: NPC conversations
- **SettingsScreen**: Audio and game options
- **MiniGames**: Various mini-games (Memory Match, etc.)

## Game Architecture

### State Management

The game uses Provider for state management with three main managers:

```dart
MultiProvider(
  providers: [
    ChangeNotifierProvider(create: (_) => GameStateManager()),
    ChangeNotifierProvider(create: (_) => AudioManager()),
    ChangeNotifierProvider(create: (_) => SaveManager()),
  ],
  child: MaterialApp(...),
)
```

### Flame Game Integration

The game world is built with Flame:

- **SolGameWorld**: Main game instance
- **PlayerComponent**: Player sprite and movement
- **TilemapComponent**: Procedural world generation
- **EncounterSystem**: Random battle triggers

## Adding New Features

### Adding a New Item

1. Add item definition to `models/item.dart`:
```dart
'new_item': Item(
  id: 'new_item',
  name: 'New Item',
  description: 'Description here',
  type: ItemType.consumable,
  healHp: 30,
  value: 20,
  consumable: true,
),
```

2. The item will automatically appear in shops and inventory.

### Adding a New Monster

1. Add monster factory to `models/monster.dart`:
```dart
static Monster createNewMonster(int level) {
  return Monster(
    id: 'new_monster',
    name: 'New Monster',
    level: level,
    maxHp: 20 + (level * 5),
    attack: 4 + (level * 2),
    defense: 3 + level,
    speed: 3 + level,
    experienceReward: 12 + (level * 3),
    goldReward: 6 + (level * 2),
    spriteId: 'new_monster',
  );
}
```

2. Add to random encounter pool in `getRandomMonster()`.

### Adding a New NPC

1. Create NPC in `models/npc.dart`:
```dart
static NPC createNewNPC() {
  return NPC(
    id: 'new_npc',
    name: 'NPC Name',
    spriteId: 'npc_sprite',
    x: 300,
    y: 200,
    mapId: 'town_map',
    dialogue: [
      DialogueNode(
        text: 'Hello, traveler!',
        speaker: 'NPC Name',
      ),
    ],
  );
}
```

2. Place NPC in game world by adding to map data.

### Adding a New Puzzle

1. Create puzzle in `models/puzzle.dart`:
```dart
static Puzzle createNewPuzzle(String id) {
  return Puzzle(
    id: id,
    description: 'Solve this puzzle',
    type: PuzzleType.custom,
    data: {
      // Puzzle-specific data
    },
    rewardItem: 'reward_item',
    rewardGold: 100,
  );
}
```

## Testing

### Running Tests

```bash
flutter test
```

### Manual Testing Checklist

- [ ] Start new game
- [ ] Navigate overworld with arrow keys/WASD
- [ ] Open inventory (backpack icon)
- [ ] Use consumable items
- [ ] Trigger random battle
- [ ] Win/lose battle
- [ ] Level up character
- [ ] Save game to slot
- [ ] Load game from slot
- [ ] Access settings menu
- [ ] Adjust audio settings
- [ ] View about screen

## Building for Release

### Android APK

```bash
flutter build apk --release
```

Output: `build/app/outputs/flutter-apk/app-release.apk`

### Android App Bundle

```bash
flutter build appbundle --release
```

Output: `build/app/outputs/bundle/release/app-release.aab`

## Asset Guidelines

### Images

All game sprites should follow these guidelines:

- **Format**: PNG with transparency
- **Color Palette**: GameBoy/GBA inspired (4-color palette)
- **Tile Size**: 16x16 pixels
- **Character Sprites**: 16x16 pixels per frame
- **Monster Sprites**: 32x32 pixels
- **UI Elements**: Scalable, maintain pixel-perfect rendering

### Audio

- **Music**: OGG or MP3 format
- **SFX**: Short WAV or OGG files
- **Bit Rate**: 128-192 kbps for music

## Color Palette

The game uses an authentic GameBoy color scheme:

```dart
#0f380f  // Darkest green (backgrounds)
#306230  // Dark green (shadows, borders)
#8bac0f  // Light green (secondary text)
#9bbc0f  // Brightest green (primary text, highlights)
```

Additional colors for UI:
- Red (HP): `#FF4444`
- Blue (MP): `#4444FF`
- Gold: `#FFD700`

## Performance Optimization

### Tips for Smooth Performance

1. **Minimize setState() calls**: Use Provider for global state
2. **Dispose controllers**: Always dispose AnimationControllers
3. **Cache assets**: Use AssetBundle for frequently used assets
4. **Optimize images**: Use appropriate image sizes
5. **Lazy loading**: Load resources when needed

## Common Issues

### Flutter not found

Make sure Flutter is in your PATH:
```bash
export PATH="$PATH:`pwd`/flutter/bin"
```

### Build fails on Android

Clean and rebuild:
```bash
flutter clean
flutter pub get
flutter build apk
```

### Hot reload not working

Restart the app:
```bash
flutter run
# Press 'R' to hot restart
```

## Contributing

When contributing to this project:

1. Follow the existing code style
2. Use meaningful variable names
3. Comment complex logic
4. Test your changes thoroughly
5. Update documentation as needed

## Resources

- [Flutter Documentation](https://flutter.dev/docs)
- [Flame Engine](https://flame-engine.org/)
- [Provider State Management](https://pub.dev/packages/provider)
- [GameBoy Color Palette](https://lospec.com/palette-list/nintendo-gameboy-bgb)

## License

This project is for educational purposes and game development testing.
