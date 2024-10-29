import 'package:edutime/constants/api_constants.dart';
import 'package:edutime/constants/api_helper_functions.dart';
import 'package:edutime/domain/models/building_model.dart';
import 'package:edutime/domain/models/room_model.dart';
import 'package:edutime/domain/models/venue_model.dart';
import 'package:edutime/domain/repository/venue_booking_repository.dart';

class VenueBookingRepoImplementation implements VenueBookingRepository {
  final String venueApiUrl = '${ApiConstants.apiUrl}/venue-bookings';
  final String buildingApiUrl = '${ApiConstants.apiUrl}/buildings';
  final String availableRoomsByTime = '${ApiConstants.apiUrl}/rooms/time';

  // implement an enum for checking the status in the presentation layer
  @override
  Future<void> createAClass(VenueBooking venueBooking) async {
    await ApiHelperFunction().postRequest(availableRoomsByTime, venueBooking.toJson());
  }

  /// note the [selected building] in the presentation layer
  @override
  Future<List<Room>> fetchAvailableRoom(DateTime startTime, DateTime endTime, String selectedBuildingID) async {
    final requestBody = {
      'startTime': startTime.toIso8601String(),
      'endTime': endTime.toIso8601String(),
      'buildingId': selectedBuildingID
    };

    final responseData = await ApiHelperFunction().postRequest(availableRoomsByTime, requestBody);

    return (responseData as List).map((json) => Room.fromJson(json)).toList();
  }

  @override
  Future<List<Building>> fetchExistingBuildings() async {
    final data = await ApiHelperFunction().apiResponse(buildingApiUrl);

    // TODO: Handle api response errors
    // assuming that the api response is the correct one
    
    return data.map((json) => Building.fromJson(json as Map<String, dynamic>)).toList();
  }
}