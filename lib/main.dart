import 'package:flutter/material.dart';
import 'package:kopianan_s/app.dart';
import 'package:kopianan_s/injection.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  configureDependencies();
  runApp(const App());
}
