import 'package:flutter/material.dart';
import 'dart:math';

class MemoryMatchMiniGame extends StatefulWidget {
  final Function(bool won, int reward) onGameEnd;

  const MemoryMatchMiniGame({
    super.key,
    required this.onGameEnd,
  });

  @override
  State<MemoryMatchMiniGame> createState() => _MemoryMatchMiniGameState();
}

class _MemoryMatchMiniGameState extends State<MemoryMatchMiniGame> {
  late List<String> cards;
  late List<bool> revealed;
  int? firstCardIndex;
  int matchesFound = 0;
  int moves = 0;
  bool isChecking = false;

  @override
  void initState() {
    super.initState();
    _initializeGame();
  }

  void _initializeGame() {
    // Create pairs of cards
    final symbols = ['A', 'B', 'C', 'D', 'E', 'F'];
    cards = [...symbols, ...symbols];
    cards.shuffle(Random());
    revealed = List.filled(cards.length, false);
    matchesFound = 0;
    moves = 0;
    firstCardIndex = null;
  }

  void _onCardTap(int index) {
    if (isChecking || revealed[index]) return;

    setState(() {
      revealed[index] = true;

      if (firstCardIndex == null) {
        firstCardIndex = index;
      } else {
        moves++;
        isChecking = true;

        if (cards[firstCardIndex!] == cards[index]) {
          // Match found
          matchesFound++;
          firstCardIndex = null;
          isChecking = false;

          if (matchesFound == cards.length ~/ 2) {
            _gameWon();
          }
        } else {
          // No match
          Future.delayed(const Duration(milliseconds: 800), () {
            if (mounted) {
              setState(() {
                revealed[firstCardIndex!] = false;
                revealed[index] = false;
                firstCardIndex = null;
                isChecking = false;
              });
            }
          });
        }
      }
    });
  }

  void _gameWon() {
    final reward = (100 - (moves * 5)).clamp(20, 100);
    Future.delayed(const Duration(milliseconds: 500), () {
      widget.onGameEnd(true, reward);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFF0f380f),
              Color(0xFF306230),
            ],
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              // Header
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    const Text(
                      'Memory Match',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF9bbc0f),
                        fontFamily: 'monospace',
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Moves: $moves',
                      style: const TextStyle(
                        fontSize: 16,
                        color: Color(0xFF8bac0f),
                        fontFamily: 'monospace',
                      ),
                    ),
                  ],
                ),
              ),

              // Game grid
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: GridView.builder(
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4,
                      crossAxisSpacing: 8,
                      mainAxisSpacing: 8,
                    ),
                    itemCount: cards.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () => _onCardTap(index),
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 300),
                          decoration: BoxDecoration(
                            color: revealed[index]
                                ? const Color(0xFF306230)
                                : const Color(0xFF0f380f),
                            border: Border.all(
                              color: const Color(0xFF9bbc0f),
                              width: 2,
                            ),
                          ),
                          child: Center(
                            child: revealed[index]
                                ? Text(
                                    cards[index],
                                    style: const TextStyle(
                                      fontSize: 32,
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xFF9bbc0f),
                                      fontFamily: 'monospace',
                                    ),
                                  )
                                : const Icon(
                                    Icons.question_mark,
                                    color: Color(0xFF8bac0f),
                                    size: 32,
                                  ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),

              // Instructions
              Container(
                margin: const EdgeInsets.all(16),
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: const Color(0xFF0f380f),
                  border: Border.all(
                    color: const Color(0xFF9bbc0f),
                    width: 2,
                  ),
                ),
                child: const Text(
                  'Match all pairs to win!\nFewer moves = more gold',
                  style: TextStyle(
                    fontSize: 12,
                    color: Color(0xFF9bbc0f),
                    fontFamily: 'monospace',
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
