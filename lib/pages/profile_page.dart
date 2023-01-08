import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kopianan_s/cubit/counter_cubit.dart';
import 'package:kopianan_s/pages/home_page.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({
    super.key,
    required this.counterCubit,
  });
  final CounterCubit counterCubit;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              bloc: counterCubit,
              builder: (context, state) {
                return Text(
                  state.name,
                  style: TextStyle(fontSize: 40),
                );
              },
            ),
            ElevatedButton(
              onPressed: () {
                // context.read<CounterCubit>().updateName("TEST"); 
                counterCubit.updateName("CARLOS");
              },
              child: Text("RANDOM"),
            ),
          ],
        ),
      ),
    );
  }
}
