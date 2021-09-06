import 'dart:async';
import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:bloc_tut/Constants/enums.dart';
import 'package:bloc_tut/Logic/cubit/internet_cubit.dart';
import 'package:equatable/equatable.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:meta/meta.dart';

part 'counter_state.dart';

class CounterCubit extends Cubit<CounterState> with HydratedMixin {
  CounterCubit() : super(CounterState(counterValue: 0));

  void increment() => emit(CounterState(counterValue: state.counterValue + 1, wasIncremented: true));
  void decrement() => emit(CounterState(counterValue: state.counterValue - 1, wasIncremented: false));

  @override
  CounterState fromJson(Map<String, dynamic> json) {
    return CounterState.fromMap(json);
  }

  @override
  Map<String, dynamic> toJson(CounterState state) {
    //addError(Exception('for test, there would have some error'), StackTrace.current);
    return state.toMap();
  }

  @override
  void onChange(Change<CounterState> change) {
    print(change);
    super.onChange(change);
  }

  // @override
  // void onError(Object error, StackTrace stackTrace) {
  //   print('$error, $stackTrace');
  //   super.onError(error, stackTrace);
  // }
}
