import 'package:flutter/material.dart';
import '../models/npc.dart';

class DialogueScreen extends StatefulWidget {
  final NPC npc;
  final Map<String, dynamic> gameFlags;
  final Function(Map<String, dynamic>) onFlagsChanged;
  final VoidCallback onDialogueEnd;

  const DialogueScreen({
    super.key,
    required this.npc,
    required this.gameFlags,
    required this.onFlagsChanged,
    required this.onDialogueEnd,
  });

  @override
  State<DialogueScreen> createState() => _DialogueScreenState();
}

class _DialogueScreenState extends State<DialogueScreen>
    with SingleTickerProviderStateMixin {
  late List<DialogueNode> dialogueNodes;
  int currentNodeIndex = 0;
  String displayedText = '';
  int textIndex = 0;
  late AnimationController _textController;
  
  @override
  void initState() {
    super.initState();
    dialogueNodes = widget.npc.getDialogue(widget.gameFlags);
    _textController = AnimationController(
      duration: const Duration(milliseconds: 50),
      vsync: this,
    );
    _animateText();
  }
  
  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }
  
  void _animateText() {
    if (currentNodeIndex >= dialogueNodes.length) {
      widget.onDialogueEnd();
      return;
    }
    
    final node = dialogueNodes[currentNodeIndex];
    displayedText = '';
    textIndex = 0;
    
    _textController.repeat();
    _textController.addListener(() {
      if (textIndex < node.text.length) {
        setState(() {
          displayedText = node.text.substring(0, textIndex + 1);
          textIndex++;
        });
      } else {
        _textController.stop();
      }
    });
  }
  
  void _nextNode() {
    final node = dialogueNodes[currentNodeIndex];
    
    // Set any flags
    if (node.flagsToSet != null) {
      widget.onFlagsChanged(node.flagsToSet!);
    }
    
    // Skip to fully displayed text if still animating
    if (textIndex < node.text.length) {
      setState(() {
        displayedText = node.text;
        textIndex = node.text.length;
        _textController.stop();
      });
      return;
    }
    
    // Check if there are choices
    if (node.choices != null && node.choices!.isNotEmpty) {
      // Stay on this node to show choices
      return;
    }
    
    // Move to next node
    if (currentNodeIndex < dialogueNodes.length - 1) {
      setState(() {
        currentNodeIndex++;
        _animateText();
      });
    } else {
      widget.onDialogueEnd();
    }
  }
  
  void _selectChoice(DialogueChoice choice) {
    // In a full implementation, this would navigate to the next node
    // For now, we'll just end the dialogue
    widget.onDialogueEnd();
  }

  @override
  Widget build(BuildContext context) {
    if (currentNodeIndex >= dialogueNodes.length) {
      return const SizedBox.shrink();
    }
    
    final node = dialogueNodes[currentNodeIndex];
    
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: GestureDetector(
        onTap: _nextNode,
        child: Stack(
          children: [
            // Dimmed background
            Container(
              color: Colors.black.withOpacity(0.5),
            ),
            
            // Dialogue box
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                margin: const EdgeInsets.all(16),
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: const Color(0xFF0f380f),
                  border: Border.all(
                    color: const Color(0xFF9bbc0f),
                    width: 3,
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // Speaker name
                    if (node.speaker != null) ...[
                      Row(
                        children: [
                          Container(
                            width: 32,
                            height: 32,
                            margin: const EdgeInsets.only(right: 12),
                            decoration: BoxDecoration(
                              color: const Color(0xFF306230),
                              border: Border.all(
                                color: const Color(0xFF9bbc0f),
                                width: 2,
                              ),
                            ),
                            child: Center(
                              child: Text(
                                node.speaker![0],
                                style: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFF9bbc0f),
                                ),
                              ),
                            ),
                          ),
                          Text(
                            node.speaker!,
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF9bbc0f),
                              fontFamily: 'monospace',
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 12),
                    ],
                    
                    // Dialogue text
                    Text(
                      displayedText,
                      style: const TextStyle(
                        fontSize: 14,
                        color: Color(0xFF9bbc0f),
                        fontFamily: 'monospace',
                        height: 1.4,
                      ),
                    ),
                    
                    // Continue indicator
                    if (textIndex >= node.text.length && 
                        (node.choices == null || node.choices!.isEmpty))
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: Container(
                            width: 16,
                            height: 16,
                            decoration: BoxDecoration(
                              color: const Color(0xFF9bbc0f),
                              border: Border.all(
                                color: const Color(0xFF8bac0f),
                                width: 1,
                              ),
                            ),
                            child: const Center(
                              child: Icon(
                                Icons.arrow_forward,
                                size: 12,
                                color: Color(0xFF0f380f),
                              ),
                            ),
                          ),
                        ),
                      ),
                    
                    // Choices
                    if (node.choices != null && 
                        node.choices!.isNotEmpty &&
                        textIndex >= node.text.length) ...[
                      const SizedBox(height: 16),
                      for (final choice in node.choices!)
                        Padding(
                          padding: const EdgeInsets.only(bottom: 8.0),
                          child: GestureDetector(
                            onTap: () => _selectChoice(choice),
                            child: Container(
                              padding: const EdgeInsets.all(12),
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: const Color(0xFF9bbc0f),
                                  width: 2,
                                ),
                              ),
                              child: Row(
                                children: [
                                  const Icon(
                                    Icons.arrow_right,
                                    color: Color(0xFF9bbc0f),
                                    size: 16,
                                  ),
                                  const SizedBox(width: 8),
                                  Expanded(
                                    child: Text(
                                      choice.text,
                                      style: const TextStyle(
                                        fontSize: 14,
                                        color: Color(0xFF9bbc0f),
                                        fontFamily: 'monospace',
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                    ],
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
