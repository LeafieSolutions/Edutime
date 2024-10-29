import 'package:edutime/domain/models/building_model.dart';
import 'package:edutime/domain/models/room_model.dart';
import 'package:edutime/domain/models/venue_model.dart';

abstract class VenueBookingRepository {
  // Should be implemented once the starting time, ending time and selected building have been populated
  Future<List<Room>> fetchAvailableRoom(DateTime startTime, DateTime endTime, String selectedBuildingID);
  // should be implemented upon page opening
  Future<List<Building>> fetchExistingBuildings();
  // on clicking the save button, the function should be implemented
  Future<void> createAClass(VenueBooking venueBooking);
}