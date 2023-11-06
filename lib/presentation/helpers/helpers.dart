import '../utils/image_constant.dart';

class Helpers {
  static DateTime data = DateTime.now();
  static int weekday = DateTime.now().weekday;
  static String weekdayName = Helpers.getWeekdayName(weekday);
  static String weekdayNameView = Helpers.getWeekday(weekday);

  static List<String> images = [
    ImageConstant.imgDownload1,
    ImageConstant.imgRainyweather4,
    ImageConstant.imgRainyweather469x69,
    ImageConstant.imgRainyweather477x77,
    ImageConstant.imgRainyweather481x81,
    ImageConstant.imgCloudrainand,
  ];

  static List<String> semana = [
    "Domingo",
    "Segunda",
    "Terça",
    "Quarta",
    "Quinta",
    "Sexta",
    "Sabado",
  ];

  static List<String> semanasGetModel = [
    "domingo",
    "segunda",
    "terca",
    "quarta",
    "quinta",
    "sexta",
    "sabado",
  ];

  static String getWeekdayName(int weekday) {
    switch (weekday) {
      case 1:
        return "segunda";
      case 2:
        return "terca";
      case 3:
        return "quarta";
      case 4:
        return "quinta";
      case 5:
        return "sexta";
      case 6:
        return "sabado";
      case 7:
        return "domingo";
      default:
        return "";
    }
  }

  static String getWeekday(int weekday) {
    switch (weekday) {
      case 1:
        return "Segunda";
      case 2:
        return "Terça";
      case 3:
        return "Quarta";
      case 4:
        return "Quinta";
      case 5:
        return "Sexta";
      case 6:
        return "Sábado";
      case 7:
        return "Domingo";
      default:
        return "";
    }
  }

  static String imageClima(String clima) {
    switch (clima) {
      case "Sol":
        return ImageConstant.imgDownload1;
      case "Nublado":
        return ImageConstant.imgRainyweather4;
      case "Chuva":
        return ImageConstant.imgRainyweather469x69;
      case "Neve":
        return ImageConstant.imgRainyweather477x77;
      case "Tempestade":
        return ImageConstant.imgRainyweather481x81;
      case "Trovão":
        return ImageConstant.imgCloudrainand;
      default:
        return "";
    }
  }
}
