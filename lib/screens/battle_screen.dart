import 'package:flutter/material.dart';
import '../models/player.dart';
import '../models/monster.dart';
import '../widgets/retro_button.dart';

class BattleScreen extends StatefulWidget {
  final Player player;
  final Monster monster;
  final VoidCallback onBattleEnd;

  const BattleScreen({
    super.key,
    required this.player,
    required this.monster,
    required this.onBattleEnd,
  });

  @override
  State<BattleScreen> createState() => _BattleScreenState();
}

class _BattleScreenState extends State<BattleScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  String _battleLog = '';
  bool _playerTurn = true;
  bool _battleEnded = false;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );
    _battleLog = 'A ${widget.monster.name} appeared!';
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _attack() {
    if (_battleEnded || !_playerTurn) return;

    setState(() {
      final damage = widget.player.attack - (widget.monster.defense ~/ 2);
      final actualDamage = damage.clamp(1, damage);
      widget.monster.takeDamage(actualDamage);
      _battleLog = 'You dealt $actualDamage damage!';
      _playerTurn = false;
    });

    _animationController.forward(from: 0);

    Future.delayed(const Duration(milliseconds: 1000), () {
      if (widget.monster.isDefeated()) {
        _victory();
      } else {
        _enemyTurn();
      }
    });
  }

  void _useSkill() {
    if (_battleEnded || !_playerTurn || widget.player.currentPp < 5) return;

    setState(() {
      widget.player.usePp(5);
      final damage = (widget.player.attack * 1.5).toInt();
      final actualDamage = damage - (widget.monster.defense ~/ 2);
      widget.monster.takeDamage(actualDamage.clamp(1, actualDamage));
      _battleLog = 'Used Psynergy! Dealt $actualDamage damage!';
      _playerTurn = false;
    });

    _animationController.forward(from: 0);

    Future.delayed(const Duration(milliseconds: 1000), () {
      if (widget.monster.isDefeated()) {
        _victory();
      } else {
        _enemyTurn();
      }
    });
  }

  void _enemyTurn() {
    if (_battleEnded) return;

    Future.delayed(const Duration(milliseconds: 500), () {
      if (!mounted || _battleEnded) return;

      setState(() {
        final damage = widget.monster.calculateDamage(widget.player.defense);
        widget.player.takeDamage(damage);
        _battleLog = '${widget.monster.name} attacked! You took $damage damage!';
      });

      _animationController.forward(from: 0);

      Future.delayed(const Duration(milliseconds: 1000), () {
        if (!mounted || _battleEnded) return;

        if (widget.player.currentHp <= 0) {
          _defeat();
        } else {
          setState(() {
            _playerTurn = true;
          });
        }
      });
    });
  }

  void _victory() {
    setState(() {
      _battleEnded = true;
      widget.player.gainExperience(widget.monster.experienceReward);
      widget.player.gold += widget.monster.goldReward;
      _battleLog =
          'Victory! Gained ${widget.monster.experienceReward} EXP and ${widget.monster.goldReward} gold!';
    });

    Future.delayed(const Duration(milliseconds: 2000), () {
      widget.onBattleEnd();
    });
  }

  void _defeat() {
    setState(() {
      _battleEnded = true;
      _battleLog = 'You were defeated...';
    });

    Future.delayed(const Duration(milliseconds: 2000), () {
      widget.onBattleEnd();
    });
  }

  void _run() {
    if (_battleEnded || !_playerTurn) return;

    // 50% chance to run
    if (DateTime.now().millisecondsSinceEpoch % 2 == 0) {
      setState(() {
        _battleEnded = true;
        _battleLog = 'Got away safely!';
      });

      Future.delayed(const Duration(milliseconds: 1000), () {
        widget.onBattleEnd();
      });
    } else {
      setState(() {
        _battleLog = 'Could not escape!';
        _playerTurn = false;
      });

      Future.delayed(const Duration(milliseconds: 1000), () {
        _enemyTurn();
      });
    }
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
              Color(0xFF1a1a1a),
            ],
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              // Monster display
              Expanded(
                flex: 2,
                child: Center(
                  child: AnimatedBuilder(
                    animation: _animationController,
                    builder: (context, child) {
                      return Transform.translate(
                        offset: Offset(
                          _animationController.value * 10 *
                              ((_animationController.value * 4) % 2 == 0 ? 1 : -1),
                          0,
                        ),
                        child: child,
                      );
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 64,
                          height: 64,
                          decoration: BoxDecoration(
                            color: const Color(0xFF9bbc0f),
                            border: Border.all(
                              color: const Color(0xFF8bac0f),
                              width: 2,
                            ),
                          ),
                          child: Center(
                            child: Text(
                              widget.monster.name[0],
                              style: const TextStyle(
                                fontSize: 32,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF0f380f),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          widget.monster.name,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF9bbc0f),
                            fontFamily: 'monospace',
                          ),
                        ),
                        const SizedBox(height: 4),
                        Container(
                          width: 120,
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
                            widthFactor: (widget.monster.currentHp /
                                    widget.monster.maxHp)
                                .clamp(0.0, 1.0),
                            child: Container(
                              color: const Color(0xFFFF4444),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              // Battle log
              Container(
                padding: const EdgeInsets.all(16),
                margin: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: const Color(0xFF0f380f),
                  border: Border.all(
                    color: const Color(0xFF9bbc0f),
                    width: 2,
                  ),
                ),
                child: Text(
                  _battleLog,
                  style: const TextStyle(
                    fontSize: 14,
                    color: Color(0xFF9bbc0f),
                    fontFamily: 'monospace',
                  ),
                  textAlign: TextAlign.center,
                ),
              ),

              // Player stats
              Container(
                padding: const EdgeInsets.all(16),
                margin: const EdgeInsets.symmetric(horizontal: 16),
                decoration: BoxDecoration(
                  color: const Color(0xFF0f380f),
                  border: Border.all(
                    color: const Color(0xFF9bbc0f),
                    width: 2,
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'HP: ${widget.player.currentHp}/${widget.player.maxHp}',
                          style: const TextStyle(
                            color: Color(0xFF9bbc0f),
                            fontFamily: 'monospace',
                          ),
                        ),
                        Container(
                          width: 100,
                          height: 8,
                          margin: const EdgeInsets.only(top: 4),
                          decoration: BoxDecoration(
                            color: const Color(0xFF306230),
                            border: Border.all(
                              color: const Color(0xFF8bac0f),
                              width: 1,
                            ),
                          ),
                          child: FractionallySizedBox(
                            alignment: Alignment.centerLeft,
                            widthFactor: (widget.player.currentHp /
                                    widget.player.maxHp)
                                .clamp(0.0, 1.0),
                            child: Container(
                              color: const Color(0xFFFF4444),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'PP: ${widget.player.currentPp}/${widget.player.maxPp}',
                          style: const TextStyle(
                            color: Color(0xFF9bbc0f),
                            fontFamily: 'monospace',
                          ),
                        ),
                        Container(
                          width: 100,
                          height: 8,
                          margin: const EdgeInsets.only(top: 4),
                          decoration: BoxDecoration(
                            color: const Color(0xFF306230),
                            border: Border.all(
                              color: const Color(0xFF8bac0f),
                              width: 1,
                            ),
                          ),
                          child: FractionallySizedBox(
                            alignment: Alignment.centerLeft,
                            widthFactor: (widget.player.currentPp /
                                    widget.player.maxPp)
                                .clamp(0.0, 1.0),
                            child: Container(
                              color: const Color(0xFFAA44FF),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              // Action buttons
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 4.0),
                        child: RetroButton(
                          text: 'Attack',
                          onPressed: _playerTurn && !_battleEnded ? _attack : null,
                          width: double.infinity,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 4.0),
                        child: RetroButton(
                          text: 'Psynergy',
                          onPressed: _playerTurn &&
                                  !_battleEnded &&
                                  widget.player.currentPp >= 5
                              ? _useSkill
                              : null,
                          width: double.infinity,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16.0, right: 16.0, bottom: 16.0),
                child: RetroButton(
                  text: 'Run',
                  onPressed: _playerTurn && !_battleEnded ? _run : null,
                  width: double.infinity,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
