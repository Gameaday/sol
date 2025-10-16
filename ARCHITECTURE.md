# Sol - Architecture Diagram

```
┌─────────────────────────────────────────────────────────────────┐
│                        SOL - Retro RPG Game                      │
│                     Flutter + Flame Engine                       │
└─────────────────────────────────────────────────────────────────┘

┌─────────────────────────────────────────────────────────────────┐
│                          Main Entry                              │
│  ┌────────────────────────────────────────────────────────────┐ │
│  │ main.dart                                                   │ │
│  │ - MultiProvider Setup                                       │ │
│  │ - Theme Configuration (GB/GBA Colors)                       │ │
│  │ - MaterialApp                                               │ │
│  └────────────────────────────────────────────────────────────┘ │
└─────────────────────────────────────────────────────────────────┘
                               │
                               ▼
┌─────────────────────────────────────────────────────────────────┐
│                      State Management Layer                      │
│  ┌─────────────┐  ┌──────────────┐  ┌──────────────┐          │
│  │ GameState   │  │ AudioManager │  │ SaveManager  │          │
│  │ Manager     │  │              │  │              │          │
│  │             │  │ - Music      │  │ - 3 Slots    │          │
│  │ - Scenes    │  │ - SFX        │  │ - JSON       │          │
│  │ - Flags     │  │ - Volume     │  │ - Timestamp  │          │
│  │ - Battle    │  │              │  │              │          │
│  └─────────────┘  └──────────────┘  └──────────────┘          │
└─────────────────────────────────────────────────────────────────┘
                               │
                               ▼
┌─────────────────────────────────────────────────────────────────┐
│                         Screen Layer                             │
│  ┌──────────────────────────────────────────────────────────┐  │
│  │ MainMenuScreen                                            │  │
│  │ ├─ New Game                                               │  │
│  │ ├─ Continue (Load)                                        │  │
│  │ ├─ Settings                                               │  │
│  │ └─ About                                                  │  │
│  └──────────────────────────────────────────────────────────┘  │
│                               │                                  │
│          ┌────────────────────┼────────────────────┐            │
│          ▼                    ▼                    ▼            │
│  ┌───────────────┐  ┌──────────────┐  ┌──────────────┐        │
│  │ GameScreen    │  │ BattleScreen │  │ Inventory    │        │
│  │               │  │              │  │ Screen       │        │
│  │ - Flame World │  │ - Turn-based │  │              │        │
│  │ - HUD         │  │ - Attack     │  │ - Items      │        │
│  │ - Controls    │  │ - Skills     │  │ - Use/View   │        │
│  │ - Pause Menu  │  │ - Run        │  │              │        │
│  └───────────────┘  └──────────────┘  └──────────────┘        │
│          │                    │                    │            │
│          ▼                    ▼                    ▼            │
│  ┌───────────────┐  ┌──────────────┐  ┌──────────────┐        │
│  │ ShopScreen    │  │ Dialogue     │  │ Settings     │        │
│  │               │  │ Screen       │  │ Screen       │        │
│  │ - Buy Items   │  │              │  │              │        │
│  │ - Gold Check  │  │ - Animated   │  │ - Audio      │        │
│  │ - 4 Shop Types│  │ - Choices    │  │ - Sliders    │        │
│  └───────────────┘  └──────────────┘  └──────────────┘        │
└─────────────────────────────────────────────────────────────────┘
                               │
                               ▼
┌─────────────────────────────────────────────────────────────────┐
│                         Model Layer                              │
│  ┌──────────────────────────────────────────────────────────┐  │
│  │ Player                                                    │  │
│  │ - Stats (HP, MP, ATK, DEF, SPD)                          │  │
│  │ - Level & Experience                                     │  │
│  │ - Inventory (List<String>)                               │  │
│  │ - Gold                                                    │  │
│  │ - Position (x, y, mapId)                                 │  │
│  │ - JSON Serialization                                     │  │
│  └──────────────────────────────────────────────────────────┘  │
│  ┌──────────────────────────────────────────────────────────┐  │
│  │ Monster                                                   │  │
│  │ - Types: Slime, Goblin, Wolf                             │  │
│  │ - Level Scaling                                           │  │
│  │ - Rewards (EXP, Gold)                                     │  │
│  │ - Combat Methods                                          │  │
│  └──────────────────────────────────────────────────────────┘  │
│  ┌──────────────────────────────────────────────────────────┐  │
│  │ Item                                                      │  │
│  │ - 13+ Items in Database                                  │  │
│  │ - Types: Consumable, Weapon, Armor, Key Item             │  │
│  │ - Stats & Effects                                         │  │
│  └──────────────────────────────────────────────────────────┘  │
│  ┌──────────────────────────────────────────────────────────┐  │
│  │ NPC                                                       │  │
│  │ - Dialogue Nodes                                          │  │
│  │ - Conditional Dialogue                                    │  │
│  │ - Shop/Quest Links                                        │  │
│  └──────────────────────────────────────────────────────────┘  │
│  ┌──────────────────────────────────────────────────────────┐  │
│  │ Puzzle                                                    │  │
│  │ - 5 Types: Block, Sequence, Path, Riddle, Timing         │  │
│  │ - Rewards System                                          │  │
│  └──────────────────────────────────────────────────────────┘  │
└─────────────────────────────────────────────────────────────────┘
                               │
                               ▼
┌─────────────────────────────────────────────────────────────────┐
│                      Flame Game Engine Layer                     │
│  ┌──────────────────────────────────────────────────────────┐  │
│  │ SolGameWorld (FlameGame)                                  │  │
│  │ ├─ Camera (follows player)                                │  │
│  │ ├─ Collision Detection                                    │  │
│  │ └─ Keyboard Input Handler                                 │  │
│  └──────────────────────────────────────────────────────────┘  │
│  ┌──────────────────────────────────────────────────────────┐  │
│  │ Components                                                 │  │
│  │ ├─ PlayerComponent (Movement, Rendering)                  │  │
│  │ └─ TilemapComponent (Procedural Generation)               │  │
│  └──────────────────────────────────────────────────────────┘  │
│  ┌──────────────────────────────────────────────────────────┐  │
│  │ Systems                                                    │  │
│  │ └─ EncounterSystem (Random Battles)                       │  │
│  └──────────────────────────────────────────────────────────┘  │
└─────────────────────────────────────────────────────────────────┘
                               │
                               ▼
┌─────────────────────────────────────────────────────────────────┐
│                        Widget Layer                              │
│  ┌──────────────────────────────────────────────────────────┐  │
│  │ RetroButton - Styled button with press animation          │  │
│  │ RetroDialog - Modal with GB border styling                │  │
│  │ GameHud     - Real-time stats display                     │  │
│  └──────────────────────────────────────────────────────────┘  │
└─────────────────────────────────────────────────────────────────┘

┌─────────────────────────────────────────────────────────────────┐
│                      Platform Layer                              │
│  ┌──────────────────────────────────────────────────────────┐  │
│  │ Android                                                    │  │
│  │ ├─ Manifest (Permissions: INTERNET, VIBRATE, BILLING)     │  │
│  │ ├─ Build Config (Min SDK 21, Target SDK 34)               │  │
│  │ ├─ MainActivity.kt                                         │  │
│  │ └─ Portrait Orientation Lock                               │  │
│  └──────────────────────────────────────────────────────────┘  │
└─────────────────────────────────────────────────────────────────┘

┌─────────────────────────────────────────────────────────────────┐
│                      Data Flow                                   │
│                                                                  │
│  User Input → GameStateManager → Update Models → Re-render UI   │
│                                                                  │
│  Battle Action → Monster Damage → Player EXP → Level Up         │
│                                                                  │
│  Use Item → Update Player HP/MP → Remove from Inventory         │
│                                                                  │
│  Save Game → Player.toJson() → SaveManager → SharedPreferences  │
│                                                                  │
│  Load Game → SharedPreferences → SaveManager → Player.fromJson  │
└─────────────────────────────────────────────────────────────────┘

┌─────────────────────────────────────────────────────────────────┐
│                    Color Palette (GameBoy)                       │
│  ┌──────────────────────────────────────────────────────────┐  │
│  │ #0f380f  ███  Darkest Green (Backgrounds)                 │  │
│  │ #306230  ███  Dark Green (Shadows, Borders)               │  │
│  │ #8bac0f  ███  Light Green (Secondary Text)                │  │
│  │ #9bbc0f  ███  Brightest Green (Primary, Highlights)       │  │
│  │ #FF4444  ███  Red (HP Bars)                               │  │
│  │ #4444FF  ███  Blue (MP Bars)                              │  │
│  │ #FFD700  ███  Gold (Currency)                             │  │
│  └──────────────────────────────────────────────────────────┘  │
└─────────────────────────────────────────────────────────────────┘
```

## Key Design Patterns

1. **Provider Pattern**: Global state management for game state, audio, and saves
2. **Factory Pattern**: Monster and NPC creation through database classes
3. **Strategy Pattern**: Different puzzle types with common interface
4. **Observer Pattern**: ChangeNotifier for reactive UI updates
5. **Serialization Pattern**: JSON encoding/decoding for save/load

## Data Persistence

```
SharedPreferences (Local Storage)
    ↓
SaveManager
    ↓
JSON Serialization
    ↓
Player Model + Game Flags
```

## Asset Loading

```
assets/
├── images/      → Future sprite sheets
├── audio/       → Future music & SFX
├── maps/        → Future map data files
└── data/        → Future dialogue/items data
```

## Testing Strategy

```
Unit Tests → Models (Player, Monster, Item)
    ↓
Widget Tests → UI Components (Planned)
    ↓
Integration Tests → Full gameplay flow (Planned)
```
