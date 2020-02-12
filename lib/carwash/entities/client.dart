import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

class Client extends Equatable {
  final int id;
  final String name;

  Client({
    @required this.id,
    @required this.name,
  });

  @override
  List<Object> get props => [id, name];
}
