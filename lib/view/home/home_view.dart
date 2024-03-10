import 'package:app_controle_estoque/controllers/home_controller.dart';
import 'package:app_controle_estoque/core/dependencies/dependencies.dart';
import 'package:app_controle_estoque/core/utils/app_colors.dart';
import 'package:app_controle_estoque/core/utils/size_box_height.dart';
import 'package:app_controle_estoque/view/home/widgets/sent_widget.dart';
import 'package:app_controle_estoque/view/home/widgets/pending_widget.dart';
import 'package:app_controle_estoque/widgets/custom_dropdown.dart';
import 'package:app_controle_estoque/widgets/custom_text_form.dart';
import 'package:app_controle_estoque/widgets/show_dialog_edit.dart';
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
    homeController.getLocalUser();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (context) {
      return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            showDialogEdit(
              context: context,
              label: "Nova",
              textButton: "Salvar",
              onPressed: () {
                // NavigationService.instance.goBack();
              },
              child: createUnit(),
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
            homeController.pendingList.isEmpty
                ? Center(
                    child: Text(
                      "Nenhuma auditoria pendente",
                    ),
                  )
                : PendingWidget(
                    listAudit: homeController.pendingList,
                  ),
            homeController.sentList.isEmpty
                ? Center(
                    child: Text(
                      "Nenhuma auditoria enviada",
                    ),
                  )
                : SentdWidget(
                    listAudit: homeController.sentList,
                  ),
          ],
        ),
      );
    });
  }

  Widget createUnit() {
    return Column(
      children: [
        CustomTextForm(
          controller: null,
          label: 'Data',
          fontSize: 12,
        ),
        CustomTextForm(
          controller: null,
          label: 'Unidade',
          fontSize: 12,
        ),
        SizeBoxHeight.customSizedBox(context, 0.01),
        CustomDropdownFormField(
          labelText: 'Status',
          items: [
            'Pendente',
            'Enviado',
          ],
          onChanged: (value) {},
          value: null,
        ),
        SizeBoxHeight.customSizedBox(context, 0.05),
      ],
    );
  }
}
