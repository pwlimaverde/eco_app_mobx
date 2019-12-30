import 'package:eco_app_mobx/app/modules/ops/widgets/errorrefresh/errorrefresh_widget.dart';
import 'package:flutter/material.dart';
import 'model/regist_model.dart';
import 'ops_controller.dart';
import 'ops_module.dart';
import 'ops_repository.dart';
import 'ops_service.dart';
import 'widgets/listops/listops_widget.dart';
import 'widgets/load/load_widget.dart';

class OpsPage extends StatefulWidget {
  final String title;

  const OpsPage({Key key, this.title = "Listagem de Pedidos"})
      : super(key: key);

  @override
  _OpsPageState createState() => _OpsPageState();
}

class _OpsPageState extends State<OpsPage>
    with SingleTickerProviderStateMixin<OpsPage> {
  final controllerGeral = OpsModule.to.getBloc<OpsController>();
  final controllerRepo = OpsModule.to.getDependency<OpsRepository>();
  final controllerServ = OpsModule.to.getDependency<OpsService>();
  bool errorApi;
  List<RegistModel> all;
  List<RegistModel> prod;
  List<RegistModel> ent;

  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _initTabs();
    _initGetAll();
  }

  Future _initGetAll() async {
    final controllerRepo = OpsModule.to.getDependency<OpsRepository>();
    bool st = await controllerRepo.getOps();
    print(" init - ${controllerGeral.errorApi}");
    if (controllerGeral.errorApi == false) {
      setState(() {
        this.prod = controllerGeral.listProdOps;
        this.ent = controllerGeral.listEntOps;
        this.all = controllerGeral.listAllOps;
      });
    }
    setState(() {
      this.errorApi = st;
    });
  }

  Future _initTabs() async {
    _tabController = TabController(length: 3, vsync: this);
    _tabController.index = await controllerServ.getInt("tabIndex");
    _tabController.addListener(() {
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
          RefreshIndicator(
            child: errorApi == null
                ? LoadWidget()
                : errorApi == true
                    ? ErrorrefreshWidget(onRefresh: _refresh, msg: "Não foi possível localizar as OPs.")
                    : prod == null
                        ? LoadWidget()
                        : ListopsWidget(
                            filtro: controllerGeral.listProdOps,
                            controllerGeral: controllerGeral,
                            controllerRepo: controllerRepo,
                            upProd: true,
                          ),
            onRefresh: _refresh,
          ),
          RefreshIndicator(
            child: errorApi == null
                ? LoadWidget()
                : errorApi == true
                    ? ErrorrefreshWidget(onRefresh: _refresh, msg: "Não foi possível localizar as OPs.")
                    : ent == null
                        ? LoadWidget()
                        : ListopsWidget(
                            filtro: controllerGeral.listEntOps,
                            controllerGeral: controllerGeral,
                            controllerRepo: controllerRepo,
                          ),
            onRefresh: _refresh,
          ),
          RefreshIndicator(
            child: errorApi == null
                ? LoadWidget()
                : errorApi == true
                    ? ErrorrefreshWidget(onRefresh: _refresh, msg: "Não foi possível localizar as OPs.")
                    : all == null
                        ? LoadWidget()
                        : ListopsWidget(
                            filtro: controllerGeral.listAllOps,
                            controllerGeral: controllerGeral,
                            controllerRepo: controllerRepo,
                            allOps: true,
                          ),
            onRefresh: _refresh,
          ),
        ],
      ),
    );
  }

  Future<void> _refresh() async {
    await _initGetAll();
  }
}
