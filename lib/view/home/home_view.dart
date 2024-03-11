import 'package:app_controle_estoque/controllers/home_controller.dart';
import 'package:app_controle_estoque/core/dependencies/dependencies.dart';
import 'package:app_controle_estoque/core/utils/app_colors.dart';
import 'package:app_controle_estoque/view/home/widgets/form_audit.dart';
import 'package:app_controle_estoque/view/home/widgets/sent_widget.dart';
import 'package:app_controle_estoque/view/home/widgets/pending_widget.dart';
import 'package:app_controle_estoque/widgets/custom_loading.dart';
import 'package:app_controle_estoque/widgets/custom_show_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> with TickerProviderStateMixin {
  final homeController = getIt<HomeController>();

  late final TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    clearList();
    homeController.getLocalUser();

    getAllAudit();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  void clearList() {
    homeController.auditList.clear();
    homeController.productList.clear();
    homeController.pendingList.clear();
    homeController.sentList.clear();
  }

  void getAllAudit() {
    homeController.getAllAudit(context);
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (context) {
        final pendingList = homeController.pendingList.where((element) {
          return element.userID == homeController.userCache.id;
        }).toList();
        final sentList = homeController.sentList.where((element) {
          return element.userID == homeController.userCache.id;
        }).toList();

        return Scaffold(
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              customShowDialog(
                label: "Nova",
                idUser: homeController.userCache.id ?? "",
                context: context,
                child: FormAudit(
                  auditId: homeController.auditModel.id ?? "",
                  isAdd: true,
                  isEdit: false,
                  userId: homeController.userCache.id ?? "",
                ),
              );
            },
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
            leading: IconButton(
                icon: const Icon(Icons.logout),
                onPressed: () async {
                  await homeController.logout();
                }),
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
                      Text(' Enviados'),
                    ],
                  ),
                ),
              ],
            ),
          ),
          body: TabBarView(
            controller: _tabController,
            children: <Widget>[
              pendingList.isEmpty
                  ? Center(
                      child: Text(
                        "Nenhuma auditoria pendente",
                      ),
                    )
                  : PendingWidget(
                      listAudit: pendingList,
                    ),
              sentList.isEmpty
                  ? Center(
                      child: Text(
                        "Nenhuma auditoria enviada",
                      ),
                    )
                  : SentdWidget(
                      listAudit: sentList,
                    ),
            ],
          ),
        );
      },
    );
  }
}
