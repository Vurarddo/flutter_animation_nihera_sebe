import 'package:flutter/material.dart';

class CuttedPaperWidget extends StatelessWidget {
  final int value;
  final AlignmentGeometry alignment;
  final Color firstColor;
  final Color secondColor;

  CuttedPaperWidget({
    Key key,
    @required this.value,
    @required this.alignment,
    this.firstColor,
    this.secondColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRect(
      child: Align(
        alignment: alignment,
        heightFactor: 0.5,
        child: _buildPaper(),
      ),
    );
  }

  Widget _buildPaper() {
    return Container(
      decoration: _buildPaperDecoration(),
      alignment: Alignment.center,
      width: 120,
      height: 180,
      child: _buildValue(),
    );
  }

  Decoration _buildPaperDecoration() {
    return BoxDecoration(
      borderRadius: BorderRadius.circular(5),
      gradient: LinearGradient(
        colors: [firstColor, secondColor],
        begin: Alignment.bottomCenter,
        end: Alignment.topCenter,
      ),
    );
  }

  Widget _buildValue() {
    return Text(
      '$value',
      style: TextStyle(
        fontSize: 100,
        color: Colors.red,
      ),
    );
  }
}
