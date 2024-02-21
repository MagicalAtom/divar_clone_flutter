import 'package:flutter/material.dart';
import 'package:sanjagh/libs/size_config.dart';
import 'package:sanjagh/router/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig:routes,
      theme: ThemeData(
        useMaterial3: true,
      ),         
    );
  }
}
