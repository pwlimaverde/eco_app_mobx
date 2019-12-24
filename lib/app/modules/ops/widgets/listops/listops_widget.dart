import 'package:date_format/date_format.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../model/regist_model.dart';
import '../../ops_controller.dart';
import '../../ops_module.dart';
import '../../ops_repository.dart';
import '../listtile/listtile_widget.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../listtilesise/listtilesise_widget.dart';

class ListopsWidget extends StatefulWidget {
  var filtro;
  final controllerGeral;
  bool upProd;

  ListopsWidget(
      {this.filtro, this.controllerGeral, this.upProd}){
    _init();
  }

  _init(){
    final controllerRepo = OpsModule.to.getDependency<OpsRepository>();
    controllerRepo.getOps();
  }

  @override
  _ListopsWidgetState createState() => _ListopsWidgetState();
}

class _ListopsWidgetState extends State<ListopsWidget> {
  @override
  Widget build(BuildContext context) {
    return _observerOp();
  }

  _observerOp() {
    return Observer(
      builder: (_){
        return _listOpsProdL();
      },
    );
  }

//  _listViewOK(){
//    final controller = OpsModule.to.bloc<OpsController>();
//    final controllerRepo = OpsModule.to.getDependency<OpsRepository>();
//    return ListView.builder(
//      itemCount: controller.listProdOps != null ? controller.listProdOps.length : 0,
//      itemBuilder: (context, index){
//        RegistModel model = controller.listProdOps[index];
//        return ListtileWidget(model: model, onPressed: () => controllerRepo.upProd(model.id),);
//      },
//    );
//  }



//  _futureBuilder() {
//    final controller = OpsModule.to.bloc<ListopsController>();
//
//    return FutureBuilder<List<RegistModel>>(
//      future: controller.repo.getOps2(),
//      builder: (context, snapshot) {
//        if (snapshot.hasError) {
//          print(snapshot.error);
//          return Center(
//            child: Text(
//              "Não foi possível listar as Ops",
//              style: TextStyle(color: Colors.red, fontSize: 16),
//            ),
//          );
//        }
//        if (!snapshot.hasData) {
//          return Center(
//            child: CircularProgressIndicator(),
//          );
//        }
//        List<RegistModel> ops = snapshot.data;
//        return _listOpsProdL(context, ops);
//      },
//    );
//  }
//


  _listOpsProdL() {
    final controller = OpsModule.to.bloc<OpsController>();
    final controllerRepo = OpsModule.to.getDependency<OpsRepository>();
    widget.controllerGeral.getOrientation(context);
    if (MediaQuery.of(context).orientation == Orientation.landscape) {
      return Container(
        padding: EdgeInsets.all(10),
        child: ListView.builder(
          itemCount: controller.listProdOps != null ? controller.listProdOps.length : 0,
          itemBuilder: (context, index) {
            RegistModel o = controller.listProdOps[index];
            var size = widget.controllerGeral.getQuery(context, 100);
            bool tipo = widget.upProd ?? false;
            return Card(
              child: Container(
                color: o.status.posicao.toLowerCase().contains("atrasado")
                    ? Colors.red[100]
                    : o.status.posicao.toLowerCase().contains("hoje")
                        ? Colors.yellow[100]
                        : Colors.grey[100],
                width: size,
                child: Row(
                  children: <Widget>[
                    ListtilesiseWidget(
                      controller: widget.controllerGeral,
                      sizeGeral: size,
                      sizeCont: 10,
                      sizeFontTile: 2.2,
                      sizeFontSubTile: 1.5,
                      title: "OP: ${o.op.op}",
                      subTile: "Entrada: ${formatDate(
                        DateTime(
                            int.parse("${o.op.entrada.substring(0, 4)}"),
                            int.parse("${o.op.entrada.substring(6, 7)}"),
                            int.parse("${o.op.entrada.substring(9, 10)}")),
                        [dd, "/", mm],
                      )}",
                    ),
                    ListtilesiseWidget(
                      controller: widget.controllerGeral,
                      threeLine: true,
                      line: 3,
                      sizeGeral: size,
                      sizeCont: 60,
                      sizeFontTile: 2.2,
                      sizeFontSubTile: 1.5,
                      title:
                          "Cliente: ${o.op.cliente.length >= 35 ? o.op.cliente.substring(0, 35) : o.op.cliente}",
                      subTile:
                          "${o.op.servico.length >= 150 ? o.op.servico.substring(0, 150) : o.op.servico}",
                    ),
                    ListtilesiseWidget(
                      controller: widget.controllerGeral,
                      sizeGeral: size,
                      sizeCont: 10,
                      sizeFontTile: 2.2,
                      sizeFontSubTile: 1.5,
                      title: "QT: ${o.op.quant}",
                      subTile:
                          "Vend: ${o.op.vendedor.length >= 8 ? o.op.vendedor.substring(0, 8) : o.op.vendedor}",
                    ),
                    ListtilesiseWidget(
                      controller: widget.controllerGeral,
                      threeLine: true,
                      line: 3,
                      sizeGeral: size,
                      sizeCont: 15,
                      sizeFontTile: 2.2,
                      sizeFontSubTile: 1.5,
                      title: "Entrega: ${formatDate(
                        DateTime(
                            int.parse("${o.prevEntrega.substring(0, 4)}"),
                            int.parse("${o.prevEntrega.substring(6, 7)}"),
                            int.parse("${o.prevEntrega.substring(9, 10)}")),
                        [dd, "/", mm],
                      )}",
                      subTile:
                          "${o.obs != null ? o.obs.length >= 68 ? o.obs.substring(0, 68) : o.obs : ""}",
                    ),
                    Container(
                      width: widget.controllerGeral.getSize(size, 3),
                      child: Column(
                        children: <Widget>[
                          IconButton(
                            icon: Icon(
                              Icons.check,
                              size: 22,
                              color: Colors.green,
                            ),
                            padding: EdgeInsets.all(0),
                            onPressed: () => tipo == true
                                ? controllerRepo.upProd(o.id)
                                : controllerRepo.upEnt(o.id),
                          ),
                          IconButton(
                            icon: Icon(
                              Icons.clear,
                              size: 22,
                              color: Colors.red,
                            ),
                            padding: EdgeInsets.all(0),
                            onPressed: () => null,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      );
    }
//    return Container(
//      padding: EdgeInsets.all(10),
//      child: ListView.builder(
//        itemCount: ops != null ? ops.length : 0,
//        itemBuilder: (context, index) {
//          RegistModel o = ops[index];
//          var size = widget.controllerGeral.getQuery(context, 100);
//          return Card(
//            child: Container(
//              color: o.status.posicao.toLowerCase().contains("atrasado")
//                  ? Colors.red[100]
//                  : o.status.posicao.toLowerCase().contains("hoje")
//                      ? Colors.yellow[100]
//                      : Colors.grey[100],
//              width: size,
//              child: Row(
//                children: <Widget>[
//                  ListtilesiseWidget(
//                    controller: widget.controllerGeral,
//                    sizeGeral: size,
//                    sizeCont: 15,
//                    sizeFontTile: 3.5,
//                    sizeFontSubTile: 2.5,
//                    title: "${o.op.op}",
//                    subTile: "${formatDate(
//                      DateTime(
//                          int.parse("${o.op.entrada.substring(0, 4)}"),
//                          int.parse("${o.op.entrada.substring(6, 7)}"),
//                          int.parse("${o.op.entrada.substring(9, 10)}")),
//                      [dd, "/", mm],
//                    )}",
//                  ),
//                  ListtilesiseWidget(
//                    controller: widget.controllerGeral,
//                    threeLine: true,
//                    line: 3,
//                    sizeGeral: size,
//                    sizeCont: 42,
//                    sizeFontTile: 3.5,
//                    sizeFontSubTile: 2.5,
//                    title:
//                        "${o.op.cliente.length >= 35 ? o.op.cliente.substring(0, 35) : o.op.cliente}",
//                    subTile:
//                        "${o.op.servico.length >= 150 ? o.op.servico.substring(0, 150) : o.op.servico}",
//                  ),
//                  ListtilesiseWidget(
//                    controller: widget.controllerGeral,
//                    sizeGeral: size,
//                    sizeCont: 15,
//                    sizeFontTile: 3.5,
//                    sizeFontSubTile: 2.5,
//                    title: "${o.op.quant}",
//                    subTile:
//                        "${o.op.vendedor.length >= 8 ? o.op.vendedor.substring(0, 8) : o.op.vendedor}",
//                  ),
//                  ListtilesiseWidget(
//                    controller: widget.controllerGeral,
//                    threeLine: true,
//                    line: 3,
//                    sizeGeral: size,
//                    sizeCont: 20,
//                    sizeFontTile: 3.5,
//                    sizeFontSubTile: 2.5,
//                    title: "Ent: ${formatDate(
//                      DateTime(
//                          int.parse("${o.prevEntrega.substring(0, 4)}"),
//                          int.parse("${o.prevEntrega.substring(6, 7)}"),
//                          int.parse("${o.prevEntrega.substring(9, 10)}")),
//                      [dd, "/", mm],
//                    )}",
//                    subTile:
//                        "${o.obs != null ? o.obs.length >= 68 ? o.obs.substring(0, 68) : o.obs : ""}",
//                  ),
//                  Container(
//                    width: widget.controllerGeral.getSize(size, 4),
//                    child: Column(
//                      children: <Widget>[
//                        IconButton(
//                          icon: Icon(
//                            Icons.check,
//                            size: 18,
//                            color: Colors.green,
//                          ),
//                          padding: EdgeInsets.all(0),
//                          onPressed: () => print("teste v ${o.id}"),
//                        ),
//                        IconButton(
//                          icon: Icon(
//                            Icons.clear,
//                            size: 18,
//                            color: Colors.red,
//                          ),
//                          padding: EdgeInsets.all(0),
//                          onPressed: () => print("teste x ${o.id}"),
//                        ),
//                      ],
//                    ),
//                  ),
//                ],
//              ),
//            ),
//          );
//        },
//      ),
//    );
  }
}


