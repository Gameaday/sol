import 'package:flutter/material.dart';

class RetroDialog extends StatelessWidget {
  final String title;
  final Widget child;

  const RetroDialog({
    super.key,
    required this.title,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: const Color(0xFF0f380f),
          border: Border.all(
            color: const Color(0xFF9bbc0f),
            width: 3,
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Color(0xFF9bbc0f),
                fontFamily: 'monospace',
              ),
            ),
            const SizedBox(height: 16),
            child,
            const SizedBox(height: 16),
            GestureDetector(
              onTap: () => Navigator.of(context).pop(),
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 8,
                ),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: const Color(0xFF8bac0f),
                    width: 2,
                  ),
                ),
                child: const Text(
                  'Close',
                  style: TextStyle(
                    color: Color(0xFF8bac0f),
                    fontFamily: 'monospace',
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
