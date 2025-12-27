import 'package:flutter_bloc/flutter_bloc.dart';

import '../state/scroll_sync_state.dart';

class ScrollSyncCubit extends Cubit<ScrollSyncState> {
  ScrollSyncCubit() : super(const ScrollSyncState());

  void updateChatHistory(double offset) {
    emit(state.copyWith(chatHistoryOffset: offset));
  }

  void updateUserMsg(double offset) {
    emit(state.copyWith(userMsgOffset: offset));
  }
}
