import '../../data/repositories/state_repository.dart';
import '../exceptions/state_exceptions.dart';
import '../models/info_weather_model.dart';

abstract class GetAllStatesUsecase {
  Future<Clima> call();
}

class GetAllStatesUsecaseImpl implements GetAllStatesUsecase {
  final StateRepository repository;

  GetAllStatesUsecaseImpl({required this.repository});

  @override
  Future<Clima> call() async {
    try {
      return repository.getAllStates();
    } on StateException {
      rethrow;
    }
  }
}
