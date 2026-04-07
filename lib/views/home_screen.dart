import 'package:captain_provider_app/core/constants/app_strings.dart';
import 'package:captain_provider_app/viewmodels/home_view_model.dart';
import 'package:captain_provider_app/views/widgets/earnings_card.dart';
import 'package:captain_provider_app/views/widgets/ride_request_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final vm = context.watch<HomeViewModel>();

    return Scaffold(
      appBar: AppBar(
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
      body: RefreshIndicator(
        onRefresh: vm.loadRideRequests,
        child: ListView(
          physics: const AlwaysScrollableScrollPhysics(),
          padding: const EdgeInsets.all(16),
          children: [
            EarningsCard(amount: vm.todayEarnings),
            const SizedBox(height: 16),
            Text(
              AppStrings.incomingRides,
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 8),
            if (vm.isLoading)
              const Center(child: Padding(
                padding: EdgeInsets.all(16),
                child: CircularProgressIndicator(),
              ))
            else if (vm.rides.isEmpty)
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 20),
                child: Center(child: Text(AppStrings.noRides)),
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
    );
  }
}
