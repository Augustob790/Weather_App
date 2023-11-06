import 'package:app_clima/domain/models/periodo_model.dart';

class Dia {
  final List<Periodo> manha;
  final List<Periodo> tarde;
  final List<Periodo> noite;

  Dia({
    required this.manha,
    required this.tarde,
    required this.noite,
  });

  factory Dia.fromJson(Map<String, dynamic> json) => Dia(
        manha:
            List<Periodo>.from(json["manha"].map((x) => Periodo.fromJson(x))),
        tarde:
            List<Periodo>.from(json["tarde"].map((x) => Periodo.fromJson(x))),
        noite:
            List<Periodo>.from(json["noite"].map((x) => Periodo.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "manha": List<dynamic>.from(manha.map((x) => x.toJson())),
        "tarde": List<dynamic>.from(tarde.map((x) => x.toJson())),
        "noite": List<dynamic>.from(noite.map((x) => x.toJson())),
      };
}
