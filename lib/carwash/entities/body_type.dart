import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

class BodyType extends Equatable {
  final int id;
  final String name;
  final String image;

  BodyType({
    @required this.id,
    @required this.name,
    @required this.image,
  })  : assert(id != null),
        assert(name != null),
        assert(image != null);

  @override
  List<Object> get props => [id, name, image];
}
