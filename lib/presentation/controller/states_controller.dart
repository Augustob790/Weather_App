import 'package:app_clima/domain/models/info_weather_model.dart';
import 'package:app_clima/presentation/helpers/helpers.dart';
import 'package:flutter/material.dart';
import '../../domain/exceptions/state_exceptions.dart';
import '../../domain/models/dia_model.dart';
import '../../domain/models/periodo_model.dart';
import '../../domain/usecases/get_all_states.usecases.dart';

class StateController extends ChangeNotifier {
  final GetAllStatesUsecase getAllStatesUsecase;

  StateController({
    required this.getAllStatesUsecase,
  });

  late Clima _states;
  List<Estado> get states => _states.result.estados;
  String _error = '';
  String get error => _error;
  Estado atual = Estado(estado: "", dias: []);
  List<Periodo> periodo = [];
  late String graus;
  late String tempo;
  bool isLoading = true;
  late List<Dia> asx;
  bool isSorted = false;
  String weather = '';
  String get weathers => weather;

  String grausState = '';
  String get grausStates => grausState;

  Future<void> getAllStates() async {
    try {
      _states = await getAllStatesUsecase();
      isLoading = false;
    } on StateException catch (e) {
      _error = e.message;
    }
    statesInfo();
    notifyListeners();
  }

  tempoInfo(String dia) {
    if (Helpers.data.hour >= 6 && Helpers.data.hour < 12) {
      tempo = atual.dias.map((e) => e.get(dia)).first.manha.first.tempo ?? '';
    } else if (Helpers.data.hour >= 12 && Helpers.data.hour < 18) {
      tempo = atual.dias.map((e) => e.get(dia)).first.tarde.first.tempo ?? '';
    } else {
      tempo = atual.dias.map((e) => e.get(dia)).first.noite.first.tempo ?? '';
    }

    return tempo;
  }

  grausInfo(String dia) {
    if (Helpers.data.hour >= 6 && Helpers.data.hour < 12) {
      graus = atual.dias.map((e) => e.get(dia)).first.manha.first.graus ?? '';
    } else if (Helpers.data.hour >= 12 && Helpers.data.hour < 18) {
      graus = atual.dias.map((e) => e.get(dia)).first.tarde.first.graus ?? '';
    } else {
      graus = atual.dias.map((e) => e.get(dia)).first.noite.first.graus ?? '';
    }

    return graus;
  }

  pageDetails(String estadoAtual) {
    atual = states.firstWhere((estado) => estado.estado == estadoAtual);
    periodo.clear();
    if (Helpers.data.hour >= 6 && Helpers.data.hour < 12) {
      periodo = atual.dias.map((e) => e.get(Helpers.weekdayName)).first.manha;
    } else if (Helpers.data.hour >= 12 && Helpers.data.hour < 18) {
      periodo = atual.dias.map((e) => e.get(Helpers.weekdayName)).first.tarde;
    } else {
      periodo = atual.dias.map((e) => e.get(Helpers.weekdayName)).first.noite;
    }
    notifyListeners();
  }

  statesInfo() async {
    for (int i = 0; i < states.length; i++) {
      if (Helpers.data.hour >= 6 && Helpers.data.hour < 12) {
        weather = states[i]
                .dias
                .map((e) => e.get(Helpers.weekdayName))
                .first
                .manha
                .first
                .tempo ??
            '';
        grausState = states[i]
                .dias
                .map((e) => e.get(Helpers.weekdayName))
                .first
                .manha
                .first
                .graus ??
            '';
      } else if (Helpers.data.hour >= 12 && Helpers.data.hour < 18) {
        weather = states[i]
                .dias
                .map((e) => e.get(Helpers.weekdayName))
                .first
                .tarde
                .first
                .tempo ??
            '';

        grausState = states[i]
                .dias
                .map((e) => e.get(Helpers.weekdayName))
                .first
                .tarde
                .first
                .graus ??
            '';
      } else {
        weather = states[i]
                .dias
                .map((e) => e.get(Helpers.weekdayName))
                .first
                .noite
                .first
                .tempo ??
            '';
        grausState = states[i]
                .dias
                .map((e) => e.get(Helpers.weekdayName))
                .first
                .noite
                .first
                .graus ??
            '';
      }
    }
  }
}
