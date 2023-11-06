// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import 'package:app_clima/presentation/pages/widgets/app_bar/custom_image_view.dart';
import 'package:app_clima/presentation/utils/image_constant.dart';
import 'package:intl/intl.dart';
import '../../controller/details_screen_controller.dart';
import '../../helpers/helpers.dart';
import '../../theme/theme_helper.dart';
import '../widgets/app_bar/appbar_image.dart';
import 'widgets/custom_bottom_bar.dart';
import 'widgets/custom_container.dart';
import 'widgets/custom_listview.dart';

class Details extends StatefulWidget {
  const Details({super.key});

  @override
  State<Details> createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<DetailsScreenController>(context);
    return Scaffold(
      extendBody: true,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: AppbarImage(
          svgPath: ImageConstant.imgArrowleft,
          margin: const EdgeInsets.only(left: 15, top: 10, bottom: 10),
          onTap: () => GoRouter.of(context).go("/details_screen"),
        ),
        title: Text(
          provider.atual.estado,
          style: const TextStyle(
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
    final provider =
        Provider.of<DetailsScreenController>(context, listen: false);
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
            fit: BoxFit.cover),
      ),
      child: Column(
        children: [
          Container(
              margin: const EdgeInsets.only(
                top: 140,
                bottom: 10,
              ),
              child: Center(
                child: Text(
                  provider.weekdayNameView,
                  style: const TextStyle(
                    color: Color(0xFFDEDDDD),
                    fontSize: 18.35,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w600,
                    height: 0.08,
                  ),
                ),
              )),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 1, horizontal: 20),
            padding: const EdgeInsets.all(10),
            child: CustomImageView(
              imagePath: Helpers.imageClima(provider.tempo),
              height: 122,
              width: 130,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                provider.graus,
                style: theme.textTheme.displayLarge,
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 30.0),
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
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(
              DateFormat(" d 'de' MMMM 'de' y").format(Helpers.data),
              style: const TextStyle(
                color: Color(0xFFDEDDDD),
                fontSize: 13,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w500,
                height: 0.12,
              ),
            ),
          ),
          const SizedBox(height: 20),
          const Row(
            children: [
              Padding(
                padding: EdgeInsets.only(left: 15),
                child: SizedBox(
                  width: 34,
                  child: Text(
                    'Hoje',
                    style: TextStyle(
                      color: Color(0xFFDEDDDD),
                      fontSize: 12,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w600,
                      height: 0.12,
                    ),
                  ),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              InkWell(
                onTap: () => context.push("/feedback_screen"),
                child: Padding(
                  padding: const EdgeInsets.all(7.0),
                  child: CustomContainer(
                    horario: "Manhã",
                    image: Helpers.imageClima(provider.manha.first.tempo ?? ''),
                    grau: provider.manha.first.graus,
                  ),
                ),
              ),
              InkWell(
                onTap: () => context.push("/feedback_screen"),
                child: Padding(
                  padding: const EdgeInsets.all(7.0),
                  child: CustomContainer(
                    horario: "Tarde",
                    image: Helpers.imageClima(provider.tarde.first.tempo ?? ''),
                    grau: provider.tarde.first.graus,
                  ),
                ),
              ),
              InkWell(
                onTap: () => context.push("/feedback_screen"),
                child: Padding(
                  padding: const EdgeInsets.all(7.0),
                  child: CustomContainer(
                    horario: "Noite",
                    image: Helpers.imageClima(provider.noite.first.tempo ?? ''),
                    grau: provider.noite.first.graus,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 30,
          ),
          // ignore: prefer_const_constructors
          Row(
            children: const [
              Padding(
                padding: EdgeInsets.only(left: 15),
                child: Text(
                  'Estados',
                  style: TextStyle(
                    color: Color(0xFFDEDDDD),
                    fontSize: 12,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w600,
                    height: 0.12,
                  ),
                ),
              ),
            ],
          ),
          Expanded(
            child: Consumer<DetailsScreenController>(
              builder: (context, info, child) => ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: info.states.length,
                  itemBuilder: (context, index) => CustomListView(
                        image: info.weather,
                        estado: info.states[index].estado,
                        graus: info.grausState,
                      )),
            ),
          ),
          const CustomBottomBar(),
        ],
      ),
    );
  }
}
