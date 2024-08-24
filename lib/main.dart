import 'package:basic/app/core/di/injection.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'app/routes/routes.dart';
import 'app/themes/themes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  configureDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      builder: FToastBuilder(),
      routerConfig: router,
      theme: Themes.lightTheme,
    );
  }
}

