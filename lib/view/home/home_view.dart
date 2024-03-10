import 'package:app_controle_estoque/core/utils/app_colors.dart';
import 'package:app_controle_estoque/view/home/widgets/completed_widget.dart';
import 'package:app_controle_estoque/view/home/widgets/sent_widget.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> with TickerProviderStateMixin {
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
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: AppColors.darkBlue,
        child: const Icon(
          Icons.library_add_outlined,
          color: Colors.white,
        ),
      ),
      appBar: AppBar(
        title: Text(
          'Auditoria',
          style: TextStyle(
            color: AppColors.darkBlue,
          ),
        ),
        backgroundColor: Colors.blueGrey.shade100,
        bottom: TabBar(
          controller: _tabController,
          labelColor: AppColors.darkBlue,
          unselectedLabelColor: AppColors.blue,
          tabs: const [
            Tab(
              icon: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.pending_actions),
                  Text(' Pendentes'),
                ],
              ),
            ),
            Tab(
              icon: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.check),
                  Text(' Concluídos'),
                ],
              ),
            ),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: const <Widget>[
          SendWidget(),
          CompletedWidget(),
        ],
      ),
    );
  }
}
