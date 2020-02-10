import 'package:flutter/material.dart';

class FlipTransitionX extends StatelessWidget {
  final Animation<double> animation;
  final AlignmentGeometry transformAlignment;
  final Widget child;

  FlipTransitionX({
    Key key,
    @required this.animation,
    @required this.transformAlignment,
    @required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animation,
      child: child,
      builder: (context, child) {
        return Transform(
          transform: Matrix4.identity()
            ..setEntry(3, 2, 0.003)
            ..rotateX(animation.value),
          alignment: transformAlignment,
          child: child,
        );
      },
    );
  }
}

class FlipTransitionY extends StatelessWidget {
  final Animation<double> animation;
  final AlignmentGeometry transformAlignment;
  final Widget child;

  FlipTransitionY({
    Key key,
    @required this.animation,
    @required this.transformAlignment,
    @required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animation,
      child: child,
      builder: (context, child) {
        return Transform(
          transform: Matrix4.identity()
            ..setEntry(3, 2, 0.001)
            ..rotateY(animation.value),
          alignment: transformAlignment,
          child: child,
        );
      },
    );
  }
}
