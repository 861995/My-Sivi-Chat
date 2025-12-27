import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_sivi_chat/core/utils/ui_utills.dart';

import '../../../domain/entity/user_msg_entity.dart';
import '../../../domain/usecase/user_msg_usecase.dart';
import '../event/user_msg_event.dart';
import '../state/user_msg_state.dart';

class UserMsgBloc extends Bloc<UserMsgEvent, UserMsgState> {
  final GetUserMsgUseCase userMsgUseCase;

  UserMsgBloc({required this.userMsgUseCase}) : super(const UserMsgInitial()) {
    on<FetchUserMessages>(_onFetchUserMessages);
    on<AddUserMsg>(_onAddUser);
  }

  Future<void> _onFetchUserMessages(
    FetchUserMessages event,
    Emitter<UserMsgState> emit,
  ) async {
    emit(const UserMsgLoading());

    try {
      final List<UserMsgEntity> result = await userMsgUseCase.fetchUserMsg();

      emit(UserMsgLoaded(result));
    } catch (e) {
      emit(UserMsgError(e.toString()));
    }
  }

  void _onAddUser(AddUserMsg event, Emitter<UserMsgState> emit) {
    if (state is! UserMsgLoaded) return;

    final currentState = state as UserMsgLoaded;

    final bool isAlreadyPresent = currentState.messages.any(
      (user) => user.userName.toLowerCase() == event.userName.toLowerCase(),
    );
    if (isAlreadyPresent) {
      UiUtility.showToast(message: "User already present, try other name");
      return;
    }
    final updatedList = List<UserMsgEntity>.from(currentState.messages)
      ..insert(
        0,
        UserMsgEntity(
          userName: event.userName,
          lastSeen: DateTime.now().toString(),
          isOnline: true,
        ),
      );
    UiUtility.showToast(message: "User Added Successfully", isSuccess: true);

    emit(UserMsgLoaded(updatedList));
  }
}
