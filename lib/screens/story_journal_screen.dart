import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/story_flags.dart';
import '../services/story_manager.dart';
import '../services/theme_manager.dart';

class StoryJournalScreen extends StatelessWidget {
  const StoryJournalScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final themeManager = context.watch<ThemeManager>();
    final storyManager = context.watch<StoryManager>();
    final colors = themeManager.currentPalette;
    final currentTip = storyManager.getCurrentTip();
    final events = storyManager.getStoryEventsChronological();

    return Scaffold(
      backgroundColor: colors['background'],
      appBar: AppBar(
        backgroundColor: colors['primary'],
        title: Text(
          'Story Journal',
          style: TextStyle(
            color: colors['text'],
            fontFamily: 'monospace',
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        iconTheme: IconThemeData(color: colors['text']),
      ),
      body: events.isEmpty
          ? _buildEmptyJournal(colors)
          : Column(
              children: [
                // Current Tip Section
                if (currentTip != null) _buildCurrentTip(currentTip, colors),
                
                // Divider
                Container(
                  height: 3,
                  color: colors['accent'],
                ),
                
                // Past Events Section
                Expanded(
                  child: _buildEventsList(events, colors),
                ),
              ],
            ),
    );
  }

  Widget _buildEmptyJournal(Map<String, Color> colors) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.book,
            size: 64,
            color: colors['secondary'],
          ),
          const SizedBox(height: 16),
          Text(
            'Your journey begins...',
            style: TextStyle(
              color: colors['secondary'],
              fontFamily: 'monospace',
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32),
            child: Text(
              'Important events will be recorded here so you can review your adventure.',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: colors['secondary'],
                fontFamily: 'monospace',
                fontSize: 12,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCurrentTip(StoryEvent tip, Map<String, Color> colors) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: colors['primaryDark'],
        border: Border(
          bottom: BorderSide(
            color: colors['accent']!,
            width: 2,
          ),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                Icons.star,
                color: colors['accent'],
                size: 20,
              ),
              const SizedBox(width: 8),
              Text(
                'CURRENT OBJECTIVE',
                style: TextStyle(
                  color: colors['accent'],
                  fontFamily: 'monospace',
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Text(
            tip.title,
            style: TextStyle(
              color: colors['text'],
              fontFamily: 'monospace',
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            tip.summary,
            style: TextStyle(
              color: colors['text'],
              fontFamily: 'monospace',
              fontSize: 14,
              height: 1.4,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Chapter ${tip.chapter}',
            style: TextStyle(
              color: colors['secondary'],
              fontFamily: 'monospace',
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildEventsList(List<StoryEvent> events, Map<String, Color> colors) {
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: events.length,
      itemBuilder: (context, index) {
        // Show events in reverse chronological order (most recent at top)
        final event = events[events.length - 1 - index];
        return _buildEventCard(event, colors);
      },
    );
  }

  Widget _buildEventCard(StoryEvent event, Map<String, Color> colors) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: colors['primary'],
        border: Border.all(
          color: colors['accent']!,
          width: 2,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Event type icon
            Container(
              width: 32,
              height: 32,
              margin: const EdgeInsets.only(right: 12),
              decoration: BoxDecoration(
                color: colors['primaryDark'],
                border: Border.all(color: colors['accent']!, width: 2),
              ),
              child: Icon(
                _getEventIcon(event.type),
                color: colors['accent'],
                size: 20,
              ),
            ),
            
            // Event content
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          event.title,
                          style: TextStyle(
                            color: colors['text'],
                            fontFamily: 'monospace',
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Text(
                        'Ch.${event.chapter}',
                        style: TextStyle(
                          color: colors['secondary'],
                          fontFamily: 'monospace',
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 6),
                  Text(
                    event.summary,
                    style: TextStyle(
                      color: colors['text'],
                      fontFamily: 'monospace',
                      fontSize: 12,
                      height: 1.3,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    _formatDate(event.timestamp),
                    style: TextStyle(
                      color: colors['secondary'],
                      fontFamily: 'monospace',
                      fontSize: 10,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  IconData _getEventIcon(EventType type) {
    switch (type) {
      case EventType.story:
        return Icons.auto_stories;
      case EventType.quest:
        return Icons.task_alt;
      case EventType.character:
        return Icons.person_add;
      case EventType.location:
        return Icons.place;
      case EventType.battle:
        return Icons.shield;
      case EventType.discovery:
        return Icons.lightbulb;
    }
  }

  String _formatDate(DateTime date) {
    final now = DateTime.now();
    final difference = now.difference(date);
    
    if (difference.inMinutes < 1) {
      return 'Just now';
    } else if (difference.inHours < 1) {
      return '${difference.inMinutes}m ago';
    } else if (difference.inDays < 1) {
      return '${difference.inHours}h ago';
    } else if (difference.inDays < 7) {
      return '${difference.inDays}d ago';
    } else {
      return '${date.day}/${date.month}/${date.year}';
    }
  }
}
