import 'package:flutter/material.dart';

class LockableButton extends StatelessWidget {
  String title;
  bool isLocked;
  void Function() onPressedFunc;

  LockableButton({
    super.key,
    required this.title,
    required this.isLocked,
    required this.onPressedFunc,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: isLocked ? onPressedFunc : null,
      style: ButtonStyle(
        backgroundColor: WidgetStateProperty.all<Color>(
          isLocked
              ? Theme.of(context).colorScheme.primary
              : Theme.of(context).colorScheme.secondary,
        ),
        shape: WidgetStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 4,
          vertical: 2,
        ),
        child: Text(
          title,
          style: Theme.of(context).textTheme.titleSmall?.copyWith(
                fontWeight: FontWeight.w400,
                color: Theme.of(context).colorScheme.inversePrimary,
              ),
        ),
      ),
    );
  }
}
