import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kopianan_s/cubit/counter_cubit.dart';
import 'dart:math';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final counterCubit = CounterCubit();
    return BlocProvider(
        create: (context) => counterCubit,
        child: Scaffold(
          appBar: AppBar(),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              BlocBuilder<CounterCubit, CounterState>(
                  builder: (context, state) {
                print("REBUILD SCAFFOLD");
                return Text(
                  state.name,
                  style: TextStyle(fontSize: 30),
                );
              }),
              ElevatedButton(
                onPressed: () {
                  final newName = Random().nextInt(1000);
                  counterCubit.updateName("Anan Alfred ${newName}");
                },
                child: Text("Set Random"),
              )
            ],
          ),
        ));
  }
}
