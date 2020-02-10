import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CardboardWidget extends StatelessWidget {
  final Alignment alignment;
  final String text;
  final double heightFactor;
  final double widthFactor;
  final Widget iconWidget;
  final Color color;

  CardboardWidget({
    Key key,
    @required this.alignment,
    this.text,
    this.heightFactor,
    this.widthFactor,
    this.iconWidget,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRect(
      child: Align(
        alignment: alignment,
        heightFactor: heightFactor,
        widthFactor: widthFactor,
        child: Container(
          width: 300,
          height: 500,
          color: color,
          child: Stack(
            children: <Widget>[
              if (iconWidget != null) ...{
                ClipRect(
                  child: iconWidget,
                ),
              },
              _buildContentText(text),
            ],
          ),
        ),
      ),
    );
  }

  Text _buildContentText(String text) {
    return Text(
      text,
      style: TextStyle(fontSize: 30),
    );
  }
}

class IconWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Icon(
        Icons.sentiment_very_dissatisfied,
        size: 200,
        color: Colors.blue[100],
      ),
    );
  }
}
