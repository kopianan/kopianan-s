import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'counter_state.dart';
part 'counter_cubit.freezed.dart';

@injectable
class CounterCubit extends Cubit<CounterState> {
  CounterCubit() : super(CounterState.initial());

  void randomWithLoading() async {
    emit(CounterState.loading());
    //calculasi/get data/ counter
    await Future.delayed(const Duration(seconds: 10));
    final dataRandom = Random().nextInt(2000);
    emit(CounterState.success(message: dataRandom.toString()));
  }
}
