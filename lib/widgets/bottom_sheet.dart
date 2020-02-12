import 'package:flutter/material.dart';

class ScreenWithBottomDrawer extends StatefulWidget {
  @override
  _ScreenWithBottomDrawerState createState() => _ScreenWithBottomDrawerState();
}

class _ScreenWithBottomDrawerState extends State<ScreenWithBottomDrawer>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation<double> _animation;
  bool _canBeDragged = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 250),
    );

    _animation = Tween<double>(begin: 0, end: 350).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void toggle() =>
      _controller.isDismissed ? _controller.forward() : _controller.reverse();
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onVerticalDragStart: _onDragStart,
      onVerticalDragUpdate: _onDragUpdate,
      onVerticalDragEnd: _onDragEnd,
      onTap: toggle,
      child: AnimatedBuilder(
        animation: _controller,
        builder: (context, _) {
          return Material(
            color: Colors.blueGrey,
            child: Stack(
              children: <Widget>[
                Positioned(
                  bottom: 0 + _controller.value * 300,
                  child: Container(
                    height: 50,
                    width: MediaQuery.of(context).size.width,
                    color: Colors.green,
                  ),
                ),
                Positioned(
                  bottom: 0,
                  child: Column(
                    children: <Widget>[
                      Container(
                        height: _animation.value,
                        width: MediaQuery.of(context).size.width,
                        color: Colors.green,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  void _onDragStart(DragStartDetails details) {
    bool isDragOpenFromBottom = _controller.isDismissed;
    bool isDragCloseFromTop = _controller.isCompleted;
    _canBeDragged = isDragOpenFromBottom || isDragCloseFromTop;
  }

  void _onDragUpdate(DragUpdateDetails details) {
    if (_canBeDragged) {
      double delta = -details.primaryDelta / 300;
      _controller.value += delta;
    }
  }

  void _onDragEnd(DragEndDetails details) {
    double _kMinFlingVelocity = 365.0;

    if (_controller.isDismissed || _controller.isCompleted) {
      return;
    }
    if (details.velocity.pixelsPerSecond.dx.abs() >= _kMinFlingVelocity) {
      double visualVelocity = details.velocity.pixelsPerSecond.dx /
          MediaQuery.of(context).size.height;

      _controller.fling(velocity: visualVelocity);
    } else if (_controller.value < 0.5) {
      _controller.reverse();
    } else {
      _controller.forward();
    }
  }
}
