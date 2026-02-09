# Sol - Retro RPG Adventure

[![Flutter CI](https://github.com/Gameaday/sol/actions/workflows/flutter-ci.yml/badge.svg)](https://github.com/Gameaday/sol/actions/workflows/flutter-ci.yml)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![Flutter Version](https://img.shields.io/badge/Flutter-3.16.0-blue.svg)](https://flutter.dev/)
[![PRs Welcome](https://img.shields.io/badge/PRs-welcome-brightgreen.svg)](CONTRIBUTING.md)

A 2D retro-style RPG game inspired by Golden Sun, built with Flutter and Flame engine.

> **Note**: Sol is in active development. See [CHANGELOG.md](CHANGELOG.md) for version history and [docs/implementation/IMPLEMENTATION_STATUS.md](docs/implementation/IMPLEMENTATION_STATUS.md) for current progress.

## 📋 Table of Contents

- [Features](#features)
- [Getting Started](#getting-started)
- [Documentation](#documentation)
- [Development](#development)
- [Contributing](#contributing)
- [License](#license)
- [Credits](#credits)

## Features

### Core Gameplay
- **Overworld Exploration**: Navigate through procedurally generated maps with towns and wilderness areas
- **Monster Encounters**: Random battle system with turn-based combat
- **Battle System**: Attack, use skills, and strategic turn-based combat
- **Character Progression**: Level up system with stat improvements
- **Save System**: Multiple save slots with timestamp tracking
- **Inventory Management**: Collect items and gold throughout your adventure
- **Psynergy System**: Golden Sun-inspired magical abilities with PP resource

### Phase 2: Narrative Framework ✓ COMPLETE
- **Story Management**: Track narrative state, flags, and story milestones
- **Story Journal**: Review past events and current objectives in chronological order
- **Quest System**: Main quests, side quests, and character quests with objectives
- **Dialogue Trees**: Branching conversations with player choices and consequences
- **Party System**: Manage up to 4 characters with progressive acquisition
- **Relationship System**: Track bonds between characters with 9 relationship levels
- **Cutscene System**: Scripted story sequences with dialogue, camera, and events

### Phase 3: Party System ✓ COMPLETE
- **Four Main Characters**: Kai (Venus), Ember (Mars), Aria (Mercury), Zephyr (Jupiter)
- **Character-Specific Psynergy**: Each character has unique elemental abilities
- **Progressive Acquisition**: Characters join at specific story points
- **Growth Rates**: Balanced stat progression per character
- **Personality Traits**: Used for dialogue system and character interactions
- **Character Relationships**: Initial relationship values with other party members

### Phase 4: Story Content (IN PROGRESS)
- **Chapter 1 "The Awakening"**: Solo start with Kai witnessing injustice
- **Tutorial "First Steps"**: Ember joins and teaches party mechanics
- **Starting Village NPCs**: 8 unique NPCs with quests and dialogue
- **Story Cutscenes**: Opening narration, injustice scene, character introductions
- **Quest System**: Main and side quests for Chapter 1 and Tutorial

### Progressive Party Formation
- **Chapter 1**: Start with Kai (Venus Alchemist) solo - learn core mechanics
- **Tutorial**: Ember (Mars Alchemist) joins as 2nd member - party mechanics introduction
- **Second Town**: Aria (Mercury Witch) joins as 3rd member - healing and support
- **Before 1st Lighthouse**: Zephyr (Jupiter Sorcerer) joins as 4th member - full party unlocked

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
└── data/                     # Game content data (Phases 2-4)
    ├── characters/              # Character definitions (Phase 3)
    │   ├── kai_venus.dart           # Kai - Venus Alchemist
    │   ├── ember_mars.dart          # Ember - Mars Alchemist
    │   ├── aria_mercury.dart        # Aria - Mercury Witch
    │   ├── zephyr_jupiter.dart      # Zephyr - Jupiter Sorcerer
    │   ├── character_registry.dart  # Character factory and management
    │   └── README.md                # Character system documentation
    ├── story/                   # Story content (Phase 4)
    │   ├── chapters/
    │   │   ├── chapter1_the_awakening.dart  # Chapter 1 content
    │   │   └── tutorial_first_steps.dart    # Tutorial content
    │   └── README.md                # Story content guide
    ├── npcs/                    # NPC definitions (Phase 4)
    │   └── starting_village_npcs.dart   # Starting village NPCs
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

## 📚 Documentation

For detailed documentation, see the [docs/](docs/) directory:

### Quick Links
- **[Project Summary](docs/PROJECT_SUMMARY.md)** - High-level overview
- **[Quickstart Guide](docs/QUICKSTART.md)** - Get started quickly
- **[Development Guide](docs/DEVELOPMENT.md)** - Setup and workflow
- **[Contributing Guide](CONTRIBUTING.md)** - How to contribute

### Design & Architecture
- **[Architecture](docs/design/ARCHITECTURE.md)** - System design
- **[Game Design](docs/design/GAME_DESIGN.md)** - Design principles
- **[Golden Sun Systems](docs/design/GOLDEN_SUN_SYSTEMS.md)** - Inspired mechanics

### Story & Content
- **[Story and Lore](docs/story/STORY_AND_LORE.md)** - Complete narrative
- **[Character Database](docs/story/CHARACTER_DATABASE.md)** - All characters
- **[Journal System](docs/story/JOURNAL_SYSTEM.md)** - Narrative tracking

### Implementation
- **[Implementation Plan](docs/implementation/IMPLEMENTATION_PLAN.md)** - Development roadmap
- **[Implementation Status](docs/implementation/IMPLEMENTATION_STATUS.md)** - Current progress
- **[Phase Guides](docs/implementation/)** - Phase-specific documentation

See [docs/README.md](docs/README.md) for the complete documentation index.

## 🚀 Development

### Development Status
- ✅ Phase 1: Technical Foundation (Complete)
- ✅ Phase 2: Narrative Framework (Complete)
- ✅ Phase 3: Party System (Complete)
- ✅ Phase 4: Story Content (Complete)
- 🔄 Phase 5: World Building (In Progress)

See [CHANGELOG.md](CHANGELOG.md) for detailed version history.

### Future Enhancements
- [ ] Animated sprite support
- [ ] More monster types and boss battles
- [ ] Puzzle system implementation
- [ ] Equipment and item system
- [ ] Multiple towns and dungeons
- [ ] Story expansion DLC content
- [ ] Achievements system
- [ ] Cloud save support

## 🤝 Contributing

We welcome contributions from the community! Here's how you can help:

1. **Read the [Contributing Guide](CONTRIBUTING.md)** - Learn about our development process
2. **Check [Issues](https://github.com/Gameaday/sol/issues)** - Find something to work on
3. **Review the [Code of Conduct](CODE_OF_CONDUCT.md)** - Understand our community standards
4. **Join the Discussion** - Share ideas and ask questions

### Ways to Contribute
- 💻 **Code**: Fix bugs, add features, improve performance
- 📝 **Documentation**: Improve guides, add examples, fix typos
- 🎨 **Design**: Create sprites, UI elements, game assets
- 🎵 **Audio**: Compose music, create sound effects
- ✍️ **Content**: Write dialogue, quests, character backstories
- 🐛 **Testing**: Report bugs, test features, provide feedback

See [CONTRIBUTING.md](CONTRIBUTING.md) for detailed guidelines.

## 🔒 Security

Found a security vulnerability? Please see our [Security Policy](SECURITY.md) for responsible disclosure guidelines.

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 🙏 Credits

Sol is inspired by the classic **Golden Sun** series by Camelot Software Planning.

### Acknowledgments
- **Flutter Team** - For the amazing cross-platform framework
- **Flame Engine** - For the powerful 2D game engine
- **Golden Sun Community** - For inspiration and passion for the series
- **Contributors** - Everyone who has contributed to this project

## 📞 Contact & Links

- **Repository**: [github.com/Gameaday/sol](https://github.com/Gameaday/sol)
- **Issues**: [Report bugs or request features](https://github.com/Gameaday/sol/issues)
- **Discussions**: [Join the conversation](https://github.com/Gameaday/sol/discussions)
- **Documentation**: [docs/](docs/)

---

**Current Version**: 0.3.0 (Phase 4 Complete)  
**Status**: Active Development  
**Last Updated**: February 2026

Made with ❤️ by the Sol development team
