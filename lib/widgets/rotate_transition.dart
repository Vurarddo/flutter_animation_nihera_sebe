
import 'package:flutter/material.dart';

class RotatingTransition extends StatelessWidget {
  final Widget child;
  final Animation<double> animation;

  RotatingTransition({
    @required this.child,
    @required this.animation,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animation,
      child: child,
      builder: (context, child) {
        return Transform.rotate(
          angle: animation.value,
          child: child,
        );
      },
    );
  }
}