import 'package:captain_provider_app/core/constants/app_strings.dart';
import 'package:captain_provider_app/views/widgets/glass_card.dart';
import 'package:flutter/material.dart';

class EarningsCard extends StatelessWidget {
  const EarningsCard({
    super.key,
    required this.amount,
    required this.multiplier,
    required this.onMultiplierChanged,
  });

  final double amount;
  final double multiplier;
  final ValueChanged<double> onMultiplierChanged;

  @override
  Widget build(BuildContext context) {
    return GlassCard(
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
              fontSize: 32,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 12),
          const Text(
            'Net earnings after completed trips',
            style: TextStyle(color: Colors.white60, fontSize: 12),
          ),
          const SizedBox(height: 6),
          Text(
            'Surge x${multiplier.toStringAsFixed(1)}',
            style: const TextStyle(color: Colors.white70),
          ),
          Slider(
            value: multiplier,
            min: 1,
            max: 2,
            divisions: 10,
            label: 'x${multiplier.toStringAsFixed(1)}',
            onChanged: onMultiplierChanged,
          ),
        ],
      ),
    );
  }
}
