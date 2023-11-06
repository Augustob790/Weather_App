import 'package:app_clima/data/repositories/weather_repository.dart';
import 'package:app_clima/domain/usecases/get_all_weather.usecases.dart';
import 'package:app_clima/presentation/controller/details_screen_controller.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

import '../../data/repositories/state_repository.dart';
import '../../domain/usecases/get_all_states.usecases.dart';
import '../controller/feedback_controller.dart';
import '../controller/states_controller.dart';

class DependecyInjectionsProvider extends StatelessWidget {
  final Widget? child;

  const DependecyInjectionsProvider({super.key, this.child});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<StateRepository>(
          create: (_) => StateRepositoryImpl(httpClient: http.Client()),
        ),
        Provider<WeatherRepository>(
          create: (_) => WeatherRepositoryImpl(httpClient: http.Client()),
        ),
        Provider<GetAllStatesUsecase>(
          create: (context) => GetAllStatesUsecaseImpl(
            repository: context.read<StateRepository>(),
          ),
        ),
        Provider<GetAllWeatherUsecase>(
          create: (context) => GetAllWeatherUsecaseImpl(
            repository: context.read<WeatherRepository>(),
          ),
        ),
        ChangeNotifierProvider(
          create: (context) => StateController(
            getAllStatesUsecase: context.read<GetAllStatesUsecase>(),
          ),
        ),
        ChangeNotifierProvider(
          create: (context) => DetailsScreenController(
            stateController: context.read<StateController>(),
          ),
        ),
        ChangeNotifierProvider(
          create: (context) => FeedbackController(
            getAllWeatherUsecase: context.read<GetAllWeatherUsecase>(),
          ),
        ),
      ],
      child: child,
    );
  }
}
