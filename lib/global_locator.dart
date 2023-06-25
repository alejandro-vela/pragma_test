import 'package:get_it/get_it.dart';

import 'package:logger/logger.dart';
import 'package:pragma_test/src/api/api_repository.dart';
import 'package:pragma_test/src/bloc/cat/repository/cat_repository.dart';

import 'src/bloc/cat/cat_bloc.dart';

late GetIt global;

void setUpGlobalLocator() {
  global = GetIt.I;

  global.registerLazySingleton(() => Logger());
  global.registerFactory<APIRepository>(() => DefaultAPIRepository());
  global.registerFactory<CatRepository>(() => CatRepositoryDefault());
  global.registerLazySingleton<CatBloc>(() => CatBloc());
}
