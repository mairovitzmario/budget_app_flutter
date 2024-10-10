import 'package:flutter/material.dart';

class LockableAddButton extends StatelessWidget {
  bool isLocked;
  void Function() onPressedFunc;

  LockableAddButton({
    super.key,
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
          'Add',
          style: Theme.of(context).textTheme.titleSmall?.copyWith(
                fontWeight: FontWeight.w400,
                color: Theme.of(context).colorScheme.inversePrimary,
              ),
        ),
      ),
    );
  }
}
