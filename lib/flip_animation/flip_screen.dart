import 'dart:math';

import 'package:flutter/material.dart';

import 'package:self_education/flip_animation/cutted_paper_widget.dart';
import 'package:self_education/widgets/flip_transition.dart';

class FlipScreen extends StatefulWidget {
  @override
  _FlipScreenState createState() => _FlipScreenState();
}

class _FlipScreenState extends State<FlipScreen>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation<double> _bottomListAnimation;
  Animation<double> _topListAnimation;
  int _prevuesValue = 0;
  int _newValue = 0;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: Duration(milliseconds: 500),
      vsync: this,
    )
      ..addListener(() {
        if (_controller.value > 0.6 && _prevuesValue != _newValue) {
          setState(() {
            _prevuesValue = _newValue;
          });
        }
      })
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          _controller.reset();
        }
      });

    _bottomListAnimation = Tween<double>(
      begin: 0,
      end: -pi / 2,
    ).animate(
      CurvedAnimation(
        curve: Interval(0.0, 0.5),
        parent: _controller,
      ),
    );

    _topListAnimation = Tween<double>(
      begin: pi / 2,
      end: 0,
    ).animate(
      CurvedAnimation(
        curve: Interval(0.5, 1.0),
        parent: _controller,
      ),
    );
  }

  void _incrementCounter() {
    if (_controller.status == AnimationStatus.dismissed) {
      if (_newValue < 99) {
        setState(() {
          _newValue++;
          _prevuesValue = _newValue - 1;
        });
        _controller.forward();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Flip',
          style: TextStyle(color: Colors.red),
        ),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      body: Container(
        child: Center(
          child: _buildFlip(),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        backgroundColor: Colors.black,
        child: Icon(
          Icons.add,
          color: Colors.red,
        ),
      ),
    );
  }

  Widget _buildFlip() {
    return Center(
      child: Stack(
        children: <Widget>[
          _buildStaticPapers(),
          _buildAnimatedPapers(),
        ],
      ),
    );
  }

  Widget _buildStaticPapers() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        CuttedPaperWidget(
          value: _prevuesValue,
          alignment: Alignment.topCenter,
          firstColor: Colors.grey[600],
          secondColor: Colors.black,
        ),
        Padding(
          padding: EdgeInsets.only(top: 2.0),
        ),
        CuttedPaperWidget(
          value: _newValue,
          alignment: Alignment.bottomCenter,
          firstColor: Colors.black,
          secondColor: Colors.grey[600],
        )
      ],
    );
  }

  Widget _buildAnimatedPapers() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        FlipTransitionX(
          animation: _topListAnimation,
          transformAlignment: Alignment.bottomCenter,
          child: CuttedPaperWidget(
            value: _newValue,
            alignment: Alignment.topCenter,
            firstColor: Colors.grey[600],
            secondColor: Colors.black,
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 2.0),
        ),
        FlipTransitionX(
          animation: _bottomListAnimation,
          transformAlignment: Alignment.topCenter,
          child: CuttedPaperWidget(
            value: _prevuesValue,
            alignment: Alignment.bottomCenter,
            firstColor: Colors.black,
            secondColor: Colors.grey[600],
          ),
        ),
      ],
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
