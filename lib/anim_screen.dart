import 'package:flutter/material.dart';

import 'package:self_education/widgets/rotate_transition.dart';

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
