import 'package:flutter/material.dart';

class CuttedPaperWidget extends StatelessWidget {
  final int value;
  final AlignmentGeometry alignment;

  CuttedPaperWidget({
    Key key,
    @required this.value,
    @required this.alignment,
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
      color: Colors.black,
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
