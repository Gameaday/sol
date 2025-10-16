import 'package:flutter/material.dart';
import '../models/player.dart';
import '../models/item.dart';
import '../widgets/retro_button.dart';

class ShopScreen extends StatefulWidget {
  final Player player;
  final String shopId;

  const ShopScreen({
    super.key,
    required this.player,
    required this.shopId,
  });

  @override
  State<ShopScreen> createState() => _ShopScreenState();
}

class _ShopScreenState extends State<ShopScreen> {
  String? selectedItemId;

  List<Item> _getShopItems() {
    // Define shop inventories based on shop ID
    switch (widget.shopId) {
      case 'general_store':
        return [
          ItemDatabase.items['potion']!,
          ItemDatabase.items['ether']!,
          ItemDatabase.items['bronze_sword']!,
          ItemDatabase.items['leather_armor']!,
        ];
      case 'weapon_shop':
        return [
          ItemDatabase.items['bronze_sword']!,
          ItemDatabase.items['iron_sword']!,
          ItemDatabase.items['steel_sword']!,
        ];
      case 'armor_shop':
        return [
          ItemDatabase.items['leather_armor']!,
          ItemDatabase.items['iron_armor']!,
        ];
      case 'item_shop':
        return [
          ItemDatabase.items['potion']!,
          ItemDatabase.items['ether']!,
          ItemDatabase.items['elixir']!,
        ];
      default:
        return ItemDatabase.items.values.take(5).toList();
    }
  }

  void _buyItem(Item item) {
    if (widget.player.gold >= item.value) {
      setState(() {
        widget.player.gold -= item.value;
        widget.player.addItem(item.id);
      });

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Purchased ${item.name}!'),
          backgroundColor: const Color(0xFF306230),
          duration: const Duration(seconds: 1),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Not enough gold!'),
          backgroundColor: Color(0xFFFF4444),
          duration: Duration(seconds: 1),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final shopItems = _getShopItems();

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
                      'Shop',
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

              // Welcome message
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 16),
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: const Color(0xFF0f380f),
                  border: Border.all(
                    color: const Color(0xFF9bbc0f),
                    width: 2,
                  ),
                ),
                child: const Text(
                  'Welcome! Take a look at what I have for sale.',
                  style: TextStyle(
                    fontSize: 14,
                    color: Color(0xFF9bbc0f),
                    fontFamily: 'monospace',
                  ),
                  textAlign: TextAlign.center,
                ),
              ),

              const SizedBox(height: 16),

              // Item list
              Expanded(
                child: ListView.builder(
                  padding: const EdgeInsets.all(16),
                  itemCount: shopItems.length,
                  itemBuilder: (context, index) {
                    final item = shopItems[index];
                    final canAfford = widget.player.gold >= item.value;
                    return _buildShopItemCard(item, canAfford);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildShopItemCard(Item item, bool canAfford) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: const Color(0xFF0f380f),
        border: Border.all(
          color: canAfford ? const Color(0xFF9bbc0f) : const Color(0xFF306230),
          width: 2,
        ),
      ),
      child: Row(
        children: [
          // Item icon
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
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: canAfford
                      ? const Color(0xFF9bbc0f)
                      : const Color(0xFF306230),
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
                Text(
                  item.name,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: canAfford
                        ? const Color(0xFF9bbc0f)
                        : const Color(0xFF8bac0f),
                    fontFamily: 'monospace',
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  item.description,
                  style: TextStyle(
                    fontSize: 12,
                    color: canAfford
                        ? const Color(0xFF8bac0f)
                        : const Color(0xFF306230),
                    fontFamily: 'monospace',
                  ),
                ),
                if (item.healHp != null || item.healMp != null) ...[
                  const SizedBox(height: 4),
                  Text(
                    '${item.healHp != null ? "HP+${item.healHp}" : ""} ${item.healMp != null ? "MP+${item.healMp}" : ""}',
                    style: TextStyle(
                      fontSize: 10,
                      color: canAfford
                          ? const Color(0xFF9bbc0f)
                          : const Color(0xFF306230),
                      fontFamily: 'monospace',
                    ),
                  ),
                ],
                if (item.attackBonus != null || item.defenseBonus != null) ...[
                  const SizedBox(height: 4),
                  Text(
                    '${item.attackBonus != null ? "ATK+${item.attackBonus}" : ""} ${item.defenseBonus != null ? "DEF+${item.defenseBonus}" : ""}',
                    style: TextStyle(
                      fontSize: 10,
                      color: canAfford
                          ? const Color(0xFF9bbc0f)
                          : const Color(0xFF306230),
                      fontFamily: 'monospace',
                    ),
                  ),
                ],
              ],
            ),
          ),

          // Price and buy button
          Column(
            children: [
              Row(
                children: [
                  const Icon(
                    Icons.monetization_on,
                    color: Color(0xFFFFD700),
                    size: 16,
                  ),
                  const SizedBox(width: 4),
                  Text(
                    '${item.value}',
                    style: const TextStyle(
                      fontSize: 14,
                      color: Color(0xFFFFD700),
                      fontFamily: 'monospace',
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              GestureDetector(
                onTap: canAfford ? () => _buyItem(item) : null,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 8,
                  ),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: canAfford
                          ? const Color(0xFF9bbc0f)
                          : const Color(0xFF306230),
                      width: 2,
                    ),
                  ),
                  child: Text(
                    'Buy',
                    style: TextStyle(
                      color: canAfford
                          ? const Color(0xFF9bbc0f)
                          : const Color(0xFF306230),
                      fontFamily: 'monospace',
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
