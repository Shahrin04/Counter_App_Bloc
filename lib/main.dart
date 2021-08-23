import 'package:bloc_tut/Logic/cubit/counter_cubit.dart';
import 'package:bloc_tut/Presentation/Route/app_route.dart';
import 'package:bloc_tut/Presentation/Screen/home_screen.dart';
import 'package:bloc_tut/Presentation/Screen/second_page.dart';
import 'package:bloc_tut/Presentation/Screen/third_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final AppRoute _appRoute = AppRoute();

  @override
  Widget build(BuildContext context) {
    return BlocProvider<CounterCubit>(
      create: (context) => CounterCubit(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        onGenerateRoute: _appRoute.onGenerateRoute,
      ),
    );
  }
}

