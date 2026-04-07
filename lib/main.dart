import 'package:captain_provider_app/repositories/ride_repository.dart';
import 'package:captain_provider_app/services/fake_ride_service.dart';
import 'package:captain_provider_app/viewmodels/home_view_model.dart';
import 'package:captain_provider_app/views/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const CaptainProviderApp());
}

class CaptainProviderApp extends StatelessWidget {
  const CaptainProviderApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<FakeRideService>(create: (_) => FakeRideService()),
        ProxyProvider<FakeRideService, RideRepository>(
          update: (_, service, __) => RideRepository(service),
        ),
        ChangeNotifierProxyProvider<RideRepository, HomeViewModel>(
          create: (_) => HomeViewModel(),
          update: (_, repository, viewModel) {
            final vm = viewModel ?? HomeViewModel();
            vm.bind(repository);
            return vm;
          },
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Captain Provider',
        theme: ThemeData(
          useMaterial3: true,
          brightness: Brightness.dark,
          colorScheme: ColorScheme.fromSeed(
            seedColor: const Color(0xFF00B894),
            brightness: Brightness.dark,
          ),
        ),
        home: const HomeScreen(),
      ),
    );
  }
}
