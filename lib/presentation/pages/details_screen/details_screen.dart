import 'package:app_clima/presentation/controller/states_controller.dart';
import 'package:app_clima/presentation/helpers/helpers.dart';
import 'package:app_clima/presentation/pages/details_screen/custom_bottom_bar.dart';
import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import 'package:app_clima/presentation/pages/widgets/app_bar/custom_image_view.dart';
import 'package:app_clima/presentation/utils/image_constant.dart';

import '../../controller/details_screen_controller.dart';
import '../../theme/app_decoration.dart';
import '../../theme/theme_helper.dart';
import '../widgets/app_bar/appbar_image.dart';
import 'widgets/custom_container.dart';

class DetailsScreen extends StatefulWidget {
  const DetailsScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
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
            onTap: () => GoRouter.of(context).go("/")),
        title: const Text(
          '7 Dias',
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
    final provider = Provider.of<StateController>(context);
    final detailsScreenProvider = Provider.of<DetailsScreenController>(context);

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
      ),
      child: Column(
        children: [
          Container(
              margin: const EdgeInsets.only(top: 150, bottom: 10),
              child: Text(
                Helpers.weekdayNameView,
                style: const TextStyle(
                  color: Color(0xFFDEDDDD),
                  fontSize: 18.35,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w600,
                  height: 0.08,
                ),
              )),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 1, horizontal: 20),
            padding: const EdgeInsets.all(10),
            decoration: AppDecoration.gradientDeepPurpleToBlueGray
                .copyWith(borderRadius: BorderRadiusStyle.roundedBorder15),
            child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
              CustomImageView(
                imagePath:
                    Helpers.imageClima(provider.periodo.first.tempo ?? ''),
                height: 132,
                width: 140,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 36, left: 80),
                child: Text(provider.periodo.first.graus ?? '',
                    style: theme.textTheme.displayLarge),
              ),
              Container(
                  height: 10,
                  width: 10,
                  margin: const EdgeInsets.only(top: 50, right: 25),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(color: appTheme.whiteA700, width: 2)))
            ]),
          ),
          Expanded(
            child: Consumer<StateController>(
              builder: (context, info, child) => ListView.builder(
                  padding: const EdgeInsets.only(top: 30),
                  itemCount: 7,
                  itemBuilder: (context, index) {
                    final dayIndex = (Helpers.weekday + index) % 7;
                    return CustomContainer(
                      onTap: () {
                        context.push("/details_two");
                        detailsScreenProvider.pageDetails(
                            info.atual.estado, dayIndex);
                      },
                      weekDay: Helpers.semana[dayIndex],
                      imageWeather:
                          info.tempoInfo(Helpers.semanasGetModel[dayIndex]),
                      weather:
                          info.tempoInfo(Helpers.semanasGetModel[dayIndex]),
                      graus: info.grausInfo(Helpers.semanasGetModel[dayIndex]),
                    );
                  }),
            ),
          ),
          const SizedBox(height: 40),
          const CustomBottomBar(),
        ],
      ),
    );
  }
}
