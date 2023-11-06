import 'package:http/http.dart' as http;
import 'package:http/http.dart';

import '../../constants/apiroutes.dart';
import '../../domain/exceptions/weather_exceptions.dart';
import '../../domain/models/weather_model.dart';

abstract class WeatherRepository {
  Future<Tempo> getAllWeather();
}

class WeatherRepositoryImpl implements WeatherRepository {
  final http.Client httpClient;
  late Tempo tempo;
  WeatherRepositoryImpl({required this.httpClient});

  @override
  Future<Tempo> getAllWeather() async {
    try {
      Response response = await httpClient.post(
          Uri.parse(ApiRoutes.apiEndpointTempo),
          headers: ApiRoutes.requestHeaders);
      if (response.statusCode == 200) {
        tempo = tempoFromJson(response.body);
      } else {
        response.statusCode.toString();
      }
      return tempo;
    } catch (e) {
      throw WeatherException.generic();
    }
  }
}
