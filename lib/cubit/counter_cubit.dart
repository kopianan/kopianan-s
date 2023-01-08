import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'counter_state.dart';
part 'counter_cubit.freezed.dart';

class CounterCubit extends Cubit<CounterState> {
  CounterCubit() : super(CounterState.empty());

  void updateName(String newName) {
    //notify
    emit(state.copyWith(name: newName));
  }

  void resetData() {
    //notify
    emit(CounterState.empty());
  }
}
