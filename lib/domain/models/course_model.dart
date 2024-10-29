import 'package:edutime/domain/models/unit_model.dart';

class Course {
  final String? id;
  final String name;
  final int duration;
  final String code;
  final List<Unit> units;

  Course({
    required this.id,
    required this.name,
    required this.duration,
    required this.code,
    required this.units,
  });
}
