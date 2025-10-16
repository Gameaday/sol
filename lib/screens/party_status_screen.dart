import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/player.dart';
import '../models/character_relationship.dart';
import '../services/party_manager.dart';
import '../services/theme_manager.dart';

class PartyStatusScreen extends StatefulWidget {
  const PartyStatusScreen({super.key});

  @override
  State<PartyStatusScreen> createState() => _PartyStatusScreenState();
}

class _PartyStatusScreenState extends State<PartyStatusScreen>
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
    final partyManager = context.watch<PartyManager>();
    final colors = themeManager.currentPalette;

    return Scaffold(
      backgroundColor: colors['background'],
      appBar: AppBar(
        backgroundColor: colors['primary'],
        title: Text(
          'Party Status',
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
            Tab(text: 'Members'),
            Tab(text: 'Relationships'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          _buildMembersTab(partyManager, colors),
          _buildRelationshipsTab(partyManager, colors),
        ],
      ),
    );
  }

  Widget _buildMembersTab(PartyManager partyManager, Map<String, Color> colors) {
    final members = partyManager.members;

    if (members.isEmpty) {
      return Center(
        child: Text(
          'No party members',
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
      itemCount: members.length,
      itemBuilder: (context, index) {
        final member = members[index];
        final isLeader = partyManager.leader?.name == member.name;
        return _buildMemberCard(member, isLeader, colors);
      },
    );
  }

  Widget _buildMemberCard(Player member, bool isLeader, Map<String, Color> colors) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: colors['primary'],
        border: Border.all(
          color: isLeader ? colors['accent']! : colors['secondary']!,
          width: isLeader ? 3 : 2,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Member header
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: colors['primaryDark'],
              border: Border(
                bottom: BorderSide(
                  color: isLeader ? colors['accent']! : colors['secondary']!,
                  width: 2,
                ),
              ),
            ),
            child: Row(
              children: [
                Container(
                  width: 48,
                  height: 48,
                  decoration: BoxDecoration(
                    color: colors['primary'],
                    border: Border.all(
                      color: isLeader ? colors['accent']! : colors['secondary']!,
                      width: 2,
                    ),
                  ),
                  child: Center(
                    child: Text(
                      member.name[0].toUpperCase(),
                      style: TextStyle(
                        color: colors['text'],
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            member.name,
                            style: TextStyle(
                              color: colors['text'],
                              fontFamily: 'monospace',
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          if (isLeader) ...[
                            const SizedBox(width: 8),
                            Icon(
                              Icons.star,
                              color: colors['accent'],
                              size: 16,
                            ),
                          ],
                        ],
                      ),
                      const SizedBox(height: 4),
                      Text(
                        'Level ${member.level}',
                        style: TextStyle(
                          color: colors['secondary'],
                          fontFamily: 'monospace',
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          // Stats
          Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildStatBar('HP', member.currentHp, member.maxHp, colors['hpColor']!, colors),
                const SizedBox(height: 8),
                _buildStatBar('PP', member.currentPp, member.maxPp, colors['ppColor']!, colors),
                const SizedBox(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _buildStatValue('ATK', member.attack, colors),
                    _buildStatValue('DEF', member.defense, colors),
                    _buildStatValue('SPD', member.speed, colors),
                  ],
                ),
                const SizedBox(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _buildInfoText('EXP: ${member.experience}', colors),
                    _buildInfoText('Gold: ${member.gold}', colors),
                  ],
                ),
              ],
            ),
          ),

          // Psynergy count
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: colors['primaryDark'],
              border: Border(
                top: BorderSide(
                  color: colors['secondary']!,
                  width: 2,
                ),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildInfoText(
                  'Psynergy: ${member.learnedPsynergy.length}',
                  colors,
                ),
                _buildInfoText(
                  'Items: ${member.inventory.length}',
                  colors,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStatBar(
    String label,
    int current,
    int max,
    Color barColor,
    Map<String, Color> colors,
  ) {
    final percentage = max > 0 ? current / max : 0.0;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              label,
              style: TextStyle(
                color: colors['text'],
                fontFamily: 'monospace',
                fontSize: 12,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              '$current / $max',
              style: TextStyle(
                color: colors['text'],
                fontFamily: 'monospace',
                fontSize: 12,
              ),
            ),
          ],
        ),
        const SizedBox(height: 4),
        Container(
          height: 8,
          decoration: BoxDecoration(
            color: colors['primaryDark'],
            border: Border.all(color: colors['secondary']!, width: 1),
          ),
          child: FractionallySizedBox(
            alignment: Alignment.centerLeft,
            widthFactor: percentage.clamp(0.0, 1.0),
            child: Container(color: barColor),
          ),
        ),
      ],
    );
  }

  Widget _buildStatValue(String label, int value, Map<String, Color> colors) {
    return Column(
      children: [
        Text(
          label,
          style: TextStyle(
            color: colors['secondary'],
            fontFamily: 'monospace',
            fontSize: 11,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          value.toString(),
          style: TextStyle(
            color: colors['text'],
            fontFamily: 'monospace',
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

  Widget _buildInfoText(String text, Map<String, Color> colors) {
    return Text(
      text,
      style: TextStyle(
        color: colors['text'],
        fontFamily: 'monospace',
        fontSize: 12,
      ),
    );
  }

  Widget _buildRelationshipsTab(PartyManager partyManager, Map<String, Color> colors) {
    final relationships = partyManager.getAllRelationships();

    if (relationships.isEmpty) {
      return Center(
        child: Text(
          'No relationships to display',
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
      itemCount: relationships.length,
      itemBuilder: (context, index) {
        final entry = relationships.entries.elementAt(index);
        final relationship = entry.value;
        return _buildRelationshipCard(relationship, colors);
      },
    );
  }

  Widget _buildRelationshipCard(
    CharacterRelationship relationship,
    Map<String, Color> colors,
  ) {
    final level = relationship.level;
    final levelColor = _getRelationshipColor(level, colors);

    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: colors['primary'],
        border: Border.all(color: levelColor, width: 2),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Relationship header
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: colors['primaryDark'],
              border: Border(
                bottom: BorderSide(color: levelColor, width: 2),
              ),
            ),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    '${relationship.character1Id} & ${relationship.character2Id}',
                    style: TextStyle(
                      color: colors['text'],
                      fontFamily: 'monospace',
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Text(
                  _getRelationshipLevelName(level),
                  style: TextStyle(
                    color: levelColor,
                    fontFamily: 'monospace',
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),

          // Relationship value bar
          Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Bond Strength',
                      style: TextStyle(
                        color: colors['text'],
                        fontFamily: 'monospace',
                        fontSize: 12,
                      ),
                    ),
                    Text(
                      '${relationship.value}',
                      style: TextStyle(
                        color: levelColor,
                        fontFamily: 'monospace',
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Container(
                  height: 12,
                  decoration: BoxDecoration(
                    color: colors['primaryDark'],
                    border: Border.all(color: colors['secondary']!, width: 1),
                  ),
                  child: Stack(
                    children: [
                      // Negative side (left half)
                      Positioned(
                        left: 0,
                        top: 0,
                        bottom: 0,
                        right: 0,
                        child: Row(
                          children: [
                            Expanded(
                              child: Container(
                                color: relationship.value < 0
                                    ? Colors.red.withOpacity(
                                        (relationship.value.abs() / 100).clamp(0.0, 1.0),
                                      )
                                    : Colors.transparent,
                              ),
                            ),
                            Expanded(
                              child: Container(
                                color: relationship.value > 0
                                    ? levelColor.withOpacity(
                                        (relationship.value / 100).clamp(0.0, 1.0),
                                      )
                                    : Colors.transparent,
                              ),
                            ),
                          ],
                        ),
                      ),
                      // Center line
                      Center(
                        child: Container(
                          width: 2,
                          color: colors['text'],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          // Recent events
          if (relationship.history.isNotEmpty) ...[
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: colors['primaryDark'],
                border: Border(
                  top: BorderSide(color: colors['secondary']!, width: 2),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Recent Events:',
                    style: TextStyle(
                      color: colors['accent'],
                      fontFamily: 'monospace',
                      fontSize: 11,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  ...relationship.history
                      .take(3)
                      .map((event) => Padding(
                            padding: const EdgeInsets.only(bottom: 4),
                            child: Text(
                              '• ${event.reason} (${event.change > 0 ? '+' : ''}${event.change})',
                              style: TextStyle(
                                color: colors['text'],
                                fontFamily: 'monospace',
                                fontSize: 10,
                              ),
                            ),
                          ))
                      .toList(),
                ],
              ),
            ),
          ],
        ],
      ),
    );
  }

  Color _getRelationshipColor(RelationshipLevel level, Map<String, Color> colors) {
    switch (level) {
      case RelationshipLevel.soulmate:
      case RelationshipLevel.trustedAlly:
        return colors['accent']!;
      case RelationshipLevel.friend:
      case RelationshipLevel.friendly:
        return colors['text']!;
      case RelationshipLevel.neutral:
        return colors['secondary']!;
      case RelationshipLevel.tense:
      case RelationshipLevel.unfriendly:
        return const Color(0xFFFF9900);
      case RelationshipLevel.hostile:
      case RelationshipLevel.enemy:
        return const Color(0xFFFF4444);
    }
  }

  String _getRelationshipLevelName(RelationshipLevel level) {
    switch (level) {
      case RelationshipLevel.soulmate:
        return 'Soulmate';
      case RelationshipLevel.trustedAlly:
        return 'Trusted Ally';
      case RelationshipLevel.friend:
        return 'Friend';
      case RelationshipLevel.friendly:
        return 'Friendly';
      case RelationshipLevel.neutral:
        return 'Neutral';
      case RelationshipLevel.tense:
        return 'Tense';
      case RelationshipLevel.unfriendly:
        return 'Unfriendly';
      case RelationshipLevel.hostile:
        return 'Hostile';
      case RelationshipLevel.enemy:
        return 'Enemy';
    }
  }
}
