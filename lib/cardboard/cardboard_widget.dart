import 'package:flutter/material.dart';

class CardboardWidget extends StatelessWidget {
  final String text;
  final Alignment alignment; 

  CardboardWidget({
    Key key,
    @required this.text,
    @required this.alignment,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      height: 500,
      color: Colors.blue[500],
      child: ClipRect(
        child: _buildIcon(),
      ),
    );
  }

  Widget _buildIcon() {
    return Transform.translate(
      offset: Offset(-150, -170),
      child: Icon(
        Icons.ac_unit,
        size: 250,
        color: Colors.blue[100],
      ),
    );
  }
}
