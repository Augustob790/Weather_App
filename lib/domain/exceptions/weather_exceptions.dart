class WeatherException implements Exception {
  final String message;

  WeatherException({required this.message});

  WeatherException.generic()
      : message = 'Não foi possível retornar todos os Clima.';
}
