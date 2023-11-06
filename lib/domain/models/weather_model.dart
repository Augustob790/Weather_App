import 'dart:convert';

Tempo tempoFromJson(String str) => Tempo.fromJson(json.decode(str));

String tempoToJson(Tempo data) => json.encode(data.toJson());

class Tempo {
  final Result result;

  Tempo({
    required this.result,
  });

  factory Tempo.fromJson(Map<String, dynamic> json) => Tempo(
        result: Result.fromJson(json["result"]),
      );

  Map<String, dynamic> toJson() => {
        "result": result.toJson(),
      };
}

class Result {
  final List<String> tempo;

  Result({
    required this.tempo,
  });

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        tempo: List<String>.from(json["estados"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "estados": List<dynamic>.from(tempo.map((x) => x)),
      };
}
