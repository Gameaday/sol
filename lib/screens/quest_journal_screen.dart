import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/quest.dart';
import '../services/story_manager.dart';
import '../services/theme_manager.dart';

class QuestJournalScreen extends StatefulWidget {
  const QuestJournalScreen({super.key});

  @override
  State<QuestJournalScreen> createState() => _QuestJournalScreenState();
}

class _QuestJournalScreenState extends State<QuestJournalScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final themeManager = context.watch<ThemeManager>();
    final storyManager = context.watch<StoryManager>();
    final colors = themeManager.currentPalette;

    return Scaffold(
      backgroundColor: colors['background'],
      appBar: AppBar(
        backgroundColor: colors['primary'],
        title: Text(
          'Quest Journal',
          style: TextStyle(
            color: colors['text'],
            fontFamily: 'monospace',
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        iconTheme: IconThemeData(color: colors['text']),
        bottom: TabBar(
          controller: _tabController,
          labelColor: colors['text'],
          unselectedLabelColor: colors['secondary'],
          indicatorColor: colors['accent'],
          tabs: const [
            Tab(text: 'Active'),
            Tab(text: 'Completed'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          _buildQuestList(
            storyManager.getActiveQuests(),
            storyManager,
            colors,
            isActive: true,
          ),
          _buildQuestList(
            storyManager.getCompletedQuests(),
            storyManager,
            colors,
            isActive: false,
          ),
        ],
      ),
    );
  }

  Widget _buildQuestList(
    List<Quest> quests,
    StoryManager storyManager,
    Map<String, Color> colors, {
    required bool isActive,
  }) {
    if (quests.isEmpty) {
      return Center(
        child: Text(
          isActive ? 'No active quests' : 'No completed quests',
          style: TextStyle(
            color: colors['secondary'],
            fontFamily: 'monospace',
            fontSize: 14,
          ),
        ),
      );
    }

    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: quests.length,
      itemBuilder: (context, index) {
        final quest = quests[index];
        return _buildQuestCard(quest, storyManager, colors, isActive: isActive);
      },
    );
  }

  Widget _buildQuestCard(
    Quest quest,
    StoryManager storyManager,
    Map<String, Color> colors, {
    required bool isActive,
  }) {
    final progress = storyManager.getQuestProgress(quest.id);

    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: colors['primary'],
        border: Border.all(
          color: colors['accent']!,
          width: 2,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Quest header
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: colors['primaryDark'],
              border: Border(
                bottom: BorderSide(
                  color: colors['accent']!,
                  width: 2,
                ),
              ),
            ),
            child: Row(
              children: [
                _buildQuestTypeIcon(quest.type, colors),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        quest.name,
                        style: TextStyle(
                          color: colors['text'],
                          fontFamily: 'monospace',
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        _getQuestTypeLabel(quest.type),
                        style: TextStyle(
                          color: colors['secondary'],
                          fontFamily: 'monospace',
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),
                if (!isActive)
                  Icon(
                    Icons.check_circle,
                    color: colors['accent'],
                    size: 24,
                  ),
              ],
            ),
          ),

          // Quest description
          Padding(
            padding: const EdgeInsets.all(12),
            child: Text(
              quest.description,
              style: TextStyle(
                color: colors['text'],
                fontFamily: 'monospace',
                fontSize: 14,
                height: 1.4,
              ),
            ),
          ),

          // Objectives
          if (isActive && quest.objectives.isNotEmpty) ...[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Text(
                'Objectives:',
                style: TextStyle(
                  color: colors['accent'],
                  fontFamily: 'monospace',
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 8),
            ...quest.objectives.map((objective) {
              final isComplete = progress != null &&
                  objective.isComplete(progress);
              return _buildObjectiveItem(
                objective,
                isComplete,
                colors,
              );
            }),
            const SizedBox(height: 8),
          ],

          // Rewards
          if (quest.reward != null) ...[
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: colors['primaryDark'],
                border: Border(
                  top: BorderSide(
                    color: colors['accent']!,
                    width: 2,
                  ),
                ),
              ),
              child: _buildRewards(quest.reward!, colors),
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildQuestTypeIcon(QuestType type, Map<String, Color> colors) {
    IconData icon;
    switch (type) {
      case QuestType.main:
        icon = Icons.star;
        break;
      case QuestType.side:
        icon = Icons.help_outline;
        break;
      case QuestType.character:
        icon = Icons.person;
        break;
      case QuestType.lore:
        icon = Icons.book;
        break;
      case QuestType.collection:
        icon = Icons.collections;
        break;
    }

    return Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        color: colors['primary'],
        border: Border.all(color: colors['accent']!, width: 2),
      ),
      child: Icon(icon, color: colors['accent'], size: 24),
    );
  }

  String _getQuestTypeLabel(QuestType type) {
    switch (type) {
      case QuestType.main:
        return 'Main Quest';
      case QuestType.side:
        return 'Side Quest';
      case QuestType.character:
        return 'Character Quest';
      case QuestType.lore:
        return 'Lore Quest';
      case QuestType.collection:
        return 'Collection Quest';
    }
  }

  Widget _buildObjectiveItem(
    QuestObjective objective,
    bool isComplete,
    Map<String, Color> colors,
  ) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 16,
            height: 16,
            margin: const EdgeInsets.only(top: 2, right: 8),
            decoration: BoxDecoration(
              color: isComplete ? colors['accent'] : colors['primary'],
              border: Border.all(color: colors['accent']!, width: 2),
            ),
            child: isComplete
                ? Icon(
                    Icons.check,
                    size: 10,
                    color: colors['primaryDark'],
                  )
                : null,
          ),
          Expanded(
            child: Text(
              objective.description,
              style: TextStyle(
                color: isComplete ? colors['secondary'] : colors['text'],
                fontFamily: 'monospace',
                fontSize: 13,
                decoration: isComplete ? TextDecoration.lineThrough : null,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRewards(QuestReward reward, Map<String, Color> colors) {
    final rewardItems = <Widget>[];

    if (reward.experience != null) {
      rewardItems.add(_buildRewardItem(
        Icons.trending_up,
        '${reward.experience} EXP',
        colors,
      ));
    }

    if (reward.gold != null) {
      rewardItems.add(_buildRewardItem(
        Icons.monetization_on,
        '${reward.gold} Gold',
        colors,
      ));
    }

    if (reward.items != null && reward.items!.isNotEmpty) {
      rewardItems.add(_buildRewardItem(
        Icons.inventory,
        '${reward.items!.length} Item(s)',
        colors,
      ));
    }

    if (reward.psynergy != null) {
      rewardItems.add(_buildRewardItem(
        Icons.flash_on,
        'New Psynergy',
        colors,
      ));
    }

    return Wrap(
      spacing: 16,
      runSpacing: 8,
      children: [
        Text(
          'Rewards:',
          style: TextStyle(
            color: colors['accent'],
            fontFamily: 'monospace',
            fontSize: 13,
            fontWeight: FontWeight.bold,
          ),
        ),
        ...rewardItems,
      ],
    );
  }

  Widget _buildRewardItem(IconData icon, String text, Map<String, Color> colors) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, color: colors['accent'], size: 16),
        const SizedBox(width: 4),
        Text(
          text,
          style: TextStyle(
            color: colors['text'],
            fontFamily: 'monospace',
            fontSize: 13,
          ),
        ),
      ],
    );
  }
}
