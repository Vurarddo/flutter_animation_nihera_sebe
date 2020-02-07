import 'package:flutter/material.dart';
import 'package:self_education/cardboard/cardboard_widget.dart';

class CardboardScreen extends StatefulWidget {
  @override
  _CardboardScreenState createState() => _CardboardScreenState();
}

class _CardboardScreenState extends State<CardboardScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: CardboardWidget(),
        ),
      ),
    );
  }
}
