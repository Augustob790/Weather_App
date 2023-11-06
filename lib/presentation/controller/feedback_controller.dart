import 'package:app_clima/domain/models/weather_model.dart';
import 'package:flutter/material.dart';
import '../../domain/exceptions/state_exceptions.dart';
import '../../domain/usecases/get_all_weather.usecases.dart';

class FeedbackController extends ChangeNotifier {
  final GetAllWeatherUsecase getAllWeatherUsecase;

  FeedbackController({
    required this.getAllWeatherUsecase,
  });

  late Tempo _weather;
  Tempo get weather => _weather;
  String _error = '';
  String get error => _error;

  Future<void> getAllWeather() async {
    try {
      _weather = await getAllWeatherUsecase();
    } on StateException catch (e) {
      _error = e.message;
    }
    notifyListeners();
  }
}
