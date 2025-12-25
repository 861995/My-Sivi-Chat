import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:provider/single_child_widget.dart';

import '../network/listener/bloc/blocs/network_bloc.dart';
import '../network/listener/bloc/event/network_event.dart';
import '../utils/utility.dart';

class BlocInitiator {
  static List<SingleChildWidget> blocInitialization() {
    try {
      return [
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
