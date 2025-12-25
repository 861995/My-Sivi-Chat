import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../utils/app_strings.dart';
import '../../utils/ui_utills.dart';
import 'bloc/blocs/network_bloc.dart';
import 'bloc/state/network_states.dart';

class NetworkListener extends StatelessWidget {
  final Widget child;

  const NetworkListener({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return BlocListener<NetworkBloc, NetworkState>(
      listener: (context, networkState) async {
        if (networkState is NetworkDisconnected) {
          UiUtility.showToast(message: AppConstantString.noInternetTitle);
        }
      },
      child: child,
    );
  }
}
