import 'package:flutter/material.dart';

import 'pages/home_page.dart';

class App extends StatelessWidget {
  const App({super.key});
 
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Kopianans',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}
