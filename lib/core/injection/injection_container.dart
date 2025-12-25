import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import '../network/api_service.dart';
import '../routes/app_router.dart';

final getIt = GetIt.instance;

void appInitInjection() {
  appCoreInjection();
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
