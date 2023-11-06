import 'package:flutter/material.dart';

import '../../../helpers/helpers.dart';
import '../../widgets/app_bar/custom_image_view.dart';

class CustomContainer extends StatelessWidget {
  const CustomContainer({
    Key? key,
    required this.estado,
    required this.image,
    this.onTap,
  }) : super(key: key);

  final String estado;
  final String image;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: SizedBox(
        width: 394,
        height: 114,
        child: Stack(
          alignment: Alignment.centerLeft,
          children: [
            Positioned(
              left: 10,
              top: 17,
              child: Opacity(
                opacity: 0.50,
                child: Container(
                  margin: const EdgeInsets.only(left: 10),
                  width: 321,
                  height: 80,
                  decoration: ShapeDecoration(
                    gradient: const LinearGradient(
                      begin: Alignment(0.00, -1.00),
                      end: Alignment(0, 1),
                      colors: [Color(0xFF947CCD), Color(0xFF523D7F)],
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              left: 34,
              top: 40,
              child: Text(
                estado,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w600,
                  // height: 0.03,
                ),
              ),
            ),
            Positioned(
              left: 300,
              top: 10,
              child: CustomImageView(
                  imagePath: Helpers.imageClima(image),
                  height: 90,
                  width: 95,
                  alignment: Alignment.centerRight),
            ),
          ],
        ),
      ),
    );
  }
}
