import 'package:bloc_tut/Logic/cubit/counter_cubit.dart';
import 'package:bloc_tut/Presentation/Screen/home_screen.dart';
import 'package:bloc_tut/Presentation/Screen/second_page.dart';
import 'package:bloc_tut/Presentation/Screen/third_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final CounterCubit _counterCubit = CounterCubit();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        '/': (context) => BlocProvider.value(
            value: _counterCubit,
            child: HomeScreen(
                title: 'Flutter Demo Home Page', color: Colors.blueAccent)),
        '/second': (context) => BlocProvider.value(
            value: _counterCubit,
            child: SecondPage(title: 'Second Page', color: Colors.redAccent)),
        '/third': (context) => BlocProvider.value(
            value: _counterCubit,
            child: ThirdPage(title: 'Third Page', color: Colors.greenAccent)),
      },
    );
  }

  @override
  void dispose() {
    _counterCubit.close();
    super.dispose();
  }
}
