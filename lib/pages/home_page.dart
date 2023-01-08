import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kopianan_s/cubit/counter_cubit.dart';
import 'dart:math';

import 'package:kopianan_s/pages/profile_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final counterCubit = CounterCubit();
    return BlocProvider(
        create: (context) => counterCubit,
        child: Scaffold(
          appBar: AppBar(),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => ProfilePage(
                        counterCubit: counterCubit,
                      )));
            },
            child: Icon(Icons.arrow_right_alt_rounded),
          ),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              BlocBuilder<CounterCubit, CounterState>(
                  builder: (context, state) {
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
              ),
              TextButton(
                onPressed: () {
                  counterCubit.resetData();
                },
                child: Text("RESET"),
              )
            ],
          ),
        ));
  }
}
