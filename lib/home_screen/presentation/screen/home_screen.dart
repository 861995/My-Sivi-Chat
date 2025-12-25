import 'package:flutter/material.dart';
import 'package:my_sivi_chat/core/utils/app_colors.dart';

import '../../../core/custom_tab_bar/common_tabbar.dart';

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
              backgroundColor: AppColors.whiteTxt,
              title: CommonTabBar(
                tabController: _tabController,
                tabs: ['Users', 'Chat History'],
              ),
              centerTitle: true,
              floating: true,
              snap: true,
              pinned: false,
            ),
          ];
        },
        body: TabBarView(
          controller: _tabController,
          children: const [
            _TabList(tabName: 'Tab One'),
            _TabList(tabName: 'Tab Two'),
          ],
        ),
      ),
    );
  }
}

class _TabList extends StatelessWidget {
  final String tabName;

  const _TabList({required this.tabName});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(12),
      itemCount: 30,
      itemBuilder: (context, index) {
        return Card(child: ListTile(title: Text('$tabName Item ${index + 1}')));
      },
    );
  }
}
