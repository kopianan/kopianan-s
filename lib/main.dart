import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kopianan_s/app.dart';
import 'package:kopianan_s/cubit/counter_cubit.dart';
import 'package:kopianan_s/injection.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  configureDependencies();
  runApp(BlocProvider(
    create: (context) => getIt<CounterCubit>(),
    child: App(),
  ));
}
