import 'package:captain_provider_app/models/ride_request.dart';
import 'package:captain_provider_app/views/widgets/glass_card.dart';
import 'package:flutter/material.dart';

class ActiveRideCard extends StatelessWidget {
  const ActiveRideCard({
    super.key,
    required this.request,
    required this.onComplete,
  });

  final RideRequest request;
  final VoidCallback onComplete;

  @override
  Widget build(BuildContext context) {
    return GlassCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Row(
            children: [
              Icon(Icons.navigation_rounded, color: Colors.white),
              SizedBox(width: 8),
              Text(
                'On Trip',
                style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Text('Pickup: ${request.pickup}',
              style: const TextStyle(color: Colors.white70)),
          Text('Drop: ${request.drop}',
              style: const TextStyle(color: Colors.white70)),
          const SizedBox(height: 12),
          SizedBox(
            width: double.infinity,
            child: FilledButton.icon(
              onPressed: onComplete,
              icon: const Icon(Icons.check_circle_outline),
              label: const Text('Complete Ride'),
            ),
          ),
        ],
      ),
    );
  }
}
