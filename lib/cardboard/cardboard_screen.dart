import 'dart:math';

import 'package:flutter/material.dart';

import 'package:self_education/cardboard/cardboard_widget.dart';
import 'package:self_education/widgets/flip_transition.dart';
import 'package:self_education/widgets/rotate_transition.dart';

class CardboardScreen extends StatefulWidget {
  @override
  _CardboardScreenState createState() => _CardboardScreenState();
}

class _CardboardScreenState extends State<CardboardScreen>
    with TickerProviderStateMixin {
  AnimationController _cardboardController;
  AnimationController _iconController;
  Animation<double> _iconAnimation;
  Animation<double> _leftOutsideAnimation;
  Animation<double> _rightOutsideAnimation;
  Animation<double> _leftInsideAnimation;
  Animation<double> _rightInsideAnimation;

  String _contentText = 'c=3 FlyingPenises 3=>';

  @override
  void initState() {
    super.initState();

    _iconController = AnimationController(
      duration: Duration(seconds: 1),
      vsync: this,
    );

    _cardboardController = AnimationController(
      duration: Duration(milliseconds: 400),
      vsync: this,
    );

    _iconAnimation = Tween<double>(begin: 0, end: pi * 2)
        .animate(_iconController)
          ..addStatusListener(_rotateStatus);

    _leftOutsideAnimation = Tween<double>(begin: .0, end: -pi * .5).animate(
      CurvedAnimation(
        curve: Interval(.0, .5),
        parent: _cardboardController,
      ),
    );

    _rightOutsideAnimation = Tween<double>(begin: .0, end: pi * .5).animate(
      CurvedAnimation(
        curve: Interval(.0, .5),
        parent: _cardboardController,
      ),
    );

    _leftInsideAnimation = Tween<double>(begin: -pi * .5, end: -pi).animate(
      CurvedAnimation(
        curve: Interval(.5, 1.0),
        parent: _cardboardController,
      ),
    );

    _rightInsideAnimation = Tween<double>(begin: pi * .5, end: pi).animate(
      CurvedAnimation(
        curve: Interval(.5, 1.0),
        parent: _cardboardController,
      ),
    );

    _iconController.forward();
  }

  AnimationStatus _rotateStatus(status) {
    if (status == AnimationStatus.completed) {
      _iconController.reset();
    } else if (status == AnimationStatus.dismissed) {
      _iconController.forward();
    }

    return status;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[800],
      body: SafeArea(
        child: GestureDetector(
          onTap: _onTap,
          child: Center(
            child: Stack(
              children: <Widget>[
                _buildOutsideCardboard(),
                _buildInsideCardboard(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildOutsideCardboard() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        FlipTransitionY(
          animation: _leftOutsideAnimation,
          transformAlignment: Alignment.centerRight,
          child: CardboardWidget(
            text: _contentText,
            iconWidget: _buildIcon(),
            alignment: Alignment.centerLeft,
            widthFactor: 0.2,
            color: Colors.blue[200],
          ),
        ),
        CardboardWidget(
          text: _contentText,
          iconWidget: _buildIcon(),
          alignment: Alignment.center,
          widthFactor: 0.6,
          color: Colors.blue[200],
        ),
        FlipTransitionY(
          animation: _rightOutsideAnimation,
          transformAlignment: Alignment.centerLeft,
          child: CardboardWidget(
            text: _contentText,
            iconWidget: _buildIcon(),
            alignment: Alignment.centerRight,
            widthFactor: 0.2,
            color: Colors.blue[200],
          ),
        ),
      ],
    );
  }

  Widget _buildInsideCardboard() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        FlipTransitionY(
          animation: _leftInsideAnimation,
          transformAlignment: Alignment.centerRight,
          child: CardboardWidget(
            text: '',
            alignment: Alignment.centerLeft,
            widthFactor: 0.2,
            color: Colors.white,
          ),
        ),
        CardboardWidget(
          text: '',
          alignment: Alignment.center,
          widthFactor: 0.6,
          color: Colors.transparent,
        ),
        FlipTransitionY(
          animation: _rightInsideAnimation,
          transformAlignment: Alignment.centerLeft,
          child: CardboardWidget(
            text: '',
            alignment: Alignment.centerRight,
            widthFactor: 0.2,
            color: Colors.white,
          ),
        ),
      ],
    );
  }

  Widget _buildIcon() {
    return RotatingTransition(
      animation: _iconAnimation,
      child: IconWidget(),
    );
  }

  void _onTap() {
    if (_cardboardController.status == AnimationStatus.dismissed) {
      _cardboardController.forward();
    }
  }

  @override
  void dispose() {
    _cardboardController.dispose();
    _iconController.dispose();
    super.dispose();
  }
}
