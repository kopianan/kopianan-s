import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kopianan_s/cubit/counter_cubit.dart';
import 'package:kopianan_s/injection.dart';
import 'dart:math';

import 'package:kopianan_s/pages/profile_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<CounterCubit, CounterState>(
      listener: (context, state) {
        print(state);
      },
      child: Scaffold(
        appBar: AppBar(),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => ProfilePage()));
          },
          child: Icon(Icons.arrow_right_alt_rounded),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BlocBuilder<CounterCubit, CounterState>(
              builder: (context, state) {
                return state.maybeMap(
                  orElse: () {
                    return Text("");
                  },
                  loading: (e) {
                    return Center(child: CircularProgressIndicator());
                  },
                  success: (value) {
                    return Center(
                      child: Text(
                        value.message,
                        style: TextStyle(fontSize: 30),
                      ),
                    );
                  },
                );
              },
            ),
            BlocBuilder<CounterCubit, CounterState>(
              builder: (context, state) {
                return state.maybeMap(
                  loading: (e) {
                    return ElevatedButton(
                      onPressed: null,
                      child: Transform.scale(
                        scale: 0.7,
                        child: const Center(
                          child: CircularProgressIndicator(),
                        ),
                      ),
                    );
                  },
                  orElse: () {
                    return ElevatedButton(
                      onPressed: () {
                        // getIt<CounterCubit>().randomWithLoading();
                        context.read<CounterCubit>().randomWithLoading();
                      },
                      child: Text("Set Random"),
                    );
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
