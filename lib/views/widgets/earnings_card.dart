import 'package:captain_provider_app/core/constants/app_strings.dart';
import 'package:flutter/material.dart';

class EarningsCard extends StatelessWidget {
  const EarningsCard({super.key, required this.amount});

  final double amount;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: const Color(0xFF00B894),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              AppStrings.todayEarnings,
              style: TextStyle(color: Colors.white70),
            ),
            const SizedBox(height: 8),
            Text(
              '₹${amount.toStringAsFixed(0)}',
              style: const TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
