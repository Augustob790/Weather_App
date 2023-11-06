import 'package:flutter/material.dart';

import '../../../helpers/helpers.dart';
import '../../widgets/app_bar/custom_image_view.dart';

class CustomContainer extends StatelessWidget {
  const CustomContainer(
      {super.key,
      this.onTap,
      required this.weekDay,
      required this.imageWeather,
      required this.weather,
      required this.graus});

  final String imageWeather;
  final String weekDay;
  final String weather;
  final String graus;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: SizedBox(
        height: 50,
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            SizedBox(
              width: 378,
              height: 40,
              child: Stack(
                children: [
                  Positioned(
                    left: 20,
                    top: 5,
                    child: SizedBox(
                      width: 80.92,
                      child: Text(
                        weekDay,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 150,
                    top: 0,
                    child: CustomImageView(
                        imagePath: Helpers.imageClima(imageWeather),
                        height: 40,
                        width: 41),
                  ),
                  Positioned(
                    left: 210,
                    top: 20,
                    child: SizedBox(
                      width: 120,
                      child: Opacity(
                        opacity: 0.60,
                        child: Text(
                          weather,
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w500,
                              height: 0.10),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 330,
                    top: 10,
                    child: SizedBox(
                      width: 29.93,
                      child: Text(
                        graus,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w500,
                          height: 0,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 355,
                    top: 11,
                    child: Container(
                      width: 6.65,
                      height: 6,
                      decoration: const ShapeDecoration(
                        shape: OvalBorder(
                          side: BorderSide(width: 1, color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
