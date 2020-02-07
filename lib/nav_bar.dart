import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';

class NavBar extends StatefulWidget {
  @override
  _NavBarState createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  List items = [
    MenuItem(x: -1.0, name: 'garage', color: Colors.lightBlue[100]),
    MenuItem(x: -0.5, name: 'garage_2', color: Colors.purple),
    MenuItem(x: -0.0, name: 'garage_3', color: Colors.greenAccent),
    MenuItem(x: 0.5, name: 'garage_4', color: Colors.pink),
    MenuItem(x: 1.0, name: 'garage_5', color: Colors.yellow),
  ];
  MenuItem active;

  @override
  void initState() {
    super.initState();

    active = items[0];
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Container(
      height: 80,
      color: Colors.black,
      child: Stack(
        children: <Widget>[
          AnimatedContainer(
            duration: Duration(milliseconds: 200),
            alignment: Alignment(active.x, -1),
            child: AnimatedContainer(
              duration: Duration(milliseconds: 1000),
              height: 8,
              width: width * 0.2,
              color: active.color,
            ),
          ),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: items.map((item) {
                return _buildFlare(item);
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFlare(MenuItem item) {
    return GestureDetector(
      child: AspectRatio(
        aspectRatio: 1,
        child: Padding(
          padding: EdgeInsets.only(top: 20),
          child: FlareActor(
            'assets/${item.name}.flr',
            alignment: Alignment.center,
            fit: BoxFit.contain,
            animation: item.name == active.name ? 'Start' : 'idle',
          ),
        ),
      ),
      onTap: () {
        setState(() {
          active = item;
        });
      },
    );
  }
}

class MenuItem {
  final String name;
  final Color color;
  final double x;
  MenuItem({
    @required this.name,
    @required this.color,
    @required this.x,
  });
}
