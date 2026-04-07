import 'package:captain_provider_app/models/ride_request.dart';
import 'package:captain_provider_app/repositories/ride_repository.dart';
import 'package:flutter/foundation.dart';

class HomeViewModel extends ChangeNotifier {
  RideRepository? _repository;

  bool _isOnline = true;
  bool _isLoading = false;
  double _todayEarnings = 1240;
  final List<RideRequest> _rides = [];

  bool get isOnline => _isOnline;
  bool get isLoading => _isLoading;
  double get todayEarnings => _todayEarnings;
  List<RideRequest> get rides => List.unmodifiable(_rides);

  void bind(RideRepository repository) {
    final shouldInit = _repository == null;
    _repository = repository;
    if (shouldInit) {
      loadRideRequests();
    }
  }

  Future<void> loadRideRequests() async {
    if (_repository == null) return;
    _isLoading = true;
    notifyListeners();

    final fetched = await _repository!.getPendingRides();
    _rides
      ..clear()
      ..addAll(fetched);

    _isLoading = false;
    notifyListeners();
  }

  void toggleOnlineStatus() {
    _isOnline = !_isOnline;
    notifyListeners();
  }

  void acceptRide(String rideId) {
    final ride = _rides.where((r) => r.id == rideId).firstOrNull;
    if (ride == null || ride.status != RideStatus.pending) return;

    ride.status = RideStatus.accepted;
    _todayEarnings += ride.fare;
    _rides.removeWhere((r) => r.id == rideId);
    notifyListeners();
  }

  void declineRide(String rideId) {
    _rides.removeWhere((ride) => ride.id == rideId);
    notifyListeners();
  }
}

extension _FirstOrNull<E> on Iterable<E> {
  E? get firstOrNull => isEmpty ? null : first;
}
