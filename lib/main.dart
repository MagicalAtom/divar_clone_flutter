import 'package:flutter/material.dart';
import 'package:sanjagh/data/models/Category.dart';
import 'package:sanjagh/libs/size_config.dart';
import 'package:sanjagh/router/routes.dart';
import 'package:sanjagh/serviceLocator/ServiceLocator.dart';
import 'package:hive_flutter/hive_flutter.dart';
Future<void> initServices() async {
  await initDio();
  await initLibs();
  initControllers();
  initDataSources(await Hive.openBox<Category>('categories'));
  initRepositories();
  initCubits();
  
}
  
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter<Category>(CategoryAdapter());
  await initServices();
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
