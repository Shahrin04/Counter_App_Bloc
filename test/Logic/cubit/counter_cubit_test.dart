import 'package:bloc_test/bloc_test.dart';
import 'package:bloc_tut/Logic/cubit/counter_cubit.dart';

import 'package:test/test.dart';

void main() {
  group('Counter Cubit', () {
    CounterCubit counterCubit;

    setUp(() {
      counterCubit = CounterCubit();
    });

    tearDown(() {
      counterCubit.close();
    });

    test(
        'The initial state for the CounterCubit is CounterState(counterValue: 0)',
        () {
      expect(counterCubit.state, CounterState(counterValue: 0));
    });

    blocTest(
      'The Logic.cubit should emit a CounterState(counterValue: 1, wasIncremented: true) when Logic.cubit.increment function is called)',
      build: () => counterCubit,
      act: (cubit) => cubit.increment(),
      expect: () => [CounterState(counterValue: 1, wasIncremented: true)]
    );

    blocTest(
        'The Logic.cubit should emit a CounterState(counterValue: -1, wasIncremented: false) when Logic.cubit.decrement function is called)',
        build: () => counterCubit,
        act: (cubit) => cubit.decrement(),
        expect: () => [CounterState(counterValue: -1, wasIncremented: false)]
    );

  });
}
