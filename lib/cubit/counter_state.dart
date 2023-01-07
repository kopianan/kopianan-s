part of 'counter_cubit.dart';

@freezed
class CounterState with _$CounterState {
  //Singleclass
  const factory CounterState({
    @Default(0) int count,
    @Default("") String name,
  }) = _CounterState;
  factory CounterState.empty() => const CounterState(count: 0, name: "");
  factory CounterState.initial() => const CounterState(count: 10, name: "Anan");
}
