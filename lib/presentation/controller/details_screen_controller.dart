import 'package:app_clima/presentation/helpers/helpers.dart';
import 'package:flutter/material.dart';

import '../../domain/models/info_weather_model.dart';
import '../../domain/models/periodo_model.dart';
import 'states_controller.dart';

class DetailsScreenController extends ChangeNotifier {
  final StateController stateController;

  DetailsScreenController({
    required this.stateController,
  });

  List<Estado> get states => stateController.states;
  Estado atual = Estado(estado: "", dias: []);
  List<Periodo> manha = [];
  List<Periodo> tarde = [];
  List<Periodo> noite = [];
  late String graus;
  late String tempo;
  late String weekdayName;
  late String weekdayNameView;
  String images = '';
  String get image => images;

  String weather = '';
  String get weathers => weather;

  String grausState = '';
  String get grausStates => grausState;

  pageDetails(String estadoAtual, int index) {
    weekdayName = Helpers.semanasGetModel[index];
    weekdayNameView = Helpers.semana[index];
    atual = states.firstWhere((estado) => estado.estado == estadoAtual);
    manha = atual.dias.map((e) => e.get(weekdayName)).first.manha;
    tarde = atual.dias.map((e) => e.get(weekdayName)).first.tarde;
    noite = atual.dias.map((e) => e.get(weekdayName)).first.noite;
    tempoInfo(weekdayName);
    grausInfo(weekdayName);
    statesInfo(weekdayName);
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

  statesInfo(String dia) async {
    for (int i = 0; i < states.length; i++) {
      if (Helpers.data.hour >= 6 && Helpers.data.hour < 12) {
        weather =
            states[i].dias.map((e) => e.get(dia)).first.manha.first.tempo ?? '';
        grausState =
            states[i].dias.map((e) => e.get(dia)).first.manha.first.graus ?? '';
      } else if (Helpers.data.hour >= 12 && Helpers.data.hour < 18) {
        weather =
            states[i].dias.map((e) => e.get(dia)).first.tarde.first.tempo ?? '';

        grausState =
            states[i].dias.map((e) => e.get(dia)).first.tarde.first.graus ?? '';
      } else {
        weather =
            states[i].dias.map((e) => e.get(dia)).first.noite.first.tempo ?? '';
        grausState =
            states[i].dias.map((e) => e.get(dia)).first.noite.first.graus ?? '';
      }
    }
  }
}
