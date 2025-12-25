import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:provider/single_child_widget.dart';

import '../../home_screen/user_tab/domain/repository/user_msg_repo.dart';
import '../../home_screen/user_tab/domain/usecase/user_msg_usecase.dart';
import '../../home_screen/user_tab/presentation/Bloc/bloc/user_msg_bloc.dart';
import '../../home_screen/user_tab/presentation/Bloc/event/user_msg_event.dart';
import '../injection/injection_container.dart';
import '../network/listener/bloc/blocs/network_bloc.dart';
import '../network/listener/bloc/event/network_event.dart';
import '../utils/utility.dart';

class BlocInitiator {
  static List<SingleChildWidget> blocInitialization() {
    try {
      return [
        BlocProvider(
          create: (context) => UserMsgBloc(
            userMsgUseCase: GetUserMsgUseCase(getIt<UserMsgRepository>()),
          )..add(const FetchUserMessages()),
        ),
        BlocProvider(
          create: (_) =>
              NetworkBloc(connectivity: Connectivity())
                ..add(CheckNetworkStatus()),
        ),
      ];
    } catch (e) {
      Utility.showPrints(message: "error in bloc initialization $e");
      return [];
    }
  }
}
