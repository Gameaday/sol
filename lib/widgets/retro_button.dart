import 'package:flutter/material.dart';

class RetroButton extends StatefulWidget {
  final String text;
  final VoidCallback? onPressed;
  final double width;
  final double height;

  const RetroButton({
    super.key,
    required this.text,
    this.onPressed,
    this.width = 200,
    this.height = 48,
  });

  @override
  State<RetroButton> createState() => _RetroButtonState();
}

class _RetroButtonState extends State<RetroButton> {
  bool _isPressed = false;

  @override
  Widget build(BuildContext context) {
    final isEnabled = widget.onPressed != null;
    final color = isEnabled
        ? (widget.onPressed != null ? const Color(0xFF9bbc0f) : const Color(0xFF306230))
        : const Color(0xFF306230);

    return GestureDetector(
      onTapDown: isEnabled ? (_) => setState(() => _isPressed = true) : null,
      onTapUp: isEnabled ? (_) => setState(() => _isPressed = false) : null,
      onTapCancel: isEnabled ? () => setState(() => _isPressed = false) : null,
      onTap: widget.onPressed,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 100),
        width: widget.width,
        height: widget.height,
        transform: Matrix4.translationValues(
          0,
          _isPressed ? 2 : 0,
          0,
        ),
        decoration: BoxDecoration(
          color: const Color(0xFF0f380f),
          border: Border.all(
            color: color,
            width: 3,
          ),
          boxShadow: [
            if (!_isPressed)
              BoxShadow(
                color: color,
                offset: const Offset(0, 4),
              ),
          ],
        ),
        child: Center(
          child: Text(
            widget.text,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: color,
              fontFamily: 'monospace',
            ),
          ),
        ),
      ),
    );
  }
}
