import 'package:bloc_tut/Logic/cubit/counter_cubit.dart';
import 'package:bloc_tut/Presentation/Screen/home_screen.dart';
import 'package:bloc_tut/Presentation/Screen/second_page.dart';
import 'package:bloc_tut/Presentation/Screen/third_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppRoute {
  Route onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case '/':
        return MaterialPageRoute(
            builder: (_) => HomeScreen(
                title: 'Flutter Demo Home Page', color: Colors.blueAccent));
        break;
      case '/second':
        return MaterialPageRoute(
            builder: (_) =>
                SecondPage(title: 'Second Page', color: Colors.redAccent));
      case '/third':
        return MaterialPageRoute(
            builder: (_) =>
                ThirdPage(title: 'Third Page', color: Colors.greenAccent));
      default:
        return null;
    }
  }

}
