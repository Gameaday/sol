/// Represents a puzzle in the game world
class Puzzle {
  final String id;
  final String description;
  final PuzzleType type;
  final Map<String, dynamic> data;
  bool solved;
  final String? rewardItem;
  final int? rewardGold;
  
  Puzzle({
    required this.id,
    required this.description,
    required this.type,
    required this.data,
    this.solved = false,
    this.rewardItem,
    this.rewardGold,
  });
  
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'description': description,
      'type': type.toString(),
      'data': data,
      'solved': solved,
      'rewardItem': rewardItem,
      'rewardGold': rewardGold,
    };
  }
  
  factory Puzzle.fromJson(Map<String, dynamic> json) {
    return Puzzle(
      id: json['id'] as String,
      description: json['description'] as String,
      type: PuzzleType.values.firstWhere(
        (e) => e.toString() == json['type'],
        orElse: () => PuzzleType.pushBlock,
      ),
      data: json['data'] as Map<String, dynamic>,
      solved: json['solved'] as bool? ?? false,
      rewardItem: json['rewardItem'] as String?,
      rewardGold: json['rewardGold'] as int?,
    );
  }
}

enum PuzzleType {
  pushBlock,    // Push blocks to specific positions
  sequence,     // Press switches in correct order
  pathfinding,  // Navigate a maze or find correct path
  riddle,       // Answer a riddle or question
  timing,       // Time-based puzzle (moving platforms, etc.)
}

/// Database of puzzles
class PuzzleDatabase {
  static Puzzle createBlockPuzzle(String id) {
    return Puzzle(
      id: id,
      description: 'Push the blocks onto the marked tiles',
      type: PuzzleType.pushBlock,
      data: {
        'blocks': [
          {'x': 5, 'y': 5},
          {'x': 7, 'y': 5},
        ],
        'targets': [
          {'x': 5, 'y': 8},
          {'x': 7, 'y': 8},
        ],
      },
      rewardItem: 'key_silver',
      rewardGold: 50,
    );
  }
  
  static Puzzle createSequencePuzzle(String id) {
    return Puzzle(
      id: id,
      description: 'Activate the switches in the correct order',
      type: PuzzleType.sequence,
      data: {
        'sequence': ['red', 'blue', 'green', 'yellow'],
        'switches': [
          {'id': 'red', 'x': 10, 'y': 10},
          {'id': 'blue', 'x': 12, 'y': 10},
          {'id': 'green', 'x': 10, 'y': 12},
          {'id': 'yellow', 'x': 12, 'y': 12},
        ],
      },
      rewardItem: 'key_gold',
      rewardGold: 100,
    );
  }
  
  static Puzzle createRiddlePuzzle(String id, String riddle, String answer) {
    return Puzzle(
      id: id,
      description: riddle,
      type: PuzzleType.riddle,
      data: {
        'riddle': riddle,
        'answer': answer.toLowerCase(),
      },
      rewardItem: 'ancient_coin',
      rewardGold: 75,
    );
  }
}
