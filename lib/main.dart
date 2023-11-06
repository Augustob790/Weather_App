// ignore_for_file: depend_on_referenced_packages

import 'package:app_clima/routes/routes.dart';
import 'package:flutter/material.dart';

import 'presentation/providers/dependency_injections.provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return DependecyInjectionsProvider(
      child: MaterialApp.router(
        title: 'Weather Forecast',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        debugShowCheckedModeBanner: false,
        routerDelegate: routes.routerDelegate,
        routeInformationParser: routes.routeInformationParser,
        routeInformationProvider: routes.routeInformationProvider,
      ),
    );
  }
}
