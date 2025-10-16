# Sol - Retro RPG Adventure

A 2D retro-style RPG game inspired by Golden Sun, built with Flutter and Flame engine.

## Features

### Core Gameplay
- **Overworld Exploration**: Navigate through procedurally generated maps with towns and wilderness areas
- **Monster Encounters**: Random battle system with turn-based combat
- **Battle System**: Attack, use skills, and strategic turn-based combat
- **Character Progression**: Level up system with stat improvements
- **Save System**: Multiple save slots with timestamp tracking
- **Inventory Management**: Collect items and gold throughout your adventure
- **Psynergy System**: Golden Sun-inspired magical abilities with PP resource

### Phase 2: Narrative Framework (NEW)
- **Story Management**: Track narrative state, flags, and story milestones
- **Story Journal**: Review past events and current objectives in chronological order
- **Quest System**: Main quests, side quests, and character quests with objectives
- **Dialogue Trees**: Branching conversations with player choices and consequences
- **Party System**: Manage up to 4 characters with progressive acquisition
- **Relationship System**: Track bonds between characters with 9 relationship levels
- **Cutscene System**: Scripted story sequences with dialogue, camera, and events

### Progressive Party Formation
- **Chapter 1**: Start with Kai (Venus Alchemist) solo
- **Tutorial**: Ember (Mars Alchemist) joins as 2nd member
- **Second Town**: Aria (Mercury Witch) joins as 3rd member
- **Before 1st Lighthouse**: Zephyr (Jupiter Sorcerer) joins as 4th member

### UI/UX
- **8-bit Retro Style**: Authentic GameBoy/GBA inspired color palette and pixel art aesthetic
- **Main Menu**: New Game, Continue, Settings, and About options
- **Settings**: Audio controls for music and sound effects with volume sliders
- **Game HUD**: Real-time display of HP, MP, and gold
- **Battle Interface**: Dynamic battle screen with player and enemy status

### Technical Features
- **Flutter & Flame**: Built on Flutter for cross-platform support with Flame game engine
- **State Management**: Provider pattern for game state, audio, and save management
- **Android Support**: Configured for Android with proper permissions
- **In-App Purchases**: Support for donations and story expansions
- **Audio System**: Music and sound effect management

## Architecture

### Project Structure
```
lib/
├── main.dart                 # Application entry point
├── models/                   # Data models
│   ├── player.dart          # Player character model with stats and progression
│   ├── party.dart           # Party of up to 4 characters (Phase 2)
│   ├── quest.dart           # Quest and objective models (Phase 2)
│   ├── dialogue_tree.dart   # Branching dialogue system (Phase 2)
│   ├── character_relationship.dart  # Character bonds (Phase 2)
│   ├── cutscene_script.dart # Cutscene events (Phase 2)
│   ├── story_flags.dart     # Narrative state (Phase 2)
│   └── monster.dart         # Monster/enemy models and database
├── screens/                  # UI screens
│   ├── main_menu_screen.dart    # Main menu with retro styling
│   ├── game_screen.dart         # Main game screen with Flame integration
│   ├── battle_screen.dart       # Turn-based battle system
│   ├── story_journal_screen.dart  # Story event log and current tip (Phase 2)
│   ├── quest_journal_screen.dart  # Quest tracking UI (Phase 2)
│   ├── party_status_screen.dart   # Party members and relationships (Phase 2)
│   ├── cutscene_player_screen.dart # Cutscene playback (Phase 2)
│   └── settings_screen.dart     # Audio and game settings
├── services/                 # Business logic services
│   ├── game_state_manager.dart  # Global game state management
│   ├── story_manager.dart       # Narrative and quest management (Phase 2)
│   ├── dialogue_manager.dart    # Dialogue tree traversal (Phase 2)
│   ├── party_manager.dart       # Party and relationships (Phase 2)
│   ├── cutscene_director.dart   # Cutscene orchestration (Phase 2)
│   ├── audio_manager.dart       # Audio playback control
│   ├── save_manager.dart        # Save/load game functionality
│   └── iap_manager.dart         # In-app purchase handling
├── widgets/                  # Reusable UI components
│   ├── retro_button.dart        # Styled button with retro aesthetic
│   ├── retro_dialog.dart        # Dialog with GB/GBA styling
│   └── game_hud.dart            # In-game heads-up display
└── data/                     # Game content data (Phase 2)
    └── example_content.dart     # Example quests and dialogues
└── game/                     # Flame game components
    ├── sol_game.dart            # Main game world
    ├── components/              # Game entities
    │   ├── player_component.dart    # Player sprite and movement
    │   └── tilemap_component.dart   # Procedural tilemap generation
    └── systems/                 # Game systems
        └── encounter_system.dart    # Random encounter logic
```

### Key Systems

#### Player System
- Stats: HP, MP, Attack, Defense, Speed
- Level progression with experience points
- Gold and inventory management
- Position tracking for overworld navigation

#### Monster System
- Predefined monster types (Slime, Goblin, Wolf)
- Level scaling based on player level
- Unique stats per monster type
- Experience and gold rewards

#### Save System
- 3 save slots with auto-save support
- JSON serialization for game data
- Timestamp tracking for each save
- Player state, position, and flags persistence

#### Battle System
- Turn-based combat
- Player actions: Attack, Skill, Run
- Enemy AI with damage calculation
- Victory/defeat handling with rewards

## Color Palette (GameBoy Inspired)

The game uses an authentic GameBoy/GBA color palette:
- Primary Dark: `#0f380f` - Deep forest green
- Primary: `#306230` - Medium forest green
- Secondary: `#8bac0f` - Light green
- Highlight: `#9bbc0f` - Bright lime green
- Accent Colors:
  - Red (HP): `#FF4444`
  - Blue (MP): `#4444FF`
  - Gold: `#FFD700`

## Android Configuration

### Permissions
- `INTERNET` - For in-app purchases and online features
- `VIBRATE` - For haptic feedback
- `BILLING` - For in-app purchase support

### Build Configuration
- Min SDK: 21 (Android 5.0)
- Target SDK: 34 (Android 14)
- Orientation: Portrait locked
- Hardware acceleration enabled

## Dependencies

### Core
- `flutter` - UI framework
- `flame: ^1.12.0` - Game engine
- `flame_audio: ^2.1.0` - Audio support

### State & Storage
- `provider: ^6.1.0` - State management
- `shared_preferences: ^2.2.2` - Local storage
- `path_provider: ^2.1.1` - File system paths

### Monetization
- `in_app_purchase: ^3.1.11` - IAP support

### UI Enhancement
- `google_fonts: ^6.1.0` - Typography
- `cupertino_icons: ^1.0.2` - Icons

### Utilities
- `json_annotation: ^4.8.1` - JSON serialization
- `uuid: ^4.2.1` - Unique identifiers

## Getting Started

### Prerequisites
- Flutter SDK (3.0.0 or higher)
- Android Studio / Xcode for mobile development
- Dart SDK

### Installation

1. Clone the repository:
```bash
git clone https://github.com/Gameaday/sol.git
cd sol
```

2. Install dependencies:
```bash
flutter pub get
```

3. Run the app:
```bash
flutter run
```

### Building for Android
```bash
flutter build apk --release
```

## Asset Organization

Assets are organized in the following structure:
- `assets/images/tiles/` - Tileset sprites (16x16px)
- `assets/images/characters/` - Character sprite sheets
- `assets/images/monsters/` - Monster sprites (32x32px)
- `assets/images/ui/` - UI elements and icons
- `assets/audio/music/` - Background music tracks
- `assets/audio/sfx/` - Sound effects
- `assets/maps/` - Map data files
- `assets/data/` - Game data (dialogue, items, etc.)

## Documentation

- **IMPLEMENTATION_PLAN.md** - 40-week development roadmap
- **PHASE1_SUMMARY.md** - Summary of completed Phase 1 features
- **PHASE2_GUIDE.md** - Comprehensive guide to Phase 2 narrative systems (NEW)
- **ARCHITECTURE.md** - System architecture and design patterns
- **STORY_AND_LORE.md** - Complete narrative and world building
- **GAME_DESIGN.md** - Game design principles and mechanics
- **lib/data/README.md** - Guide for creating game content (NEW)

## Future Enhancements

- [ ] Animated sprite support
- [ ] More monster types and boss battles
- [ ] Puzzle system implementation
- [ ] NPC dialogue system
- [ ] Equipment and item system
- [ ] Multiple towns and dungeons
- [ ] Story expansion DLC content
- [ ] Achievements system
- [ ] Cloud save support

## License

This project is created as a test bed for Flutter and Flame game development.

## Credits

Inspired by the classic Golden Sun series by Camelot Software Planning.
