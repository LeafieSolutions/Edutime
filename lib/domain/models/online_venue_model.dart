import '../entities/recurring_type.dart';

class OnlineMeeting {
  final String? id;
  final String meetingUrl;
  final DateTime startTime;
  final DateTime endTime;
  final bool recurring;
  final RecurringType recurringType;
  final String userId;
  final String academicCourseId;
  final String academicUnitId;

  OnlineMeeting({
    required this.id,
    required this.meetingUrl,
    required this.startTime,
    required this.endTime,
    required this.recurring,
    required this.recurringType,
    required this.userId,
    required this.academicCourseId,
    required this.academicUnitId,
  });
}
