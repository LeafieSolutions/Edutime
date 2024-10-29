class Room {
  final String? id;
  final String name;
  final int floor;
  final int number;
  final String buildingId;

  Room({
    required this.id,
    required this.name,
    required this.floor,
    required this.number,
    required this.buildingId,
  });

  // Converts Room instance to JSON format
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'floor': floor,
      'number': number,
      'buildingId': buildingId,
    };
  }

  // Creates a Room model from JSON data
  factory Room.fromJson(Map<String, dynamic> json) {
    return Room(
      id: json['id'] as String?,
      name: json['name'] as String,
      floor: json['floor'] as int,
      number: json['number'] as int,
      buildingId: json['buildingId'] as String,
    );
  }
}
