import 'package:app_clima/presentation/utils/size_utils.dart';
import 'package:flutter/material.dart';

import 'theme_helper.dart';

class AppDecoration {
  // Bg decorations
  static BoxDecoration get bg => BoxDecoration(
        gradient: LinearGradient(
          begin: const Alignment(0.5, 0),
          end: const Alignment(0.5, 1),
          colors: [
            appTheme.indigo90001,
            appTheme.indigo900,
            appTheme.blueGray900,
          ],
        ),
      );

  // Fill decorations
  static BoxDecoration get fillBlackA => BoxDecoration(
        color: appTheme.black9003a,
      );
  static BoxDecoration get fillWhiteA => BoxDecoration(
        color: appTheme.whiteA700,
      );

  // Gradient decorations
  static BoxDecoration get gradientDeepPurpleToBlueGray => BoxDecoration(
        gradient: LinearGradient(
          begin: const Alignment(0.5, 0),
          end: const Alignment(0.5, 1),
          colors: [
            appTheme.deepPurple300,
            appTheme.blueGray700,
          ],
        ),
      );
}

class BorderRadiusStyle {
  // Circle borders
  static BorderRadius get circleBorder50 => BorderRadius.circular(
        50.h,
      );

  // Rounded borders
  static BorderRadius get roundedBorder15 => BorderRadius.circular(
        15.h,
      );
  static BorderRadius get roundedBorder8 => BorderRadius.circular(
        8.h,
      );
}

double get strokeAlignInside => BorderSide.strokeAlignInside;

double get strokeAlignCenter => BorderSide.strokeAlignCenter;

double get strokeAlignOutside => BorderSide.strokeAlignOutside;
