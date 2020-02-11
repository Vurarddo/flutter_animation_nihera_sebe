import 'package:flutter/material.dart';
import 'package:self_education/carwash/entities/body_type.dart';

class BodyTypeCard extends StatelessWidget {
  final BodyType bodyType;
  final bool isSelected;

  BodyTypeCard({
    Key key,
    @required this.bodyType,
    @required this.isSelected,
  })  : assert(bodyType != null),
        assert(isSelected != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    final borderRadius = BorderRadius.circular(5);

    return Container(
      width: 128.0,
      margin: EdgeInsets.symmetric(horizontal: 8.0, vertical: 10.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: borderRadius,
        shape: BoxShape.rectangle,
        border: isSelected
            ? Border.all(color: Colors.blue, width: 2.0)
            : Border.all(color: Colors.white, width: 2.0),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 6.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.network(
              bodyType.image,
              fit: BoxFit.fill,
            ),
            Text(
              bodyType.name,
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
            ),
          ],
        ),
      ),
    );
  }
}
