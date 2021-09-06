part of 'counter_cubit.dart';

class CounterState extends Equatable {
  int counterValue;
  bool wasIncremented;

  CounterState({@required this.counterValue, this.wasIncremented});

  @override
  List<Object> get props => [this.counterValue, this.wasIncremented];

  Map<String, dynamic> toMap() {
    return {
      'counterValue': this.counterValue,
      'wasIncremented': this.wasIncremented,
    };
  }

  String toJson() => jsonEncode(toMap());

  factory CounterState.fromJson(String source) => CounterState.fromMap(jsonDecode(source));

  factory CounterState.fromMap(Map<String, dynamic> map) {
    return CounterState(
      counterValue: map['counterValue'] as int,
      wasIncremented: map['wasIncremented'] as bool,
    );
  }

  @override
  String toString() => 'CounterState(counterValue: $counterValue, wasIncremented: $wasIncremented)';
}
