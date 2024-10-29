import 'package:edutime/domain/models/venue_model.dart';

import '../../constants/api_constants.dart';
import '../entities/role.dart';
import 'academic_details_model.dart';
import '../../constants/api_helper_functions.dart';
import 'online_venue_model.dart';

class User {
  final String id;
  final String email;
  final String name;
  final String? profileUrl;
  final List<Role> roles;
  final List<AcademicDetail> academicDetails;
  final List<VenueBooking> venueBookings;
  final List<OnlineMeeting> onlineMeetings;

  User({
    required this.id,
    required this.email,
    required this.name,
    this.profileUrl,
    required this.roles,
    required this.academicDetails,
    required this.venueBookings,
    required this.onlineMeetings,
  });

  Map<String ,dynamic> toJson(){
    return {
      'id': id,
      'email': email,
      'name': name,
      'profileUrl': profileUrl,
      'role': roles,
      'academicDetail': academicDetails,
      'venueBooking': venueBookings,
      'onlineMeeting': onlineMeetings
    };
  }

  //factory User.fromAPI() {
    //final data = ApiHelperFunction().apiResponse('${ApiConstants.apiUrl}/users') as Map<String, dynamic>;
    //return User(id: id, email: email, name: name, roles: roles, academicDetails: academicDetails, venueBookings: venueBookings, onlineMeetings: onlineMeetings)
  //}
}