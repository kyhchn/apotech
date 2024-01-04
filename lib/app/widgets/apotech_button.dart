import 'package:apotech/app/core/theme/colors.dart';
import 'package:flutter/material.dart';

enum Type { primary, secondary }

class ApotechButton extends StatelessWidget {
  final Widget child;
  final VoidCallback onPressed;
  final Type type;
  const ApotechButton(
      {super.key,
      required this.child,
      required this.onPressed,
      this.type = Type.primary});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        elevation: 0,
        textStyle: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w700,
        ),
        backgroundColor: type == Type.primary ? primaryColor : Colors.white,
        side: BorderSide(
          color:
              type == Type.primary ? Colors.white : purpleText.withOpacity(0.1),
          width: 1,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(100),
        ),
        padding: const EdgeInsets.symmetric(vertical: 16),
      ),
      child: child,
    );
  }
}
