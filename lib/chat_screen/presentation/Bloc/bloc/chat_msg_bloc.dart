import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/entity/chat_message_entity.dart';
import '../../../domain/usecase/chat_message_usecase.dart';
import '../event/chat_msg_event.dart';
import '../state/chat_msg_state.dart';

class ChatMessageBloc extends Bloc<ChatMessageEvent, ChatState> {
  final GetChatMessageUseCase fetchChatMessageUseCase;

  CancelToken? _cancelToken;

  ChatMessageBloc({required this.fetchChatMessageUseCase})
    : super(const ChatInitial()) {
    on<FetchChatMessages>(_onFetchChatMessages);
  }

  Future<void> _onFetchChatMessages(
    FetchChatMessages event,
    Emitter<ChatState> emit,
  ) async {
    _cancelToken?.cancel("New fetch triggered");

    _cancelToken = CancelToken();

    emit(const ChatLoading());

    try {
      final List<ChatMessageEntity> messages = await fetchChatMessageUseCase
          .fetchChatMessage(_cancelToken!);

      if (messages.isNotEmpty) {
        emit(ChatLoaded(messages));
      } else {
        emit(const ChatError("No Message Found"));
      }
    } on DioException catch (e) {
      if (CancelToken.isCancel(e)) {
        return;
      }

      emit(const ChatError("Failed to load messages"));
    } catch (e) {
      emit(ChatError(e.toString()));
    }
  }

  @override
  Future<void> close() {
    _cancelToken?.cancel("Bloc closed");
    return super.close();
  }
}
