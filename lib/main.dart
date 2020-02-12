import 'package:flutter/material.dart';

import 'package:self_education/carwash/clients/clients_scree.dart';
import 'package:self_education/carwash/carwash_services/carwash_services_screen.dart';
import 'package:self_education/flip_animation/flip_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ClientsScreen(),
      // home: CarWashServicesScreen(),
      // home: FlipScreen(),
      // home: CardboardScreen(),
    );
  }
}
