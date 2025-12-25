import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/entity/chat_history_entity.dart';
import '../../../domain/usecase/chat_history_usecase.dart';
import '../event/chat_history_event.dart';
import '../state/chat_history_state.dart';

class ChatHistoryBloc extends Bloc<ChatHistoryEvent, ChatHistoryState> {
  final GetChatHistoryUseCase useCase;

  ChatHistoryBloc({required this.useCase}) : super(ChatHistoryInitial()) {
    on<FetchChatHistory>(_onFetchChatHistory);
  }

  Future<void> _onFetchChatHistory(
    FetchChatHistory event,
    Emitter<ChatHistoryState> emit,
  ) async {
    emit(ChatHistoryLoading());

    try {
      final List<ChatHistoryEntity> result = await useCase.fetchChatHistory();

      emit(ChatHistoryLoaded(result));
    } catch (e) {
      emit(ChatHistoryError(e.toString()));
    }
  }
}
