import 'package:flutter/material.dart';

import 'package:self_education/cardboard/cardboard_screen.dart';
import 'package:self_education/flip_animation/flip.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: FlipScreen(),
      // home: CardboardScreen(),
    );
  }
}
