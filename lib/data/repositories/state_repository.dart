import 'package:app_clima/domain/models/info_weather_model.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

import '../../constants/apiroutes.dart';
import '../../domain/exceptions/state_exceptions.dart';

abstract class StateRepository {
  Future<Clima> getAllStates();
}

class StateRepositoryImpl implements StateRepository {
  final http.Client httpClient;
  late Clima clima;
  StateRepositoryImpl({required this.httpClient});

  @override
  Future<Clima> getAllStates() async {
    try {
      Response response = await httpClient.post(
          Uri.parse(ApiRoutes.apiEndpointInfo),
          headers: ApiRoutes.requestHeaders);
      if (response.statusCode == 200) {
        clima = climaFromJson(response.body);
      } else {
        response.statusCode.toString();
      }
      return clima;
    } catch (e) {
      throw StateException.generic();
    }
  }
}
