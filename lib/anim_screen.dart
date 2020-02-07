import 'package:flutter/material.dart';

class AnimScreen extends StatefulWidget {
  @override
  _AnimPageState createState() => _AnimPageState();
}

class _AnimPageState extends State<AnimScreen>
    with SingleTickerProviderStateMixin {
  AnimationController animController;
  Animation<double> animation;

  @override
  void initState() {
    super.initState();
    animController = AnimationController(
      duration: Duration(seconds: 1),
      vsync: this,
    );

    animation = Tween<double>(
      begin: 0,
      end: 1.573,
    ).animate(animController)
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          animController.reverse();
        } else if (status == AnimationStatus.dismissed) {
          animController.forward();
        }
      });

    animController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RotatingTransition(
        child: FlutterImage(),
        animation: animation,
      ),
    );
  }

  @override
  void dispose() {
    animController.dispose();
    super.dispose();
  }
}

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
        return Transform(
          transform: Matrix4.skewX(0.3)
            ..setEntry(3, 2, 0.01)
            ..rotateX(animation.value),
          alignment: FractionalOffset.center,
          child: child,
        );
      },
    );
  }
}

class FlutterImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.all(30),
      child: Icon(
        Icons.crop_square,
        size: 200,
      ),
    );
  }
}
