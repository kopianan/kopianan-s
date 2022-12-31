import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:kopianan_s/injection.dart';
import 'package:kopianan_s/routes/kopi_route.dart';

class SettingPage extends StatefulWidget {
  static const String routeName = '/setting-page';
  const SettingPage({super.key});

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  @override
  void initState() {
    print("SETTING PAGE");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Login > Home > Setting
          // Login > Setting
          // AutoRouter.of(context).replaceAll([LoginRoute(), SettingRoute()]);
        },
      ),
      appBar: AppBar(title: Text("SettingPage")),
      body: Center(
        child: ElevatedButton(
          child: Text("Next"),
          onPressed: () async {
            showModal(context);
            await Future.delayed(Duration(seconds: 2));
            
            await getIt<KopiRoute>().popAndPush(ProfileRoute());
          },
        ),
      ),
    );
  }
}

void showModal(BuildContext context) {
  showDialog(
      context: context,
      builder: (context) {
        return Container(
          width: 100,
          height: 100,
          child: Text("sdf"),
          color: Colors.white,
        );
      });
}
