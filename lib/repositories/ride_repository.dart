import 'package:captain_provider_app/models/ride_request.dart';
import 'package:captain_provider_app/services/fake_ride_service.dart';

class RideRepository {
  RideRepository(this._service);

  final FakeRideService _service;

  Future<List<RideRequest>> getPendingRides() {
    return _service.fetchRequests();
  }
}
