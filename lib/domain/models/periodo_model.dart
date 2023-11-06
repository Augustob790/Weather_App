class Periodo {
  final String? tempo;
  final String? graus;

  Periodo({
    required this.tempo,
    required this.graus,
  });

  factory Periodo.fromJson(Map<String, dynamic> json) => Periodo(
        tempo: json["tempo"],
        graus: json["graus"]?.toString(),
      );

  Map<String, dynamic> toJson() => {
        "tempo": tempo,
        "graus": graus,
      };
}
