import 'package:get_it/get_it.dart';
import 'package:hive_flutter/hive_flutter.dart';
import '/core/services/local_storage_service.dart';

class ServiceInjection {
  static Future<void> init() async {
    final getIt = GetIt.instance;

    // Abrimos la box para los items marcados
    final markedItemsBox = await Hive.openBox<List<String>>('marked_items');

    // Registramos el servicio como singleton
    getIt.registerLazySingleton<LocalStorageService>(
      () => LocalStorageService(markedItemsBox),
    );
  }
}
