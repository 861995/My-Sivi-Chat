import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_sivi_chat/core/extension/extension.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../domain/entity/user_msg_entity.dart';
import '../Bloc/bloc/user_msg_bloc.dart';
import '../Bloc/state/user_msg_state.dart';
import '../widget/user_message_card.dart';

class UserMsgScreen extends StatelessWidget {
  const UserMsgScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserMsgBloc, UserMsgState>(
      builder: (context, state) {
        bool isLoading = state is UserMsgLoading;

        if (isLoading || state is UserMsgLoaded) {
          final userMsg = switch (state) {
            UserMsgLoaded(:final messages) => messages,
            _ => List.generate(5, (_) => UserMsgEntity.placeHolder()),
          };
          return Skeletonizer(
            enabled: isLoading,
            child: ListView.builder(
              padding: EdgeInsetsGeometry.zero,
              itemCount: userMsg.length,
              itemBuilder: (context, index) {
                final user = userMsg[index];
                return UserMessageCard(user: user);
              },
            ),
          );
        }

        if (state is UserMsgError) {
          return Text(state.message).center;
        }

        return const SizedBox();
      },
    );
  }
}
