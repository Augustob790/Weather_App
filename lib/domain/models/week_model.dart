import 'package:app_clima/domain/models/dia_model.dart';
import 'package:app_clima/domain/models/periodo_model.dart';

class Semana {
  final List<Dia> segunda;
  final List<Dia> terca;
  final List<Dia> quarta;
  final List<Dia> quinta;
  final List<Dia> sexta;
  final List<Dia> sabado;
  final List<Dia> domingo;

  Semana({
    required this.segunda,
    required this.terca,
    required this.quarta,
    required this.quinta,
    required this.sexta,
    required this.sabado,
    required this.domingo,
  });

  factory Semana.fromJson(Map<String, dynamic> json) => Semana(
        segunda: List<Dia>.from(json["segunda"].map((x) => Dia.fromJson(x))),
        terca: List<Dia>.from(json["terca"].map((x) => Dia.fromJson(x))),
        quarta: List<Dia>.from(json["quarta"].map((x) => Dia.fromJson(x))),
        quinta: List<Dia>.from(json["quinta"].map((x) => Dia.fromJson(x))),
        sexta: List<Dia>.from(json["sexta"].map((x) => Dia.fromJson(x))),
        sabado: List<Dia>.from(json["sabado"].map((x) => Dia.fromJson(x))),
        domingo: List<Dia>.from(json["domingo"].map((x) => Dia.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "segunda": List<dynamic>.from(segunda.map((x) => x.toJson())),
        "terca": List<dynamic>.from(terca.map((x) => x.toJson())),
        "quarta": List<dynamic>.from(quarta.map((x) => x.toJson())),
        "quinta": List<dynamic>.from(quinta.map((x) => x.toJson())),
        "sexta": List<dynamic>.from(sexta.map((x) => x.toJson())),
        "sabado": List<dynamic>.from(sabado.map((x) => x.toJson())),
        "domingo": List<dynamic>.from(domingo.map((x) => x.toJson())),
      };

  Dia get(String propertyName) {
    var mapRep = toJson();
    if (mapRep.containsKey(propertyName)) {
      return Dia(
        manha: List<Periodo>.from(mapRep[propertyName][0]['manha']
            .map((x) => Periodo(tempo: x['tempo'], graus: x['graus']))),
        tarde: List<Periodo>.from(mapRep[propertyName][0]['tarde']
            .map((x) => Periodo(tempo: x['tempo'], graus: x['graus']))),
        noite: List<Periodo>.from(mapRep[propertyName][0]['noite']
            .map((x) => Periodo(tempo: x['tempo'], graus: x['graus']))),
      );
    }
    throw ArgumentError('propery not found');
  }
}
