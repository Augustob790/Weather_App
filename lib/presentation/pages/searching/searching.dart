import 'package:app_clima/presentation/controller/feedback_controller.dart';
import 'package:app_clima/presentation/pages/searching/widgets/custom_container.dart';

import 'package:app_clima/presentation/utils/image_constant.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../../controller/states_controller.dart';
import 'package:flutter/material.dart';

import '../../theme/theme_helper.dart';
import 'widgets/custom_bottom_bar.dart';
import 'widgets/get_error_ui.dart';
import 'widgets/load_ui.dart';

class SearchingPage extends StatefulWidget {
  const SearchingPage({super.key});

  @override
  State<SearchingPage> createState() => _SearchingPageState();
}

class _SearchingPageState extends State<SearchingPage> {
  @override
  void initState() {
    final controller = Provider.of<StateController>(context, listen: false);
    final feedback = Provider.of<FeedbackController>(context, listen: false);
    controller.getAllStates();
    feedback.getAllWeather();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<StateController>(context);
    return Scaffold(
      extendBody: true,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          'Search for City',
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
      ),
      body: provider.isLoading
          ? const LoadUi()
          : provider.error.isNotEmpty
              ? GetErrorUi(error: provider.error)
              : getBodyUI(),
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
            child: Consumer<StateController>(
              builder: (context, state, child) => ListView.builder(
                  itemCount: state.states.length,
                  itemBuilder: (_, index) => CustomContainer(
                        estado: state.states[index].estado,
                        image: state.weather,
                        onTap: () {
                          context.push("/details_screen");
                          state.pageDetails(
                            state.states[index].estado,
                          );
                        },
                      )),
            ),
          ),
          const CustomBottomBar(),
        ],
      ),
    );
  }
}
