import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import '../../home_screen/user_tab/data/data_source/user_msg_local_ds.dart';
import '../../home_screen/user_tab/data/repo_impl/user_msg_repo_impl.dart';
import '../../home_screen/user_tab/domain/repository/user_msg_repo.dart';
import '../../home_screen/user_tab/domain/usecase/user_msg_usecase.dart';
import '../network/api_service.dart';
import '../routes/app_router.dart';

final getIt = GetIt.instance;

void appInitInjection() {
  appCoreInjection();
  apiServiceInjection();
  otpInjection();
}

void appCoreInjection() {
  // Register AppRouter
  getIt.registerLazySingleton<AppRouter>(() => AppRouter());
}

void apiServiceInjection() {
  // Register Dio and ApiService instances for each domain
  if (!getIt.isRegistered<Dio>()) {
    getIt.registerLazySingleton<ApiService>(() => ApiService(getIt<Dio>()));
  }
}

void otpInjection() {
  if (!getIt.isRegistered<UserMsgLocalDataSource>()) {
    getIt.registerLazySingleton<UserMsgLocalDataSource>(
      () => UserMsgLocalDataSource(),
    );
  }

  if (!getIt.isRegistered<UserMsgRepository>()) {
    getIt.registerLazySingleton<UserMsgRepository>(
      () => AuthRepositoryImpl(dataSource: getIt<UserMsgLocalDataSource>()),
    );
  }

  if (!getIt.isRegistered<GetUserMsgUseCase>()) {
    getIt.registerLazySingleton<GetUserMsgUseCase>(
      () => GetUserMsgUseCase(getIt<UserMsgRepository>()),
    );
  }
}
