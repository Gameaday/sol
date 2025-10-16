import 'package:flutter/material.dart';
import '../models/player.dart';
import '../models/item.dart';
import '../widgets/retro_button.dart';

class InventoryScreen extends StatefulWidget {
  final Player player;
  final Function(String itemId)? onItemUse;

  const InventoryScreen({
    super.key,
    required this.player,
    this.onItemUse,
  });

  @override
  State<InventoryScreen> createState() => _InventoryScreenState();
}

class _InventoryScreenState extends State<InventoryScreen> {
  ItemType selectedCategory = ItemType.consumable;

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
                child: Row(
                  children: [
                    IconButton(
                      icon: const Icon(
                        Icons.arrow_back,
                        color: Color(0xFF9bbc0f),
                      ),
                      onPressed: () => Navigator.of(context).pop(),
                    ),
                    const Text(
                      'Inventory',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF9bbc0f),
                        fontFamily: 'monospace',
                      ),
                    ),
                    const Spacer(),
                    Row(
                      children: [
                        const Icon(
                          Icons.monetization_on,
                          color: Color(0xFFFFD700),
                          size: 20,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          '${widget.player.gold}',
                          style: const TextStyle(
                            fontSize: 16,
                            color: Color(0xFFFFD700),
                            fontFamily: 'monospace',
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              // Category tabs
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 16),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: const Color(0xFF9bbc0f),
                    width: 2,
                  ),
                ),
                child: Row(
                  children: [
                    _buildCategoryTab('Items', ItemType.consumable),
                    _buildCategoryTab('Weapons', ItemType.weapon),
                    _buildCategoryTab('Armor', ItemType.armor),
                    _buildCategoryTab('Key', ItemType.keyItem),
                  ],
                ),
              ),

              const SizedBox(height: 16),

              // Item list
              Expanded(
                child: _buildItemList(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCategoryTab(String label, ItemType type) {
    final isSelected = selectedCategory == type;
    return Expanded(
      child: GestureDetector(
        onTap: () => setState(() => selectedCategory = type),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 12),
          decoration: BoxDecoration(
            color: isSelected
                ? const Color(0xFF306230)
                : const Color(0xFF0f380f),
            border: Border(
              right: BorderSide(
                color: const Color(0xFF9bbc0f),
                width: type != ItemType.keyItem ? 1 : 0,
              ),
            ),
          ),
          child: Text(
            label,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 12,
              color: isSelected
                  ? const Color(0xFF9bbc0f)
                  : const Color(0xFF8bac0f),
              fontFamily: 'monospace',
              fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildItemList() {
    final items = widget.player.inventory
        .map((id) => ItemDatabase.getItem(id))
        .where((item) => item != null && item.type == selectedCategory)
        .toList();

    if (items.isEmpty) {
      return const Center(
        child: Text(
          'No items in this category',
          style: TextStyle(
            color: Color(0xFF8bac0f),
            fontFamily: 'monospace',
          ),
        ),
      );
    }

    // Count item quantities
    final Map<String, int> itemCounts = {};
    for (final item in items) {
      itemCounts[item!.id] = (itemCounts[item.id] ?? 0) + 1;
    }

    // Get unique items
    final uniqueItems = itemCounts.keys
        .map((id) => ItemDatabase.getItem(id))
        .where((item) => item != null)
        .toList();

    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: uniqueItems.length,
      itemBuilder: (context, index) {
        final item = uniqueItems[index]!;
        final count = itemCounts[item.id]!;
        return _buildItemCard(item, count);
      },
    );
  }

  Widget _buildItemCard(Item item, int count) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: const Color(0xFF0f380f),
        border: Border.all(
          color: const Color(0xFF9bbc0f),
          width: 2,
        ),
      ),
      child: Row(
        children: [
          // Item icon placeholder
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              color: const Color(0xFF306230),
              border: Border.all(
                color: const Color(0xFF8bac0f),
                width: 2,
              ),
            ),
            child: Center(
              child: Text(
                item.name[0],
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF9bbc0f),
                ),
              ),
            ),
          ),
          const SizedBox(width: 12),

          // Item info
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      item.name,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF9bbc0f),
                        fontFamily: 'monospace',
                      ),
                    ),
                    if (count > 1) ...[
                      const SizedBox(width: 8),
                      Text(
                        'x$count',
                        style: const TextStyle(
                          fontSize: 14,
                          color: Color(0xFF8bac0f),
                          fontFamily: 'monospace',
                        ),
                      ),
                    ],
                  ],
                ),
                const SizedBox(height: 4),
                Text(
                  item.description,
                  style: const TextStyle(
                    fontSize: 12,
                    color: Color(0xFF8bac0f),
                    fontFamily: 'monospace',
                  ),
                ),
                if (item.healHp != null || item.healMp != null) ...[
                  const SizedBox(height: 4),
                  Text(
                    [
                      if (item.healHp != null) 'HP+${item.healHp}',
                      if (item.healMp != null) 'MP+${item.healMp}',
                    ].join(' '),
                    style: const TextStyle(
                      fontSize: 10,
                      color: Color(0xFF9bbc0f),
                      fontFamily: 'monospace',
                    ),
                  ),
                ],
              ],
            ),
          ),

          // Use button (for consumables)
          if (item.consumable && widget.onItemUse != null)
            GestureDetector(
              onTap: () {
                widget.onItemUse!(item.id);
                Navigator.of(context).pop();
              },
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 8,
                ),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: const Color(0xFF9bbc0f),
                    width: 2,
                  ),
                ),
                child: const Text(
                  'Use',
                  style: TextStyle(
                    color: Color(0xFF9bbc0f),
                    fontFamily: 'monospace',
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
