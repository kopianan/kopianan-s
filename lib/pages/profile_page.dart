import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kopianan_s/cubit/counter_cubit.dart';
import 'package:kopianan_s/injection.dart';
import 'package:kopianan_s/pages/home_page.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final localCubit = getIt<CounterCubit>();
    return BlocProvider(
      create: (context) => localCubit,
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => HomePage()));
          },
          child: Icon(Icons.arrow_back_ios_new),
        ),
        appBar: AppBar(
          title: Text("PROFILE"),
        ),
        body: Center(
          child: Column(
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
              ElevatedButton(
                onPressed: () {
                  localCubit.randomWithLoading();
                },
                child: Text("RANDOM"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
