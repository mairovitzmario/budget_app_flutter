import 'package:flutter/material.dart';

class NavigationUtils {
  static void switchPageTo(BuildContext context, pageToPush) {
    Navigator.of(context).pushReplacement(PageRouteBuilder(
      pageBuilder: (context, animation1, animation2) => pageToPush,
      transitionDuration: Duration.zero,
      reverseTransitionDuration: Duration.zero,
    ));
  }
}
