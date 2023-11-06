import 'dart:convert';

import 'package:app_clima/domain/models/week_model.dart';

Result resultFromJson(String str) => Result.fromJson(json.decode(str));

String resultToJson(Result data) => json.encode(data.toJson());

Clima climaFromJson(String str) => Clima.fromJson(json.decode(str));

String climaToJson(Clima data) => json.encode(data.toJson());

class Clima {
  final Result result;

  Clima({
    required this.result,
  });

  factory Clima.fromJson(Map<String, dynamic> json) => Clima(
        result: Result.fromJson(json["result"]),
      );

  Map<String, dynamic> toJson() => {
        "result": result.toJson(),
      };
}

class Result {
  final List<Estado> estados;

  Result({
    required this.estados,
  });

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        estados:
            List<Estado>.from(json["estados"].map((x) => Estado.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "estados": List<dynamic>.from(estados.map((x) => x.toJson())),
      };
}

class Estado {
  final String estado;
  final List<Semana> dias;

  Estado({
    required this.estado,
    required this.dias,
  });

  factory Estado.fromJson(Map<String, dynamic> json) => Estado(
        estado: json["estado"],
        dias: List<Semana>.from(json["dias"].map((x) => Semana.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "estado": estado,
        "dias": List<dynamic>.from(dias.map((x) => x.toJson())),
      };
}

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
