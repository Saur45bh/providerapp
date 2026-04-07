import 'package:captain_provider_app/core/constants/app_strings.dart';
import 'package:captain_provider_app/viewmodels/home_view_model.dart';
import 'package:captain_provider_app/views/widgets/active_ride_card.dart';
import 'package:captain_provider_app/views/widgets/earnings_card.dart';
import 'package:captain_provider_app/views/widgets/logo_header.dart';
import 'package:captain_provider_app/views/widgets/ride_request_card.dart';
import 'package:captain_provider_app/views/widgets/stat_tile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final vm = context.watch<HomeViewModel>();

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(AppStrings.appTitle),
        actions: [
          Row(
            children: [
              Text(vm.isOnline ? AppStrings.online : AppStrings.offline),
              Switch(
                value: vm.isOnline,
                onChanged: (_) => vm.toggleOnlineStatus(),
              ),
            ],
          ),
        ],
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Color(0xFF0F172A), Color(0xFF111827), Color(0xFF1D4ED8)],
          ),
        ),
        child: SafeArea(
          child: RefreshIndicator(
            onRefresh: vm.loadRideRequests,
            child: ListView(
              physics: const AlwaysScrollableScrollPhysics(),
              padding: const EdgeInsets.all(16),
              children: [
                const LogoHeader(),
                const SizedBox(height: 12),
                const Text(
                  AppStrings.welcomeTitle,
                  style: TextStyle(color: Colors.white70),
                ),
                const SizedBox(height: 12),
                Row(
                  children: [
                    StatTile(
                      label: AppStrings.acceptanceRate,
                      value: '${vm.acceptanceRate.toStringAsFixed(0)}%',
                      icon: Icons.insights_rounded,
                    ),
                    const SizedBox(width: 10),
                    StatTile(
                      label: AppStrings.completedTrips,
                      value: vm.completedRides.length.toString(),
                      icon: Icons.check_circle_outline,
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                EarningsCard(
                  amount: vm.todayEarnings,
                  multiplier: vm.surgeMultiplier,
                  onMultiplierChanged: vm.setSurgeMultiplier,
                ),
                const SizedBox(height: 8),
                const Text(
                  AppStrings.quickActions,
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
                const SizedBox(height: 8),
                Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: const [
                    Chip(label: Text('Navigate'), avatar: Icon(Icons.navigation)),
                    Chip(label: Text('Call Rider'), avatar: Icon(Icons.call)),
                    Chip(label: Text('Support'), avatar: Icon(Icons.support_agent)),
                  ],
                ),
                const SizedBox(height: 8),
                SwitchListTile.adaptive(
                  title: const Text(
                    AppStrings.autoAccept,
                    style: TextStyle(color: Colors.white),
                  ),
                  value: vm.autoAccept,
                  onChanged: vm.setAutoAccept,
                ),
                const SizedBox(height: 8),
                if (vm.activeRide != null) ...[
                  const Text(
                    AppStrings.activeRide,
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                  const SizedBox(height: 8),
                  ActiveRideCard(
                    request: vm.activeRide!,
                    onComplete: vm.completeActiveRide,
                  ),
                  const SizedBox(height: 14),
                ],
                const Text(
                  AppStrings.incomingRides,
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
                const SizedBox(height: 8),
                if (vm.isLoading)
                  const Center(
                    child: Padding(
                      padding: EdgeInsets.all(16),
                      child: CircularProgressIndicator(),
                    ),
                  )
                else if (vm.rides.isEmpty)
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 20),
                    child: Center(
                      child: Text(
                        AppStrings.noRides,
                        style: TextStyle(color: Colors.white70),
                      ),
                    ),
                  )
                else
                  ...vm.rides.map(
                    (ride) => RideRequestCard(
                      request: ride,
                      onAccept: () => vm.acceptRide(ride.id),
                      onDecline: () => vm.declineRide(ride.id),
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
