import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/player.dart';
import '../models/psynergy.dart';
import '../services/theme_manager.dart';
import '../widgets/retro_button.dart';

class PsynergyScreen extends StatefulWidget {
  final Player player;

  const PsynergyScreen({
    super.key,
    required this.player,
  });

  @override
  State<PsynergyScreen> createState() => _PsynergyScreenState();
}

class _PsynergyScreenState extends State<PsynergyScreen> {
  PsynergyType selectedCategory = PsynergyType.offensive;

  @override
  Widget build(BuildContext context) {
    final themeManager = context.watch<ThemeManager>();
    
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              themeManager.darkest,
              themeManager.dark,
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
                      icon: Icon(
                        Icons.arrow_back,
                        color: themeManager.text,
                      ),
                      onPressed: () => Navigator.of(context).pop(),
                    ),
                    Text(
                      'Psynergy',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: themeManager.text,
                        fontFamily: 'monospace',
                      ),
                    ),
                    const Spacer(),
                    Row(
                      children: [
                        const Icon(
                          Icons.flash_on,
                          color: Color(0xFFBB44FF),
                          size: 20,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          '${widget.player.currentPp}/${widget.player.maxPp}',
                          style: const TextStyle(
                            fontSize: 16,
                            color: Color(0xFFBB44FF),
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
                    color: themeManager.lightest,
                    width: 2,
                  ),
                ),
                child: Row(
                  children: [
                    _buildCategoryTab('Attack', PsynergyType.offensive, themeManager),
                    _buildCategoryTab('Defend', PsynergyType.defensive, themeManager),
                    _buildCategoryTab('Heal', PsynergyType.healing, themeManager),
                    _buildCategoryTab('Field', PsynergyType.field, themeManager),
                  ],
                ),
              ),

              const SizedBox(height: 16),

              // Psynergy list
              Expanded(
                child: _buildPsynergyList(themeManager),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCategoryTab(String label, PsynergyType type, ThemeManager themeManager) {
    final isSelected = selectedCategory == type;
    return Expanded(
      child: GestureDetector(
        onTap: () => setState(() => selectedCategory = type),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 12),
          decoration: BoxDecoration(
            color: isSelected ? themeManager.dark : themeManager.darkest,
            border: Border(
              right: BorderSide(
                color: themeManager.lightest,
                width: type != PsynergyType.field ? 1 : 0,
              ),
            ),
          ),
          child: Text(
            label,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 11,
              color: isSelected ? themeManager.lightest : themeManager.light,
              fontFamily: 'monospace',
              fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildPsynergyList(ThemeManager themeManager) {
    final learnedPsynergy = widget.player.learnedPsynergy
        .map((id) => PsynergyDatabase.getPsynergy(id))
        .where((p) => p != null && p.type == selectedCategory)
        .toList();

    if (learnedPsynergy.isEmpty) {
      return Center(
        child: Text(
          'No Psynergy in this category',
          style: TextStyle(
            color: themeManager.light,
            fontFamily: 'monospace',
          ),
        ),
      );
    }

    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: learnedPsynergy.length,
      itemBuilder: (context, index) {
        final psy = learnedPsynergy[index]!;
        return _buildPsynergyCard(psy, themeManager);
      },
    );
  }

  Widget _buildPsynergyCard(Psynergy psy, ThemeManager themeManager) {
    final canUse = widget.player.canUsePsynergy(psy.ppCost);
    
    // Determine element color
    Color elementColor;
    switch (psy.element) {
      case PsynergyElement.venus:
        elementColor = ThemeManager.elementVenus;
        break;
      case PsynergyElement.mars:
        elementColor = ThemeManager.elementMars;
        break;
      case PsynergyElement.jupiter:
        elementColor = ThemeManager.elementJupiter;
        break;
      case PsynergyElement.mercury:
        elementColor = ThemeManager.elementMercury;
        break;
      default:
        elementColor = themeManager.light;
    }
    
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: themeManager.darkest,
        border: Border.all(
          color: canUse ? themeManager.lightest : themeManager.dark,
          width: 2,
        ),
      ),
      child: Row(
        children: [
          // Element indicator
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              color: themeManager.dark,
              border: Border.all(
                color: elementColor,
                width: 2,
              ),
            ),
            child: Center(
              child: Icon(
                _getElementIcon(psy.element),
                color: elementColor,
                size: 24,
              ),
            ),
          ),
          const SizedBox(width: 12),

          // Psynergy info
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      psy.name,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: canUse ? themeManager.text : themeManager.light,
                        fontFamily: 'monospace',
                      ),
                    ),
                    const Spacer(),
                    Row(
                      children: [
                        const Icon(
                          Icons.flash_on,
                          color: Color(0xFFBB44FF),
                          size: 14,
                        ),
                        Text(
                          '${psy.ppCost}',
                          style: TextStyle(
                            fontSize: 14,
                            color: canUse ? const Color(0xFFBB44FF) : themeManager.dark,
                            fontFamily: 'monospace',
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                Text(
                  psy.description,
                  style: TextStyle(
                    fontSize: 12,
                    color: canUse ? themeManager.light : themeManager.dark,
                    fontFamily: 'monospace',
                  ),
                ),
                if (psy.power != null) ...[
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      Text(
                        'Power: ${psy.power}',
                        style: TextStyle(
                          fontSize: 10,
                          color: canUse ? elementColor : themeManager.dark,
                          fontFamily: 'monospace',
                        ),
                      ),
                      const SizedBox(width: 12),
                      if (psy.range != null && psy.range! > 1)
                        Text(
                          'Range: ${psy.range == 5 ? "All" : psy.range}',
                          style: TextStyle(
                            fontSize: 10,
                            color: canUse ? themeManager.text : themeManager.dark,
                            fontFamily: 'monospace',
                          ),
                        ),
                    ],
                  ),
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }
  
  IconData _getElementIcon(PsynergyElement element) {
    switch (element) {
      case PsynergyElement.venus:
        return Icons.terrain;
      case PsynergyElement.mars:
        return Icons.whatshot;
      case PsynergyElement.jupiter:
        return Icons.air;
      case PsynergyElement.mercury:
        return Icons.water_drop;
      default:
        return Icons.star;
    }
  }
}
