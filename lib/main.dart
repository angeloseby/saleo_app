import 'dart:async';
import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:saleo_app/database/models/user_model.dart';
import 'package:saleo_app/widgets/custom_alert_dialog.dart';
import 'pages/login_page/login_page.dart';
import 'package:path_provider/path_provider.dart' as path_provider;

Future main() async {
  final appDocumentDirectory =
      await path_provider.getApplicationDocumentsDirectory();
  Hive.init(appDocumentDirectory.path);
  Hive.registerAdapter(UserAdapter());
  WidgetsFlutterBinding.ensureInitialized;
  runApp(const MyApp());
  doWhenWindowReady(() {
    const initialSize = Size(1000, 700);
    appWindow.minSize = initialSize;
    appWindow.size = initialSize;
    appWindow.alignment = Alignment.center;
    appWindow.show();
  });
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Authentication',
      home: FutureBuilder(
        future: Hive.openBox("user"),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasError) {
              return const CustomAlertDialog(
                  width: 300,
                  height: 300,
                  backgroundColor: Colors.red,
                  text: "DATABASE FETCHING ERROR",
                  textSize: 30);
            } else {
              return LoginPage();
            }
          } else if (snapshot.connectionState == ConnectionState.waiting) {
            return const Scaffold(
              backgroundColor: Colors.blue,
              body: Center(
                child: CircularProgressIndicator(
                  color: Colors.green,
                ),
              ),
            );
          } else {
            return const Scaffold(
              backgroundColor: Colors.red,
              body: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
