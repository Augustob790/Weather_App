import '../../data/repositories/weather_repository.dart';
import '../exceptions/state_exceptions.dart';
import '../models/weather_model.dart';

abstract class GetAllWeatherUsecase {
  Future<Tempo> call();
}

class GetAllWeatherUsecaseImpl implements GetAllWeatherUsecase {
  final WeatherRepository repository;

  GetAllWeatherUsecaseImpl({required this.repository});

  @override
  Future<Tempo> call() async {
    try {
      return repository.getAllWeather();
    } on StateException {
      rethrow;
    }
  }
}
