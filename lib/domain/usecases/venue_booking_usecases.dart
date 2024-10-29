import 'package:edutime/domain/models/building_model.dart';
import 'package:edutime/domain/models/venue_model.dart';
import 'package:edutime/domain/repository/venue_booking_repository.dart';

import '../models/room_model.dart';

class FetchAvailableRoomUseCase {
  final VenueBookingRepository venueBookingRepository;

  FetchAvailableRoomUseCase(this.venueBookingRepository);

  Future<List<Room>> execute(DateTime startTime, DateTime endTime, String selectedBuildingID) {
    return venueBookingRepository.fetchAvailableRoom(startTime, endTime, selectedBuildingID);
  }
}

class FetchExistingBuildingsUseCase {
  final VenueBookingRepository venueBookingRepository;

  FetchExistingBuildingsUseCase(this.venueBookingRepository);

  Future<List<Building>> execute() {
    return venueBookingRepository.fetchExistingBuildings();
  }
}

class CreateClassUseCase {
  final VenueBookingRepository venueBookingRepository;

  CreateClassUseCase(this.venueBookingRepository);

  Future<void> execute(VenueBooking venueBooking) {
    return venueBookingRepository.createAClass(venueBooking);
  }
}