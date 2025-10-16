import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/cutscene_script.dart';
import '../services/cutscene_director.dart';
import '../services/theme_manager.dart';

class CutscenePlayerScreen extends StatefulWidget {
  final CutsceneScript script;
  final VoidCallback onComplete;

  const CutscenePlayerScreen({
    super.key,
    required this.script,
    required this.onComplete,
  });

  @override
  State<CutscenePlayerScreen> createState() => _CutscenePlayerScreenState();
}

class _CutscenePlayerScreenState extends State<CutscenePlayerScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  bool _isInitialized = false;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 16), // ~60 FPS
    );

    // Start the cutscene
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final director = context.read<CutsceneDirector>();
      director.startCutscene(widget.script);
      _isInitialized = true;
      _startUpdateLoop();
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    final director = context.read<CutsceneDirector>();
    if (director.isPlaying) {
      director.endCutscene();
    }
    super.dispose();
  }

  void _startUpdateLoop() {
    _animationController.repeat();
    _animationController.addListener(() {
      if (!mounted) return;
      
      final director = context.read<CutsceneDirector>();
      if (director.isPlaying) {
        director.update(0.016); // ~60 FPS
        
        if (!director.isPlaying) {
          // Cutscene ended
          _animationController.stop();
          widget.onComplete();
        }
      }
    });
  }

  void _handleTap() {
    final director = context.read<CutsceneDirector>();
    final event = director.getCurrentEvent();
    
    if (event?.type == CutsceneEventType.dialogue) {
      director.skipCurrentEvent();
    }
  }

  void _handleSkip() {
    final director = context.read<CutsceneDirector>();
    if (widget.script.skippable) {
      // Show confirmation dialog
      showDialog(
        context: context,
        builder: (context) => _buildSkipDialog(),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    if (!_isInitialized) {
      return const Scaffold(
        backgroundColor: Colors.black,
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }

    return Consumer2<CutsceneDirector, ThemeManager>(
      builder: (context, director, themeManager, child) {
        if (!director.isPlaying) {
          return const SizedBox.shrink();
        }

        final colors = themeManager.currentPalette;
        final currentEvent = director.getCurrentEvent();

        return Scaffold(
          backgroundColor: Colors.black,
          body: GestureDetector(
            onTap: _handleTap,
            child: Stack(
              children: [
                // Main cutscene view
                Center(
                  child: _buildCutsceneContent(
                    director,
                    currentEvent,
                    colors,
                  ),
                ),

                // Skip button
                if (widget.script.skippable)
                  Positioned(
                    top: 40,
                    right: 16,
                    child: _buildSkipButton(colors),
                  ),

                // Progress indicator
                Positioned(
                  bottom: 80,
                  left: 0,
                  right: 0,
                  child: _buildProgressBar(director, colors),
                ),

                // Dialogue box (if current event is dialogue)
                if (currentEvent?.type == CutsceneEventType.dialogue)
                  _buildDialogueBox(currentEvent!, colors),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildCutsceneContent(
    CutsceneDirector director,
    CutsceneEvent? event,
    Map<String, Color> colors,
  ) {
    if (event == null) {
      return const SizedBox.shrink();
    }

    // For now, show a placeholder based on event type
    // In a full implementation, this would render the actual scene
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: Colors.black,
      child: Center(
        child: _buildEventVisual(event, colors),
      ),
    );
  }

  Widget _buildEventVisual(CutsceneEvent event, Map<String, Color> colors) {
    switch (event.type) {
      case CutsceneEventType.showLocation:
        final locationName = event.parameters?['location'] as String? ?? 'Unknown';
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.place,
              color: colors['accent'],
              size: 64,
            ),
            const SizedBox(height: 16),
            Text(
              locationName,
              style: TextStyle(
                color: colors['text'],
                fontFamily: 'monospace',
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        );

      case CutsceneEventType.fadeIn:
      case CutsceneEventType.fadeOut:
        return Container(
          color: Colors.black.withOpacity(
            event.type == CutsceneEventType.fadeIn ? 0.5 : 0.8,
          ),
        );

      case CutsceneEventType.dialogue:
        // Dialogue is shown in the dialogue box
        return const SizedBox.shrink();

      default:
        return Icon(
          Icons.movie,
          color: colors['secondary'],
          size: 48,
        );
    }
  }

  Widget _buildDialogueBox(CutsceneEvent event, Map<String, Color> colors) {
    final speaker = event.parameters?['speaker'] as String?;
    final text = event.parameters?['text'] as String? ?? '';

    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: Container(
        margin: const EdgeInsets.all(16),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: colors['primaryDark'],
          border: Border.all(
            color: colors['accent']!,
            width: 3,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            if (speaker != null) ...[
              Text(
                speaker,
                style: TextStyle(
                  color: colors['accent'],
                  fontFamily: 'monospace',
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
            ],
            Text(
              text,
              style: TextStyle(
                color: colors['text'],
                fontFamily: 'monospace',
                fontSize: 14,
                height: 1.4,
              ),
            ),
            const SizedBox(height: 8),
            Align(
              alignment: Alignment.centerRight,
              child: Icon(
                Icons.arrow_forward,
                color: colors['accent'],
                size: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSkipButton(Map<String, Color> colors) {
    return GestureDetector(
      onTap: _handleSkip,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: colors['primaryDark'],
          border: Border.all(color: colors['accent']!, width: 2),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.fast_forward,
              color: colors['text'],
              size: 16,
            ),
            const SizedBox(width: 4),
            Text(
              'Skip',
              style: TextStyle(
                color: colors['text'],
                fontFamily: 'monospace',
                fontSize: 14,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProgressBar(CutsceneDirector director, Map<String, Color> colors) {
    final progress = director.getProgress();

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 32),
      height: 4,
      decoration: BoxDecoration(
        color: colors['primaryDark'],
        border: Border.all(color: colors['secondary']!, width: 1),
      ),
      child: FractionallySizedBox(
        alignment: Alignment.centerLeft,
        widthFactor: progress,
        child: Container(
          color: colors['accent'],
        ),
      ),
    );
  }

  Widget _buildSkipDialog() {
    return Consumer<ThemeManager>(
      builder: (context, themeManager, child) {
        final colors = themeManager.currentPalette;

        return Dialog(
          backgroundColor: colors['primaryDark'],
          child: Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              border: Border.all(color: colors['accent']!, width: 3),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Skip Cutscene?',
                  style: TextStyle(
                    color: colors['text'],
                    fontFamily: 'monospace',
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  'Are you sure you want to skip this cutscene?',
                  style: TextStyle(
                    color: colors['text'],
                    fontFamily: 'monospace',
                    fontSize: 14,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 24),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _buildDialogButton(
                      'Cancel',
                      colors,
                      () => Navigator.of(context).pop(),
                    ),
                    _buildDialogButton(
                      'Skip',
                      colors,
                      () {
                        Navigator.of(context).pop();
                        final director = context.read<CutsceneDirector>();
                        director.skip();
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildDialogButton(
    String text,
    Map<String, Color> colors,
    VoidCallback onPressed,
  ) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        decoration: BoxDecoration(
          color: colors['primary'],
          border: Border.all(color: colors['accent']!, width: 2),
        ),
        child: Text(
          text,
          style: TextStyle(
            color: colors['text'],
            fontFamily: 'monospace',
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
