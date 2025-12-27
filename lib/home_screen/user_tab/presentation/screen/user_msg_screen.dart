import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:my_sivi_chat/core/extension/extension.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../core/utils/app_colors.dart';
import '../../domain/entity/user_msg_entity.dart';
import '../Bloc/bloc/user_msg_bloc.dart';
import '../Bloc/event/user_msg_event.dart';
import '../Bloc/state/user_msg_state.dart';
import '../widget/user_message_card.dart';

class UserMsgScreen extends StatefulWidget {
  const UserMsgScreen({super.key});

  @override
  State<UserMsgScreen> createState() => _UserMsgScreenState();
}

class _UserMsgScreenState extends State<UserMsgScreen>
    with AutomaticKeepAliveClientMixin {
  // final ScrollController _scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      backgroundColor: AppColors.whiteTxt,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showAddUserDialog(context);
        },
        shape: const CircleBorder(),
        backgroundColor: AppColors.bubbleBlue,
        child: const Icon(Icons.add, size: 28, color: AppColors.whiteTxt),
      ),
      body: BlocBuilder<UserMsgBloc, UserMsgState>(
        builder: (context, state) {
          bool isLoading = state is UserMsgLoading;

          if (isLoading || state is UserMsgLoaded) {
            final userMsg = switch (state) {
              UserMsgLoaded(:final messages) => messages,
              _ => List.generate(15, (_) => UserMsgEntity.placeHolder()),
            };
            return Skeletonizer(
              enabled: isLoading,
              child: ListView.builder(
                // controller: _scrollController,
                key: const PageStorageKey('user_msg_list'),
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
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;

  Future<void> showAddUserDialog(BuildContext context) async {
    final TextEditingController controller = TextEditingController();

    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("New Chat"),
          content: TextField(
            controller: controller,
            autofocus: true,
            decoration: const InputDecoration(hintText: "Enter name"),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text("Cancel"),
            ),
            ElevatedButton(
              onPressed: () {
                final name = controller.text.trim();
                if (name.isNotEmpty) {
                  context.read<UserMsgBloc>().add(AddUserMsg(name));
                }
                context.pop();
              },
              child: const Text("OK"),
            ),
          ],
        );
      },
    );
  }
}
