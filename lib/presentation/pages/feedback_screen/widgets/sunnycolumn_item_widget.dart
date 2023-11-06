import 'package:flutter/material.dart';
import '../../widgets/app_bar/custom_image_view.dart';

// ignore: must_be_immutable
class SunnycolumnItemWidget extends StatelessWidget {
  final String? image;
  final String? name;
  const SunnycolumnItemWidget({
    Key? key,
    this.image,
    this.name,
  }) : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Expanded(
            child: Container(
              height: 100,
              width: 100,
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 30,
              ),
              decoration: const ShapeDecoration(
                color: Color(0x3A030303),
                shape: CircleBorder(),
              ),
              child: CustomImageView(
                imagePath: image,
                height: 20,
                width: 25,
                // alignment: Alignment.center,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 1,
              top: 15,
            ),
            child: Text(
              name ?? '',
              style: const TextStyle(
                color: Colors.white,
                fontSize: 15,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w500,
                //height: 0.05,
              ),
            ),
          )
        ],
      ),
    );
  }
}
