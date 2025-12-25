import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/entity/user_msg_entity.dart';
import '../../../domain/usecase/user_msg_usecase.dart';
import '../event/user_msg_event.dart';
import '../state/user_msg_state.dart';

class UserMsgBloc extends Bloc<UserMsgEvent, UserMsgState> {
  final GetUserMsgUseCase userMsgUseCase;

  UserMsgBloc({required this.userMsgUseCase}) : super(const UserMsgInitial()) {
    on<FetchUserMessages>(_onFetchUserMessages);
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
}
