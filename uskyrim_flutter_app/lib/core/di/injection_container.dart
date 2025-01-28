import 'package:get_it/get_it.dart';
import '/core/services/local_storage_service.dart';

import '/data/datasources/local/houses_local_datasource.dart';
import '/data/repositories/houses_repository_impl.dart';
import '/domain/repositories/houses_repository.dart';
import '/data/datasources/local/shouts_local_datasource.dart';
import '/data/repositories/shouts_repository_impl.dart';
import '/domain/repositories/shouts_repository.dart';

Future<void> initializeDependencies() async {
  // ... inicializaciones existentes ...

  // Houses
  GetIt.I.registerLazySingleton<HousesLocalDatasource>(
    () => HousesLocalDatasourceImpl(GetIt.I<LocalStorageService>()),
  );

  GetIt.I.registerLazySingleton<HousesRepository>(
    () => HousesRepositoryImpl(GetIt.I<HousesLocalDatasource>()),
  );

  // Shouts
  GetIt.I.registerLazySingleton<ShoutsLocalDatasource>(
    () => ShoutsLocalDatasourceImpl(GetIt.I<LocalStorageService>()),
  );

  GetIt.I.registerLazySingleton<ShoutsRepository>(
    () => ShoutsRepositoryImpl(GetIt.I<ShoutsLocalDatasource>()),
  );
}
