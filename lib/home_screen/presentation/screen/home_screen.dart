import 'package:flutter/material.dart';
import 'package:my_sivi_chat/core/utils/app_colors.dart';

import '../../../core/custom_tab_bar/common_tabbar.dart';
import '../../chat_history/presentation/screen/chat_history_screen.dart';
import '../../user_tab/presentation/screen/user_msg_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late final TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteTxt,
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            SliverAppBar(
              expandedHeight: kToolbarHeight,
              backgroundColor: AppColors.whiteTxt,
              centerTitle: true,
              floating: true,
              snap: true,
              pinned: false,
              title: CommonTabBar(
                tabController: _tabController,
                tabs: ['Users', 'Chat History'],
              ),
            ),
          ];
        },
        body: TabBarView(
          controller: _tabController,
          children: [const UserMsgScreen(), const ChatHistoryScreen()],
        ),
      ),
    );
  }
}
