import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import '/core/di/datasource_injection.dart';
import '/core/di/repository_injection.dart';
import '/core/router/app_router.dart';
import '/core/theme/app_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Inicializamos Hive
  await Hive.initFlutter();

  // Registramos los adaptadores de Hive si los hay
  // await Hive.registerAdapter(QuestAdapter());

  // Abrimos las boxes necesarias
  // await Hive.openBox<Quest>('quests');

  // Inicializamos las dependencias
  await DatasourceInjection.init();
  await RepositoryInjection.init();

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Skyrim Tracker',
      theme: AppTheme.darkTheme,
      routerConfig: appRouter,
    );
  }
}
