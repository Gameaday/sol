import 'package:flutter/material.dart';
import '../models/player.dart';

class GameHud extends StatelessWidget {
  final Player player;

  const GameHud({super.key, required this.player});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: const Color(0xFF0f380f).withOpacity(0.9),
        border: Border.all(
          color: const Color(0xFF9bbc0f),
          width: 2,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          // Player name and level
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                player.name,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF9bbc0f),
                  fontFamily: 'monospace',
                ),
              ),
              Text(
                'Lv.${player.level}',
                style: const TextStyle(
                  fontSize: 14,
                  color: Color(0xFF8bac0f),
                  fontFamily: 'monospace',
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          
          // HP bar
          _buildStatBar(
            label: 'HP',
            current: player.currentHp,
            max: player.maxHp,
            color: const Color(0xFFFF4444),
          ),
          const SizedBox(height: 4),
          
          // MP bar
          _buildStatBar(
            label: 'MP',
            current: player.currentMp,
            max: player.maxMp,
            color: const Color(0xFF4444FF),
          ),
          const SizedBox(height: 4),
          
          // PP bar (Psynergy Points)
          _buildStatBar(
            label: 'PP',
            current: player.currentPp,
            max: player.maxPp,
            color: const Color(0xFFBB44FF),
          ),
          const SizedBox(height: 8),
          
          // Gold
          Row(
            children: [
              const Icon(
                Icons.monetization_on,
                color: Color(0xFFFFD700),
                size: 16,
              ),
              const SizedBox(width: 4),
              Text(
                '${player.gold}',
                style: const TextStyle(
                  fontSize: 14,
                  color: Color(0xFFFFD700),
                  fontFamily: 'monospace',
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildStatBar({
    required String label,
    required int current,
    required int max,
    required Color color,
  }) {
    final percentage = (current / max).clamp(0.0, 1.0);
    
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              label,
              style: const TextStyle(
                fontSize: 12,
                color: Color(0xFF9bbc0f),
                fontFamily: 'monospace',
              ),
            ),
            Text(
              '$current/$max',
              style: const TextStyle(
                fontSize: 10,
                color: Color(0xFF8bac0f),
                fontFamily: 'monospace',
              ),
            ),
          ],
        ),
        const SizedBox(height: 2),
        Container(
          height: 12,
          decoration: BoxDecoration(
            color: const Color(0xFF306230),
            border: Border.all(
              color: const Color(0xFF8bac0f),
              width: 1,
            ),
          ),
          child: FractionallySizedBox(
            alignment: Alignment.centerLeft,
            widthFactor: percentage,
            child: Container(
              color: color,
            ),
          ),
        ),
      ],
    );
  }
}
