import 'package:get_it/get_it.dart';
import 'package:task/features/home/data/repo_impl/home_repo_impl.dart';
import 'package:task/features/home/domain/repo/home_repo.dart';
import 'package:task/features/home/domain/use_case/home_use_case.dart';

import 'core/services/api_service.dart';
import 'features/home/data/remote/home_remote_data_source.dart';

class InjectionController {
  final getIt = GetIt.instance;
  initialize() async {
    getIt.registerLazySingleton<ApiService>(
      () => ApiService(),
    );
    getIt.registerLazySingleton<HomeRepo>(
      () => HomeRepoImpl(
        getIt(),
      ),
    );

    getIt.registerLazySingleton<HomeRemoteDataSource>(
      () => HomeRemoteDataSourceImpl(
        getIt(),
      ),
    );

    getIt.registerLazySingleton<HomeUseCase>(
      () => HomeUseCase(
        getIt(),
      ),
    );

    getIt.registerLazySingleton<DeleteTodosUseCase>(
      () => DeleteTodosUseCase(
        getIt(),
      ),
    );

    getIt.registerLazySingleton<AddTodosUseCase>(
      () => AddTodosUseCase(
        getIt(),
      ),
    );
  }
}
