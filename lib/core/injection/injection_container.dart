import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:translator/translator.dart';

import '../../chat_screen/data/datasource/receiver_remote_ds.dart';
import '../../chat_screen/data/datasource/sender_local_ds.dart';
import '../../chat_screen/data/repo_impl/chat_message_repo_impl.dart';
import '../../chat_screen/domain/repository/chat_message_repo.dart';
import '../../chat_screen/domain/usecase/chat_message_usecase.dart';
import '../../home_screen/chat_history/data/data_source/chat_history_local_ds.dart';
import '../../home_screen/chat_history/data/repo_impl/chat_history_repo_impl.dart';
import '../../home_screen/chat_history/domain/repository/chat_history_repo.dart';
import '../../home_screen/chat_history/domain/usecase/chat_history_usecase.dart';
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
  userMsgInjection();
  chatHistoryInjection();
  chatMessageInjection();
}

void appCoreInjection() {
  // Register AppRouter
  getIt.registerLazySingleton<AppRouter>(() => AppRouter());
  if (!getIt.isRegistered<GoogleTranslator>()) {
    getIt.registerLazySingleton<GoogleTranslator>(() => GoogleTranslator());
  }
}

void apiServiceInjection() {
  if (!getIt.isRegistered<Dio>()) {
    getIt.registerLazySingleton<Dio>(() => Dio());
  }

  if (!getIt.isRegistered<ApiService>()) {
    getIt.registerLazySingleton<ApiService>(() => ApiService(getIt<Dio>()));
  }
}

void userMsgInjection() {
  if (!getIt.isRegistered<UserMsgLocalDataSource>()) {
    getIt.registerLazySingleton<UserMsgLocalDataSource>(
      () => UserMsgLocalDataSource(),
    );
  }

  if (!getIt.isRegistered<UserMsgRepository>()) {
    getIt.registerLazySingleton<UserMsgRepository>(
      () => UserMsgRepositoryImpl(dataSource: getIt<UserMsgLocalDataSource>()),
    );
  }

  if (!getIt.isRegistered<GetUserMsgUseCase>()) {
    getIt.registerLazySingleton<GetUserMsgUseCase>(
      () => GetUserMsgUseCase(getIt<UserMsgRepository>()),
    );
  }
}

void chatHistoryInjection() {
  if (!getIt.isRegistered<ChatHistoryLocalDataSource>()) {
    getIt.registerLazySingleton<ChatHistoryLocalDataSource>(
      () => ChatHistoryLocalDataSource(),
    );
  }

  if (!getIt.isRegistered<ChatHistoryRepository>()) {
    getIt.registerLazySingleton<ChatHistoryRepository>(
      () => ChatHistoryRepositoryImpl(
        dataSource: getIt<ChatHistoryLocalDataSource>(),
      ),
    );
  }

  if (!getIt.isRegistered<GetChatHistoryUseCase>()) {
    getIt.registerLazySingleton<GetChatHistoryUseCase>(
      () => GetChatHistoryUseCase(getIt<ChatHistoryRepository>()),
    );
  }
}

void chatMessageInjection() {
  if (!getIt.isRegistered<SenderLocalDataSource>()) {
    getIt.registerLazySingleton<SenderLocalDataSource>(
      () => SenderLocalDataSource(),
    );
  }
  if (!getIt.isRegistered<ReceiverMsgRemoteDataSource>()) {
    getIt.registerLazySingleton<ReceiverMsgRemoteDataSource>(
      () => ReceiverMsgRemoteDataSource(apiService: getIt<ApiService>()),
    );
  }

  if (!getIt.isRegistered<ChatMessageRepository>()) {
    getIt.registerLazySingleton<ChatMessageRepository>(
      () => ChatMessageRepositoryImpl(
        senderLocalDs: getIt<SenderLocalDataSource>(),
        receiverMsgRemoteDataSource: getIt<ReceiverMsgRemoteDataSource>(),
      ),
    );
  }

  if (!getIt.isRegistered<GetChatMessageUseCase>()) {
    getIt.registerLazySingleton<GetChatMessageUseCase>(
      () => GetChatMessageUseCase(getIt<ChatMessageRepository>()),
    );
  }
}
