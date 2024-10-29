import '../entities/recurring_type.dart';

class VenueBooking {
  //final String? id;
  final DateTime startTime;
  final DateTime endTime;
  final RecurringType recurringType;
  final String userId;
  final String roomId;
  final String academicCourseId;
  final String academicUnitId;
  final String selectedBuildingID;

  VenueBooking({
    //this.id,
    required this.startTime,
    required this.endTime,
    required this.recurringType,
    required this.userId,
    required this.roomId,
    required this.academicCourseId,
    required this.academicUnitId,
    required this.selectedBuildingID
  });

  // Convert VenueBooking instance to JSON format
  Map<String, dynamic> toJson() {
    return {
      //'id': id,
      'startTime': startTime.toIso8601String(),
      'endTime': endTime.toIso8601String(),
      'recurringType': recurringType.toString().split('.').last.toUpperCase(),
      'userId': userId,
      'roomId': roomId,
      'academicCourseId': academicCourseId,
      'academicUnitId': academicUnitId,
      'buildingID': selectedBuildingID,
    };
  }

  // Creates a VenueBooking model from JSON data
  factory VenueBooking.fromJson(Map<String, dynamic> json) {
    return VenueBooking(
      //id: json['id'] as String?,
      startTime: DateTime.parse(json['startTime'] as String),
      endTime: DateTime.parse(json['endTime'] as String),
      recurringType: RecurringType.values.firstWhere(
              (e) => e.toString().split('.').last.toLowerCase() == json['recurringType']),
      userId: json['userId'] as String,
      roomId: json['roomId'] as String,
      academicCourseId: json['academicCourseId'] as String,
      academicUnitId: json['academicUnitId'] as String,
      selectedBuildingID: json['buildingID']
    );
  }
}
