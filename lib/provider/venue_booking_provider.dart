import 'package:edutime/domain/implementation/venue_booking_repo_implementation.dart';
import 'package:edutime/domain/usecases/venue_booking_usecases.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

import '../domain/models/building_model.dart';
import '../domain/models/room_model.dart';
import '../domain/models/venue_model.dart';

enum VenueStatus {
  uninitialized,
  fetching,
  found,
  failed,
}

class VenueBookingProvider with ChangeNotifier {
  final FetchExistingBuildingsUseCase _fetchExistingBuildingsUseCase;
  final FetchAvailableRoomUseCase _fetchAvailableRoomUseCase;
  final CreateClassUseCase _createClassUseCase;

  VenueBookingProvider(VenueBookingRepoImplementation repository)
      : _fetchExistingBuildingsUseCase = FetchExistingBuildingsUseCase(repository),
        _fetchAvailableRoomUseCase = FetchAvailableRoomUseCase(repository),
        _createClassUseCase = CreateClassUseCase(repository);

  List<Room> _rooms = [];
  List<Building> _buildings = [];
  VenueStatus _status = VenueStatus.uninitialized;
  String? _error;

  List<Room> get availableRooms => _rooms;
  List<Building> get existingBuildings => _buildings;
  VenueStatus get venueStatus => _status;
  String? get errorMessage => _error;

  final Map<String, dynamic> _venueDetails = {
    'startTime': null,
    'endTime': null,
    'recurringType': null,
    'userId': null,
    'roomId': null,
    'academicCourseId': null,
    'academicUnitId': null,
    'buildingID': null
  };


  Future<void> getExistingBuildings() async {
    _status = VenueStatus.fetching;
    notifyListeners();

    try {
      _buildings = await _fetchExistingBuildingsUseCase.execute();
      _status = VenueStatus.found;
      _error = null;
      if (kDebugMode) {
        print(_buildings);
      }
    } catch (e) {
      _status = VenueStatus.failed;
      _error = 'Failed to load buildings: $e';
    }
    notifyListeners();
  }

  Future<void> getAvailableRooms(DateTime startTime, DateTime endTime, String buildingId) async {
    _status = VenueStatus.fetching;
    notifyListeners();

    try {
      _rooms = await _fetchAvailableRoomUseCase.execute(startTime, endTime, buildingId);
      _status = VenueStatus.found;
      _error = null;
    } catch (e) {
      _status = VenueStatus.failed;
      _error = 'Failed to load available rooms: $e';
    }
    notifyListeners();
  }

  Future<void> createClass(VenueBooking venueBooking) async {
    _status = VenueStatus.fetching;
    notifyListeners();

    try {
      await _createClassUseCase.execute(venueBooking);
      _status = VenueStatus.found;
      _error = null;
    } catch (e) {
      _status = VenueStatus.failed;
      _error = 'Failed to create class: $e';
    }
    notifyListeners();
  }

  void updateVenueDetails(String key, dynamic value) {
    // Check if the key exists in the map before updating
    if (_venueDetails.containsKey(key)) {
      _venueDetails[key] = value;
      notifyListeners();
      if (kDebugMode) {
        print('Updated $key to $value');
      }
    } else {
      if (kDebugMode) {
        print('Key $key does not exist in _venueDetails');
      }
    }
  }
  // TODO: Ensure to notify the user if all details are not fed in
}