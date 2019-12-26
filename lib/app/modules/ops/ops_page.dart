import 'package:eco_app_mobx/app/shared/global/loginbutton/loginbutton_controller.dart';
import 'package:flutter/material.dart';
import '../../app_module.dart';
import 'ops_controller.dart';
import 'ops_module.dart';
import 'ops_repository.dart';
import 'ops_service.dart';
import 'widgets/listops/listops_widget.dart';

class OpsPage extends StatefulWidget {
  final String title;

  const OpsPage({Key key, this.title = "Ops"}) : super(key: key);

  @override
  _OpsPageState createState() => _OpsPageState();
}

class _OpsPageState extends State<OpsPage>
    with SingleTickerProviderStateMixin<OpsPage> {
  final controllerGeral = OpsModule.to.getBloc<OpsController>();
  final controllerRepo = OpsModule.to.getDependency<OpsRepository>();
  final controllerServ = OpsModule.to.getDependency<OpsService>();
  

  TabController _tabController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _initTabs();
  }

  Future _initTabs() async{
    _tabController = TabController(length: 3, vsync: this);

    _tabController.index = await controllerServ.getInt("tabIndex");

    _tabController.addListener((){
      controllerServ.setInt("tabIndex", _tabController.index);
    });
//    Future<String> getIndex = controllerGeral.storage.read(key: "tabIndx");
//    getIndex.then((String idx){
//      _tabController.index = int.parse("$idx");
//    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        bottom: TabBar(
          controller: _tabController,
          tabs: [
            Tab(text: "Em Produção"),
            Tab(text: "Em Expedição"),
            Tab(text: "Todas as Ops"),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          ListopsWidget(
            filtro: controllerGeral.listProdOps,
            controllerGeral: controllerGeral,
            controllerRepo: controllerRepo,
            upProd: true,
          ),
          ListopsWidget(
            filtro: controllerGeral.listEntOps,
            controllerGeral: controllerGeral,
            controllerRepo: controllerRepo,
          ),
          ListopsWidget(
            filtro: controllerGeral.listAllOps,
            controllerGeral: controllerGeral,
            controllerRepo: controllerRepo,
            allOps: true,
          ),
        ],
      ),
    );
  }

}
