import 'package:eco_app_mobx/app/shared/global/loginbutton/loginbutton_controller.dart';
import 'package:flutter/material.dart';
import '../../app_module.dart';
import 'ops_controller.dart';
import 'ops_module.dart';
import 'ops_repository.dart';
import 'widgets/listops/listops_widget.dart';

class OpsPage extends StatefulWidget {
  final String title;
  const OpsPage({Key key, this.title = "Ops"}) : super(key: key);

  @override
  _OpsPageState createState() => _OpsPageState();
}

class _OpsPageState extends State<OpsPage> {

  final controllerGeral = OpsModule.to.getBloc<OpsController>();
  final controllerRepo = OpsModule.to.getDependency<OpsRepository>();
  final store = AppModule.to.bloc<LoginbuttonController>();

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
          bottom: TabBar(tabs: [
            Tab(text: "Em Produção",),
            Tab(text: "Em Expedição",),
            Tab(text: "Todas as Ops",),
          ]),
        ),
        body: TabBarView(children: [
          ListopsWidget(filtro: controllerGeral.listProdOps, controllerGeral: controllerGeral, controllerRepo: controllerRepo, upProd: true,),
          ListopsWidget(filtro: controllerGeral.listEntOps, controllerGeral: controllerGeral, controllerRepo: controllerRepo,),
          ListopsWidget(filtro: controllerGeral.listAllOps, controllerGeral: controllerGeral, controllerRepo: controllerRepo, allOps: true,),
        ]),
      ),
    );
  }
}


