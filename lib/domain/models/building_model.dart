import '../entities/gates.dart';

class Building {
  final String? id;
  final String name;
  final String initials;
  final int floors;
  final List<Gate> gates;
  // final List<Room> rooms;

  Building({
    required this.id,
    required this.name,
    required this.initials,
    required this.floors,
    required this.gates,
    // required this.rooms,
  });

  // Converts Building object to JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'initials': initials,
      'floors': floors,
      'gates': gates.map((gate) => gate.name.toUpperCase()).toList(),
    };
  }

  // Converts JSON to Building Model
  factory Building.fromJson(Map<String, dynamic> json) {
    return Building(
      id: json['id'] as String?,
      name: json['name'] as String,
      initials: json['initials'] as String,
      floors: json['floors'] as int,
      gates: (json['gates'] as List<dynamic>)
          .where((gate) => Gate.values.any((e) => e.name.toLowerCase() == gate.toString().toLowerCase()))
          .map((gate) => Gate.values.firstWhere(
            (e) => e.name.toLowerCase() == gate.toString().toLowerCase()))
          .toList(),
    );
  }
}