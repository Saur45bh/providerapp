import 'package:captain_provider_app/models/ride_request.dart';
import 'package:captain_provider_app/repositories/ride_repository.dart';
import 'package:flutter/foundation.dart';

class HomeViewModel extends ChangeNotifier {
  RideRepository? _repository;

  bool _isOnline = true;
  bool _isLoading = false;
  bool _autoAccept = false;
  double _todayEarnings = 1240;
  double _surgeMultiplier = 1.0;
  int _acceptedCount = 0;
  int _declinedCount = 0;

  final List<RideRequest> _rides = [];
  final List<RideRequest> _completedRides = [];
  RideRequest? _activeRide;

  bool get isOnline => _isOnline;
  bool get isLoading => _isLoading;
  bool get autoAccept => _autoAccept;
  double get todayEarnings => _todayEarnings;
  double get surgeMultiplier => _surgeMultiplier;
  RideRequest? get activeRide => _activeRide;
  List<RideRequest> get rides => List.unmodifiable(_rides);
  List<RideRequest> get completedRides => List.unmodifiable(_completedRides);

  int get acceptedCount => _acceptedCount;
  int get declinedCount => _declinedCount;

  double get acceptanceRate {
    final totalDecisions = _acceptedCount + _declinedCount;
    if (totalDecisions == 0) return 100;
    return (_acceptedCount / totalDecisions) * 100;
  }

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

    if (_autoAccept && _activeRide == null && _rides.isNotEmpty) {
      acceptRide(_rides.first.id, silent: true);
    }

    _isLoading = false;
    notifyListeners();
  }

  void toggleOnlineStatus() {
    _isOnline = !_isOnline;
    notifyListeners();
  }

  void setAutoAccept(bool value) {
    _autoAccept = value;
    if (_autoAccept && _activeRide == null && _rides.isNotEmpty) {
      acceptRide(_rides.first.id, silent: true);
    }
    notifyListeners();
  }

  void setSurgeMultiplier(double value) {
    _surgeMultiplier = value.clamp(1.0, 2.0).toDouble();
    notifyListeners();
  }

  void acceptRide(String rideId, {bool silent = false}) {
    if (_activeRide != null) return;

    final ride = _rides.where((r) => r.id == rideId).firstOrNull;
    if (ride == null || ride.status != RideStatus.pending) return;

    ride.status = RideStatus.accepted;
    _activeRide = ride;
    _rides.removeWhere((r) => r.id == rideId);
    _acceptedCount += 1;

    if (!silent) {
      notifyListeners();
    }
  }

  void completeActiveRide() {
    if (_activeRide == null) return;

    final completedRide = _activeRide!;
    _todayEarnings += completedRide.fare * _surgeMultiplier;
    _completedRides.insert(0, completedRide);
    _activeRide = null;

    if (_autoAccept && _rides.isNotEmpty) {
      acceptRide(_rides.first.id, silent: true);
    }

    notifyListeners();
  }

  void declineRide(String rideId) {
    _declinedCount += 1;
    _rides.removeWhere((ride) => ride.id == rideId);
    notifyListeners();
  }
}

extension _FirstOrNull<E> on Iterable<E> {
  E? get firstOrNull => isEmpty ? null : first;
}
