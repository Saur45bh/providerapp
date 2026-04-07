import 'package:captain_provider_app/models/ride_request.dart';

class FakeRideService {
  Future<List<RideRequest>> fetchRequests() async {
    await Future<void>.delayed(const Duration(milliseconds: 400));
    return [
      RideRequest(
        id: 'R101',
        pickup: 'Koramangala 5th Block',
        drop: 'MG Road Metro',
        fare: 186,
        distanceKm: 6.4,
        riderName: 'Arjun',
      ),
      RideRequest(
        id: 'R102',
        pickup: 'HSR Layout Sector 2',
        drop: 'Electronic City Phase 1',
        fare: 242,
        distanceKm: 9.2,
        riderName: 'Nisha',
      ),
      RideRequest(
        id: 'R103',
        pickup: 'Indiranagar 100ft Road',
        drop: 'Whitefield ITPL',
        fare: 328,
        distanceKm: 13.8,
        riderName: 'Rahul',
      ),
    ];
  }
}
