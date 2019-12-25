import 'package:date_format/date_format.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../model/regist_model.dart';
import '../../ops_module.dart';
import '../../ops_repository.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import '../listtilesise/listtilesise_widget.dart';

class ListopsWidget extends StatefulWidget {

  var filtro;
  final controllerGeral;
  final controllerRepo;
  bool upProd;
  bool allOps;

  ListopsWidget(
      {this.filtro,
      this.controllerGeral,
      this.controllerRepo,
      this.upProd,
      this.allOps}) {
    _init();
  }

  _init() {
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
      builder: (_) {
        return _listOpsProdL();
      },
    );
  }

  _listOpsProdL() {
    widget.controllerGeral.getOrientation(context);
    if (MediaQuery.of(context).orientation == Orientation.landscape) {
      return Container(
        padding: EdgeInsets.all(12),
        child: ListView.builder(
          itemCount: widget.filtro != null ? widget.filtro.length : 0,
          itemBuilder: (context, index) {
            RegistModel o = widget.filtro[index];
            var size = widget.controllerGeral.getQuery(context, 100);
            bool upProd = widget.upProd ?? false;
            bool allOps = widget.allOps ?? false;
            return Card(
              child: Container(
                color: o.produzido != null && o.entrega != null
                    ? Colors.grey[100]
                    : o.status.posicao.toLowerCase().contains("atrasado")
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
                          int.parse("${o.op.entrada.substring(5, 7)}"),
                          int.parse("${o.op.entrada.substring(8, 10)}"),
                        ),
                        [dd, "/", mm],
                      )}",
                    ),
                    ListtilesiseWidget(
                      controller: widget.controllerGeral,
                      threeLine: true,
                      line: 3,
                      sizeGeral: size,
                      sizeCont: 58,
                      sizeFontTile: 2.2,
                      sizeFontSubTile: 1.5,
                      title:
                          "Cliente: ${o.cancelada == false ? o.op.cliente.length >= 35 ? o.op.cliente.substring(0, 35) : o.op.cliente : o.op.cliente.length >= 25 ? o.op.cliente.substring(0, 25) + " - OP CANCELADA" : o.op.cliente + " - OP CANCELADA"}",
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
                            int.parse("${o.prevEntrega.substring(5, 7)}"),
                            int.parse("${o.prevEntrega.substring(8, 10)}")),
                        [dd, "/", mm],
                      )}",
                      subTile:
                          "${o.obs != null ? o.obs.length >= 68 ? o.obs.substring(0, 68) : o.obs : ""}",
                    ),
                    Container(
                      width: widget.controllerGeral.getSize(size, 3),
                      child: allOps == false
                          ? Column(
                              children: <Widget>[
                                IconButton(
                                  icon: Icon(
                                    Icons.check,
                                    size: 20,
                                    color: Colors.green,
                                  ),
                                  padding: EdgeInsets.all(4),
                                  onPressed: () => upProd == true
                                      ? widget.controllerRepo.upProd(o.id)
                                      : widget.controllerRepo.upEnt(o.id),
                                ),
                                IconButton(
                                  icon: Icon(
                                    Icons.clear,
                                    size: 20,
                                    color: Colors.red,
                                  ),
                                  padding: EdgeInsets.all(4),
                                  onPressed: () => widget.controllerRepo.canProd(o.id),
                                ),
                              ],
                            )
                          : Column(
                              children: <Widget>[
                                o.cancelada == false ? IconButton(
                                  icon: Icon(
                                    Icons.clear,
                                    size: 20,
                                    color: Colors.red,
                                  ),
                                  padding: EdgeInsets.all(4),
                                  onPressed: () => widget.controllerRepo.canProd(o.id),
                                ): IconButton(
                                  icon: Icon(
                                    Icons.settings_backup_restore,
                                    size: 20,
                                    color: Colors.green,
                                  ),
                                  padding: EdgeInsets.all(4),
                                  onPressed: () => widget.controllerRepo.atProd(o.id),
                                )
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
    return Container(
      padding: EdgeInsets.all(12),
      child: ListView.builder(
        itemCount: widget.filtro != null ? widget.filtro.length : 0,
        itemBuilder: (context, index) {
          RegistModel o = widget.filtro[index];
          var size = widget.controllerGeral.getQuery(context, 100);
          bool upProd = widget.upProd ?? false;
          bool allOps = widget.allOps ?? false;
          return Card(
            child: Container(
              color: o.produzido != null && o.entrega != null
                  ? Colors.grey[100]
                  : o.status.posicao.toLowerCase().contains("atrasado")
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
                    sizeCont: 14,
                    sizeFontTile: 3.5,
                    sizeFontSubTile: 2.5,
                    title: "${o.op.op}",
                    subTile: "${formatDate(
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
                    sizeCont: 40,
                    sizeFontTile: 3.5,
                    sizeFontSubTile: 2.5,
                    title:
                        "${o.cancelada == false ? o.op.cliente.length >= 35 ? o.op.cliente.substring(0, 35) : o.op.cliente : o.op.cliente.length >= 25 ? o.op.cliente.substring(0, 25) + " - OP CANCELADA" : o.op.cliente + " - OP CANCELADA"}",
                    subTile:
                        "${o.op.servico.length >= 150 ? o.op.servico.substring(0, 150) : o.op.servico}",
                  ),
                  ListtilesiseWidget(
                    controller: widget.controllerGeral,
                    sizeGeral: size,
                    sizeCont: 15,
                    sizeFontTile: 3.5,
                    sizeFontSubTile: 2.5,
                    title: "${o.op.quant}",
                    subTile:
                        "${o.op.vendedor.length >= 8 ? o.op.vendedor.substring(0, 8) : o.op.vendedor}",
                  ),
                  ListtilesiseWidget(
                    controller: widget.controllerGeral,
                    threeLine: true,
                    line: 3,
                    sizeGeral: size,
                    sizeCont: 18,
                    sizeFontTile: 3.5,
                    sizeFontSubTile: 2.5,
                    title: "Ent: ${formatDate(
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
                    width: widget.controllerGeral.getSize(size, 4),
                    child: allOps == false
                        ? Column(
                      children: <Widget>[
                        IconButton(
                          icon: Icon(
                            Icons.check,
                            size: 20,
                            color: Colors.green,
                          ),
                          padding: EdgeInsets.all(2),
                          onPressed: () => upProd == true
                              ? widget.controllerRepo.upProd(o.id)
                              : widget.controllerRepo.upEnt(o.id),
                        ),
                        IconButton(
                          icon: Icon(
                            Icons.clear,
                            size: 20,
                            color: Colors.red,
                          ),
                          padding: EdgeInsets.all(2),
                          onPressed: () => widget.controllerRepo.canProd(o.id),
                        ),
                      ],
                    )
                        : Column(
                      children: <Widget>[
                        o.cancelada == false ? IconButton(
                          icon: Icon(
                            Icons.clear,
                            size: 20,
                            color: Colors.red,
                          ),
                          padding: EdgeInsets.all(2),
                          onPressed: () => widget.controllerRepo.canProd(o.id),
                        ): IconButton(
                          icon: Icon(
                            Icons.settings_backup_restore,
                            size: 20,
                            color: Colors.green,
                          ),
                          padding: EdgeInsets.all(2),
                          onPressed: () => widget.controllerRepo.atProd(o.id),
                        )
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
}
