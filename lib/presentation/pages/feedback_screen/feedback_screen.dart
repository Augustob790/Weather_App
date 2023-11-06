import 'package:app_clima/presentation/controller/feedback_controller.dart';
import 'package:app_clima/presentation/helpers/helpers.dart';
import 'package:app_clima/presentation/utils/image_constant.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import 'package:flutter/material.dart';

import '../../theme/theme_helper.dart';
import '../widgets/app_bar/appbar_image.dart';
import 'widgets/custom_bottom_bar.dart';
import 'widgets/sunnycolumn_item_widget.dart';

class FeedbackScreen extends StatefulWidget {
  const FeedbackScreen({Key? key}) : super(key: key);

  @override
  State<FeedbackScreen> createState() => _FeedbackScreenState();
}

class _FeedbackScreenState extends State<FeedbackScreen> {
  late final FeedbackController controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: AppbarImage(
            svgPath: ImageConstant.imgArrowleft,
            margin: const EdgeInsets.only(left: 15, top: 10, bottom: 10),
            onTap: () => GoRouter.of(context).go("/details_two")),
        title: const Text(
          'Informações',
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
      ),
      body: getBodyUI(),
    );
  }

  Widget getBodyUI() {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: const Alignment(0.5, 0),
              end: const Alignment(0.5, 1),
              colors: [
                appTheme.indigo90001,
                appTheme.indigo900,
                appTheme.blueGray900
              ]),
          image: DecorationImage(
              opacity: 0.2,
              image: AssetImage(ImageConstant.imgGroup88),
              fit: BoxFit.cover)),
      child: Column(
        children: [
          Expanded(
            child: Consumer<FeedbackController>(
              builder: (context, feedback, child) => GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    mainAxisExtent: 150,
                    crossAxisCount: 3,
                    mainAxisSpacing: 40,
                    crossAxisSpacing: 40,
                  ),
                  itemCount: feedback.weather.result.tempo.length,
                  itemBuilder: (BuildContext ctx, index) {
                    return SunnycolumnItemWidget(
                      image: Helpers.images[index],
                      name: feedback.weather.result.tempo[index],
                    );
                  }),
            ),
          ),
          const CustomBottomBar()
        ],
      ),
    );
  }
}
