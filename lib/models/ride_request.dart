enum RideStatus { pending, accepted, declined }

class RideRequest {
  RideRequest({
    required this.id,
    required this.pickup,
    required this.drop,
    required this.fare,
    required this.distanceKm,
    required this.riderName,
    this.status = RideStatus.pending,
  });

  final String id;
  final String pickup;
  final String drop;
  final double fare;
  final double distanceKm;
  final String riderName;
  RideStatus status;
}
