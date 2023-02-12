part of 'counter_cubit.dart';

@freezed
class CounterState with _$CounterState {
  factory CounterState.initial() = _Initial;
  factory CounterState.loading() = _Loading;
  factory CounterState.success({@Default('') String message}) = _Success;
  factory CounterState.failed() = _Failed;
}
