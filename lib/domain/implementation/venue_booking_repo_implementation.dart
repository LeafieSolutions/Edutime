import 'package:edutime/constants/api_constants.dart';
import 'package:edutime/constants/api_helper_functions.dart';
import 'package:edutime/domain/models/building_model.dart';
import 'package:edutime/domain/models/room_model.dart';
import 'package:edutime/domain/models/venue_model.dart';
import 'package:edutime/domain/repository/venue_booking_repository.dart';
import 'package:flutter/foundation.dart';

class VenueBookingRepoImplementation implements VenueBookingRepository {
  final String venueApiUrl = '${ApiConstants.apiUrl}/venue-bookings';
  final String buildingApiUrl = '${ApiConstants.apiUrl}/buildings';
  final String availableRoomsByTime = '${ApiConstants.apiUrl}/rooms/time';

  // implement an enum for checking the status in the presentation layer
  @override
  Future<void> createAClass(VenueBooking venueBooking) async {
    await ApiHelperFunction().postRequest(availableRoomsByTime, venueBooking.toJson());
  }

  @override
  Future<List<Building>> fetchExistingBuildings() async {
    try {
      final data = await ApiHelperFunction().apiResponse(buildingApiUrl);

      if (kDebugMode) {
        print("API Response: $data");
      } // Debugging response

      // Validate and extract the "data" field
      if (data is Map<String, dynamic> &&
          data['success'] == true &&
          data.containsKey('data') &&
          data['data'] is List) {
        return (data['data'] as List)
            .map((json) => Building.fromJson(json as Map<String, dynamic>))
            .toList();
      } else {
        throw Exception('Unexpected response format: $data');
      }
    } catch (e) {
      if (kDebugMode) {
        print("Error fetching buildings: $e");
      }
      rethrow;
    }
  }

  /// note the [selected building] in the presentation layer
  @override
  Future<List<Room>> fetchAvailableRoom(DateTime startTime, DateTime endTime, String selectedBuildingID) async {
    final requestBody = {
      'startTime': startTime.toIso8601String(),
      'endTime': endTime.toIso8601String(),
      'buildingId': selectedBuildingID
    };

    try {
      final responseData = await ApiHelperFunction().postRequest(availableRoomsByTime, requestBody);

      if(responseData is Map<String, dynamic> &&
          responseData['success'] == true &&
          responseData.containsKey('data') &&
          responseData['data'] is List) {
        return (responseData['data'] as List)
            .map((json) => Room.fromJson(json as Map<String, dynamic>))
            .toList();
      } else {
        throw Exception('Unexpected response format: $responseData');
      }
    } catch (e) {
      // Handle or log the error
      throw Exception('Error fetching available rooms: $e');
    }
  }
}